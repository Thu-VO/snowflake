{{ config(materialized='view') }}

select
  PlaylistId as playlist_id,
  Name       as name
from {{ source('music', 'PLAYLIST') }}
