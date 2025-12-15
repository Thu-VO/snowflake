{{ config(materialized='view', tags=['exam_queries']) }}

select
  t.track_name,
  ar.name as artist_name
from {{ ref('stg_track') }} t
join {{ ref('stg_album') }} al
  on t.album_id = al.album_id
join {{ ref('stg_artist') }} ar
  on al.artist_id = ar.artist_id
join {{ ref('dim_genre') }} g
  on t.genre_id = g.genre_id
where g.name = 'Rock'
  and upper(ar.country) = 'FRANCE'
order by artist_name, track_name
