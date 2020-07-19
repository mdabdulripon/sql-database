/**
* ! LIKE OPERATORS: The LIKE operator is use with WHERE clause to search for a specified pattern.
*/

-- FIND all companies Start with a:
SELECT * FROM CompanyInfo
WHERE companyName LIKE 'a%';


-- FIND all companies Start with n:
SELECT * FROM CompanyInfo
WHERE companyName LIKE 'n%';


-- FIND all companies end with a:
SELECT * FROM CompanyInfo 
WHERE companyName LIKE '%a';


-- FIND all companies end with n:
SELECT * FROM CompanyInfo
WHERE companyName LIKE '%n';


-- FIND all companies that containes a:
SELECT * FROM CompanyInfo 
WHERE companyName LIKE '%a%'


-- FIND all companies that containes n:
SELECT * FROM CompanyInfo 
WHERE companyName LIKE '%n%';


-- FIND all companies that starts with ri and end with n:
SELECT * FROM CompanyInfo 
WHERE companyName LIKE 'ri%n';


-- FIND all companies that does not have 'n' 
SELECT * FROM CompanyInfo 
WHERE companyName NOT LIKE '%n%'


-- FIND all Companies that second leter is x.
SELECT * FROM CompanyInfo
WHERE companyName LIKE '_x%';


-- FIND all Companies that start with 6 and at least 4 characters long.
SELECT * FROM CompanyInfo 
WHERE companyName LIKE '6%___';
