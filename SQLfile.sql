//find the population from the table world with name equal to Germany
SELECT population FROM world
  WHERE name = 'Germany'

//find the population from the table world with any of the names listed
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

//find the name and area from the table world with area between 200k and 250k
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

//find the names that start with Y
SELECT name FROM world
  WHERE name LIKE 'Y%'

//find the names that end with y
SELECT name FROM world
  WHERE name LIKE '%y'

//find the name that contains x
SELECT name FROM world
  WHERE name LIKE '%x%'

//find the names that end with land
SELECT name FROM world
  WHERE name LIKE '%land'

//find the names that start with C and end with ia
SELECT name FROM world
  WHERE name LIKE 'C%ia'

//find the names that contains oo
SELECT name FROM world
  WHERE name LIKE '%oo%'

//find the names that contains three or more a
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

//find the names that have t in the second letter
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

//find the name that have two o but separated by two other letters
SELECT name FROM world
 WHERE name LIKE '%o__o%'

//find the name that have four letters
SELECT name FROM world
 WHERE name LIKE '____'

//find the names that equal its capital
SELECT name
  FROM world
 WHERE capital = name

//Find the country where the capital is the country plus "City".
SELECT name
  FROM world
 WHERE capital = concat(name, ' City')

// Find the capital and the name where the capital includes the name of the country.
SELECT capital, name FROM world WHERE capital like concat(name, '%')

//Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name FROM world WHERE capital like concat(name, '_%')

//Show the name and the extension where the capital is an extension of name of the country.
SELECT name, REPLACE(capital, name, '') FROM world WHERE capital like concat(name, '_%')

//Show the name for the countries that have a population of at least 200 million.
SELECT name FROM world
WHERE population > 200000000

//Find the name and per capita GDP for population of at least 200 million.
SELECT name, GDP/population FROM world WHERE population > 200000000

//Find the name and population for countries in South America and show population in millions
SELECT name, population/1000000 FROM world WHERE continent = 'South America'

//Show the name and population for France, Germany, Italy
SELECT name, population FROM world WHERE name in ('France', 'Germany', 'Italy')

//Show the countries which have a name that includes the word 'United'
SELECT name FROM world WHERE name like '%United%'

//Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area FROM world WHERE population > 250000000 or area > 3000000

//Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both.
SELECT name, population, area FROM world WHERE population > 250000000 xor area > 3000000

//For South America show population in millions and GDP in billions both to 2 decimal places.
SELECT name, ROUND(population/1000000,2), ROUND(GDP/1000000000,2) FROM world WHERE continent = 'South America'

//Show per-capita GDP for the trillion dollar countries to the nearest $1000.
SELECT name, ROUND(GDP/population, -3) FROM world WHERE GDP > 1000000000000

//Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

//Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) and name <> capital

//Find the country that has all the vowels and no spaces in its name.
SELECT name
   FROM world
WHERE name LIKE '%a%' AND name Like '%e%' AND name Like '%i%' AND name Like '%o%' AND name Like '%u%' 
  AND name NOT LIKE '% %'

//displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

//Show who won the 1962 prize for Literature.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

//Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein' 

//Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner
  FROM nobel
 WHERE yr >= 2000 AND subject = 'Peace'

//Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT yr,subject,winner
  FROM nobel
 WHERE subject = 'Literature' AND yr >= 1980 AND yr <= 1989

//Show all details of the presidential winners:
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter', 'Barack Obama')

//Show the winners with first name John
SELECT winner FROM nobel
 WHERE winner LIKE ('John%')

//Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT yr,subject,winner
  FROM nobel
 WHERE (subject = 'Physics' AND yr = 1980) or (yr = 1984 and subject = 'Chemistry')

//Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT yr,subject,winner
  FROM nobel
 WHERE subject <> 'Chemistry' AND subject <> 'Medicine' AND yr = 1980

//List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

//Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world
  WHERE continent = 'Europe' AND GDP/population >
     (SELECT GDP/population FROM world
      WHERE name='United Kingdom')

//List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent FROM world
  WHERE continent = (SELECT continent FROM world WHERE name='Argentina')  
      or continent = (SELECT continent FROM world WHERE name='Australia') 
          ORDER BY name

//Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population FROM world
  WHERE population > (SELECT population FROM world WHERE name='Canada')  
      AND population < (SELECT population FROM world WHERE name='Poland') 

//Show the total population of the world.
SELECT SUM(population)
FROM world

//List all the continents - just once each.
SELECT DISTINCT continent FROM world

//Give the total GDP of Africa
SELECT SUM(gdp) FROM world WHERE continent = 'Africa'

//How many countries have an area of at least 1000000
SELECT count(name) FROM world WHERE area > 1000000
