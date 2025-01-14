--CREATE DATABASE US_INTL_TRAVEL

USE US_INTL_TRAVEL

SELECT * FROM Data

--1.	What is the total number of passengers from Mexico in June 2021?

SELECT Country, Month, SUM(Total_Passengers) AS TotalPassengers
FROM DATA
WHERE Country = 'Mexico' AND MONTH = '2021-06-01'
GROUP BY Country, Month;

--2.	Which country had the highest number of passengers in May 2021?

SELECT TOP 1 Country, Month, SUM(Total_passengers) AS Highest_Number_Of_Passengers
FROM Data
WHERE Month = '2021-05-01'
GROUP BY Country, Month
ORDER BY 3 DESC;

--3.	In April 2021, what were the total passenger numbers for all countries combined?

SELECT Month, SUM(Total_Passengers) AS Total_Passengers
FROM Data 
WHERE Month = '2021-04-01'
GROUP BY Month;

--4.	How many passengers traveled from Japan to the United States in March 2021?

SELECT Country, SUM(Total_Passengers) AS March_Total_Passengers
FROM Data
WHERE Country = 'Japan' AND MONTH = '2021-03-01'
GROUP BY Country;

--5.	What is the trend in the number of passengers from Canada over the months of February, March, April, and May 2021?

SELECT Month, SUM(Total_Passengers) AS Canada_Total_Passengers
FROM Data
WHERE Country = 'Canada' AND Month IN ('02/01/2021', '03/01/2021', '04/01/2021', '05/01/2021')
GROUP BY Month

--6.	Which country experienced the highest increase in the number of passengers between April and June 2021?

SELECT TOP 1 Country, SUM(Total_Passengers) AS Total_Passengers
FROM Data
WHERE Month BETWEEN '2021-04-01' AND '2021-06-01'
GROUP BY Country
ORDER BY 2 DESC

--7.	What is the total number of passengers from the United Kingdom in each of the reported months?

SELECT Month, SUM(Total_Passengers) AS UK_Total_Passengers
FROM DATA
WHERE Country = 'United Kingdom'
GROUP BY MONTH

--8.	In June 2021, which country had the lowest number of passengers?

SELECT TOP 1 Country, SUM(Total_Passengers) AS June_2021_Total_Passengers
FROM DATA
WHERE Month = '2021-06-01'
GROUP BY Country
ORDER BY 2; 

--9.	Compare the total passengers from Germany and France in May 2021.

SELECT Country, Month, SUM(Total_Passengers) AS Total_Passengers
FROM DATA
WHERE Country IN ('Germany', 'France') AND Month = '2021-05-01'
GROUP BY Country, Month;

--10.	What was the total number of passengers from China in March 2021?

SELECT Country, Month, SUM(Total_Passengers) AS Total_Passengers
FROM DATA
WHERE Country = 'China' AND Month = '2021-03-01'
GROUP BY Country, Month;

--11.	Identify the countries where the number of passengers increased consistently from February to June 2021.

SELECT Country
FROM Data
WHERE Month IN ('2021-02-01', '2021-03-01', '2021-04-01', '2021-05-01', '2021-06-01')
GROUP BY Country
HAVING 
    SUM(CASE WHEN Month = '2021-02-01' THEN Total_Passengers ELSE 0 END) <
    SUM(CASE WHEN Month = '2021-03-01' THEN Total_Passengers ELSE 0 END)
    AND
    SUM(CASE WHEN Month = '2021-03-01' THEN Total_Passengers ELSE 0 END) <
    SUM(CASE WHEN Month = '2021-04-01' THEN Total_Passengers ELSE 0 END)
    AND
    SUM(CASE WHEN Month = '2021-04-01' THEN Total_Passengers ELSE 0 END) <
    SUM(CASE WHEN Month = '2021-05-01' THEN Total_Passengers ELSE 0 END)
    AND
    SUM(CASE WHEN Month = '2021-05-01' THEN Total_Passengers ELSE 0 END) <
    SUM(CASE WHEN Month = '2021-06-01' THEN Total_Passengers ELSE 0 END)
ORDER BY Country;

--12.	What is the average number of passengers per month for each country?

SELECT Country, AVG(Total_Passengers) AS Avg_Passengers_Per_Month
FROM DATA
GROUP BY Country 
ORDER BY 2 DESC

--13.	Which countries had a decrease in the number of passengers from May to June 2021?

SELECT Country,
    SUM(CASE WHEN Month = '2021-05-01' THEN Total_Passengers ELSE 0 END) AS May_Passengers,
    SUM(CASE WHEN Month = '2021-06-01' THEN Total_Passengers ELSE 0 END) AS June_Passengers
FROM Data
WHERE Month IN ('2021-05-01', '2021-06-01')
GROUP BY Country
HAVING 
    SUM(CASE WHEN Month = '2021-06-01' THEN Total_Passengers ELSE 0 END) <
    SUM(CASE WHEN Month = '2021-05-01' THEN Total_Passengers ELSE 0 END)
ORDER BY Country;

--14.	What is the percentage change in the total number of passengers from the United States in March 2021 compared to April 2021?

WITH MonthlyPassengers AS (      
    SELECT Month, SUM(Total_Passengers) AS Total_Passengers
    FROM Data
    WHERE Country = 'United Kingdom' AND Month IN ('2021-03-01', '2021-04-01')
    GROUP BY Month
)
SELECT CAST(((April.Total_Passengers - March.Total_Passengers) * 100.0 / March.Total_Passengers) AS DECIMAL(10, 2)) AS Percentage_Change
FROM 
    (SELECT Total_Passengers FROM MonthlyPassengers WHERE Month = '2021-03-01') AS March,
    (SELECT Total_Passengers FROM MonthlyPassengers WHERE Month = '2021-04-01') AS April;

--15.	Which country had the highest total number of passengers in the first quarter of 2021 (January to March)?

SELECT TOP 1 Country, SUM(Total_Passengers) AS Total_Passengers_Q1
FROM DATA
WHERE Month IN ('2021-01-01', '2021-02-01', '2021-03-01')
GROUP BY Country
ORDER BY 2 DESC;

--16.	In which month did Argentina have the highest number of passengers?

SELECT TOP 1 Month, SUM(Total_Passengers) AS Total_Passengers
FROM DATA
WHERE Country = 'ARGENTINA'
GROUP BY Month
ORDER BY 2 DESC;

--17.	What is the total number of passengers from all countries combined for each month in 2021?

SELECT Month, SUM(Total_Passengers) AS Total_Passengers
FROM Data
WHERE YEAR(Month) = 2021
GROUP BY MONTH;

--18.	How many countries had a decrease in passengers from June 2021 compared to May 2021?

SELECT COUNT(DISTINCT D1.COUNTRY) AS Countries_With_Decrease
FROM Data D1
JOIN Data D2 
	 ON D1.COUNTRY = D2.COUNTRY
WHERE D1.MONTH = '2021-06-01' AND D2.MONTH = '2021-05-01'
	  AND D1.TOTAL_PASSENGERS > D2.TOTAL_PASSENGERS;

--19.	Which country had the highest percentage increase in passengers from February to March 2021?

SELECT TOP 1 D1.Country, ((D2.TOTAL_PASSENGERS - D1.TOTAL_PASSENGERS) / D1.TOTAL_PASSENGERS) * 100 AS Percentage_Increase
FROM Data D1
JOIN Data D2 
	ON D1.COUNTRY = D2.COUNTRY
WHERE D1.MONTH = '2021-02-01' AND D2.MONTH = '2021-03-01'
ORDER BY percentage_increase DESC;

--20.	What is the average number of passengers per month for each country, excluding the United States?

SELECT Country, AVG(TOTAL_PASSENGERS) AS Average_Passengers_Per_Month
FROM Data
WHERE COUNTRY <> 'United States'
GROUP BY COUNTRY
ORDER BY 2 DESC;
