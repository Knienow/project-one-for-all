SELECT 
songs.song_name AS cancao, 
COUNT(history.song_id) AS reproducoes
FROM 
SpotifyClone.songs AS songs
INNER JOIN SpotifyClone.history AS history
ON songs.song_id = history.song_id
GROUP BY songs.song_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
