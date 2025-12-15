{{ config(materialized='view', tags=['exam_queries']) }}

select
  t.track_id,
  t.track_name,
  a.title as album_title,
  a.prod_year
from {{ ref('stg_track') }} t
join {{ ref('dim_album') }} a
  on t.album_id = a.album_id
where a.prod_year in (2000, 2002)
