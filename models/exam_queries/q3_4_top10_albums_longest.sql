{{ config(materialized='view', tags=['exam_queries']) }}

select
  a.title,
  ar.name as artist_name,
  round(sum(f.milliseconds)/60000, 2) as total_minutes
from {{ ref('fact_cd_tracks') }} f
join {{ ref('dim_album') }} a
  on f.album_id = a.album_id
join {{ ref('dim_artist') }} ar
  on f.artist_id = ar.artist_id
group by a.title, ar.name
order by total_minutes desc
limit 10
