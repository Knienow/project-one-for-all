SELECT COUNT(history.user_id) AS musicas_no_historico
FROM 
SpotifyClone.users AS users
INNER JOIN SpotifyClone.history AS history 
ON history.user_id = users.user_id
WHERE users.user_name = 'Barbara Liskov'
GROUP BY users.user_id;
