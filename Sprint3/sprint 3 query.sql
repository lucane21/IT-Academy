# Nivel 1 - Ejercicio 1

USE transactions;

CREATE TABLE credit_card (
	id CHAR(8) PRIMARY KEY,
    iban VARCHAR(35), 
    pan VARCHAR(20),
    pin CHAR(4),
    cvv CHAR(4),
	expiring_date CHAR(8),
    FOREIGN KEY(id) REFERENCES transaction(credit_card_id));
    
# Nivel 1 - Ejercicio 2

UPDATE credit_card
SET iban = 'R323456312213576817699999'
WHERE id = 'CcU-2938';

SELECT *
FROM credit_card
WHERE id = 'CcU-2938';

#Nivel 1 - Ejercicio 3

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO transaction (id, credit_card_id, company_id, user_id, lat, longitude, amount, declined)
VALUES ('108B1D1D-5B23-A76C-55EF-C568E49A99DD', 'CcU-9999', 'b-9999', '9999', 829.999, -117.999, 111.11, 0);

SELECT *
FROM transaction
WHERE id = '108B1D1D-5B23-A76C-55EF-C568E49A99DD';

#Nivel 1 - Ejercicio 4

ALTER table credit_card
DROP COLUMN pan;

SELECT *
FROM credit_card
LIMIT 1;

#Nivel 2 - Ejercicio 1

DELETE FROM transaction
WHERE id='02C6201E-D90A-1859-B4EE-88D2986D3B02';

SELECT *
FROM transaction
WHERE id ='02C6201E-D90A-1859-B4EE-88D2986D3B02';

#Nivel 2 - Ejercicio 2

CREATE VIEW `vistamarketing` AS
SELECT company.company_name, company.phone, company.country, AVG(transaction.amount) AS AVGtransaction
FROM company 
LEFT JOIN transaction ON company.id=transaction.company_id
WHERE declined = 0
GROUP BY company.company_name, company.phone, company.country
ORDER BY AVGtransaction DESC;

SELECT * FROM transactions.vistamarketing;

#Nivel 2 - Ejercicio 3

SELECT * 
FROM transactions.vistamarketing
WHERE country='Germany';

#Nivel 3 - Ejercicio 1
ALTER TABLE company
DROP COLUMN website;
ALTER TABLE user
RENAME COLUMN email TO personal_email;
ALTER TABLE user
RENAME data_user;
SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE credit_card
MODIFY COLUMN id VARCHAR(20);
ALTER TABLE credit_card
MODIFY COLUMN iban VARCHAR(50);
ALTER TABLE credit_card
MODIFY COLUMN pin VARCHAR(4);
ALTER TABLE credit_card
MODIFY COLUMN cvv INT;
ALTER TABLE credit_card
MODIFY COLUMN expiring_date VARCHAR(20);
ALTER TABLE credit_card
ADD COLUMN fecha_actual DATE;

SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE credit_card
DROP FOREIGN KEY credit_card_ibfk_1;
ALTER TABLE data_user
DROP FOREIGN KEY data_user_ibfk_1;
ALTER TABLE transaction
DROP FOREIGN KEY transaction_ibfk_1;

ALTER TABLE transaction
ADD FOREIGN KEY (credit_card_id) REFERENCES credit_card(id);
ALTER TABLE transaction
ADD FOREIGN KEY (user_id) REFERENCES data_user(id);
ALTER TABLE transaction
ADD FOREIGN KEY (company_id) REFERENCES company(id);

#Nivel 3 - Ejercicio 2

CREATE VIEW `informetecnico`AS
SELECT transaction.id AS TransactionID, user.name AS UserName, user.surname AS UserSurname, 
credit_card.iban AS Creditcardiban, company.company_name AS Companyname
FROM user
LEFT JOIN transaction ON user.id=transaction.user_id
RIGHT JOIN company ON transaction.company_id=company.id
RIGHT JOIN credit_card ON transaction.credit_card_id=credit_card.id;

SELECT * 
FROM transactions.informetecnico
ORDER BY TransactionID DESC;
	


