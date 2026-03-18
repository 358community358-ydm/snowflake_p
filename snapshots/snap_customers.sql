{% snapshot snap_customers %}

{{
    config(
        target_schema='snapshots',
        unique_key='cust_id',
        strategy='timestamp',
        updated_at='created_date',
         invalidate_hard_deletes=True
    )
}}

select * 
from {{ ref('stg_customers') }}

{% endsnapshot %}