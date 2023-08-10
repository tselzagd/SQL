
 

select * from sales.orders
select * from sales.customers

--- Looking for orders data that qualifies following: 
--- Customer who lives in 90278 area with gmail email and order should be shipped. 
select * from sales.orders
where shipped_date is null and customer_id in
(select customer_id from sales.customers
where zip_code='90278' and email like '%gmail.com')

/* Looking for Brand products that quantity is between 25,30 and 
I want to see each brand_id have how many product has. 
In other words what brand product does not sell well. Does not sell well = quantity (25,30) left. */

select * from production.stocks
select * from production.products

select count(*) as products_per_brand, brand_id from production.products
where product_id in
(select product_id from production.stocks
where quantity between 25 and 30)
group by brand_id
order by count(*) desc











