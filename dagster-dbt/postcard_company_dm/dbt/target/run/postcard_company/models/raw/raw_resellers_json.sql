
  
    
    

    create  table
      "datamart"."postcard_company_raw"."raw_resellers_json__dbt_tmp"
  
    as (
      
SELECT *, CURRENT_TIMESTAMP AS loaded_timestamp

FROM read_json('/shared/json/rawDailySales_*.json', auto_detect=True, format='array')
    );
  
  