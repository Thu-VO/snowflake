{{ config(materialized='view', tags=['exam_queries']) }}

select
  g.name as genre_name,
  count(*) as nb_tracks_2000s
from {{ ref('fact_cd_tracks') }} f
join {{ ref('dim_album') }} a
  on f.album_id = a.album_id
join {{ ref('dim_genre') }} g
  on f.genre_id = g.genre_id
where a.prod_year between 2000 and 2009
group by g.name
order by nb_tracks_2000s desc
limit 1
