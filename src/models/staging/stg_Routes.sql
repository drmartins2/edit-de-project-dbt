

{{
    config(
        materialized = "view"
    )
}}

with routes as (
    select 
        case 
            when circular = '0' then 'NON CIRCULAR' 
            else 'CIRCULAR' 
        end as circular, 
        line_id, 
        line_long_name, 
        line_short_name, 
        line_type, 
        path_type,
        route_color,
        route_id, 
        route_long_name,
        route_short_name,
        route_text_color, 
        route_type,
        school
    from {{ source('raw_data', 'staging_routes') }}
)

select *
from routes
