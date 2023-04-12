USE covid_dataset;

-- Overview of the tables
SELECT *
FROM death_info
WHERE continent NOT LIKE ""
ORDER BY 3,4;

SELECT *
FROM vaccine_info
ORDER BY 3,4;

-- LOCATION APPROACH
SELECT location,date,total_cases,new_cases,total_deaths,population
FROM death_info
ORDER BY location,date;

-- Total Cases Vs Total Deaths
-- Shows likelihood of dying if you contract covid at the 'location'
SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS death_percentage
FROM death_info
WHERE location LIKE 'India' AND continent NOT LIKE ""
ORDER BY location,date;

-- Total Cases Vs Population
-- Analyzing virus spread at various locations
SELECT location,date,total_cases,population,(total_cases/population)*100 AS infection_rate
FROM death_info
WHERE continent NOT LIKE ""
ORDER BY location, date;

-- Countries with highest infection rates
SELECT location,population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 AS Highest_Infection_rate
FROM death_info
WHERE continent NOT LIKE ""
GROUP BY location,population
ORDER BY Highest_Infection_rate DESC;

-- Countries with highest death count per Population
SELECT location,population, MAX(CAST(total_deaths AS UNSIGNED)) AS Highest_Death_Count
FROM death_info
WHERE continent NOT LIKE ""
GROUP BY location,population
ORDER BY Highest_Death_Count DESC;

-- CONTINENT APPROACH

-- Continents with highest death count per Population
SELECT continent,MAX(CAST(total_deaths AS UNSIGNED)) AS Highest_Death_Count
FROM death_info
WHERE continent NOT LIKE ""
GROUP BY continent
ORDER BY Highest_Death_Count DESC;

-- GLOBAL NUMBERS
SELECT 
	date, 
    SUM(CAST(new_cases AS UNSIGNED)) AS total_new_cases, 
    SUM(CAST(new_deaths AS UNSIGNED)) AS total_new_deaths,
    SUM(CAST(new_deaths AS UNSIGNED))/SUM(CAST(new_cases AS UNSIGNED))*100 AS DeathPercentage
FROM death_info
WHERE continent NOT LIKE ""
GROUP BY date 
ORDER BY 1,2;

-- WEEDING OUT DISCREPANCIES 
-- Remove death percentages > 100 and total_deaths > total cases

-- Death Percentage around the globe
-- DISCREPANCY!!
SELECT 
    SUM(CAST(CONV(new_cases) AS UNSIGNED)) AS total_new_cases, 
    SUM(CAST(CONV(new_deaths) AS UNSIGNED INTEGER)) AS total_new_deaths,
    SUM(CAST(new_deaths AS UNSIGNED INTEGER))/SUM(CAST(new_cases AS UNSIGNED INTEGER))*100 AS DeathPercentage
FROM death_info
WHERE continent NOT LIKE "" 
ORDER BY 1,2;


-- VACCINATION TABLE
SELECT *
FROM vaccine_info;

-- Joining both tables
SELECT *
FROM death_info AS DI
JOIN vaccine_info AS VI
ON DI.location=VI.location AND DI.date=VI.date
LIMIT 10;

-- Vaccinations Vs Total Population
WITH PopvsVac (continent,location,date,new_vaccinations,population,cumulative_people_vaccinated)
AS
(
SELECT 
	DI.continent,
    DI.location,
    DI.date,
    VI.new_vaccinations,
    DI.population,
    SUM(CAST(VI.new_vaccinations AS UNSIGNED)) OVER (PARTITION BY DI.location ORDER BY DI.location,DI.date) AS cumulative_people_vaccinated
FROM death_info AS DI
JOIN vaccine_info AS VI
ON DI.location=VI.location AND DI.date=VI.date
WHERE DI.continent NOT LIKE ""
)
SELECT *,(cumulative_people_vaccinated/population)*100 AS vaccination_rate
FROM PopvsVac;

-- Temp table
CREATE TABLE PercentPopulationVaccinated
(
	continent VARCHAR(255),
    location VARCHAR(255),
    date DATE,
    population NUMERIC,
    new_vaccinations BIGINT,
    cumulative_people_vaccinated NUMERIC
);
    
-- Error    
INSERT INTO PercentPopulationVaccinated
SELECT 
	DI.continent,
    DI.location,
    DI.date,
	DI.population,
    VI.new_vaccinations,
    SUM(VI.new_vaccinations) OVER (PARTITION BY DI.location ORDER BY DI.location,DI.date) AS cumulative_people_vaccinated
FROM death_info AS DI
JOIN vaccine_info AS VI
ON DI.location=VI.location AND DI.date=VI.date
WHERE DI.continent NOT LIKE "";

SELECT * FROM percentpopulationvaccinated;