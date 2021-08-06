----SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”------

SELECT SUM(AmountinUSD),CityLocation as funding_Beng
FROM indian_startup_funding
WHERE CityLocation="Bengaluru";


----2.SQL query to sort the table by startup name DESC--------
SELECT * FROM indian_startup_funding
ORDER by StartupName DESC;


----3.SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”
--and AmountinUSD>380000----
SELECT SUM(AmountinUSD) as sum_of_AmountinUSD
FROM indian_startup_funding
WHERE CityLocation="Bengaluru" AND AmountinUSD>380000;


---4.SQL query to get all CityLocations that has an AmountinUSD >380000---
SELECT CityLocation FROM indian_startup_funding
WHERE AmountinUSD>380000;

----5.SQL query to get only unique CityLocations that has an AmountinUSD >380000
SELECT DISTINCT CityLocation
FROM indian_startup_funding WHERE AmountinUSD>380000;

----6.SQL query to get all StartupNames where AmountinUSD<380000
SELECT StartupName FROM indian_startup_funding
WHERE AmountinUSD>380000;

----7.SQL query to sort the output from the previous question DESC-----
SELECT * FROM indian_startup_funding
ORDER by StartupName DESC;

--8.SQL query to get the City location that has the maximum funding amount “Note that is the
--data is not cleaned properly you will get non logical result”------
SELECT MAX(AmountinUSD),CityLocation
FROM indian_startup_funding;
SELECT CityLocation FROM indian_startup_funding 
WHERE AmountinUSD=(SELECT max(AmountinUSD) FROM indian_startup_funding);
---9.SQL query to get the total funding AmountinUSD for each IndustryVertical
SELECT sum(AmountinUSD),IndustryVertical FROM indian_startup_funding GROUP by IndustryVertical;
---10.SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with
--letter “A
SELECT total(AmountinUSD),IndustryVertical FROM indian_startup_funding
WHERE IndustryVertical LIKE 'A%' GROUP by IndustryVertical;

---11.SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with
--letter “A” and sort the output DESC by the total AmountinUSD 
SELECT sum(AmountinUSD),IndustryVertical FROM indian_startup_funding
WHERE IndustryVertical LIKE "A%" 
Group by IndustryVertical
ORDER by total(AmountinUSD) DESC;

--12.SQL query to count all the start_ups in the Education field
SELECT count(StartupName) as Startup_in_educationfield
FROM indian_startup_funding 
WHERE IndustryVertical="Education";

---13.SQL query to count all the start_Ups in the E-Commerce field
SELECT count(StartupName) as Startup_in_Ecommerce
FROM indian_startup_funding 
WHERE IndustryVertical="E-Commerce";

---14.QL query to count all the start_Ups in the E-Commerce field, where city location equals
--“Bengaluru

SELECT count(StartupName) 
FROM indian_startup_funding 
WHERE IndustryVertical="E-Commerce" AND CityLocation="Bengaluru";

--15.For each Industry Vertical find the total funding amount

SELECT sum(AmountinUSD),IndustryVertical
FROM indian_startup_funding GROUP by IndustryVertical;

----16.For each Industry Vertical find the total funding amount as “Total_fund” and the average
--funding amount as “Avg_Fund”. In this question provide two answer 1- using group by Industry
--Vertical, 2- using sub_queries

SELECT sum(AmountinUSD)as Total_fund,avg(AmountinUSD)as Avg_fund,IndustryVertical
FROM indian_startup_funding GROUP by IndustryVertical;

SELECT IndustryVertical,
AmountinUSD,
(SELECT AVG(AmountinUSD)
   FROM indian_startup_funding) AS Avg_fund,
   (SELECT sum(AmountinUSD)
   FROM indian_startup_funding) AS Total_fund
   
FROM   indian_startup_funding;



--17.Write SQL query to get the minimum value of funding for the “Uniphore” start_up
SELECT min(AmountinUSD),StartupName FROM indian_startup_funding
 WHERE StartupName="Uniphore";
 
 ---18.Write SQL query to get the length of the city location names
 SELECT length(CityLocation),CityLocation FROM indian_startup_funding;
 
 ---19.Write SQL query to convert start_ups names into uppercase if the funding amount is >380,000
 SELECT upper(StartupName)as StartupNameUppercase,AmountinUSD
 from indian_startup_funding
 WHERE AmountinUSD>380000;
 
 ---20.Write SQL query to select distinct industry vertical names, knowing that names are mix of
--lowercase and uppercase values.
SELECT DISTINCT(upper(IndustryVertical)) as UpIndustryVertical FROM indian_startup_funding
--WHERE(SELECT DISTINCT(upIndustryVertical));

