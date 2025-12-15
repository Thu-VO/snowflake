{{ config(materialized='view') }}

select
  TrackId      as track_id,
  Name         as track_name,
  MediaTypeId  as media_type_id,
  GenreId      as genre_id,
  AlbumId      as album_id,
  Composer     as composer,
  Milliseconds as milliseconds,
  Bytes        as bytes,
  UnitPrice    as unit_price
from {{ source('music', 'TRACK') }}
