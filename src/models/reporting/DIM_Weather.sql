{{
    config(
        materialized = "incremental",
        unique_key = "timestamp"
    )
}}


select * 
from {{ ref('DIM_Weathers') }}