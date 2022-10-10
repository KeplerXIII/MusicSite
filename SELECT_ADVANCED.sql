--количество исполнителей в каждом жанре
SELECT COUNT(*), g.name genres FROM music.artistgenre ag
JOIN music.genres g ON G.id = ag.genre_id
GROUP BY g.id
ORDER BY g.id;

--количество треков, вошедших в альбомы 2019-2020 годов
SELECT COUNT(*) FROM music.albums A
JOIN music.tracks t ON a.id = t.album_id
WHERE year > 2018;

--средняя продолжительность треков по каждому альбому
SELECT a.name tracks, AVG(t.duration) FROM music.albums a
JOIN music.tracks t ON a.id = t.album_id
GROUP BY a.name; 

--все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name artists, al.year FROM music.artists ar
JOIN music.artistalbum aa ON aa.artist_id = ar.id
JOIN music.albums al ON aa.album_id = al.id
WHERE al.year != 2020;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами)
SELECT c.name Albums FROM music.collections c
JOIN music.collectiontrack ct ON c.id = ct.collection_id
JOIN music.tracks tr ON ct.track_id = tr.id
JOIN music.albums al ON al.id = tr.album_id
JOIN music.artistalbum aa ON al.id = aa.album_id
JOIN music.artists ar ON aa.artist_id = ar.id
WHERE ar.name LIKE 'Rocky';

--название альбомов, в которых присутствуют исполнители более 1 жанра 
--не понял как убрать из вывода count и ID или сделать новую таблицу
SELECT DISTINCT al.name, COUNT(ag.genre_id), ag.artist_id FROM music.artistgenre ag
JOIN music.artistalbum aa ON aa.artist_id = ag.artist_id
JOIN music.albums al ON al.id = aa.album_id
GROUP BY al.name, ag.artist_id
HAVING count(ag.genre_id) > 1
ORDER BY name;

--второй вариант решения, но я не понял почему это работает, просьба пояснить
SELECT al.name FROM music.artistgenre ag
JOIN music.artistalbum aa ON aa.artist_id = ag.artist_id
JOIN music.albums al ON al.id = aa.album_id
GROUP BY al.name
HAVING count(ag.genre_id) > 1
ORDER BY name;

--наименование треков, которые не входят в сборники
SELECT tr.name FROM music.collectiontrack ct
RIGHT JOIN music.tracks tr ON tr.id = ct.track_id
WHERE ct.collection_id IS NULL;


--исполнителя(-ей), написавшего самый короткий по продолжительности трек 
--(теоретически таких треков может быть несколько)
SELECT DISTINCT ar.name FROM music.tracks tr
JOIN music.albums al ON al.id = tr.album_id 
JOIN music.artistalbum aa ON aa.album_id = al.id 
JOIN music.artists ar ON ar.id = aa.artist_id
WHERE tr.duration = (SELECT MIN(tr.duration) FROM music.tracks tr);

--название альбомов, содержащих наименьшее количество треков
SELECT al.name, COUNT(tr.album_id) FROM music.tracks tr
JOIN music.albums al ON al.id = tr.album_id
GROUP BY al.name
HAVING COUNT(tr.album_id) = 
(
SELECT COUNT(tr.album_id) FROM music.tracks tr
JOIN music.albums al ON al.id = tr.album_id
GROUP BY al.name
order by count limit 1
);








