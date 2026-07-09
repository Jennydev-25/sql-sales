SELECT
    SUM(unit_sales) AS total_american_units
FROM
    sales_db.sales
WHERE
    continent LIKE '%America';