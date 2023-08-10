select * from sales.customers
where zip_code= '90278' and email like '%gmail.com'

select * from sales.customers
where phone is null and zip_code= '11553' and state='NY'

select * from production.products
where model_year='2016'

select * from production.products
where len(product_name)<=20

select * from production.products
where model_year between 2016 and 2017 and list_price between 379 and 600

/*
--- Write queries on SQL Server Management Studio
Where is 'restrictions'
operators =, >, <, between, like, in, <>
order by asc, desc

*/

select * from sales.order_items 
where product_id in 
(select product_id from production.products where model_year='2016')

select * from SALES.order_items

select * from dbo.employee

select max(salary) from dbo.employee --- Hamgiin Ih

select top 1 salary from dbo.employee
where salary < (select max(salary) from dbo.employee)
order by salary desc


[dbo].[Departments.SubQ]
select * from dbo.[employees_subq]
where department_id in
( select deparotment_id from dbo.departments_subq where department_name='HR')

select department_id from dbo.employees_subq
where employee_name= 'Carol'

select department_name from dbo.departments_subq
where department_id= ( select department_id from dbo.employees_subq where employee_name='Carol')


--- A query to find an employee's name who salary is greater than Bob

select employee_name from dbo.employees_subq
where salary> (select salary from dbo.employees_subq where employee_name='Bob')

--- find employees who work in the same department as Alice

select employee_name from dbo.employees_subq
where department_id= (select department_id from dbo.employees_subq
where employee_name='Alice')

--- find employees whose department name containing 'Sales'

select employee_name from dbo.employees_subq
where department_id= 
(select department_id from dbo.departments_subq where department_name = 'Sales')

select * from sales.orders

--- Find orders from customers who live in CA, zip_code 95008

select * from sales.orders
where customer_id in
(
select customer_id from sales.customers
where state='CA' and zip_code='95008'
)

select * from sales.orders

-- How to get product name with stock less than 10 pieces

select * from production.products
select * from production.stocks

select max(list_price), min(list_price), avg(list_price) from production.products
where product_id in(select product_id from production.stocks where quantity<10 )






