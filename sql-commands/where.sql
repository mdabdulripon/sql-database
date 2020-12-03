-- WHERE CLAUSE: The WHERE clause is used to filter records.
SELECT *
FROM [Contacts].[dbo].[Contacts]
WHERE AllowContactByPhone = 0;


-- WHERE CLAUSE WITH AND OPERATOR
SELECT *
FROM [Contacts].[dbo].[Contacts]
WHERE AllowContactByPhone = 0 AND DateOfBirth > '1980-01-01';



-- WHERE CLAUSE WITH OR OPERATOR
SELECT *
FROM [Contacts].[dbo].[Contacts]
WHERE FirstName = 'Stephen' OR LastName = 'Lee';

-- WHERE CLAUSE WITH NOR OPERATOR
SELECT *
FROM [Contacts].[dbo].[Contacts]
WHERE NOT (FirstName = 'Stephen' OR LastName='Adams');
-- WHERE NOT FirstName = 'Stephen' OR NOT LastName='Adams';

-- WHERE CLAUSE WITH BETWEEN OPERATOR
-- WHERE DateOfBirth BETWEEN ;
SELECT *
FROM [Contacts].[dbo].[Contacts]
WHERE DateOfBirth BETWEEN '1990-01-27' AND '2001-06-30';

-- To SELECT outside the of the range we can use NOT BETWEEN:
SELECT *
FROM [Contacts].[dbo].[Contacts]
WHERE DateOfBirth NOT BETWEEN '1990-01-27' AND '2001-06-30';


-- WHERE CLAUSE WITH BETWEEN AND IN Example
-- NOT IN: SELECT ALL THE CONTACTS THAT MENTION IN ```NOT IN(.,.,.,.,.)``` 
-- IN: SELECT ALL THE CONTACTS THAT MENTION IN ```IN(.,.,.,.,.)``` 
SELECT *
FROM [Contacts].[dbo].[Contacts]
WHERE DateOfBirth BETWEEN '1980-05-30' AND '2001-06-30'
AND LastName IN ('lee', 'Marx', 'Jones');


SELECT *
FROM [Contacts].[dbo].[Contacts]
ORDER BY DateOfBirth DESC;