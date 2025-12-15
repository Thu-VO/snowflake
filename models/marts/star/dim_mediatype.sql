{{ config(materialized='table', tags=['star_music']) }}

select distinct
  media_type_id,
  name
from {{ ref('stg_mediatype') }}
