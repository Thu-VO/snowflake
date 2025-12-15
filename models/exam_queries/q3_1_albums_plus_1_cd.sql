{{ config(materialized='view', tags=['exam_queries']) }}

select a.title
from {{ ref('dim_album') }} a
join {{ ref('fact_cd_tracks') }} f
  on f.album_id = a.album_id
where a.cd_year is not null
group by a.title
having count(*) > 1
