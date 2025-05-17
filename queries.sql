-- Making advance sql queries

-- 1.) let assume you want to compare the sales(promotion simulation)
Select case 
when o.InvoiceDate < '2010-11-01' then 'Before Promotion'
else 'After Promotion' end as Period,
round(sum(od.Quantity*od.UnitPrice),2) as TotalRevenue
from OrderDetails od  
Join Orders o 
on od.InvoiceNo = o.InvoiceNo
group by Period;

-- 2.) Customer Cohorts by Month means make customer group 
-- cohort month = month they first purchased

with FirstOrderMonth as(
select customerID,
min(date_trunc('month', InvoiceDate)) as CohortMonth
from Orders
Group by CustomerID
)
Select 
To_char(CohortMonth, 'YYYY-MM') as CohortMonth,
count(distinct CustomerID) as NumCustomers
from FirstOrderMonth
group by CohortMonth
order by CohortMonth;

-- 3.) Top Customers by total revenue: 
Select CustomerID,
Round(sum(od.Quantity * od.UnitPrice),2) as totalspent,
rank() over (order by sum(od.Quantity * od.UnitPrice) Desc) as rank
from OrderDetails od
join Orders o
on od.InvoiceNo = o.InvoiceNo
group by CustomerID
order by totalspent desc
limit 10;

-- 4.) check how many customers ordered once vs more than once
with CustomerOrderCounts as( 
select CustomerID,
count(distinct InvoiceNo) as NumOrders
from Orders
group by CustomerID
)
select case
when  NumOrders = 1 then 'One-Time Customer'
else 'Repeat Customer'
end as CustomerType,
count(*) as NumCustomers
from CustomerOrderCounts
group by CustomerType;

