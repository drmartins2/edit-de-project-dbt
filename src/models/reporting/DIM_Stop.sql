
/* 
To reference this table onwards: {{ref('DIM_Stop')}}
*/

{{
    config(
        materialized = "incremental",
        unique_key = "stop_code"
    )
}}


select s.*
from {{ref('DIM_Stops')}} s 
