**Overview**

This project involves analyzing sales data from a database to derive insights into buyer behavior, sales performance, and product trends. 
The following SQL queries have been used to generate the necessary reports and visualizations.

**Queries and Reports**

1. Top 20 Buyers Information
Objective: Generate a list of the top 20 buyers based on total purchase value.
The report includes buyer details such as name, contact information, and the total amount spent.

SELECT TOP 20
    first_name,
    last_name,
    phone,
    email,
    SUM(items.quantity * (items.list_price - (items.list_price * items.discount))) AS total_purchase_value
FROM
    sales.customers cust
JOIN
    sales.orders o ON cust.customer_id = o.customer_id
JOIN
    sales.order_items items ON o.order_id = items.order_id
GROUP BY
    first_name, last_name, phone, email
ORDER BY
    total_purchase_value DESC;

2. Location Sales Visualization
Objective: Create a geographical visualization of buyer locations to differentiate between top-performing and poor-performing sales locations.

SELECT
    cus.city,
    cus.zip_code,
    SUM(item.quantity * (item.list_price * (1 - item.discount))) AS sales
FROM
    sales.customers AS cus
JOIN
    sales.orders AS ord ON cus.customer_id = ord.customer_id
JOIN
    sales.order_items AS item ON ord.order_id = item.order_id
GROUP BY
    cus.city, cus.zip_code
ORDER BY
    sales DESC;

3. Yearly Sales Analysis
Objective: Determine which year had the highest overall sales, including a breakdown of total sales per year.

SELECT
    YEAR(ord.order_date) AS Year,
    SUM((list_price - (list_price * discount)) * quantity) AS total_sales
FROM
    sales.order_items AS it
LEFT JOIN
    sales.orders AS ord ON it.order_id = ord.order_id
GROUP BY
    YEAR(ord.order_date)
ORDER BY
    total_sales DESC;

4. Product Sales Analysis
Objective: Identify the top-selling product across all years, including product name and total sales.

SELECT
    SUM(ord_it.quantity * ord_it.list_price * (1 - discount)) AS total_sales,
    prod.product_name
FROM
    production.products AS prod
JOIN
    sales.order_items AS ord_it ON prod.product_id = ord_it.product_id
GROUP BY
    prod.product_name
ORDER BY
    total_sales DESC;

5. Best Month for Product Sales
Objective: Determine the best-performing month for each product, including a breakdown of the top-selling month and its sales figures.

WITH top_selling_month AS (
    SELECT
        pr.product_name,
        MONTH(ord.order_date) AS sales_month,
        YEAR(ord.order_date) AS sales_year,
        SUM(it.list_price * it.quantity * (1 - it.discount)) AS total_sales,
        DENSE_RANK() OVER (PARTITION BY pr.product_name ORDER BY SUM(it.list_price * it.quantity * (1 - it.discount)) DESC) AS rank
    FROM
        production.products AS pr
    JOIN
        sales.order_items AS it ON pr.product_id = it.product_id
    JOIN
        sales.orders AS ord ON ord.order_id = it.order_id
    GROUP BY
        pr.product_name, MONTH(ord.order_date), YEAR(ord.order_date)
)
SELECT TOP 10
    product_name,
    DATENAME(MONTH, DATEADD(MONTH, sales_month - 1, 0)) + ' ' + CAST(sales_year AS VARCHAR(4)) AS sales_month_year,
    total_sales
FROM
    top_selling_month
WHERE
    rank = 1
ORDER BY
    total_sales DESC;

**Usage**
These queries are intended for use with a sales database containing similar table structures. To use these queries:

**Modify Queries:** Adapt the queries to match your database schema and table names if they differ.
**Execute Queries:** Run the queries in your SQL client or database management tool to generate the reports and visualizations.

**Confidentiality Notice**
Please note that the data used in these queries is confidential and should not be shared or distributed. Access to this data is restricted to authorized personnel only. Any unauthorized use or distribution of this information is prohibited.
