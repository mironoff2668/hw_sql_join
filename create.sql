CREATE TABLE IF NOT EXISTS genre_music(
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null
);

CREATE TABLE IF NOT EXISTS artist_music(
	artist_id INTEGER PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

create table if not exists album_music(
	album_id SERIAL primary key references artist_music(artist_id),
	name varchar(60) not null,
	release_year integer not null
);

create table if not exists genre_artist(
	genre_id INTEGER references genre_music(genre_id),
	artist_id INTEGER references artist_music(artist_id),
	constraint pk primary key (genre_id, artist_id)
);

create table if not exists album_artist(
	album_id INTEGER references album_music(album_id),
	artist_id INTEGER references artist_music(artist_id),
	constraint dk primary key (album_id, artist_id)
);


create table if not exists track_music(
	track_id SERIAL primary key,
	album_id INTEGER not null references album_music(album_id),
	name varchar(60) not null,
	duration time
);


create table if not exists collection_music(
	collection_id SERIAL PRIMARY KEY,
	track_id INTEGER not null references track_music(track_id),
	album_id INTEGER not null references album_music(album_id),
	name VARCHAR(40) NOT null,
	release_year integer not null
);

