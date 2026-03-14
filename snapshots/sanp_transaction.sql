{% snapshot snap_transactions %}

{{
    config(
        target_schema='snapshots',
        unique_key='TRANSACTION_ID',
        strategy='timestamp',
        updated_at='TRANSACTION_DATE'
    )
}}

SELECT *
FROM {{ source('yogesh','stg_transacition') }}

{% endsnapshot %}