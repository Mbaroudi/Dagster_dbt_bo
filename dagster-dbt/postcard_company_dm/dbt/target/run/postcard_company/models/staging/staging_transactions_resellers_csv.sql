

    insert into "datamart"."postcard_company_staging"."staging_transactions_resellers_csv" ("customer_key", "transaction_id", "product_key", "channel_key", "reseller_id", "bought_date_key", "CAST(total_amount AS DECIMAL(18,3))", "number_of_purchased_postcards", "CAST(e.product_price AS DECIMAL(18,3))", "geography_key", "commisionpaid", "commission_pct", "loaded_timestamp")
    (
        select "customer_key", "transaction_id", "product_key", "channel_key", "reseller_id", "bought_date_key", "CAST(total_amount AS DECIMAL(18,3))", "number_of_purchased_postcards", "CAST(e.product_price AS DECIMAL(18,3))", "geography_key", "commisionpaid", "commission_pct", "loaded_timestamp"
        from "staging_transactions_resellers_csv__dbt_tmp20231214103500197845"
    )
  