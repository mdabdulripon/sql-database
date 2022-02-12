# SQL - Relational Database

## Environments:

- Need to up and running the [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).
- To interact with the database download [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15)

## Abbreviation:

- SQL: Structured Query Language
- RDBMS: Relational Database Management System.
- ANSI: American National Standards Institute
- IOS: International Organization for Standardization

## SQL Clause:

- The SELECT clause is used to select data from a database
- The WHERE clause is used to filter records
- The ORDER BY keyword is used to sort the result-set in ascending (ASC) or descending (DESC) order.
- The INSERT INTO clause is used to insert new records.

## What is database [normalization](https://towardsdatascience.com/database-normalization-explained-53e60a494495)

- Normalization is a technique for organizing data in a database

## What are the basic SQL commands?

- Select: Retrieves one or more rows form the table.
- Insert Into: Adds one or more rows into a table.
- Update: Modifies one or more rows in a table.
- Delete: Removes one or more rows from one table.

## Constraints:

    - Constraints specify the rules of the data in a table.
    - Constraints ensures the accuracy and reliability of the data in the table.
    - Constraints can be apply in the column level or table level.

## What are the Constraints?

- [x] NOT NULL - Ensures that a column cannot have a NULL value.
- [x] UNIQUE - Ensures that all values in a column are different
- [x] PRIMARY KEY
  - Uniquely identifies each row in a table.
  - Primary keys must contain UNIQUE values, and cannot contain NULL values.
  - A table can have only one primary key; and in the table, the primary key can consist of single or multiple columns.
  ```sql
      CREATE TABLE users (
       id SERIAL PRIMARY KEY,
          username VARCHAR(50)
      )
  ```
- [x] FOREIGN KEY
  - A FOREIGN KEY is a key used to link between two tables together.
  - A FOREIGN KEY is a field in one table that refers to the PRIMARY KEY in another table.
  ```sql
      CREATE TABLE photos(
          id SERIAL PRIMARY KEY,
          url VARCHAR(200),
          user_id INTEGER REFERENCES users(id)
      );
  ```
- [x] CHECK - Ensures that all values in a column satisfies a specific condition
- [x] DEFAULT - Sets a default value for a column when no value is specified
- [x] INDEX
  - Index used to create indexes in the tables.
  - Indexes are used to retrieve data from the database very quickly.

## What is auto increment?

- Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table

## What is LIKE Operator?

- The LIKE operator is use with WHERE clause to search for a specified pattern.

## There are two wildcards that conjunction with the LIKE operator

- [x] % The percent sign represents zero, one, or multiple characters.
- [x] \_ The underscore represents a single character

## LIKE Operators with `%` and `_` wildcards

| **LIKE Operators** | **Description**                                                          |
| ------------------ | ------------------------------------------------------------------------ |
| `LIKE 'a%'`        | Finds any values that start with "a"                                     |
| `LIKE '%a'`        | Finds any values that end with "a"                                       |
| `LIKE '%rip%'`     | Finds any values that have "rip" in any position                         |
| `LIKE 'a%o'`       | Finds any values that start with "a" and ends with "o"                   |
| `LIKE '_r%'`       | Finds any values that have "r" in the second position                    |
| `LIKE 'a__%'`      | Finds any values that start with "a" and at least 3 characters in length |

## What is [WHERE](./sql-commands/where.sql) Clause?

- The WHERE clause is used to filter records.
- The WHERE clause is extract only those records that fulfill the specified condition.
- The WHERE clause can be combined with AND, OR, and NOT operators to perform multiple conditions.

## Operators that are use in The WHERE Clause

| **Operator** | **Description**       |
| ------------ | --------------------- |
| `=`          | Equal                 |
| `>`          | Greater than          |
| `<`          | Less than             |
| `>=`         | Greater then or equal |
| `<=`         | Less then or equal    |
| `<>`         | Not Equal             |
| `Between`    | Between               |
| `Like`       | Like                  |
| `in`         | In                    |

## SQL has Four types Relationships

- Many to One
- One to Many
- Many to Many
- One to One

### Creating Users table (pgsql)

```sql
CREATE TABLE users (
	id int PRIMARY KEY,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
	username VARCHAR(30) NOT NULL,
	bio VARCHAR(100),
	avatar VARCHAR(200),
	phone VARCHAR(25),
	email VARCHAR(40),
	password VARCHAR(50),
	status VARCHAR(15),
	CHECK(COALESCE(phone, email) IS NOT NULL) -- check either phone or email should presented
);
```

### Creating and deleting index

```sql
CREATE INDEX ON users (username);
DROP INDEX users_username_idx
```

### Explain how long does it take to query execute

```sql
EXPLAIN ANALYZE SELECT *
FROM users
WHERE username = 'Emil30';
```

### Find the amount of space use by a table and index

```sql
SELECT pg_size_pretty(pg_relation_size('users')); -- table
SELECT pg_size_pretty(pg_relation_size('users_username_idx')); -- index
```

### Downside of index

- Store more data or user more space
- Can slow down the inset, update, and delete operation because it also need to update the index while performing these query
- index might not actually used

### Common table Expression(CTE)

- Show the username of users who were tagged in a caption or photo before 2010-01-07. Also show the date they were tagged
- Note: use users, caption_tags, photo_tags table to solve this question

```sql
WITH tags AS(
	SELECT user_id, created_at FROM caption_tags
	UNION ALL
	SELECT user_id, created_at FROM photo_tags
)
SELECT users.username, tags.created_at
FROM users
JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';
```

### Create a View

```sql
  CREATE VIEW tags AS (
    SELECT id, created_at, user_id, post_id, 'photo_tag' AS type FROM photo_tags
    UNION ALL
    SELECT id, created_at, user_id, post_id, 'caption_tag' AS type FROM caption_tags
  )
```

### Find the popular user who mention frequently in the photo_tags and caption_tags

```sql
  --By using tags view
  SELECT username, COUNT(*)
  FROM users
  JOIN tags ON tags.user_id = users.id
  GROUP BY username
  ORDER By COUNT(*) DESC;

  -- Without the view
  SELECT username, COUNT(*)
  FROM users
  JOIN (
    SELECT user_id FROM photo_tags
    UNION ALL
    SELECT user_id FROM caption_tags
  ) AS tags ON tags.user_id = users.id
  GROUP BY username
  ORDER By COUNT(*) DESC;
```

### Find 10 most recent post

```sql
  CREATE VIEW recent_posts AS (
    SELECT *
    FROM posts
    ORDER BY created_at DESC
    LIMIT 10
  );
```

### Modify the views: Modify the limit to 15

```sql
  CREATE OR REPLACE VIEW recent_posts AS (
    SELECT *
    FROM posts
    ORDER BY created_at DESC
    LIMIT 15
  );
```

### Delete a view

```sql
  DROP VIEW recent_posts;
```
