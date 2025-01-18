
/* 
To reference this table onwards: {{ref('DIM_Stop')}}
*/

{{
    config(
        materialized = "table",
    )
}}


select s.*
from {{ref('DIM_Stops')}} s 
