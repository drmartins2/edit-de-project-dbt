/* 
To reference this table onwards: {{ref('DIM_Stops')}}
*/

{{
    config(
        materialized = "table",
    )
}}

with dim_stops as (
    select 
        s.stop_id           AS stop_code,
        s.stop_name,
        s.stop_short_name,
        s.stop_latitude,
        s.stop_longitude,
        s.region_id,
        s.region_name,
        s.district_id,
        s.district_name,
        s.municipality_id,
        s.municipality_name,
        s.locality,
        s.operational_status,
        s.near_school,
        s.near_airport,
        s.near_subway,
        s.near_train,
        1 AS is_valid,
        CURRENT_TIMESTAMP() AS inserted_at,
        SESSION_USER()      AS inserted_by,
        CURRENT_TIMESTAMP() AS updated_at,
        SESSION_USER()      AS updated_by,
        GENERATE_UUID()     AS uuid
    from {{ref('stg_Stops')}} s 
)

select 
    {{ dbt_utils.generate_surrogate_key(['stop_code']) }} AS pk_stop_id,
    st.*
from dim_stops st
