# sql-database

- [x] RDBMS stands for Relational Database Management System.
- [x] ANSI stands for American National Standards Institute
- [x] ISO stands for International Organization for Standardization


#### The SELECT statement is used to select data from a database.
#### The WHERE statement is used to filter records.
**Operators in The WHERE Clause**
-------------- | ------------------ 
**Operator**   | **Description**
=	           |  Equal
>              |  Greater than
<              |  Less than
>=             |  Greater then or equal  
<=             |  Less then or equal 
<>             |  Not Equal
Between        |  Between 
Like           |  Like
in             |  In 

#### The ORDER BY keyword is used to sort the result in ascending or descending order.
#### The INSERT INTO statement create new records in a table.


#### Constraints: 
    - Constraints specify the rules of the data in a table.
    - Constraints ensures the accuracy and reliability of the data in the table.
    - Constraints can be apply in the column level or table level.


#### What are the Constraints?
- [x] NOT NULL - Ensures that a column cannot have a NULL value.
- [x] UNIQUE - Ensures that all values in a column are different
- [x] PRIMARY KEY 
    - Uniquely identifies each row in a table. 
    - Primary keys must contain UNIQUE values, and cannot contain NULL values.
    - A table can have only one primary key; and in the table, the primary key can consist of single or multiple columns.
- [x] FOREIGN KEY 
    - Uniquely identifies a record in another table
    - A FOREIGN KEY is a field in one table that refers to the PRIMARY KEY in another table.
- [x] CHECK - Ensures that all values in a column satisfies a specific condition
- [x] DEFAULT - Sets a default value for a column when no value is specified
- [x] INDEX 
    - Index used to create indexes in the tables.
    - Indexes are used to retrieve data from the database very quickly.

#### Waht is auto increment?
*Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table*


#### LIKE Operator: The LIKE operator is use with WHERE clause to search for a specified pattern.

#### There are two wildcards that conjunction with the LIKE operator
- [x] % The percent sign represents zero, one, or multiple characters.
- [x] _ The underscore represents a single character



**LIKE Operators with ```%``` and ```_``` wildcards**
--------------------------- | --------------------------
**LIKE Operators**          |        **Description**
LIKE 'a%'                   |  Finds any values that start with "a"
LIKE '%a'                   |  Finds any values that end with "a"
LIKE '%rip%'                |  Finds any values that have "rip" in any position
LIKE 'a%o'                  |  Finds any values that start with "a" and ends with "o"

