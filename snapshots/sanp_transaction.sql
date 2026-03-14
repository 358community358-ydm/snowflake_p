{% snapshot snap_transactions %}

{{
    config(
        target_schema='snapshots',
        unique_key='transaction_id',
        strategy='timestamp',
        updated_at='transaction_date'
        unique_key='TRANSACTION_ID',
        strategy='timestamp',
        updated_at='TRANSACTION_DATE'
    )
}}

SELECT *
FROM {{ ref('stg_transacition') }}
FROM {{ source('yogesh','stg_transacition') }}

{% endsnapshot %}