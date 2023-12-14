


WITH 



latest_transaction as (
    
select max(loaded_timestamp) as max_transaction  from "datamart"."postcard_company_staging"."staging_transactions_resellers_csv"

),

  



resellers_csv AS (
  SELECT
    "reseller id" :: INT AS reseller_id,
    "Transaction ID" AS  transaction_id,
    "Product name" AS product_name,
    "Total amount" AS total_amount,
    "Quantity" AS number_of_purchased_postcards,
    "Created Date" AS created_date,
    "Series City" AS office_location,
    "Sales Channel" AS sales_channel,
    loaded_timestamp
  FROM
    "datamart"."postcard_company_raw"."raw_resellers_csv"

      

  -- this filter will only be applied on an incremental run
  where loaded_timestamp > (SELECT max_transaction from latest_transaction LIMIT 1)

  



),
trans_csv AS (
  SELECT
    
    
md5(cast(coalesce(cast(reseller_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(transaction_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS customer_key,
    transaction_id,
    reseller_id,
    product_name,
    total_amount,
    number_of_purchased_postcards,
    created_date,
    office_location,
    sales_channel,
    loaded_timestamp
  FROM
    resellers_csv
)


SELECT
  t.customer_key,
  transaction_id,
  product_key,
  channel_key,
  t.reseller_id,
  strftime('%Y%m%d', created_date)::INTEGER AS bought_date_key,
  total_amount::numeric,
  number_of_purchased_postcards,
  e.product_price::numeric,
  e.geography_key,
  s.commission_pct * total_amount::numeric AS commisionpaid,
  s.commission_pct AS commission_pct,
  loaded_timestamp
FROM
  trans_csv t
  JOIN "datamart"."postcard_company_core"."dim_product"
  e
  ON t.product_name = e.product_name
  JOIN "datamart"."postcard_company_core"."dim_channel" C
  ON t.sales_channel = C.channel_name
  JOIN "datamart"."postcard_company_core"."dim_customer"
  cu
  ON t.customer_key = cu.customer_key
  JOIN "datamart"."postcard_company_core"."dim_salesagent"
  s
  ON t.reseller_id = s.original_reseller_id