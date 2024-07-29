WITH cte_cust_addr AS (
    SELECT CA_ADDRESS_SK
        ,CA_ADDRESS_ID
        ,CA_STREET_NUMBER
        ,CA_STREET_NAME
        ,CA_STREET_TYPE
        ,CA_SUITE_NUMBER
        ,CA_CITY
        ,CA_COUNTY
        ,CA_STATE
        ,CA_ZIP
        ,CA_COUNTRY
        ,CA_GMT_OFFSET
        ,CA_LOCATION_TYPE
    FROM {{ source('snowflake_sample_data', 'CUSTOMER_ADDRESS') }}
)

SELECT * FROM cte_cust_addr
LIMIT 100