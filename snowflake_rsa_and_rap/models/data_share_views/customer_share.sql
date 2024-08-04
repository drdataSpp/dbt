{{ config(schema="DATA_SHARE") }}

WITH cte_cust_share AS (
    SELECT * FROM {{ ref('customer') }}
    WHERE ROW_LEVEL_SHARE_POLICY = CURRENT_ACCOUNT_NAME()
)

SELECT * FROM cte_cust_share