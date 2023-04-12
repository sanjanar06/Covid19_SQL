USE covid_dataset;

-- Table Creation
CREATE TABLE death_info(
iso_code VARCHAR(255),
continent VARCHAR(255),	
location VARCHAR(255),	
date DATE,	
population VARCHAR(255),
total_cases VARCHAR(255),	
new_cases VARCHAR(255),	
new_cases_smoothed VARCHAR(255),		
total_deaths VARCHAR(255),		
new_deaths VARCHAR(255),		
new_deaths_smoothed VARCHAR(255),		
total_cases_per_million VARCHAR(255),		
new_cases_per_million VARCHAR(255),		
new_cases_smoothed_per_million VARCHAR(255),		
total_deaths_per_million VARCHAR(255),		
new_deaths_per_million VARCHAR(255),		
new_deaths_smoothed_per_million VARCHAR(255),		
reproduction_rate VARCHAR(255),		
icu_patients VARCHAR(255),		
icu_patients_per_million VARCHAR(255),		
hosp_patients VARCHAR(255),		
hosp_patients_per_million VARCHAR(255),		
weekly_icu_admissions VARCHAR(255),		
weekly_icu_admissions_per_million VARCHAR(255),		
weekly_hosp_admissions VARCHAR(255),		
weekly_hosp_admissions_per_million VARCHAR(255)	
);

-- Table Creation
CREATE TABLE vaccine_info(
iso_code VARCHAR(255),
continent VARCHAR(255),	
location VARCHAR(255),	
date DATE,
new_tests VARCHAR(255),	
total_tests VARCHAR(255),	
total_tests_per_thousand VARCHAR(255),	
new_tests_per_thousand VARCHAR(255),	
new_tests_smoothed VARCHAR(255),	
new_tests_smoothed_per_thousand VARCHAR(255),
positive_rate VARCHAR(255),	
tests_per_case VARCHAR(255),	
tests_units VARCHAR(255),
total_vaccinations VARCHAR(255),	
people_vaccinated VARCHAR(255),	
people_fully_vaccinated VARCHAR(255),	
new_vaccinations VARCHAR(255),	
new_vaccinations_smoothed VARCHAR(255),	
total_vaccinations_per_hundred VARCHAR(255),	
people_vaccinated_per_hundred VARCHAR(255),	
people_fully_vaccinated_per_hundred VARCHAR(255),	
new_vaccinations_smoothed_per_million VARCHAR(255),	
stringency_index VARCHAR(255),	
population_density VARCHAR(255),	
median_age VARCHAR(255),	
aged_65_older VARCHAR(255),	
aged_70_older VARCHAR(255),	
gdp_per_capita VARCHAR(255),	
extreme_poverty VARCHAR(255),	
cardiovasc_death_rate VARCHAR(255),	
diabetes_prevalence VARCHAR(255),	
female_smokers VARCHAR(255),	
male_smokers VARCHAR(255),	
handwashing_facilities VARCHAR(255),	
hospital_beds_per_thousand VARCHAR(255),	
life_expectancy VARCHAR(255),
human_development_index VARCHAR(255)
);

-- Adding NULL values
UPDATE death_info
SET total_deaths=NULL WHERE total_deaths = "";
