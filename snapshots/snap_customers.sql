{% snapshot snap_customers %}

{{
    config(
        target_schema='snapshots',
        unique_key='cust_id',
        strategy='timestamp',
        updated_at='created_date'
    )
}}

select * 
from {{ ref('stg_customers') }}

{% endsnapshot %}