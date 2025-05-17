-- This is a raw table to import data from csv file in ERD pattern
create table raw_data(
InvoiceNo Varchar,
StockCode Varchar,
Description Text,
Quantity Integer,
InvoiceDate Timestamp,
UnitPrice Numeric,
CustomerID Varchar,
Country Varchar
);

-- Normalize Table or we can say that divided the dataset(total 4 tables)

/* Note: always remember to use drop after create because instead
run script duplicate everything now as above i forgot now working 
below with data too much cleary */ 

Drop table if exists OrderDetails;
Drop table if exists Orders;
Drop table if exists Products;
Drop table if exists Customers;

-- 1.) Customers table
create table Customers( 
CustomerID varchar primary key,
Country varchar
);

-- 2.) Products
create table Products( 
StockCode varchar primary key,
Description text
);

-- 3.) Orders
create table Orders(
InvoiceNo varchar primary key,
InvoiceDate timestamp,
CustomerID varchar references Customers(CustomerID)
);

-- 4.) OrderDetails
create table OrderDetails( 
DetailID Serial primary key, -- we made DetailID and serial give no sequence-wise it is just like Index
InvoiceNo varchar references Orders(InvoiceNo),
StockCode varchar references Products(StockCode),
Quantity Interger,
UnitPrice Numeric 
);

-- Move Data from raw to tables
Insert into Customers(CustomerID, Country)
select distinct CustomerID, Country
from raw_data
where CustomerID is not null
on conflict (CustomerID) do nothing;

Select * from Customers;

-- just checking the Customers table CustomerID primary duplicate error with country wise 
select CustomerID, Count(distinct Country) as CountyCount, 
string_agg(distinct Country, ', ') as Countries
from raw_data
where CustomerID is not null
group by CustomerID
Having Count(distinct Country) > 1;

-- Insert into Products
Insert into Products(StockCode, Description)
Select distinct StockCode, Description
from raw_data
on conflict (StockCode) do nothing;

select * from Products;

-- Insert into Orders
Insert into Orders(InvoiceNo, InvoiceDate, CustomerID)
Select distinct InvoiceNo, InvoiceDate, CustomerID
from raw_data
where CustomerID is not null
on conflict (InvoiceNo) do nothing;

Select * from Orders;

-- Insert into OrderDetails
Insert into Orderdetails(InvoiceNo, StockCode, Quantity, UnitPrice)
Select InvoiceNo, StockCode, Quantity, UnitPrice
from raw_data;

Select * from OrderDetails;


