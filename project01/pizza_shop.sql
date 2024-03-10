--Create table customers
CREATE TABLE customers (
  Customerid int,
  Firstname text,
  Lastname text,
  Country text,
  Email text,
  Tel text
);

INSERT INTO customers
VALUES 
  (1, "Peter","Smith","USA","Peter@gmail.com","1900900988"), 
  (2,"Ada","Carpenter","Fiji","AdaC@yahoo.com","1067557855"), 
  (3,"Johny","Depp","Ireland",Null,"1776643211"),
  (4,"Iris","Lee","Korea","Lee@outlook.com","1775530033");


--Create table Invoices
CREATE TABLE Invoices (
  Invoiceid int,
  Customerid int,
  Invoicedate date,
  Amount real
);

INSERT INTO Invoices
VALUES 
  (1,2,"2023-10-29",500),
  (2,3,"2023-10-30",300),
  (3,1,"2023-11-01",700),
  (4,4,"2023-11-04",400);


--Create table Invoice_item
CREATE TABLE Invoice_item (
  Itemid int,
  Invoiceid int,
  Menuid int,
  Menu text,
  UnitPrice real,
  Quantity int
);

INSERT INTO Invoice_item
VALUES 
  (1,1,3,"Seafood",500,1),
  (2,2,2,"FourCheese",300,1),
  (3,3,1,"Veggie",350,2),
  (4,4,1,"Pepporoni",400,1);

.mode box
SELECT * FROM Customers;
SELECT * FROM Invoices;
SELECT * FROM Invoice_item;

--Aggregate functions
SELECT
  COUNT (*),
  AVG(Amount),
  SUM(Amount),
  MIN(Amount),
  MAX(Amount)
FROM Invoices;

--CASE WHEN
SELECT
  CASE
    WHEN amount >=600 THEN "High"
    WHEN amount >=500 THEN "Medium"
    ELSE "Low"
  END AS Invoice_level,
  COUNT (*) AS num_invoices
FROM Invoices
GROUP BY 1;

-- Filter data - WHERE operator
SELECT * FROM customers
WHERE Firstname LIKE 'A%' OR Email LIKE '%gmail%';
  
-- Filter data - IN operator
SELECT * FROM Invoice_item
WHERE Menu IN  ('Seafood');

--Join function
SELECT
  cu.Firstname,
  cu.Lastname,
  inv.invoiceid,
  inv.Invoicedate,
  inv_item.Menu,
  inv_item.UnitPrice
  FROM customers AS cu
JOIN invoices AS inv
  ON cu.Customerid = inv.Customerid
JOIN invoice_item AS inv_item
  ON inv.invoiceid = inv_item.invoiceid;

--basic query
SELECT
  cu.Firstname,
  cu.Email,
  cu.Tel,
  COUNT(*) count_order
FROM customers AS cu
JOIN invoices inv ON cu.Customerid = inv.Customerid
WHERE country = 'Ireland' AND STRFTIME ("%Y-%m",inv.invoicedate)="2023-10"
GROUP BY 1;

--Subqueries
SELECT
  cu.Firstname,
  cu.Lastname,
  inv.Invoiceid,
  inv.Invoicedate,
  sub.Menu,
  sub.UnitPrice,
  sub.Quantity,
  COUNT(*) count_order
FROM (
  SELECT * from Invoice_item 
  WHERE Menu = "Pepporoni" OR Menu = "Veggie"
) AS sub
JOIN invoices inv ON sub.invoiceid = inv.invoiceid
JOIN customers cu ON inv.Customerid = cu.Customerid
WHERE quantity >= 1 
GROUP BY 2;

--Millions thanks for running my code :) --