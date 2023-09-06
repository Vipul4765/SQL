-- 1. Show records of 'male' patients from the 'southwest' region.
SELECT * 
FROM insurance_data 
WHERE gender = 'male' AND region = 'southwest';

-- 2. Show all records with BMI in the range 30 to 45, both inclusive.
SELECT * 
FROM insurance_data
WHERE bmi BETWEEN 30 AND 45;

-- 3. Show the minimum and maximum blood pressure of diabetic patients who smoke.
--    Rename the columns as MinBP and MaxBP respectively.
SELECT MIN(bloodpressure) AS MinBP, MAX(bloodpressure) AS MaxBP
FROM insurance_data 
WHERE diabetic = 'yes' AND smoker = 'yes';

-- 4. Find the number of unique patients who are not from the southwest region.
SELECT COUNT(DISTINCT PatientID)
FROM insurance_data
WHERE region != 'southwest';

-- 5. Total claim amount from male smokers.
SELECT SUM(claim) 
FROM insurance_data 
WHERE gender = 'male' AND smoker = 'yes';

-- 6. Select all records from the south region.
SELECT * 
FROM insurance_data 
WHERE region LIKE 'south%';

-- 7. Number of patients having normal blood pressure. Normal range [90-120].
SELECT COUNT(*) 
FROM insurance_data 
WHERE bloodpressure BETWEEN 90 AND 120;

-- 8.No of pateint below 17 years of age having normal blood pressure as per below formula -
-- BP normal range = 80+(age in years × 2) to 100 + (age in years × 2)
-- Note: Formula taken just for practice, don't take in real sense.
SELECT COUNT(*) 
FROM insurance_data 
WHERE age < 17 
AND bloodpressure >= 80 + (age * 2) 
AND bloodpressure <= 100 + (age * 2);

-- 9.What is the average claim amount for non-smoking female patients who are diabetic 
SELECT AVG(claim) 
FROM insurance_data 
WHERE gender = 'female' AND diabetic = 'yes' AND smoker = 'no';



-- 10.Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000. 
SELECT SUM(claim) 
FROM insurance_data 
WHERE PatientID BETWEEN 1234 AND 5000;


-- 11.Write a SQL query to delete all records for patients who are smokers and have no children. 
UPDATE insurance_data SET claim = 5000
WHERE PatientID = 1234;

-- 12.Write a SQL query to delete all records for patients who are smokers and have no children.  
DELETE FROM insurance_data
WHERE smoker = 'yes' AND children = 0



