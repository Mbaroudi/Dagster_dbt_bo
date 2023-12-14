
  
    
    

    create  table
      "datamart"."postcard_company_raw"."raw_transactions__dbt_tmp"
  
    as (
      
SELECT *, CURRENT_TIMESTAMP AS loaded_timestamp FROM postgres_scan('postgresql://postgres:postgres@oltp:5432/sales_oltp','public', 'transactions')
    );
  
  