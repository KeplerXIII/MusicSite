--DROP TABLE IF EXISTS Genres, Artists, Albums, Collections, Tracks, ArtistGenre, ArtistAlbum, CollectionTrack;

CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	year INTEGER NOT NULL,
	name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	year INTEGER NOT NULL,
	name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) UNIQUE NOT NULL,
	album_id INTEGER REFERENCES Albums(id),
	duration NUMERIC 
);

CREATE TABLE IF NOT EXISTS ArtistGenre (
	artist_id INTEGER REFERENCES Artists(id),
	genre_id INTEGER REFERENCES Genres(id),
	CONSTRAINT ag PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS ArtistAlbum (
	artist_id INTEGER REFERENCES Artists(id),
	album_id INTEGER REFERENCES Albums(id),
	CONSTRAINT aa PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS CollectionTrack (
	collection_id INTEGER REFERENCES Collections(id),
	track_id INTEGER REFERENCES Tracks(id),
	CONSTRAINT ct PRIMARY KEY (collection_id, track_id)
);