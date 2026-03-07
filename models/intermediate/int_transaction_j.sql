select
t.transaction_id,
t.account_id,
t.merchant_id,
t.transaction_type,
t.transaction_date,
t.amount,
a.cust_id 
from {{ ref('stg_transacition') }} t
join {{ ref('stg_account')}} a
on t.account_id = a.account_id