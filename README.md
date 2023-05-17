# SQL PROJECT : COVID 19 DATASET
This is a guided project that I completed following 'Alex The Analyst' on youtube. Click [https://www.youtube.com/watch?v=qfyynHBFOsM](url) to watch the youtube video.  
Tools used : MySQL, MySQL WorkBench, Github, Excel

### Importing .csv file to MySQL  
To enable load data load in mysql server and client
##### MySQL Cmd
```
  mysql> SET GLOBAL local_infile = true;
```

#### Windows Cmd
Step 1. Add a PATH environment variable in Windows 
```
  SET PATH=%PATH%;<your mysql bin folder location>
```
eg:
```
  SET PATH=%PATH%;C:\Program Files\MySQL\MySQL Server 8.0\bin
```

Step 2.Access SQL server
```
  mysql --local_infile=1 -u root -p
```

Step 3.Load data command  
The table must be already created with the fields defined before loading the data.
```
  mysql> show databases;
  mysql> use <Enter your db>;
  mysql> LOAD DATA LOCAL INFILE './infile.txt' INTO TABLE students;
  
```
  
