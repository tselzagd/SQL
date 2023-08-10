select * from production.stocks
select * from production.products

select product_name from production.products
where product_id in
(select product_id from production.stocks
where quantity=0)

select product_name from production.products
where product_id in
(select top 10 product_id from production.stocks
order by quantity desc)

select * from sales.staffs
select * from sales.orders

--- Janette how many sales

select count(order_id) from sales.orders
where staff_id =
(select staff_id from sales.staffs
where first_name='Mireya')

--- 164

--- How many orders were sold by Baldwin bikes?

select * from sales.stores

select count(order_id) from sales.orders
where store_id =
(select store_id from sales.stores
where store_name='Baldwin bikes')

--- 1097

--- Group by, order by ---
Group the data by a certain criterion or characteristic

--- How to count each store's sales
select count (*) as store_sales, store_id from sales.orders group by store_id
--- How to count number of orders by day
select count(*) as order_perday, order_date from sales.orders group by order_date
order by count(*) desc
--- 
select * from sales.orders where order_date = '2021-03-15'

select * from sales.customers

select count(*) as customer_per_city, city from sales.customers
group by city
order by 1 desc

select count(*) as customer_per_state, state from sales.customers
group by state
order by 1 desc

select count(*) as customer_per_zip, zip_code from sales.customers
group by zip_code
order by 1 desc

select * from dbo.employee

select count(*) as gender_count, gender from dbo.employee
group by gender

select count(*) as total_orders_number, store_id
from sales.orders
group by store_id
having count (*) > 1000

select count(*) as per_state, state from dbo.customer_info
group by state

select sum(salary), gender from dbo.employee
group by gender

select avg(salary), gender from dbo.employee
group by gender
having avg(salary)>71500

select * from dbo.employee

select sum(salary), gender from dbo.employee
where employeeid !=201
group by gender

select count(*), state from dbo.customer_info 
group by state
having count(*)>200

--- How many customers in each city

select count(*) as per_city, city from dbo.customer_info
group by city

--- How many city more than 10 customers

select count(*) as per_city, city from dbo.customer_info
group by city 
having count(*) >10

select * from dbo.employee

-- list of employees from each state with total salaries greater than 50000

select sum(salary), statecode from dbo.employee
group by statecode
having sum(salary) > 50000

--- Having Clause

/* Order of clauses
where
group by
order by
having
*/

select * from sales.orders

select count(*), order_date from sales.orders
group by order_date
having count(*) >=5

--- Calculate total salary for male employees in each state

select * from dbo.employee

select sum(salary) as male_totalsalary, statecode from dbo.employee
where gender <> 'F'
group by statecode
order by sum(salary) desc

--- ORDER BY clause comes LAST





























