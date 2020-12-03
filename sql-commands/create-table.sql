-- Create Table 
USE BobsShoes 
GO 

CREATE TABLE Orders.OrderTracking (
	OrderId int IDENTITY(1,1) NOT NULL,
	OrderDate datetime2(0) NOT NULL,
	RequestedDate datetime2(0) NOT NULL,
	DeliveryDate datetime2(0) NULL,
	CustomerName varchar(200) NOT NULL,
	CustomerAddress varchar(200) NOT NULL,
	ShoeStyle varchar(200) NOT NULL,
	ShoeSize varchar(10) NOT NULL,
	SKU char(8) NOT NULL,
	UnitPrice numeric(7, 2) NOT NULL,
	Quantity smallint NOT NULL,
	Discount numeric NOT NULL,
	IsExpedited bit NOT NULL,
	TotalProce as (Quantity * UnitPrice *(1.0 - Discount)), 
)
ON BobsData 
WITH (DATA_COMPRESSION = PAGE);
GO
