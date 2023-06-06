SELECT *
FROM breweries
LIMIT 5;

/*SESSION A*/

SELECT SUM(profit)
FROM breweries;

SELECT countries, COUNT(*)
FROM breweries
GROUP BY countries
ORDER BY countries;

SELECT SUM(profit) AS Anglo_totalprofit
FROM breweries
WHERE countries IN ('Ghana', 'Nigeria');

SELECT SUM(profit) AS Franco_totalprofit
FROM breweries
WHERE countries IN ('Benin', 'Senegal', 'Togo');


SELECT countries, MAX(profit)
FROM breweries
WHERE years = 2019
GROUP BY countries 
ORDER BY countries DESC
LIMIT 1;

SELECT years, MAX(profit)
FROM breweries
GROUP BY years
ORDER BY MAX(profit) DESC
LIMIT 1;

SELECT months, MIN(profit)
FROM breweries
GROUP BY months
ORDER BY MIN(profit);

SELECT MIN(profit)
FROM breweries
WHERE months = 'December' 
AND years = 2018;

SELECT SUM(profit), months
FROM breweries 
WHERE years = 2019
GROUP BY months;

SELECT SUM(profit)
FROM breweries 
WHERE years = 2019;

SELECT months AS yearmonths, SUM(profit) * 100.0 / 
 (SELECT SUM(profit)
 FROM breweries
 WHERE years = 2019) AS profit_perc
FROM breweries
WHERE years = 2019
GROUP BY months;

SELECT MAX(profit), brands
FROM breweries
WHERE countries = 'Senegal'
GROUP BY brands
ORDER BY MAX(profit) DESC
LIMIT 1;

/*SESSION B*/

SELECT SUM(quantity), brands
FROM breweries
WHERE countries IN ('Benin', 'Senegal', 'Togo')
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 3;

SELECT SUM(quantity), brands
FROM breweries
WHERE countries IN ('Ghana')
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 2;

SELECT SUM(quantity) AS total_quantity, brands, unit_price, SUM(profit) AS total_profit
FROM breweries
WHERE countries IN ('Nigeria')
GROUP BY brands, unit_price
ORDER BY SUM(quantity) DESC;

SELECT brands, SUM(quantity) AS quant_sold
FROM breweries
WHERE countries IN ('Ghana', 'Nigeria')
AND brands IN ('beta malt', 'grand malt')
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 1;

SELECT brands, SUM(quantity)
FROM breweries
WHERE years = 2019
AND countries = 'Nigeria'
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 1;

SELECT brands, SUM(quantity)
FROM breweries
WHERE region = 'southsouth'
AND countries = 'Nigeria'
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 1;

SELECT brands, SUM(quantity) AS quant_sold
FROM breweries
WHERE countries IN ('Nigeria')
AND brands NOT IN ('beta malt', 'grand malt')
GROUP BY brands
ORDER BY SUM(quantity) DESC;

SELECT brands, SUM(quantity) AS quant_sold
FROM breweries
WHERE countries IN ('Nigeria')
AND brands IN ('budweiser')
GROUP BY brands;

SELECT brands, SUM(quantity) AS quant_sold
FROM breweries
WHERE countries IN ('Nigeria')
AND brands IN ('budweiser')
AND years = 2019
GROUP BY brands;

/*SESSION C*/

SELECT countries, SUM(quantity)
FROM breweries
GROUP BY countries
ORDER BY SUM(quantity) DESC;

SELECT sales_rep, SUM(quantity)
FROM breweries
WHERE brands = 'budweiser'
AND countries = 'Senegal'
GROUP BY sales_rep
ORDER BY SUM(quantity) DESC;

SELECT SUM(profit), countries
FROM breweries
WHERE years = '2019'
AND months IN ('October', 'November', 'December')
GROUP BY countries
ORDER BY SUM(profit) DESC;

