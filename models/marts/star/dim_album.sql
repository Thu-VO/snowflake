{{ config(materialized='table', tags=['star_music']) }}

select distinct
  album_id,
  title,
  artist_id,
  prod_year,
  cd_year
from {{ ref('stg_album') }}
