--Количество исполнителей в каждом жанре.
select gm.name, COUNT (distinct artist_id) from genre_music gm
join genre_artist ga2 on gm.genre_id = ga2.genre_id 
group by gm.name
order by COUNT (distinct artist_id) desc;

--Количество треков, вошедших в альбомы 2019–2020 годов.
select count(track_id) from track_music tm
join album_music am on tm.album_id = am.album_id
where release_year = '2019' or release_year = '2020';


--Средняя продолжительность треков по каждому альбому.
select album_id, AVG(duration)  from track_music tm
group by album_id
order by album_id;


--Все исполнители, которые не выпустили альбомы в 2020 году.
select am.name from artist_music am
where am.name not in (
		select am2.name from artist_music am2
		join album_artist aa on am2.artist_id = aa.artist_id
		join album_music am3 on aa.album_id = am3.album_id 
		where release_year = '2020'
		);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct cm.name from collection_music cm
join track_music tm on cm.track_id = tm.track_id 
join album_music am on tm.album_id = am.album_id
join album_artist aa on am.album_id = aa.album_id
join artist_music am2 on aa.artist_id =am2.artist_id 
where am2.name = 'Pet Shop Boys'
order by cm.name;

--Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select am.name, COUNT(gm.name)  from album_music am
join album_artist aa on am.album_id = aa.album_id 
join artist_music am2  on aa.artist_id = am2.artist_id
join genre_artist ga on am2.artist_id = ga.artist_id 
join genre_music gm on ga.genre_id = gm.genre_id
group by am.name
having COUNT(gm.name) > 1;

--Наименования треков, которые не входят в сборники.
select tm.name from track_music tm
left join collection_music cm on tm.track_id = cm.track_id
where cm.track_id is null;


--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек,
-- — теоретически таких треков может быть несколько.
select am2.name, tm.duration from track_music tm
join album_music am on tm.album_id = am.album_id 
join album_artist aa on am.album_id = aa.album_id 
join artist_music am2 on aa.artist_id = am2.artist_id 
group by am2.name, tm.duration 
having tm.duration = (select min(duration) from track_music)
order by am2.name;

--Названия альбомов, содержащих наименьшее количество треков.
select distinct am.name from album_music am 
left join track_music tm on tm.album_id = am.album_id
where tm.album_id in (
	select album_id from track_music
	group by album_id
	having count(track_id) = (
		select count(track_id) from track_music
		group by album_id
		order by count
		limit 1)
)
order by am.name;