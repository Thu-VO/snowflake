{{ config(materialized='view', tags=['exam_queries']) }}

select distinct
  p.name as playlist_name
from {{ ref('stg_playlist') }} p
join {{ ref('stg_playlisttrack') }} pt
  on p.playlist_id = pt.playlist_id
join {{ ref('stg_track') }} t
  on pt.track_id = t.track_id
where t.milliseconds > 4 * 60 * 1000
order by playlist_name
