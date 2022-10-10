INSERT INTO genres(name) 
ON CONFLICT (name)
DO UPDATE SET name = Excluded.name;

INSERT INTO artists(name) 
VALUES ('Rocky'), ('Poppy'), ('Jhonas'), ('Emma'), ('Herman'), ('Heim-Elman'), ('Roman Pegan'), ('Jim-Ernando')
ON CONFLICT (name)
DO UPDATE SET name = Excluded.name;

INSERT INTO albums(year, name) 
VALUES 
('2000', 'Road to the moon'), ('2000', 'Sun on the night'), ('2018', 'VIP'), ('2018', 'River into hell'), ('2010', 'Motherland'), 
('2010', 'Gray man'), ('2020', 'Shame'), ('2020', 'Lucky Hour')
ON CONFLICT (name)
DO UPDATE SET name = Excluded.name;

INSERT INTO tracks(name, album_id, duration) 
VALUES 
('Mother', '1', '240'), ('Father', '2', '180'), ('Brother', '3', '180'), ('Sister', '4', '180'), ('Mister', '5', '180'), 
('Roadster', '6', '180'), ('Poster', '7', '180'), ('Chester', '8', '180'), ('Suffer', '1', '240'), ('Maffin', '2', '180'), 
('Griffin', '3', '240'), ('Sunrise', '4', '180'), ('My Goal', '5', '240'), ('My Destiny', '6', '180'), ('Focus', '7', '180'), 
('Vegans', '8', '180'), ('Im not in collection', '1', '180')
ON CONFLICT (name)
DO UPDATE SET name = Excluded.name;

INSERT INTO collections(year, name) 
VALUES 
('2013', 'Best of 2013'), ('2014', 'Best of 2014'), ('2015', 'Best of 2015'), ('2016', 'Best of 2016'), 
('2017', 'Best of 2017'), ('2018', 'Best of 2018'), ('2019', 'Best of 2019'), ('2020', 'Best of 2020')
ON CONFLICT (name)
DO UPDATE SET name = Excluded.name;

INSERT INTO artistalbum (artist_id, album_id) 
VALUES 
('1', '8'), ('2', '7'), ('3', '6'), ('4', '5'),
('5', '4'), ('6', '2'), ('7', '2'), ('8', '1'),
('1', '1'), ('2', '1'), ('3', '2'), ('2', '3')
ON CONFLICT (artist_id, album_id)
DO NOTHING;

INSERT INTO artistgenre (artist_id, genre_id) 
VALUES 
('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'),
('5', '5'), ('6', '1'), ('7', '2'), ('8', '3'),
('1', '2'), ('2', '3'), ('3', '4'), ('2', '5')
ON CONFLICT (artist_id, genre_id)
DO NOTHING;

INSERT INTO collectiontrack (collection_id, track_id) 
VALUES 
('1', '1'), ('2', '2'), ('3', '3'), ('4', '4'),
('5', '5'), ('6', '6'), ('7', '7'), ('8', '8'),
('1', '9'), ('2', '10'), ('3', '11'), ('4', '12'),
('5', '13'), ('6', '14'), ('7', '15'), ('8', '16')
ON CONFLICT (collection_id, track_id)
DO NOTHING;
