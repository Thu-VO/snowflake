{{ config(materialized='table', tags=['star_music']) }}

select distinct
  genre_id,
  name
from {{ ref('stg_genre') }}
