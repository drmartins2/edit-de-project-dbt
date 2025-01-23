{{
    config(
        materialized = "incremental",
        unique_key = "route_code"
    )
}}


SELECT *
FROM {{ ref('DIM_Routes') }} 
