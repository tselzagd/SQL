select distinct list_price from sales.order_items
where list_price>599 and list_price<700 and discount=0.2--7
select count (*) from production.customers
where email like '%yahoo.com' and state in ('NY','CA') and zip_code in ('14217','11372')--8

select * from production.customers
where email like '%yahoo.com' and state in ('NY','CA') and zip_code in ('14217','11372') --8

--- the "in" function is used when searching for things that are in multiple categories. like searching for entries in 
either NY or CA.
--- whereas the "like" function is used when searching for things that apply to a certain criterion. like searching for entries 
with only yahoo emails.

select * from dbo.employee
order by salary, gender, statecode desc

select * from dbo.employee
order by gender desc

select * from dbo.customer_info
order by first_name 

select * from dbo.customer_info
order by first_name desc

select * from dbo.customer_info
order by last_name, first_name desc

select * from dbo.customer_info
order by first_name, last_name 

select * from dbo.customer_info
where last_name not like 'a%'
order by last_name desc

/* "double quotation", 'single quotation', \ backslash, / forward slash, { curly bracket }, [ brackets ]

--- SQL ALIASES
SQL aliases are used to give a table, or a column in a table, a temporary name.
Aliases are often used to make column names more readable. An alias only exists for the duration of that query.
Aliases are created with AS keyword.

*/

select * from dbo.orders
select requireddate as expected_date, employeeid as ajilchin_dugaar from dbo.orders

select * from dbo.customer_info

--create full_name
Select first_name + ' ' + last_name as full_name, 
street + ' ' + city + ' ' + state as full_address, *  from dbo.customer_info

select street + ' ' + city + ' ' + state + ' ' as full_address, * from dbo.customer_info

select (list_price*(1-discount)) +  (list_price*(1-discount))*0.15 as sale_price, * from sales.order_items

select lower(contacttitle) as shine_lower_case, upper(address) as shine_upper_case, * from dbo.customers

select lower (contacttitle) as shine_lowercase_contacttitle, lower(city) as shine_lowercase_city, * from dbo.customers

select right(phone, 4) as last_four_digits, * from dbo.customers
select left(first_name,4), * from dbo.customer_info
select left(first_name,4) from dbo.customer_info

select right(email,5) as suuliin_tav, * from dbo.customer_info

select len(first_name), first_name from dbo.customer_info
order by len(first_name) desc --11

select len(last_name), last_name from dbo.customer_info
order by 1 --3

select len(last_name), last_name from dbo.customer_info
order by 1 desc --11

select len(product_name), product_name from production.products
order by 1 --15

select len(product_name), product_name from production.products
order by 1 desc --53

--- ANOTHER WAY TO FIND THE MAX LENGTH OF PRODUCT NAME

select max(len(first_name)) from dbo.customer_info --11
select min(len(first_name)) from dbo.customer_info --2

select * from production.products

select * from dbo.customer_info
where len(first_name)=11 ---4

select count (*) from dbo.customer_info
where len(first_name)=11 ---4

select count(*) from dbo.customer_info
where len(first_name)<10

select * from dbo.customer_info
where len(first_name)>=10 ---21















































select * from dbo.customer_info




