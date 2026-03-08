select
    t.account_id,
    sum(
        case 
            when t.transaction_type = 'Credit' then t.amount
            when t.transaction_type = 'Debit' then -t.amount
            else 0
        end
    ) as net_amount
from {{ ref('stg_transacition') }} t
group by
    t.account_id