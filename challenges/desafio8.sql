SELECT artists.artist_name AS artista,
albuns.album_name AS album
FROM 
SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.albuns AS albuns 
ON albuns.artist_id = artists.artist_id
WHERE artists.artist_name = 'Elis Regina';
