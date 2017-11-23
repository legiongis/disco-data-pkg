INSERT INTO iiif_manifests (id, url)
VALUES
(uuid_generate_v1(), 'http://127.0.0.1/~dwuthrich/manifests/he/29986_004.json');

CREATE TABLE lincoln_sites
( id int4, site_name varchar(25), geom geometry(POLYGON,4326) );
