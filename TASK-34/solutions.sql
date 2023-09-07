-- 1. Find out top 10 countries' which have maximum A and D values.
SELECT A.country, A, D FROM (SELECT country, A FROM country_ab
ORDER BY A DESC LIMIT 10) A
LEFT JOIN 
(SELECT country, D FROM country_cd
ORDER BY D DESC LIMIT 10) B
ON A.country = B.country
UNION
SELECT B.country, A, D FROM (SELECT country, A FROM country_ab
ORDER BY A DESC LIMIT 10) A
RIGHT JOIN 
(SELECT country, D FROM country_cd
ORDER BY D DESC LIMIT 10) B
ON A.country = B.country
ORDER BY country;

-- 2. Find out the highest CL value for 2020 for every region. Also sort the result in descending order.
SELECT Region, MAX(CL) FROM country_cl t1
JOIN country_ab t2
ON t1.country = t2.country
WHERE t1.Edition = 2020
GROUP BY Region
ORDER BY MAX(CL) DESC;

-- 3. Find the top-5 most sold products.
SELECT DISTINCT Name, SUM(Quantity) as 'quantity' FROM products t1
JOIN sales1 t2
ON t1.ProductID = t2.ProductID 
GROUP BY t1.ProductID
ORDER BY Quantity DESC LIMIT 5;

-- 4. Find the salesperson who sold the most number of products.
SELECT t1.SalesPersonID, FirstName, LastName, SUM(Quantity) AS 'num_sold' FROM sales1 t1
JOIN employees t2
ON t1.SalesPersonID = t2.EmployeeID
GROUP BY t1.SalesPersonID
ORDER BY num_sold DESC LIMIT 5;

-- 5. Find the salesperson who sold to the most number of unique customers.
SELECT t1.SalesPersonID, FirstName, LastName, COUNT(DISTINCT CustomerID) AS 'unique_customers' FROM sales1 t1
JOIN employees t2
ON t1.SalesPersonID = t2.EmployeeID
GROUP BY t1.SalesPersonID
ORDER BY unique_customers DESC LIMIT 5;

-- 6. Salesperson who has generated the most revenue. Show the top 5.
SELECT t1.SalesPersonID, t3.FirstName, t3.LastName,
ROUND(SUM(t1.Quantity * t2.Price)) AS 'total_revenue'
FROM sales1 t1
JOIN products t2
ON t1.ProductID = t2.ProductID
JOIN employees t3
ON t1.SalesPersonID = t3.EmployeeID
GROUP BY t1.SalesPersonID
ORDER BY total_revenue DESC LIMIT 5;

-- 7. List all customers who have made more than 10 purchases.
SELECT t1.CustomerID, t2.FirstName, t2.LastName, COUNT(*) FROM sales1 t1
JOIN customers t2
ON t1.CustomerID = t2.CustomerID
GROUP BY t1.CustomerID
HAVING COUNT(*) > 10;

-- 8. List all salespeople who have made sales to more than 5 customers.
SELECT t1.SalesPersonID, FirstName, LastName, COUNT(DISTINCT CustomerID) AS 'unique_customers' FROM sales1 t1
JOIN employees t2
ON t1.SalesPersonID = t2.EmployeeID
GROUP BY t1.SalesPersonID
HAVING unique_customers > 5;

-- 9. List all pairs of customers who have made purchases with the same salesperson.
SELECT *
FROM (SELECT DISTINCT t1.CustomerID AS 'first_customer',
t2.CustomerID AS 'second_customer',
t1.SalesPersonID
FROM sales1 t1
JOIN sales1 t2
ON t1.SalesPersonID = t2.SalesPersonID 
AND t1.CustomerID != t2.CustomerID) A
JOIN customers B
ON A.first_customer = B.CustomerID
LEFT JOIN customers C
ON A.second_customer = C.CustomerID
LEFT JOIN employees D
ON A.SalesPersonID = D.EmployeeID;
