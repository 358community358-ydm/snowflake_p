{% snapshot snap_customers %}

{{
    config(
        target_schema='snapshots',
        unique_key='cust_id',
        strategy='check',
        check_cols=['first_name','last_name','email'],
        invalidate_hard_deletes=True
    )
}}

select *
from {{ ref('stg_customers') }}

{% endsnapshot %}