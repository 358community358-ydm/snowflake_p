{% snapshot snap_transactions %}

{{
    config(
        target_schema='snapshots',
        unique_key='transaction_id',
        strategy='timestamp',
        updated_at='transaction_date'
    )
}}

SELECT *
FROM {{ ref('stg_transaction') }}

{% endsnapshot %}}
