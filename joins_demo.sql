-- *******************************************************
-- INNER JOIN: Only rows with matching records in all tables
-- *******************************************************

SELECT
    s.sale_id,
    c.customer_name,
    p.product_name,
    s.sale_date,
    s.total_amount
FROM
    sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
INNER JOIN products p ON s.product_id = p.product_id;

-- *******************************************************
-- LEFT JOIN: All customers, with sales and products if available
-- *******************************************************

SELECT
    c.customer_name,
    s.sale_id,
    p.product_name,
    s.sale_date,
    s.total_amount
FROM
    customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
LEFT JOIN products p ON s.product_id = p.product_id;

-- *******************************************************
-- RIGHT JOIN: All sales (and matching customers & products)
-- *******************************************************

SELECT
    s.sale_id,
    c.customer_name,
    p.product_name,
    s.sale_date,
    s.total_amount
FROM
    sales s
RIGHT JOIN customers c ON s.customer_id = c.customer_id
RIGHT JOIN products p ON s.product_id = p.product_id;

-- *******************************************************
-- FULL JOIN (MySQL workaround using UNION)
-- *******************************************************

SELECT
    c.customer_name,
    p.product_name,
    s.sale_date,
    s.total_amount
FROM
    customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
LEFT JOIN products p ON s.product_id = p.product_id

UNION

SELECT
    c.customer_name,
    p.product_name,
    s.sale_date,
    s.total_amount
FROM
    customers c
RIGHT JOIN sales s ON c.customer_id = s.customer_id
RIGHT JOIN products p ON s.product_id = p.product_id;
