insert into genre_music (genre_id, name)
values (1, 'Rok'),
       (2, 'Rap'),
       (3, 'Pop'),
       (4, 'Electro'),
       (5, 'Alternative');

insert into artist_music (artist_id, name)
values (1, 'Dolphin'),
       (2, 'System Of A Down'),
       (3, 'ATL'),
       (4, 'Земфира'),
       (5, 'Zivert'),
       (6, 'Pet Shop Boys'),
       (7, 'DenDerty'),
       (8, 'ГРОТ');

insert into genre_artist (genre_id, artist_id)
values (1, 1),
       (1, 2),
       (1, 4),
       (2, 3),
       (2, 8),
       (3, 5),
       (4, 6),
       (5, 7);

insert into album_music (album_id, name, release_year)
values (1, '442', 2018),
       (2, 'Toxicity', 2001),
       (3, 'Марабу', 2015),
       (4, 'Бордерлайн', 2021),
       (5, 'Vynil#1', 2019),
       (6, 'Actually', 1987),
       (7, 'Тотальное самоубийство', 2015),
       (8, 'Ледокол "Вега"', 2017);

insert into album_artist (album_id, artist_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8);


insert into track_music (track_id, album_id, name, duration)
values (1, 1, '520', '00:04:33'),
       (2, 1, '713', '00:04:25'),
       (3, 2, 'Chop Suey!', '00:03:30'),
       (4, 2, 'X', '00:01:59'),
       (5, 3, 'Пилюли', '00:02:55'),
       (6, 3, 'Ареола', '00:03:04'),
       (7, 4, 'Пальто', '00:04:29'),
       (8, 4, 'Ок', '00:04:05'),
       (9, 5, 'Fly', '00:03:14'),
       (10, 5, 'Life', '00:03:09'),
       (11, 6, 'Hit Music', '00:04:44'),
       (12, 6, 'I Want To Wake Up', '00:05:09'),
       (13, 7, 'Упадок', '00:04:17'),
       (14, 7, 'Молоток', '00:03:58'),
       (15, 6, 'Магия Возраста', '00:03:27'),
       (16, 6, '2%', '00:02:43');

update track_music
   set album_id = 8
 where track_id = 15;

update track_music
   set album_id = 8
 where track_id = 16;


insert into collection_music (collection_id, track_id, album_id, name, release_year)
values (1, 3, 2, 'collection_1', 2001),
       (2, 12, 6, 'collection_2', 1990),
       (3, 4, 2, 'collection_3', 2010),
       (4, 11, 6, 'collection_4', 2007),
       (5, 12, 6, 'collection_5', 1998),
       (6, 15, 8, 'collection_6', 2020),
       (7, 11, 6, 'collection_7', 1995),
       (8, 14, 7, 'collection_8', 2021);

