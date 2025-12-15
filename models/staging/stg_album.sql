{{ config(materialized='view') }}

select
  AlbumId  as album_id,
  Title    as title,
  ArtistId as artist_id,
  ProdYear as prod_year,
  CdYear   as cd_year
from {{ source('music', 'ALBUM') }}
