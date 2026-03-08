{{
    config(materialized = 'view')
}}

select 
cust_id,
INITCAP(NULLIF(TRIM(first_name),'')) as first_name,
INITCAP(NULLIF(TRIM(last_name),''))  as last_name,
LOWER(NULLIF(TRIM(email),''))         as email,
created_at                            as created_date
from {{source('yogesh','customers')}}  
where cust_id is not null