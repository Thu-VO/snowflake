{{ config(materialized='view', tags=['exam_queries']) }}

select
  t.track_name,
  t.composer,
  g.name as genre_name
from {{ ref('stg_track') }} t
join {{ ref('dim_genre') }} g
  on t.genre_id = g.genre_id
where g.name in ('Rock', 'Jazz')
