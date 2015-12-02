-----------------------------------------------------------
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Bakori','Bakori (FU)', '','c');
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Batagarawa','Batagarawa (KA) ', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Batsari','Batsari (DU)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Baure','Baure (DA)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Bindawa','Bindawa (MA)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Charanchi','Charanchi (MA)', '','c'); 	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Dandume','Dandume (FU)', '','c');
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Danja','Danja (FU)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('DanMusa','DanMusa (DU)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Daura','Daura (DA)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Dutsi','Dutsi (MA)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('DutsinMa','DutsinMa (DU)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Faskari','Faskari (FU)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Funtua','Funtua (FU)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Ingawa','Ingawa (KN)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Jibia','Jibia (KA) ', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Kafur','Kafur (ML)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Kaita','Kaita (KA)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Kankara','Kankara (ML)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Kankia','Kankia (KN)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Katsina','Katsina (KA)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Kurfi','Kurfi (DU)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Kusada','Kusada (KN)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Mai Adua','Mai Adua (DA)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Malumfashi','Malumfashi (ML)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Mani','Mani (MA)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Mashi','Mashi (MA)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Matazuu ','atazuu (KN)', '','c'); 	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Musawa','Musawa (KN)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Rimi','Rimi (KA)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Sabuwa','Sabuwa (FU)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Safana','Safana (DU)', '','c'); 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Sandamu','Sandamu (DA)', '','c');	 
INSERT INTO cadastre.lga_type(
            code, display_value, description, status)
    VALUES ('Zango','Zango (DA)', '','c');





INSERT INTO cadastre.zone_type(
            code, display_value, description, status)
    VALUES ('Daura','Daura', '','c');	 
INSERT INTO cadastre.zone_type(
            code, display_value, description, status)
    VALUES ('Dutsinma','Dutsinma', '','c'); 	 
INSERT INTO cadastre.zone_type(
            code, display_value, description, status)
    VALUES ('Funtua','Funtua', '','c'); 	 
INSERT INTO cadastre.zone_type(
            code, display_value, description, status)
    VALUES ('Kankia','Kankia', '','c');	 
INSERT INTO cadastre.zone_type(
            code, display_value, description, status)
    VALUES ('Katsina','Katsina', '','c');	 
INSERT INTO cadastre.zone_type(
            code, display_value, description, status)
    VALUES ('Malumfashi','Malumfashi', '','c');	 
INSERT INTO cadastre.zone_type(
            code, display_value, description, status)
    VALUES ('Mani','Mani', '','c');
	


---------------------------------------------------------------------------
DROP VIEW application.systematic_registration_certificates;
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

    co.id											AS id, 
    co.name_firstpart										AS name_firstpart, 
    co.name_lastpart										AS name_lastpart, 
    su.ba_unit_id										AS ba_unit_id, 
    round(sa.size) 										AS size, 
    administrative.get_parcel_share(su.ba_unit_id) 						AS owners, 

--	SYSTEM.SETTING TABLE
--	system.setting.system_id
    ( SELECT setting.vl
             from system.setting
             WHERE setting.name::text = 'state'::text) 					AS state, 
          
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
--   	 lga 
    --administrative.get_baunit_detail(su.ba_unit_id, 'LGA') 
      lga.display_value										AS lga, 
        
--   	 zone 
    --administrative.get_baunit_detail(su.ba_unit_id, 'zone') 				
    zone.display_value										AS zone, 

--   	 location 
    --administrative.get_baunit_detail(su.ba_unit_id, 'location') 				
    ad.description										AS location, 

--    	 plan        
    --administrative.get_baunit_detail(su.ba_unit_id, 'layoutPlan') 				
    co.source_reference										AS plan, 

-- 	 sheetnr  
    --administrative.get_baunit_detail(su.ba_unit_id, 'IntellMapSheet') 				
    co.intell_map_sheet										AS sheetnr, 

-- 	 date commenced
    --administrative.get_baunit_detail(su.ba_unit_id, 'dateCommenced')  			
    rrr.date_commenced										AS commencingdate, 

--  	 purpose     
    --administrative.get_baunit_detail(su.ba_unit_id, 'cOfOtype')   			
    lu.display_value										AS purpose, 

--  	 term     
    --administrative.get_baunit_detail(su.ba_unit_id, 'term')	              		
    rrr.term											AS term,

--       rent
    --administrative.get_baunit_detail(su.ba_unit_id, 'yearlyRent')	              		
    rrr.yearly_rent										AS  rent

   FROM 
    cadastre.cadastre_object co, 
    administrative.ba_unit bu, 
    cadastre.land_use_type lu, 
    cadastre.lga_type lga,
    cadastre.zone_type zone, 
    cadastre.spatial_value_area sa, 
    administrative.ba_unit_contains_spatial_unit su,
    administrative.rrr rrr,
    address.address ad,
    cadastre.spatial_unit_address  sad
    
  WHERE 
  bu.id::text = su.ba_unit_id::text
  AND bu.id::text = rrr.ba_unit_id::text
  AND su.spatial_unit_id::text = sa.spatial_unit_id::text 
  AND sa.spatial_unit_id::text = co.id::text 
  AND sa.type_code::text = 'officialArea'::text 
  AND COALESCE(co.land_use_code, 'residential'::character varying)::text = lu.code::text
  AND coalesce(co.lga_code::text, 'Katsina')  = lga.code::text 
  AND rrr.zone_code::text = zone.code::text
  AND ad.id =  sad.address_id
  AND co.id =  sad.spatial_unit_id
  AND rrr.type_code = 'ownership'
  ORDER BY co.name_firstpart, co.name_lastpart;
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------
DROP VIEW IF EXISTS cadastre.parcel_plan ;

	