{{ config(materialized='view', tags=['exam_queries']) }}

select
  ar.name as artist_name,
  count(distinct a.album_id) as nb_albums
from {{ ref('dim_artist') }} ar
join {{ ref('dim_album') }} a
  on a.artist_id = ar.artist_id
group by ar.name
order by nb_albums desc, artist_name
