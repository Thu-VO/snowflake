{{ config(materialized='view') }}

select
  ArtistId   as artist_id,
  Name       as name,
  BirthYear  as birthyear,
  Country    as country
from {{ source('music', 'ARTIST') }}
