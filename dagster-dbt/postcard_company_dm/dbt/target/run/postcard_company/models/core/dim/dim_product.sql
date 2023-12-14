
  
    
    

    create  table
      "datamart"."postcard_company_core"."dim_product__dbt_tmp"
  
    as (
      


select product_id as product_key, product_id as original_product_id, product_name, geography_key , product_price


FROM "datamart"."postcard_company_staging"."staging_products"
    );
  
  