-- AS Keyword: Is used for and alias. it is giving a temporary name in a table and column.
-- It requires double quotation marks or square brackets if the alias name contains spaces:

-- ALIAS FOR COLUMN 
SELECT ContactId as Id, CreatedDate as date
FROM [Contacts].[dbo].[Contacts];

-- Add space in the alias name
SELECT ContactId AS [Contact Id], FirstName AS "First Name"
FROM [Contacts].[dbo].[Contacts];

-- Combine Colums Alias Name

SELECT FirstName + '' + LastName AS fullname
FROM [Contacts].[dbo].[Contacts];

-- ALIAS FOR TABLE:
SELECT c.FirstName, c.DateOfBirth, a.City
FROM [Contacts].[dbo].[Contacts] AS c, [Contacts].[dbo].[ContactAddresses] AS a; 





