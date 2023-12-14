
  
    
    

    create  table
      "datamart"."postcard_company_core"."dim_geography__dbt_tmp"
  
    as (
      

SELECT
      id AS geography_key,
      cityname as city_name,
      countryname as country_name,
      regionname as region_name
FROM
      "datamart"."postcard_company_raw"."geography"
    );
  
  