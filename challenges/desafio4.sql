SELECT users.user_name AS pessoa_usuaria,
CASE 
  WHEN MAX(history.reproduction_date) > '2020-12-31' THEN 'Ativa'
    ELSE 'Inativa'
  END AS status_pessoa_usuaria
FROM 
SpotifyClone.users AS users
INNER JOIN SpotifyClone.history AS history
ON users.user_id = history.user_id
GROUP BY pessoa_usuaria ORDER BY pessoa_usuaria;
