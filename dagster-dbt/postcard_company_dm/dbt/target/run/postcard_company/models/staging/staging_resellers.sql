
  
    
    

    create  table
      "datamart"."postcard_company_staging"."staging_resellers__dbt_tmp"
  
    as (
      


with resellers as (

SELECT reseller_id, reseller_name, commission_pct, row_number() over (partition by reseller_id order by loaded_timestamp desc ) as rn 
from "datamart"."postcard_company_raw"."raw_resellers"

)
select reseller_id, reseller_name, commission_pct

from resellers

where rn = 1
    );
  
  