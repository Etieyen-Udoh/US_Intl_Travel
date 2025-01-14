# U.S. Intl Travel

## Project Overview
This project aim to analyse U.S. International Travel Data using SQL to uncover patterns, preferences, and trends of international travelers, providing insights into how visitors from around the world experience the cultural, geographic, and iconic allure of the United States.

## Data Source
The primary dataset used for this analysis is [Data.csv](https://drive.google.com/file/d/1l2rUEiJJhT4J_WIxhsOS7slnG9Xw4pBE/view?usp=drive_link) 

## Tool
- SQL Server - Data Analysis

## Exploratory Data Analysis

EDA involved exploring the travel data to answer questions such as:

1.	What is the total number of passengers from Mexico in June 2021?
	
2.	Which country had the highest number of passengers in May 2021?
	
3.	In April 2021, what were the total passenger numbers for all countries combined?

5.	How many passengers traveled from Japan to the United States in March 2021?

6.	What is the trend in the number of passengers from Canada over the months of February, March, April, and May 2021?

7.	Which country experienced the highest increase in the number of passengers between April and June 2021?

8.	What is the total number of passengers from the United Kingdom in each of the reported months?

9.	In June 2021, which country had the lowest number of passengers?

10.	Compare the total passengers from Germany and France in May 2021.

11.	What was the total number of passengers from China in March 2021?

12.	Identify the countries where the number of passengers increased consistently from February to June 2021.

13.	What is the average number of passengers per month for each country?

14.	Which countries had a decrease in the number of passengers from May to June 2021?

15.	What is the percentage change in the total number of passengers from the United States in March 2021 compared to April 2021?

16.	Which country had the highest total number of passengers in the first quarter of 2021 (January to March)?

17.	In which month did Argentina have the highest number of passengers?

18.	What is the total number of passengers from all countries combined for each month in 2021?

19.	How many countries had a decrease in passengers from June 2021 compared to May 2021?

20.	Which country had the highest percentage increase in passengers from February to March 2021?

21.	What is the average number of passengers per month for each country, excluding the United States?

## Data Analysis

Aggregate Functions, CTE, JOIN

``` sql
select Country, SUM(Total_Passengers) AS TotalPassengers
from Data
where Month IN ('01-01-2020', '01-05-2021')
Group By = Country
```


