{{ config(materialized='view') }}

select
  MediaTypeId as media_type_id,
  Name        as name
from {{ source('music', 'MEDIATYPE') }}
