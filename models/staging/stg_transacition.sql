{{ config(
    materialized='view'
) }}

SELECT
    transaction_id,
    account_id,
    merchant_id,

    INITCAP(NULLIF(TRIM(transaction_type), '')) AS transaction_type,

    CAST(amount AS NUMBER(12,2)) AS amount,

    CAST(transaction_date AS DATE) AS transaction_date,

    INITCAP(NULLIF(TRIM(status), '')) AS status

FROM {{ source('yogesh', 'transactions') }}

WHERE transaction_id IS NOT NULL