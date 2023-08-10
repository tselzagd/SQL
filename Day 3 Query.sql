select product_id, product_name, category_id from stage.products
where category_id= 25;

select product_id, product_name, category_id from stage.products
where product_name= 'banana'

select * from sales.customers
where state= 'ca'

/* conditions
>
<
>=
<=
<> not equal (exclude)
between: between a certain range
like: search for a pattern. example: any name that starts with "john"
in: to specify multiple possible values for a column
*/ 

select * from sales.customers
where first_name like 'De___'

select * from sales.customers
where zip_code in ('14127', '11717', '14606')

-- when you use "in" function, put the values in () brackets
-- ene bol 5000aas ih unetei order itemuudiig gargaj bgaa query:
select * from sales.order_items
where list_price > 5000
-- ene bol 1000aas baga unetei order itemuudiig gargaj bgaa query:
select * from sales.order_items
where list_price < 1000

select * from sales.order_items
where list_price <=599.99

select * from sales.order_items
where list_price >=599.99

select * from sales.order_items
where list_price <> 429

select * from sales.order_items
where discount <> 0.2

select * from sales.order_items
where list_price between 500 and 1000

select * from sales.order_items
where discount between 0.1 and 0.2

select * from sales.customers
where first_name like 'ka%' --38

select * from sales.customers
where first_name like 'ka___' -- 10

select * from sales.customers
where first_name like 'ka__a' --6

select * from sales.customers
where first_name like '%ra' --48

select * from sales.orders
where customer_id in ('259', '1212','523')

/* SQL AND, OR AND NOT OPERATORS
*/

select * from sales.customers
where state ='NY' and zip_code='14127'

select * from sales.customers
where state ='NY' or zip_code='14127'

select distinct * from sales.customers
where state='NY' or first_name like 'al%'

select * from sales.order_items
where discount= 0.2 and list_price=599.99

select * from sales.customers
where phone is not NULL

select * from dbo.customers
where contactname =''

Select * from dbo.customers
where address =''

select * from sales.order_items
where list_price= 599.99 and discount= 0.05 

select * from sales.order_items
where list_price= 599.99 or discount= 0.05

--INSERT

select * from dbo.customers
where customerid like '%6481'

update 


INSERT INTO dbo.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax)
VALUES 
('e6481', 'Google', 'Tselmuun', 'CPO', '11801 Rockville Pike', 'Rockville' , 'MD', '20852', 'USA', '571-222-2222', null)

--What is my IP address?

Update dbo.customers set contactname='Tmuun' where customerid='6481'

Update dbo.customers set contactname='Unknown' where customerid='32167'






































