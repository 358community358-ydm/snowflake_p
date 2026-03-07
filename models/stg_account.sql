{{ config(
    materialized='view'
) }}

SELECT
    account_id,

    CAST(NULLIF(TRIM(cust_id), '') AS NUMBER) AS cust_id,

    INITCAP(NULLIF(TRIM(account_type), '')) AS account_type,

    balance,

    UPPER(NULLIF(TRIM(currency), '')) AS currency,

    open_date,

    INITCAP(NULLIF(TRIM(current_status), '')) AS current_status

FROM {{ source('yogesh', 'account') }}

WHERE account_id IS NOT NULL