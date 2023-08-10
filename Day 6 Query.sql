--- Homework 3 Queries
select left(first_name, 5), * from production.customers

select right(last_name, 4), * from production.customers

select max(len(first_name))from production.customers

select min(len(first_name)) from production.customers

select upper(first_name), * from production.customers

select lower(first_name), * from production.customers

--- Show time zone: UTC (Coordinated Universal Time)
Select getdate(), * from dbo.orders
Select * from dbo.orders

Insert into dbo.orders (customerid, employeeid, orderdate, requireddate, shippeddate, 
shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry)
values ('Vinet', '5', getdate(), dateadd(week, 3, getdate()), dateadd(day, 2, getdate()), 
3, 12.11, 'Mongoljin', '123 Rockville Pike',   'Arlington', 'VA', '12312', 'USA')

select dateadd (week,3 , getdate())
select dateadd (month, -3, getdate())

select * from dbo.orders where shipname='Mongoljin'

insert into dbo.orders (customerid, employeeid, orderdate, requireddate, shippeddate, 
shipvia, freight, shipname, shipaddress, shipcity, 
shipregion, shippostalcode, shipcountry)
values ('Welli', '3', getdate(), dateadd(week, 3, getdate()), dateadd(day, 5, getdate()), 
'2', 33.28, 'Tsagaanaa', '552 Hope Street', 'Rio De Janeiro', 
NULL, '45522', 'Brazil')

select * from dbo.orders 
where shipname='Tsagaanaa'


select dateadd (year, -2, getdate())

select dateadd (week, 14, getdate())

select dateadd (hour, 17, getdate())

select dateadd (hour, -9, getdate())

select sysdatetimeoffset ()

select dateadd(month, 3, getdate()) -- 2023-11-03
select dateadd (day, -5, getdate()) --2023-07-29
select dateadd(year, 2, getdate()) --2025-08-03

--- Separate the year from date:
Select year(getdate())

select month(orderdate) as order_sar, * from dbo.orders
where month(orderdate)=8 --22

select month(orderdate) as order_sar, * from dbo.orders
where month(orderdate)=9 --60

select month(orderdate) as order_sar, * from dbo.orders
where month(orderdate)=10

select count (*) from dbo.orders
where month(orderdate)=11 --59

select month(orderdate) as order_sar, * from dbo.orders
where month(orderdate)=12 --79

select * from dbo.orders
where year(orderdate)=1997

select format(getdate(), 'yyyy-MM-dd')
select format(getdate(), 'mm-dd-yy') as USA, getdate() as Mongol

select format (getdate(), 'MM/dd/yyyy hh:mm:ss') as USA, getdate () as Mongol

select first_name, last_name from sales.customers
where zip_code='14127' --22 rows

select * from sales.customers

select count (distinct (customer_id)) from sales.orders --1445

select count (customer_id) from sales.orders --1621
select * from sales.orders
select distinct (customer_id) from sales.orders

select max(list_price) as hamgiin_ih, min(list_price) as hamgiin_baga, avg(list_price) as dundaj_price from sales.order_items
--- 11999.99 and 89.99 and 1212.707871

select max(len(street)) from sales.customers --29

select * from sales.customers

select * from sales.customers
where state='CA'

select distinct(zip_code) from sales.customers
where state='NY' --134

select * from sales.customers
where state <> 'NY' and state <> 'TX' --306

select * from sales.customers
where state <> 'NY' or state <> 'TX'

<> and != are the same
not like  -- wildcard (picking some of the characters from a column, not full column. used for endings or beginnings)

select * from sales.customers
where state not in ('NY', 'TX')

select * from sales.customers
where email not like '%yahoo.com' and phone ='NULL'  --1186

select * from dbo.customers
where fax is null

select * from dbo.customers
where country is null

select * from dbo.customers
where contacttitle =''

distinct() remove duplicates






































































