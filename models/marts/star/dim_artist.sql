{{ config(materialized='table', tags=['star_music']) }}

select distinct
  artist_id,
  name,
  birthyear,
  country
from {{ ref('stg_artist') }}
