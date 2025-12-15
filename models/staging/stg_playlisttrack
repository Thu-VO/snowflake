{{ config(materialized='view') }}

select
  PlaylistId as playlist_id,
  TrackId    as track_id
from {{ source('music', 'PLAYLISTTRACK') }}
