WITH cte_customer AS (
    SELECT 
        src_tbl.C_CUSTOMER_SK
        , src_tbl.C_CUSTOMER_ID
        , src_tbl.C_CURRENT_CDEMO_SK
        , src_tbl.C_CURRENT_HDEMO_SK
        , src_tbl.C_CURRENT_ADDR_SK
        , src_tbl.C_FIRST_SHIPTO_DATE_SK
        , src_tbl.C_FIRST_SALES_DATE_SK
        , src_tbl.C_SALUTATION
        , src_tbl.C_FIRST_NAME
        , src_tbl.C_LAST_NAME
        , src_tbl.C_PREFERRED_CUST_FLAG
        , src_tbl.C_BIRTH_DAY
        , src_tbl.C_BIRTH_MONTH
        , src_tbl.C_BIRTH_YEAR
        , src_tbl.C_BIRTH_COUNTRY
        , src_tbl.C_LOGIN
        , src_tbl.C_EMAIL_ADDRESS
        , src_tbl.C_LAST_REVIEW_DATE
        , mapping_tbl.ACCOUNT_NAME AS ROW_LEVEL_SHARE_POLICY
    FROM {{ source('snowflake_sample_data', 'CUSTOMER') }} src_tbl
    LEFT JOIN {{ ref('data_share_map') }} mapping_tbl
        ON mapping_tbl.ALLOWED_COUNTRY = src_tbl.C_BIRTH_COUNTRY
    WHERE C_BIRTH_COUNTRY IN ('NEW ZEALAND', 'AUSTRALIA', 'NETHERLANDS', 'FINLAND', 'AUSTRIA')
    /* Limiting run time */
)

SELECT * FROM cte_customer