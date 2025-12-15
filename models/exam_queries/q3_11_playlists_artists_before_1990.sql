{{ config(materialized='view', tags=['exam_queries']) }}

select distinct
  p.name as playlist_name
from {{ ref('stg_playlist') }} p
join {{ ref('stg_playlisttrack') }} pt
  on p.playlist_id = pt.playlist_id
join {{ ref('stg_track') }} t
  on pt.track_id = t.track_id
join {{ ref('stg_album') }} al
  on t.album_id = al.album_id
join {{ ref('stg_artist') }} ar
  on al.artist_id = ar.artist_id
where ar.birthyear < 1990
order by playlist_name
