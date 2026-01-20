Use world;
SHOW tables

Q.1 Count how many cities are there in each country?

SELECT c.Name AS Country,
       COUNT(ci.ID) AS Total_Cities
FROM Country c
LEFT JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Name;

Q.2 - Display all continents having more than 30 countries

SELECT Continent,
     COUNT(*) AS Total_Countries
FROM Country
GROUP BY Continent
HAVING COUNT(*) > 30;

Q.3-  List regions whose total population exceeds 200 million

SELECT Region,
      SUM(Population) AS Total_Population
FROM Country
GROUP BY Region
HAVING SUM(Population) > 200000000;

Q.4- Find the top 5 continents by average GNP per country

SELECT Continent,
       AVG(GNP) AS Avg_gnp
FROM Country
Group by Continent
ORDER BY Avg_gnp
LIMIT 5

Q.5- Find the total number of official languages spoken in each continent

SELECT c.Continent,
       COUNT(cl.Language) AS Official_Languages
FROM Country c
JOIN CountryLanguage cl
ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent;

Q.6- Find the maximum and minimum GNP for each continent

SELECT Continent, 
       MAX(GNP) AS Max_GNP, 
       MIN(GNP) AS Min_GNP
FROM Country
GROUP BY Continent;

Q.7- Find the country with the highest average city population

SELECT c.Name AS Country, 
       AVG(ci.Population) AS Avg_City_Population
FROM Country c
JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY Avg_City_Population DESC
LIMIT 1;

Q.8- List continents where the average city population is greater than 200,000

    SELECT c.Continent, 
       AVG(ci.Population) AS Avg_City_Population
FROM Country c
JOIN City ci
ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000;

Q.9- Find total population and average life expectancy for each continent

SELECT Continent, SUM(Population) AS Total_Population ,  avg(LifeExpectancy) AS average_life_expectancy
FROM Country
GROUP BY Continent
ORDER BY average_life_expectancy DESC;

Q.10 - Find top 3 continents with highest average life expectancy where total population is over 200 million

SELECT Continent, avg(LifeExpectancy) AS Average_life_expectancy, SUM(Population) as Total_population
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY Average_life_expectancy DESC 
LIMIT 3;
