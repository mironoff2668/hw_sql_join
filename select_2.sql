--Количество исполнителей в каждом жанре.
select genre_id, COUNT (distinct artist_id) from genre_artist ga
group by genre_id 
order by COUNT (distinct artist_id) desc;

--Количество треков, вошедших в альбомы 2019–2020 годов.
select count(name) from album_music am
 where release_year > 2018 and release_year < 2021;


--Средняя продолжительность треков по каждому альбому.
select album_id, AVG(duration)  from track_music tm
group by album_id
order by AVG(duration) desc;


--Все исполнители, которые не выпустили альбомы в 2020 году.
select artist_id from artist_music am
join album_music am2 on am.artist_id = am2.album_id
where release_year != '2020';


--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select cm.name from collection_music cm 
join album_music am on cm.album_id = am.album_id
join artist_music am2 on am.album_id = am2.artist_id
where am2.name = 'Pet Shop Boys';

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select am.name, COUNT(gm.name)  from album_music am
join artist_music am2 on am.album_id = am2.artist_id
join genre_artist ga on am2.artist_id = ga.artist_id 
join genre_music gm on ga.genre_id = gm.genre_id
group by am.name
having COUNT(gm.name) > 1;

--Наименования треков, которые не входят в сборники.
select tm.name from track_music tm
right join collection_music cm on tm.track_id = cm.track_id;


--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек,
-- — теоретически таких треков может быть несколько.
select am.name, MIN(tm.duration) from artist_music am
join album_music am2 on am.artist_id = am2.album_id
join track_music tm on am2.album_id = tm.album_id
group by am.name, tm.duration
order by tm.duration
limit 1;

--Названия альбомов, содержащих наименьшее количество треков.
select am.name, COUNT(tm.track_id) from album_music am
join track_music tm on am.album_id = tm.album_id
group by am.name
order by MIN(tm.track_id) desc;