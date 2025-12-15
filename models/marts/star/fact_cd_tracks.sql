{{ config(materialized='table', tags=['star_music']) }}

select
  t.track_id,
  t.album_id,
  a.artist_id,
  t.genre_id,
  t.media_type_id,
  a.cd_year,
  t.milliseconds,
  t.bytes,
  t.unit_price,
  1 as track_count
from {{ ref('stg_track') }} t
join {{ ref('stg_album') }} a
  on t.album_id = a.album_id
