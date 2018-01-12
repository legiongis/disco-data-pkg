CREATE OR REPLACE VIEW vw_monuments AS
WITH mv AS (SELECT tileid, resourceinstanceid, nodeid, ST_Union(geom) as geom, ST_GeometryType(geom) AS geom_type
FROM mv_geojson_geoms
GROUP BY tileid, nodeid, resourceinstanceid, ST_GeometryType(geom))
SELECT row_number() OVER () AS gid,
    mv.resourceinstanceid,
    mv.tileid,
    mv.nodeid,
    ST_GeometryType(geom) AS geom_type,
    geom
FROM mv
WHERE (SELECT graphid FROM resource_instances WHERE mv.resourceinstanceid = resourceinstanceid) = 'ab74af76-fa0e-11e6-9e3e-026d961c88e6'
