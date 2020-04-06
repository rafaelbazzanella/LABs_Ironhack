
INSERT INTO Car (VIN , Manufacturer, Model , Year , Color) VALUES ('3K096I98581DHSNUP' , 'Volkswagen' , 'Tiguan' , 2019 , 'Blue')
INSERT INTO Car (VIN , Manufacturer, Model , Year , Color) VALUES ( 'ZM8G7BEUQZ97IH46V' , 'Peugeot' , 'Rifter' , 2019 , 'Red');
INSERT INTO Car (VIN , Manufacturer, Model , Year , Color) VALUES ( 'RKXVNNIHLVVZOUB4M' , 'Ford' , 'Fusion' , 2018 , 'White');
INSERT INTO Car (VIN , Manufacturer, Model , Year , Color) VALUES ( 'HKNDGS7CU31E9Z7JW' , 'Toyota' , 'RAV4' , 2018 , 'Silver');
INSERT INTO Car (VIN , Manufacturer, Model , Year , Color) VALUES ( 'DAM41UDN3CHU2WVF6' , 'Volvo' , 'V60' , 2019 , 'Gray');
INSERT INTO Car (VIN , Manufacturer, Model , Year , Color) VALUES ( 'DAM41UDN3CHU2WVF6' , 'Volvo' , 'V60 Cross Country' , 2019 , 'Gray');

select * from Car;



### Customers
INSERT INTO customer (ID_Customer, Name, Phone_Number, Email,Address,City, State_Province,Country,Zip) Values (10001 , 'Pablo Picasso' , '+34 636 17 63 82' , '-' , 'Paseo de la Chopera, 14 ', 'Madrid' , 'Madrid' , 'Spain' , 28045 );
INSERT INTO customer (ID_Customer, Name, Phone_Number, Email,Address,City, State_Province,Country,Zip) Values ( 20001 , 'Abraham Lincoln' , '+1 305 907 7086' , '-' , '120 SW 8th St' , 'Miami' , 'Florida' , 'United States' , 33130 );
INSERT INTO customer (ID_Customer, Name, Phone_Number, Email,Address,City, State_Province,Country,Zip) Values ( 30001 , 'Napoléon Bonaparte' , '+33 1 79 75 40 00' , '-' , '40 Rue du Colisée' , 'Paris' , 'Île-de-France' , 'France' , 75008  );

ALTER TABLE customer ALTER COLUMN Phone_Number TYPE VARCHAR

SELECT * FROM customer

### Salespersons
ALTER TABLE salesperson ALTER COLUMN nome TYPE VARCHAR

INSERT INTO salesperson (ID_Salesperson, nome, Store) VALUES(00001 , 'Petey Cruiser' , 'Madrid');
INSERT INTO salesperson (ID_Salesperson, nome, Store) VALUES(00002 , 'Anna Sthesia' , 'Barcelona' );
INSERT INTO salesperson (ID_Salesperson, nome, Store) VALUES(00003 , 'Paul Molive' , 'Berlin' );
INSERT INTO salesperson (ID_Salesperson, nome, Store) VALUES(00004 , 'Gail Forcewind' , 'Paris' );
INSERT INTO salesperson (ID_Salesperson, nome, Store) VALUES(00005 , 'Paige Turner' , 'Mimia' );
INSERT INTO salesperson (ID_Salesperson, nome, Store) VALUES(00006 , 'Bob Frapples' , 'Mexico City');
INSERT INTO salesperson (ID_Salesperson, nome, Store) VALUES(00007 , 'Walter Melon' , 'Amsterdam' );
INSERT INTO salesperson (ID_Salesperson, nome, Store) VALUES(00008 , 'Shonda Leer' , 'São Paulo');

SELECT * FROM salesperson

### Invoices
ALTER TABLE invoice ALTER COLUMN "date" type date using ("date"::text::date);

INSERT INTO invoice (ID_Invoice,  Date,VIN,ID_Customer, ID_Salesperson) VALUES(852399038 , '22-08-2018' , 0 , 1 , 3);
INSERT INTO invoice (ID_Invoice,  Date,VIN,ID_Customer, ID_Salesperson) VALUES(731166526 , '31-12-2018' , 3 , 0 , 5);
INSERT INTO invoice (ID_Invoice,  Date,VIN,ID_Customer, ID_Salesperson) VALUES(271135104 , '22-01-2019' , 2 , 2 , 7 );

delete from invoice
SELECT * FROM invoice



