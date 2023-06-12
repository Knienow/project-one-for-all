SELECT artists.artist_name AS artista,
albuns.album_name AS album,
COUNT(followers.user_id) AS pessoas_seguidoras
FROM 
SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.albuns AS albuns 
ON albuns.artist_id = artists.artist_id
INNER JOIN SpotifyClone.following_artists AS followers 
ON followers.artist_id = artists.artist_id
GROUP BY 
artista, album
ORDER BY 
pessoas_seguidoras DESC,
artista ASC,
album ASC;
