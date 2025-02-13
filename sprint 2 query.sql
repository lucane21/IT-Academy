# Nivel 1 - Ejercicio 2
SELECT DISTINCT company.country
From company
RIGHT JOIN transaction ON company.id=transaction.company_id
ORDER BY country;

SELECT COUNT(DISTINCT company.country) AS Numberofcountries
From company
RIGHT JOIN transaction ON company.id=transaction.company_id
ORDER BY country;

SELECT company.company_name, AVG(transaction.amount) AS AVGTransactionamount
From company 
RIGHT JOIN transaction ON company.id=transaction.company_id
GROUP BY company.company_name
ORDER BY AVGTransactionamount DESC
LIMIT 1;

# Nivel 1 - Ejercicio 3

SELECT * 
FROM transaction
WHERE company_id IN(SELECT id FROM company WHERE country = 'Germany');

SELECT company_id, SUM(amount) AS amount
FROM transaction
WHERE amount > (SELECT AVG(amount) FROM transaction)
GROUP BY company_id;

SELECT id
FROM company
WHERE id NOT IN(SELECT company_id FROM transaction);

# Nivel 2 - Ejercicio 1

SELECT LEFT(timestamp,10), SUM(amount) AS amount
FROM transaction
GROUP BY LEFT(timestamp,10)
ORDER BY amount DESC
LIMIT 5;

# Nivel 2 - Ejercicio 2

SELECT company.country, AVG(transaction.amount) AS AVGTransactionamount
From company 
JOIN transaction ON company.id=transaction.company_id
GROUP BY company.country
ORDER BY AVGTransactionamount DESC;

# Nivel 2 - Ejercicio 3

SELECT *
From company 
JOIN transaction ON company.id=transaction.company_id
WHERE country IN(SELECT country FROM company WHERE company_name='Non Institute');

SELECT *
FROM transaction
WHERE company_id IN (SELECT id FROM company WHERE country IN (SELECT country FROM company WHERE company_name='Non Institute'));

# Nivel 3 - Ejercicio 1

SELECT company_name, phone, country, timestamp, amount
FROM company
JOIN transaction ON company.id=transaction.company_id
WHERE amount BETWEEN 100 AND 200 AND LEFT(timestamp, 10) IN('2021-04-29', '2021-07-20', '2022-03-13'); 

# Nivel 3 - Ejercicio 2

SELECT company_name, 
CASE
    WHEN COUNT(amount) > 4 THEN 'TRUE'
    WHEN COUNT(amount) < 4 THEN 'FALSE'
END AS plus4transactions
FROM company
JOIN transaction ON company.id=transaction.company_id
GROUP BY company_name;