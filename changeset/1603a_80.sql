update system.query set sql = 'select co.id, co.name_firstpart || ''/'' || co.name_lastpart as label, 
st_asewkb(st_transform(co.geom_polygon,  #{srid})) as the_geom from cadastre.cadastre_object co where type_code= ''parcel'' and co.geom_polygon is not null
and status_code= ''current'' and ST_Intersects(st_transform(co.geom_polygon, #{srid}), ST_SetSRID(ST_3DMakeBox(ST_Point(#{minx}, #{miny}),ST_Point(#{maxx}, #{maxy})), #{srid})) and st_area(co.geom_polygon)> power(5 * #{pixel_res}, 2)'
where name = 'SpatialResult.getParcels'





update system.query set sql = 'select id, name_firstpart || ''/'' || name_lastpart as label, st_asewkb(st_transform(geom_polygon, #{srid})) as the_geom 
 from cadastre.cadastre_object  where status_code= ''current'' and compare_strings(#{search_string}, name_firstpart || '' '' || name_lastpart) and geom_polygon is not null limit 30'
 where name = 'map_search.cadastre_object_by_number'


