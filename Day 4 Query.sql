select * from dbo.customers
delete from dbo.customers where customerid='6481'

--- create (insert)
--- read
--- update
--- delete

--- crud operations (create, read, update, delete)

select * from dbo.customers
insert into dbo.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax)
values ('EV329','tech2High', 'Tselmuun', 'Student', 'Maryland', 'Rockville', 'MD', '20850', 'USA', '571-111-1100', NULL)

select * from dbo.customers
where customerid= 'EV329'

update dbo.customers set companyname='Tech2High' where customerid= 'EV329'

delete from dbo.customers where customerid='EV329'

update dbo.customers set companyname='Gq' , address='Update SQL Test'
where companyname='GG' and contactname='CMO'


select top 5 percent * from dbo.customers
select top 1 percent * from Covid_Data_Team_DC

SQL Min () Max () Functions
-- The min() function returns the smallest value of the selected column. 

select max(list_price) from sales.order_items
--11999.99
select min(list_price) from sales.order_items
--89.99

select max(list_price), min(list_price) from sales.order_items
select avg(list_price) from sales.order_items
--1212.707871

select max(discount) as Hamgiin_undur, min(discount) as Hamgiin_baga from sales.order_items
--0.2 and 0.05

select avg(discount) as dundaj from sales.order_items
--0.105372

select count(*) from sales.order_items
select * from sales.order_items

select count(*) from sales.order_items where discount=0.10--1158

select count(*) from dbo.covid_data_green_st

select count(discount) from sales.order_items
select sum (list_price) from sales.order_items

select * from sales.order_items

select sum (list_price*quantity) from sales.order_items --8578988.88

select sum((list_price*(1-discount))*quantity) from sales.order_items--7,689,116.5576

select * from sales.order_items

---SQL Like Operator---

select * from production.customers where first_name like 'a%'--118
'a%' could just be one character 'a' with % also including empty entry or a name starting with 'a'
select * from production.customers where first_name like '%a'--534
select * from production.customers where first_name like '%o%'--392
select * from production.customers where first_name like '_r%'--86
select * from production.customers where first_name like 'a__%'--117
----
Insert your relatives into dbo.customers
select * from sales.order_items
Order by list_price desc
----
select * from sales.order_items
Order by list_price asc
--- ASC is the default when it comes to order

select * from sales.order_items
where list_price<>11999.99
order by list_price desc

select * from production.customers
order by first_name desc

insert into dbo.customers (customerid, companyname,contactname,contacttitle, address, city, region, postalcode, country,phone,fax)
values ('0319A', 'MCS', 'Dolgor', 'Financial Manager', '123 Road', 'Ulaanbaatar', 'MN', NULL, 'Mongolia', '213-800-0000', NULL)

insert into dbo.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax)
values ('22112', 'Coca Cola', 'Shinee', 'Technician', '552 Forest', 'Ulaanbaatar', 'MN', NULL, 'Mongolia', '213-800-0100', NULL)

select * from sales.order_items
order by list_price desc

select distinct top 5 (list_price) from sales.order_items
order by order_id , item_id desc

select * from sales.order_items
where discount<0.07
---Query to show the top 5 priced items
select distinct top 5 list_price, item_id from sales.order_items
order by list_price desc
---
select * from sales.order_items 
where product_id=2





























