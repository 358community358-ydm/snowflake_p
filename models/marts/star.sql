
select l.cust_id,c.first_name,
l.account_id,l.latest_balance
from {{ ref('latest_balance') }} l 
join {{ref('stg_customers')}} c 
on l.cust_id = c.cust_id
where latest_balance >5500