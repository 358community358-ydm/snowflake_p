{{
    config(materialized = 'view')
}}

SELECT 
    cust_id,

    INITCAP(NULLIF(TRIM(first_name), '')) AS first_name,

    INITCAP(NULLIF(TRIM(last_name), ''))  AS last_name,

    LOWER(NULLIF(TRIM(email), ''))        AS email,

    CAST(created_at AS DATE) AS created_date

FROM {{ source('yogesh', 'customers') }}

WHERE cust_id IS NOT NULL