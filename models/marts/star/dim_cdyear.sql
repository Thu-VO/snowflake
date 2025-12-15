{{ config(materialized='table', tags=['star_music']) }}

select distinct
  cd_year
from {{ ref('stg_album') }}
where cd_year is not null
