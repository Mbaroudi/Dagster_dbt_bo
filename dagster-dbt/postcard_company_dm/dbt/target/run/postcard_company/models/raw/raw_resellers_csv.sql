
  
    
    

    create  table
      "datamart"."postcard_company_raw"."raw_resellers_csv__dbt_tmp"
  
    as (
      
SELECT *, CURRENT_TIMESTAMP AS loaded_timestamp

FROM read_csv('/shared/csv/DailySales_*.csv', auto_detect=True)
    );
  
  