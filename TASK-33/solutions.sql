USE task33;
-- 1.  Find out the average sleep duration of top 15 male candidates who's sleep duration are equal to
--     7.5 or greater than 7.5
SELECT AVG(`Sleep duration`) 
FROM sleep_efficiency 
WHERE `Sleep duration` >= 7.5 AND gender = 'male'
ORDER BY `Sleep duration` LIMIT 15;

-- 2.  Show avg deep sleep time for both gender. Round result at 2 decimal places. 
SELECT Gender,AVG(`sleep duration`*`Deep sleep percentage`/100) as deep_sleep
FROM sleep_efficiency
GROUP BY gender;

-- 3.  Find out the lowest 10th to 30th light sleep percentage records where deep sleep percentage 
--     values are between 25 to 45. Display age, light sleep percentage and deep sleep percentage 
--     columns only.
SELECT age,`Light sleep percentage`,`Deep sleep percentage`
FROM sleep_efficiency 
WHERE `Deep sleep percentage`  between 25 and 45 
ORDER BY `Light sleep percentage` LIMIT 10 ,20;


-- 4.  Group by on exercise frequency and smoking status and show average deep sleep time, average 
--     light sleep time and avg rem sleep time.
SELECT `smoking status`,
AVG(`sleep duration`*`Deep sleep percentage`/100), 
AVG(`sleep duration`*`Light sleep percentage`/100), 
AVG(`sleep duration`*`REM sleep percentage`/100)
FROM sleep_efficiency
GROUP BY `Exercise frequency` ,`Smoking status`
ORDER BY AVG(`sleep duration`*`Deep sleep percentage`/100);

SELECT * from sleep_efficiency;

-- 5.   Group By on Awekning and show AVG Caffeine consumption, AVG Deep sleep time and AVG Alcohol consumption 
--      only for people who do exercise atleast 3 days a week. Show result in descending order awekenings
SELECT Awakenings, 
AVG(`Caffeine consumption`),
AVG(`Sleep duration` * `Deep sleep percentage`/100),
AVG(`Alcohol consumption`)
FROM sleep_efficiency 
WHERE `Exercise frequency` >= 3
GROUP BY Awakenings
ORDER BY `Awakenings` DESC;

-- 6.  Display those power stations which have average 'Monitored Cap.(MW)' (display the values) 
--     between 1000 and 2000 and the number of occurance of the power stations (also display these values) 
--     are greater than 200. Also sort the result in ascending order.
SELECT `Power Station`,
  AVG(`Monitored Cap.(MW)`) AS `avg_power`,
  COUNT(*) AS ocurrence
FROM powergeneration
GROUP BY `Power Station`
HAVING AVG(`Monitored Cap.(MW)`) BETWEEN 1000 AND 2000
  AND ocurrence > 200
ORDER BY `avg_power`;

-- 7.  Display top 10 lowest "value" State names of which the Year either belong to 2013 or 2017 
--      or 2021 and type is 'Public In-State'. Also the number of occurance should be between 6 to
--      10. Display the average value upto 2 decimal places, state names and the occurance of the states.
SELECT State,
ROUND(AVG(Value),2) AS 'Avg_Value',
COUNT(*) AS 'frequency' FROM nces330_20
WHERE Year IN (2013,2017,2021) AND Type = 'Public In-State'
GROUP BY State
HAVING frequency BETWEEN 6 AND 10
ORDER BY Avg_Value ASC LIMIT 10;

-- 8. -- Q8: Best state in terms of low education cost (Tution Fees) in 
--     'Public' type university.
SELECT State,AVG(Value) 
FROM nces330_20
WHERE Type LIKE '%Public%' AND Expense LIKE '%Tuition%'
GROUP BY State
ORDER BY AVG(Value) ASC LIMIT 1;

-- Q9: 2nd Costliest state for Private education in year 2021. 
--     Consider, Tution and Room fee both.
SELECT State,AVG(Value) 
FROM nces330_20
WHERE Year = 2021 AND Type LIKE '%Private%'
GROUP BY State






