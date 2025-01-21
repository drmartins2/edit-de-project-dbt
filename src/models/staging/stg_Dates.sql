/* 
Using dbt_date package -> get_date_dimension macro
from https://github.com/calogica/dbt-date/tree/0.10.1/#get_date_dimensionstart_date-end_date
As bonus added audit column ingested_at
*/
{{
    config(
        materialized = "view",
    )
}}


with dates as ({{ dbt_date.get_date_dimension("2015-01-01", "2050-12-31") }})

select 
    dates.*, 
    CASE
        WHEN date = '2025-01-01' THEN 'New Year''s Day'
        WHEN date = '2025-04-18' THEN 'Good Friday'
        WHEN date = '2025-04-20' THEN 'Easter Sunday'
        WHEN date = '2025-04-25' THEN 'Freedom Day'
        WHEN date = '2025-05-01' THEN 'Labour Day'
        WHEN date = '2025-06-10' THEN 'Portugal Day'
        WHEN date = '2025-06-19' THEN 'Corpus Christi'
        WHEN date = '2025-08-15' THEN 'Assumption Day'
        WHEN date = '2025-10-05' THEN 'Republic Day'
        WHEN date = '2025-11-01' THEN 'All Saints'' Day'
        WHEN date = '2025-12-01' THEN 'Independence Restoration Day'
        WHEN date = '2025-12-08' THEN 'Immaculate Conception'
        WHEN date = '2025-12-25' THEN 'Christmas Day'
        ELSE NULL
    END AS holidays,
    current_timestamp as ingested_at
from dates