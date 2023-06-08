DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
  plan_id INT AUTO_INCREMENT PRIMARY KEY,
  plan_name VARCHAR(15) NOT NULL,
  plan_value DOUBLE NOT NULL,
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(120) NOT NULL,
  user_age INT(3) NOT NULL,
  plan_id INT AUTO_INCREMENT,
  signature_date DATE NOT NULL,
  FOREIGN KEY(plan_id) REFERENCES plans(plan_id),
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_name VARCHAR(120) NOT NULL,
  album_id INT AUTO_INCREMENT,
  FOREIGN KEY(album_id) REFERENCES albuns(album_id),
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
  album_id INT AUTO_INCREMENT PRIMARY KEY,
  album_name VARCHAR(120) NOT NULL,
  release_year INT NOT NULL,
  artist_id INT AUTO_INCREMENT,
  FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
  song_id INT AUTO_INCREMENT PRIMARY KEY,
  song_name VARCHAR(120) NOT NULL,
  album_id INT AUTO_INCREMENT,
  artist_id INT AUTO_INCREMENT,
  duration_in_seconds TINYINT NOT NULL,
  FOREIGN KEY(album_id) REFERENCES albuns(album_id),
  FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  reproduction_date DATE NOT NULL,
  CONSTRAINT PRIMARY KEY(user_id, song_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  FOREIGN KEY(song_id) REFERENCES songs(song_id),
) engine = InnoDB;

CREATE TABLE SpotifyClone.following_artists(
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_id INT AUTO_INCREMENT,
  CONSTRAINT PRIMARY KEY(user_id, artist_id),
  FOREIGN KEY(user_id) REFERENCES users(user_id),
  FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
) engine = InnoDB;
INSERT INTO SpotifyClone.following_artists (coluna1, coluna2) VALUES ('exemplo de dados 1', 'exemplo de dados X');

INSERT INTO SpotifyClone.plans (plan_name,  plan_value) VALUES 
  ('gratuito', 0.00),
  ('universitario', 5.99),
  ('pessoal', 6.99),  
  ('familiar', 7.99);

INSERT INTO SpotifyClone.users (user_name, user_age, signature_date) VALUES 
  ('Barbara Liskov', 82, 2019-10-20), 
  ('Robert Cecil Martin', 58, 2017-01-06),
  ('Ada Lovelace', 37, 2017-12-30),
  ('Martin Fowler', 46, 2017-01-17),
  ('Sandi Metz', 58, 2018-04-29),
  ('Paulo Freire', 19, 2018-02-14),
  ('Bell Hooks', 26, 2018-01-05),
  ('Christopher Alexander', 85, 2019-06-05),
  ('Judith Butler', 45, 2020-05-13),
  ('Jorge Amado', 58, 2017-02-17);

INSERT INTO SpotifyClone.artists (artist_name) VALUES
('Beyoncé'), 
('Queen'), 
('Elis Regina'), 
('Baco Exu do Blues'), 
('Blind Guardian'), 
('Nina Simone');

INSERT INTO SpotifyClone.albuns (album_name, release_year) VALUES 
('Renaissance', 2022),
('Jazz', 1978),
('Hot Space', 1982),
('Falso Brilhante', 1998),
('Vento de Maio', 2001),
('QVVJFA?', 2003),
('Somewhere Far Beyond', 2007),
('I Put A Spell On You', 2012);

INSERT INTO SpotifyClone.songs (song_name, album_id, artist_id, duration_in_seconds) VALUES 
  ('BREAK MY SOUL', 1, 1, 279),
  ("VIRGO'S GROOVE", 1, 1, 369),
  ('ALIEN SUPERSTAR', 1, 1, 116),
  ("Don't Stop Me Now", 2, 2, 203),
  ('Under Pressure', 3, 2, 152),
  ('Como Nossos Pais', 4, 3, 105),
  ('O Medo de Amar é o Medo de Ser Livre', 5, 3, 207),
  ('Samba em Paris', 6, 4, 267),
  ("The Bard's Song", 7, 5, 244),
  ('Feeling Good', 8, 6, 100);

INSERT INTO SpotifyClone.history (user_id, song_id, reproduction_date) VALUES 
(1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:35'),
(1, 10, '2020-03-06 11:22:33'),
(2, 10, '2022-08-05 08:05:17'),
(2, 7, '2020-01-02 07:40:33'),
(3, 10, '2020-11-13 16:55:13'),
(3, 2, '2020-12-05 18:38:30'),
(4, 8, '2021-08-15 17:10:10'),
(5, 8, '2022-01-09 01:44:33'),
(5, 5, '2020-08-06 15:23:43'),
(6, 7, '2017-01-24 00:31:17'),
(6, 1, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2022-02-24 21:14:22'),
(10, 3, '2015-12-13 08:30:22');
