{{
    config(
        materialized = "incremental",
        unique_key = "line_code"
    )
}}


SELECT *
FROM {{ ref('DIM_Lines') }} 
