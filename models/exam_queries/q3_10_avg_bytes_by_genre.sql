{{ config(materialized='view', tags=['exam_queries']) }}

select
  g.name as genre_name,
  avg(t.bytes) as avg_bytes
from {{ ref('stg_track') }} t
join {{ ref('dim_genre') }} g
  on t.genre_id = g.genre_id
group by g.name
order by avg_bytes desc
