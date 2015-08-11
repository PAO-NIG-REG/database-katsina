-- DROP FUNCTION administrative.get_parcel_share(character varying);

CREATE OR REPLACE FUNCTION administrative.get_parcel_share(baunit_id character varying)
  RETURNS character varying AS
$BODY$
declare
  rec record;
  rrr character varying;
  i integer =0 ;
BEGIN
  rrr = '';
             

	for rec in 
              select  (rrrt.display_value)  as tiporrr,
              initcap(pp.name)||' '||initcap(pp.last_name) || ' ( '||rrrsh.nominator||'/'||rrrsh.denominator||' )'
               as value,
               rrrsh.nominator||'/'||rrrsh.denominator as shareFraction
              from party.party pp,
		     administrative.party_for_rrr  pr,
		     administrative.rrr rrr,
		     administrative.rrr_share  rrrsh,
		     administrative.rrr_type  rrrt
		where pp.id=pr.party_id
		and   pr.rrr_id=rrr.id
		and rrrsh.id = pr.share_id
		AND rrr.type_code = rrrt.code
		and   rrr.ba_unit_id= baunit_id
	loop
           rrr = rrr || ', ' || rec.value;
           i = i+1;
	end loop;

        if rrr = '' then
	  rrr = 'No rrr claimed ';
       end if;

        
	if substr(rrr, 1, 1) = ',' then
          rrr = substr(rrr,2);
        end if;
        if i = 2 then
          rrr= replace(rrr, '( 1/1 )','Joint');
        end if;
        if i > 2 then
          rrr= replace(rrr, '( 1/1 )','Undevided Share');
        end if;
        rrr= replace(rrr, '( 1/1 )','');
return rrr;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.get_parcel_share(character varying)
  OWNER TO postgres;
---------------------------------------------------------------------------

-- DROP FUNCTION administrative.get_baunit_detail(ba_unit_id character varying, detail_code character varying , is_for character varying);

CREATE OR REPLACE FUNCTION administrative.get_baunit_detail(ba_unit_id character varying, detail_code character varying , is_for character varying)
  RETURNS character varying AS
$BODY$
declare
  rec record;
  result character varying;
  i integer =0 ;
BEGIN
  result = '';
             

	SELECT bud.custom_detail_text 
	INTO result
	FROM cdministrative.ba_unit_detail bud
	WHERE bud.ba_unit_id = ba_unit_id 
	AND bud.detail_code = detail_code
	AND bud.is_for = is_for;

        if result = '' then
	  result = 'No Result ';
        end if;
return result;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.get_baunit_detail(character varying, character varying, character varying)
  OWNER TO postgres;



-- DROP FUNCTION administrative.get_rrr_detail(ba_unit_id character varying, detail_code character varying, is_for character varying);

CREATE OR REPLACE FUNCTION administrative.get_rrr_detail(ba_unit_id character varying, detail_code character varying, is_for character varying)
  RETURNS character varying AS
$BODY$
declare
  rec record;
  result character varying;
  i integer =0 ;
BEGIN
  result = '';
             

	SELECT rrrd.custom_detail_text 
	INTO result
	FROM administrative.rrr_detail rrrd,
	     administrative.rrr rrr
	WHERE 
	     rrr.ba_unit_id  = ba_unit_id
        AND 
	     rrr.type_code = 'ownership' 
	AND 
	     rrrd.rrr_id = rrr.id 
	AND 
	     rrrd.detail_code = detail_code
	AND 
	     rrrd.is_for = is_for;

        if result = '' then
	  result = 'No Result ';
        end if;
return result;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.get_rrr_detail(character varying, character varying, character varying)
  OWNER TO postgres;







---------------------------------------------------------------------------
-- DROP VIEW application.systematic_registration_certificates;
CREATE OR REPLACE VIEW application.systematic_registration_certificates AS 
 SELECT DISTINCT 
    
--	TBV  ------------------------------------------------------------------------------------------
--    sg.name::text 									AS name, 
--    aa.nr 										AS nr, 
--    aa.id::text 									AS appid, 
--    ( SELECT lga.label
--           FROM cadastre.spatial_unit_group lga
--          WHERE lga.hierarchy_level = 3 AND co.name_lastpart::text = lga.name::text) 	AS ward, 
--    (( SELECT count(s.id) AS count
--           FROM source.source s
--           WHERE s.description::text ~~ 
--           ((('TOTAL_'::text || 'title'::text) || '%'::text) 
--           || replace(sg.name::text, '/'::text, '-'::text))))::integer 			AS cofo, 

--------------------------------------------------------------------------------------------------------

    co.name_firstpart, 
    co.name_lastpart, 
    co.id, 
    su.ba_unit_id, 
    round(sa.size) 										AS size, 
    administrative.get_parcel_share(su.ba_unit_id) 						AS owners, 

--	SYSTEM.SETTING TABLE
--	system.setting.system_id
    ( SELECT setting.vl
             from system.setting
             WHERE setting.name::text = 'system-id'::text) 					AS state, 
          
-- 	system.setting.surveyor
    ( SELECT setting.vl
           FROM system.setting
          WHERE setting.name::text = 'surveyor'::text) 						AS surveyor, 


--	system.setting.rank
    ( SELECT setting.vl
           FROM system.setting
          WHERE setting.name::text = 'surveyorRank'::text) 					AS rank,



--	SYSTEM.CONFIG_MAP_LAYER_METADATA TABLE

-- 	imagerydate
    ( SELECT config_map_layer_metadata.value
           FROM system.config_map_layer_metadata
          WHERE config_map_layer_metadata.name_layer::text = 'orthophoto'::text 
          AND config_map_layer_metadata.name::text = 'date'::text) 				AS imagerydate, 
--	imageryresolution
    ( SELECT config_map_layer_metadata.value
           FROM system.config_map_layer_metadata
          WHERE config_map_layer_metadata.name_layer::text = 'orthophoto'::text 
          AND config_map_layer_metadata.name::text = 'resolution'::text) 			AS imageryresolution, 
--	imagerysource
    ( SELECT config_map_layer_metadata.value
           FROM system.config_map_layer_metadata
          WHERE config_map_layer_metadata.name_layer::text = 'orthophoto'::text 
          AND config_map_layer_metadata.name::text = 'data-source'::text) 			AS imagerysource, 


--    	BA UNIT DETAIL TABLE
--   	ba unit detail location 
    administrative.get_baunit_detail(su.ba_unit_id, 'location', 'cofo') 			AS proplocation, 
--    	ba unit detail plan        
    administrative.get_baunit_detail(su.ba_unit_id, 'plan', 'cofo') 				AS title, 
-- 	ba unit detail sheetnr  
    administrative.get_baunit_detail(su.ba_unit_id, 'sheetnr', 'cofo') 				AS sheetnr, 

        
--    	RRR DETAIL TABLE
-- 	rrr detail date commenced
    administrative.get_rrr_detail(su.ba_unit_id, 'startdate', 'cofo')  				AS commencingdate, 

--  	rrr detail purpose     
    administrative.get_rrr_detail(su.ba_unit_id, 'purpose', 'cofo')   				AS landuse, 

--  	rrr term     
    administrative.get_rrr_detail(su.ba_unit_id, 'term', 'cofo')	              		AS term,

--      rrr rent
    administrative.get_rrr_detail(su.ba_unit_id, 'rent', 'cofo')	              		AS  rent

   FROM 
    --- cadastre.spatial_unit_group sg, 
    cadastre.cadastre_object co, 
    administrative.ba_unit bu, 
    -- cadastre.land_use_type lu, 
    cadastre.spatial_value_area sa, 
    administrative.ba_unit_contains_spatial_unit su 
    --application.application_property ap, 
    --application.application aa, 
    --application.service s

  WHERE 
  --- sg.hierarchy_level = 5 AND st_intersects(st_pointonsurface(co.geom_polygon), sg.geom) AND (co.name_firstpart::text || co.name_lastpart::text) = (ap.name_firstpart::text || ap.name_lastpart::text) AND 
  --(co.name_firstpart::text || co.name_lastpart::text) = (bu.name_firstpart::text || bu.name_lastpart::text) 
  --AND aa.id::text = ap.application_id::text AND s.application_id::text = aa.id::text 
  -- TBU  
  --AND s.request_type_code::text = 'systematicRegn'::text 
  -- AND (aa.status_code::text = 'approved'::text OR aa.status_code::text = 'archived'::text)
  -- AND 
  bu.id::text = su.ba_unit_id::text
  AND su.spatial_unit_id::text = sa.spatial_unit_id::text 
  AND sa.spatial_unit_id::text = co.id::text 
  AND sa.type_code::text = 'officialArea'::text 
  -- TBU  
  --AND COALESCE(bu.land_use_code, 'res_home'::character varying)::text = lu.code::text
  ORDER BY co.name_firstpart, co.name_lastpart;
-------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------
-- DROP VIEW application.systematic_registration_certificates;
CREATE OR REPLACE VIEW cadastre.parcel_plan AS 
 SELECT DISTINCT 
    
--	TBV  ------------------------------------------------------------------------------------------
--    sg.name::text 									AS name, 
--    aa.nr 										AS nr, 
--    aa.id::text 									AS appid, 
--    ( SELECT lga.label
--           FROM cadastre.spatial_unit_group lga
--          WHERE lga.hierarchy_level = 3 AND co.name_lastpart::text = lga.name::text) 	AS ward, 
--    (( SELECT count(s.id) AS count
--           FROM source.source s
--           WHERE s.description::text ~~ 
--           ((('TOTAL_'::text || 'title'::text) || '%'::text) 
--           || replace(sg.name::text, '/'::text, '-'::text))))::integer 			AS cofo, 

--------------------------------------------------------------------------------------------------------

    co.name_firstpart, 
    co.name_lastpart, 
    co.id, 
    su.ba_unit_id, 
    round(sa.size) 										AS size, 
--    administrative.get_parcel_share(su.ba_unit_id) 						AS owners, 

--	SYSTEM.SETTING TABLE
--	system.setting.system_id
    ( SELECT setting.vl
             from system.setting
             WHERE setting.name::text = 'system-id'::text) 					AS state, 
          
-- 	system.setting.surveyor
    ( SELECT setting.vl
           FROM system.setting
          WHERE setting.name::text = 'surveyor'::text) 						AS surveyor, 


--	system.setting.rank
    ( SELECT setting.vl
           FROM system.setting
          WHERE setting.name::text = 'surveyorRank'::text) 					AS rank,



--	SYSTEM.CONFIG_MAP_LAYER_METADATA TABLE

-- 	imagerydate
    ( SELECT config_map_layer_metadata.value
           FROM system.config_map_layer_metadata
          WHERE config_map_layer_metadata.name_layer::text = 'orthophoto'::text 
          AND config_map_layer_metadata.name::text = 'date'::text) 				AS imagerydate, 
--	imageryresolution
    ( SELECT config_map_layer_metadata.value
           FROM system.config_map_layer_metadata
          WHERE config_map_layer_metadata.name_layer::text = 'orthophoto'::text 
          AND config_map_layer_metadata.name::text = 'resolution'::text) 			AS imageryresolution, 
--	imagerysource
    ( SELECT config_map_layer_metadata.value
           FROM system.config_map_layer_metadata
          WHERE config_map_layer_metadata.name_layer::text = 'orthophoto'::text 
          AND config_map_layer_metadata.name::text = 'data-source'::text) 			AS imagerysource, 


--    	BA UNIT DETAIL TABLE
--   	ba unit detail location 
    administrative.get_baunit_detail(su.ba_unit_id, 'location', 'cofo') 			AS proplocation, 
--    	ba unit detail plan        
    administrative.get_baunit_detail(su.ba_unit_id, 'plan', 'cofo') 				AS title, 
-- 	ba unit detail sheetnr  
    administrative.get_baunit_detail(su.ba_unit_id, 'sheetnr', 'cofo') 				AS sheetnr, 

        
--    	RRR DETAIL TABLE
-- 	rrr detail date commenced
    administrative.get_rrr_detail(su.ba_unit_id, 'startdate', 'cofo')  				AS commencingdate, 

--  	rrr detail purpose     
    administrative.get_rrr_detail(su.ba_unit_id, 'purpose', 'cofo')   				AS landuse, 

--  	rrr term     
    administrative.get_rrr_detail(su.ba_unit_id, 'term', 'cofo')	              		AS term,

--      rrr rent
    administrative.get_rrr_detail(su.ba_unit_id, 'rent', 'cofo')	              		AS  rent

   FROM 
    --- cadastre.spatial_unit_group sg, 
    cadastre.cadastre_object co, 
    administrative.ba_unit bu, 
    -- cadastre.land_use_type lu, 
    cadastre.spatial_value_area sa, 
    administrative.ba_unit_contains_spatial_unit su 
    --application.application_property ap, 
    --application.application aa, 
    --application.service s

  WHERE 
  --- sg.hierarchy_level = 5 AND st_intersects(st_pointonsurface(co.geom_polygon), sg.geom) AND (co.name_firstpart::text || co.name_lastpart::text) = (ap.name_firstpart::text || ap.name_lastpart::text) AND 
  --(co.name_firstpart::text || co.name_lastpart::text) = (bu.name_firstpart::text || bu.name_lastpart::text) 
  --AND aa.id::text = ap.application_id::text AND s.application_id::text = aa.id::text 
  -- TBU  
  --AND s.request_type_code::text = 'systematicRegn'::text 
  -- AND (aa.status_code::text = 'approved'::text OR aa.status_code::text = 'archived'::text)
  -- AND 
  bu.id::text = su.ba_unit_id::text
  AND su.spatial_unit_id::text = sa.spatial_unit_id::text 
  AND sa.spatial_unit_id::text = co.id::text 
  AND sa.type_code::text = 'officialArea'::text 
  -- TBU  
  --AND COALESCE(bu.land_use_code, 'res_home'::character varying)::text = lu.code::text
  ORDER BY co.name_firstpart, co.name_lastpart;
