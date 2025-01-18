
/* 
To reference this table onwards: {{ref('stg_Stops')}}
*/

{{
    config(
        materialized = "view",
    )
}}

with stops as ({{ 
        select 
            s.stop_id,
            s.stop_name,
            s.stop_short_name,
            s.stop_lat          AS stop_latitude,
            s.stop_lon          AS stop_longitude,
            s.region_id,
            s.region_name,
            s.district_id,
            s.district_name,
            s.municipality_id,
            s.municipality_name,
            s.locality,
            s.operational_status,
            CASE 
            WHEN s.near_school = '0' THEN 'No'
            WHEN s.near_school = '1' THEN 'Yes' 
            ELSE 'N/A'
            END                 AS near_school,
            CASE 
            WHEN s.airport  = '0' THEN 'No'
            WHEN s.airport  = '1' THEN 'Yes' 
            ELSE 'N/A'
            END                 AS near_airport,
            CASE 
            WHEN s.subway  = '0' THEN 'No'
            WHEN s.subway  = '1' THEN 'Yes' 
            ELSE 'N/A'
            END                 AS near_subway,
            CASE 
            WHEN s.train  = '0' THEN 'No'
            WHEN s.train  = '1' THEN 'Yes' 
            ELSE 'N/A'
            END                  AS near_train
        from {{source{'raw_data','staging_stops'}}} s 
    }})

select *
from stops



