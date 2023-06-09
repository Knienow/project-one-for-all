SELECT 
COUNT(DISTINCT songs.song_id) AS cancoes, 
COUNT(DISTINCT artists.artist_id) AS artistas, 
COUNT(DISTINCT albuns.album_id) AS albuns
FROM 
SpotifyClone.songs AS songs, 
SpotifyClone.artists AS artists, 
SpotifyClone.albuns AS albuns;
