
select
t.transaction_id,
a.cust_id,
t.account_id,
t.merchant_id,
t.transaction_type,
t.transaction_date,
t.amount
from {{ ref('stg_transactions') }} t
join {{ ref('stg_account')}} a
on t.account_id = a.account_id