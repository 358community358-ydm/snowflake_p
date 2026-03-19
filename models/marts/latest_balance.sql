{{ config(
    materialized='table'
) }}

with transaction_summary as (

    select
        t.account_id,
        sum(
            case 
                when t.transaction_type = 'Credit' then t.amount
                when t.transaction_type = 'Debit' then -t.amount
                else 0
            end
        ) as net_amount
    from {{ ref('stg_transactions') }} t
    group by t.account_id

)

select
    a.account_id,
    a.cust_id,
    a.account_type,
    a.balance,
    coalesce(ts.net_amount,0) as net_amount,
    a.balance + coalesce(ts.net_amount,0) as latest_balance,
    a.currency,
    a.current_status

from {{ ref('stg_account') }} a
left join transaction_summary ts
on a.account_id = ts.account_id