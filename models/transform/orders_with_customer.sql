{{ config(materialized='table') }}


SELECT
    o.order_id,
    o.order_date,
    o.total_amount,
    c.first_name,
    c.last_name
FROM {{ source('uwinnipeg', 'ORDERS' ) }} o
JOIN {{ source('uwinnipeg', 'CUSTOMERS' ) }} c
ON o.customer_id = c.customer_id
    