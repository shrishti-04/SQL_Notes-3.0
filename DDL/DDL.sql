-- Create a new table called persons with columns: id, person_name, birth_date, phone

USE MyDatabase;

CREATE TABLE PERSONS
(
	ID INT NOT NULL,
	PERSONE_NAME VARCHAR(30) NOT NULL,
	BIRTH_DATE DATE,
	PHONE VARCHAR(10) NOT NULL
	CONSTRAINT pk_persons PRIMARY KEY (ID)
);

-- Alter the table and add email id in it.

ALTER TABLE PERSONS
ADD EMAIL_ID VARCHAR(30) NOT NULL;

SELECT * FROM dbo.PERSONS;