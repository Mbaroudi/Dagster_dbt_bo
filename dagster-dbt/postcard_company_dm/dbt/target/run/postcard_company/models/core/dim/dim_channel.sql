
  
    
    

    create  table
      "datamart"."postcard_company_core"."dim_channel__dbt_tmp"
  
    as (
      


select channel_key, original_channel_id, channel_name
from "datamart"."postcard_company_staging"."staging_channels"
    );
  
  