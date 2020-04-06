CREATE TABLE Customer (ID_Customer int, Name varchar(200), Phone_Number int, Email varchar(200),
					   Address varchar(200), City varchar(200), State_Province varchar(200),
					   Country varchar(200), Zip int)
					   
CREATE TABLE Invoice (ID_Invoice int, ID_Customer int, ID_Salesperson int, Date bigint, VIN int )

CREATE TABLE Salesperson ( ID_Salesperson int, nome int, Store varchar(200))

CREATE TABLE Car (VIN varchar(200), Manufacturer varchar(200), Model varchar(200), Year int, Color varchar(200))

SELECT * FROM Customer;
SELECT * FROM Invoice;
SELECT * FROM Salesperson;
SELECT * FROM Car;