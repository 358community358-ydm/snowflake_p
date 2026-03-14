{{
    config(materialized = 'view')
}}

select sum(latest_balance) as total_remain,currency 
from {{ref('latest_balance')}}
group by currency
order by total_remain desc