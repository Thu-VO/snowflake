{{ config(materialized='view') }}

select
  GenreId as genre_id,
  Name    as name
from {{ source('music', 'GENRE') }}
