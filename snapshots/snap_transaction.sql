{% snapshot snap_transaction %}

{{
    config(
        target_schema='snapshots',
        unique_key='transaction_id',
        strategy='timestamp',
        updated_at='transaction_date'
    )
}}

select *
from {{ ref('stg_transacition') }}

{% endsnapshot %}