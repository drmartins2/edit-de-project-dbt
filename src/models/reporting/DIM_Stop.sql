

{{
    config(
        materialized = "incremental",
        unique_key = "stop_id"
    )
}}


select s.*
from {{ref('DIM_Stops')}} s 
