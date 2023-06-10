SELECT users.user_name AS pessoa_usuaria,
COUNT(DISTINCT history.song_id) AS musicas_ouvidas,
ROUND(SUM(songs.duration_in_seconds/60), 2) AS total_minutos 
FROM 
SpotifyClone.users AS users 
INNER JOIN SpotifyClone.history AS history ON users.user_id = history.user_id 
INNER JOIN SpotifyClone.songs AS songs ON history.song_id = songs.song_id
GROUP BY pessoa_usuaria ORDER BY pessoa_usuaria ASC;
