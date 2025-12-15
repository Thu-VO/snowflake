{{ config(materialized='view', tags=['exam_queries']) }}

select
  ar.name as artist_name,
  count(*) as nb_tracks
from {{ ref('fact_cd_tracks') }} f
join {{ ref('dim_artist') }} ar
  on f.artist_id = ar.artist_id
group by ar.name
order by nb_tracks desc, artist_name
