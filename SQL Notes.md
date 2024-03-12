# SQL Notes

## General

- [ ] SQL Joins
  - INNER JOIN: This join returns only the rows that have matching values in both tables. If there's no match, the rows are not returned.
  - LEFT JOIN (or LEFT OUTER JOIN): This join returns all the rows from the left table, and the matched rows from the right table. If there's no match, the result is NULL on the side of the right table.
  - RIGHT JOIN (or RIGHT OUTER JOIN): This join returns all the rows from the right table, and the matched rows from the left table. If there's no match, the result is NULL on the side of the left table.
  - FULL JOIN (or FULL OUTER JOIN): This join returns rows when there is a match in one of the tables. Essentially, it combines the results of both LEFT JOIN and RIGHT JOIN. If there's no match, the result is NULL on the side without a match.
  - CROSS JOIN: This join returns a Cartesian product of the two tables, i.e., it returns all possible combinations of rows from both tables. It's not commonly used because it can result in a very large number of rows in the result set.
  - SELF JOIN: This is not a different type of join, but rather a join of a table to itself. It's useful when comparing rows within the same table.
  - NATURAL JOIN: This join implicitly joins tables based on columns with the same names and datatypes in both tables. It's like an INNER JOIN, but you don't need to specify the joining condition explicitly.

### Firebird

- [ ] Install and configure Firebird
- [ ] Research about popular Firebird DB Editors/Mangers
- [ ] Stored procedures
- [ ] Triggers and Events

## Therminalogy

- Data Query Language (DQL). Used to query the database.
- Data Definition Language (DDL). Defines the database structure.
- Data Control Language (DCL). Manages user access to the database.
- Data Manipulation Language (DML). Used to manage data within the database.


```sql
-- Creating a table
CREATE TABLE Table1 (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age SMALLINT,
    Salary DECIMAL(10, 2),
    EntryDate DATE
);

-- Creating a second table with a foreign key reference to the first table
CREATE TABLE Table2 (
    ID INT PRIMARY KEY,
    Table1ID INT,
    Description VARCHAR(255),
    FOREIGN KEY (Table1ID) REFERENCES Table1(ID)
);

-- Add a new column
ALTER TABLE Table1 ADD Email VARCHAR(255);

-- Modify a column
ALTER TABLE Table1 ALTER COLUMN Email TYPE VARCHAR(320);

-- Drop a column
ALTER TABLE Table1 DROP COLUMN Email;

-- Insert data
INSERT INTO Table1 (ID, Name, Age, Salary, EntryDate) VALUES (1, 'John Doe', 30, 50000, '2024-01-01');

-- Update data
UPDATE Table1 SET Name = 'Jane Doe' WHERE ID = 1;

-- Delete data
DELETE FROM Table1 WHERE ID = 1;

-- Stored procedure
SET TERM ^ ;

CREATE PROCEDURE GetEmployeeInfo
AS
BEGIN
    SELECT * FROM Table1;
END^

SET TERM ; ^
```
