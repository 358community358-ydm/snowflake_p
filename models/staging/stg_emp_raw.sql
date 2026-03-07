{{ config(
    materialized='incremental',
    unique_key='emp_id'
) }}

SELECT
    DATA:EMP_ID::NUMBER                              AS emp_id,

    TRIM(DATA:EMP_NAME::STRING)                       AS emp_name,

    UPPER(TRIM(DATA:DEPARTMENT::STRING))              AS department,

    COALESCE(DATA:SALARY::NUMBER,0)                   AS salary,

    TRY_TO_DATE(DATA:HIRE_DATE::STRING)               AS hire_date,

    SRC_FILE_NAME,

    LOAD_TIME

FROM {{ source('yogesh','emp_raw') }}

WHERE DATA:EMP_ID IS NOT NULL

{% if is_incremental() %}

AND LOAD_TIME > (
    SELECT MAX(LOAD_TIME) FROM {{ this }}
)

{% endif %}