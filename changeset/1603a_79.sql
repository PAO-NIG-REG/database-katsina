
delete from system.setting where name = 'map-srid';
Insert into system.setting (vl,"name", description)  select srid , 'map-srid', 'srid for the map' from system.crs where item_order=1 ; 




-- Function: get_geometry_with_srid(geometry)

-- DROP FUNCTION get_geometry_with_srid(geometry);

CREATE OR REPLACE FUNCTION get_geometry_with_srid(geom geometry)
  RETURNS geometry AS
$BODY$
declare
  srid_found integer;
  x float;
begin
  --if (select count(*) from system.crs) = 1 then
   --return 
   --ST_Transform(
   --ST_GeomFromText(
   --ST_AsText(ST_GeometryN(geom, 1)),ST_SRID(geom)),srid_found);
  --end if;
  x = st_x(st_transform(st_centroid(geom), 4326));
  srid_found = (select srid from system.crs where x >= from_long and x < to_long );
  --return st_transform(geom, srid_found);
 
   return 
   -- ST_SetSRID(ST_GeometryN(geom, 1),srid_found);
   ST_Transform(
   ST_GeomFromText(
   ST_AsText(ST_GeometryN(geom, 1)),ST_SRID(geom)),srid_found);
  --ST_SetSRID(ST_GeometryN(geom, 1),srid_found); 
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION get_geometry_with_srid(geometry)
  OWNER TO postgres;
COMMENT ON FUNCTION get_geometry_with_srid(geometry) IS 'This function assigns a srid found in the settings to the geometry passed as parameter. The srid is chosen based in the longitude where the centroid of the geometry is.';

