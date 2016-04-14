update application.request_type set notation_template = 'Right of Occupancy' where code = 'newFreehold';
update administrative.mortgage_type set status = 'x' where code = 'microCredit' or code = 'linear';
DROP FUNCTION administrative.get_concatenated_name(character varying);

CREATE OR REPLACE FUNCTION administrative.get_concatenated_name(baunit_id character varying)
  RETURNS character varying AS
$BODY$
declare
  rec record;
  name character varying;
  
BEGIN
  name = '';
   
	for rec in 
           Select pippo.firstpart||'/'||pippo.lastpart || ' ' || pippo.cadtype  as value
   from 
   administrative.ba_unit bu join
	   (select coalesce (co.name_firstpart, '') firstpart,
	     replace(coalesce (co.name_lastpart, ''),'null', '' )lastpart,
	    get_translation(cot.display_value, null) cadtype,
	   bsu.ba_unit_id unit_id
	   from administrative.ba_unit_contains_spatial_unit  bsu
	   join cadastre.cadastre_object co on (bsu.spatial_unit_id = co.id)
	   join cadastre.cadastre_object_type cot on (co.type_code = cot.code)) pippo
           on (bu.id = pippo.unit_id)
	   where bu.id = baunit_id
	loop
           name = name || ', ' || rec.value;
	end loop;

        if name = '' then
	  name = ' ';
       end if;

	if substr(name, 1, 1) = ',' then
          name = substr(name,2);
        end if;
      
return name;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.get_concatenated_name(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION administrative.get_concatenated_name(character varying) IS 'Returns a concatenated list of all cadastre objects associated to the BA Unit';


DROP FUNCTION application.get_concatenated_name(character varying);

CREATE OR REPLACE FUNCTION application.get_concatenated_name(service_id character varying)
  RETURNS character varying AS
$BODY$
declare
  rec record;
  name character varying;
  
BEGIN
  name = '';
   
	for rec in 
	   Select bu.name_firstpart||'/'||bu.name_lastpart||' ( '||pippo.firstpart||'/'||pippo.lastpart || ' ' || pippo.cadtype||' )'  as value,
	        pippo.id
		from application.service s 
		join application.application_property ap on (s.application_id=ap.application_id)
		join administrative.ba_unit bu on (ap.name_firstpart||ap.name_lastpart=bu.name_firstpart||bu.name_lastpart)
		join  (select coalesce (co.name_firstpart, '') firstpart,
	     replace(coalesce (co.name_lastpart, ''),'null', '' )lastpart,
			   get_translation(cot.display_value, null) cadtype,
			   bsu.ba_unit_id unit_id,
			   co.id id
			   from administrative.ba_unit_contains_spatial_unit  bsu
			   join cadastre.cadastre_object co on (bsu.spatial_unit_id = co.id)
			   join cadastre.cadastre_object_type cot on (co.type_code = cot.code)) pippo
			   on (bu.id = pippo.unit_id)
	   where s.id = service_id 
	    and (s.request_type_code = 'cadastreChange' or s.request_type_code = 'redefineCadastre' or s.request_type_code = 'newApartment' 
	   or s.request_type_code = 'newDigitalProperty' or s.request_type_code = 'newDigitalTitle' or s.request_type_code = 'newFreehold' 
	   or s.request_type_code = 'newOwnership' or s.request_type_code = 'newState')
	   and s.status_code != 'lodged'
	loop
	   name = name || ', ' || replace (rec.value,rec.id, '');
	end loop;

        if name = '' then
	  return name;
	end if;

	if substr(name, 1, 1) = ',' then
          name = substr(name,2);
        end if;
return name;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION application.get_concatenated_name(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION application.get_concatenated_name(character varying) IS 'Returns a concatenated list of all cadastre objects associated to the BA Unit referenced by the application.';

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
WITH cadastreDocs AS 	(SELECT DISTINCT ON (id) ss.id, ext_archive_id FROM source.source ss
				INNER JOIN transaction.transaction_source ts ON (ss.id = ts.source_id)
				INNER JOIN transaction.transaction tn ON(ts.transaction_id = tn.id)
				WHERE tn.from_service_id = #{id}
				ORDER BY 1),
	rrrDocs AS	(SELECT DISTINCT ON (id) ss.id, ext_archive_id FROM source.source ss
				INNER JOIN administrative.source_describes_rrr sr ON (ss.id = sr.source_id)
				INNER JOIN administrative.rrr rr ON (sr.rrr_id = rr.id)
				INNER JOIN transaction.transaction tn ON(rr.transaction_id = tn.id)
				WHERE tn.from_service_id = #{id}
				ORDER BY 1),
     titleDocs AS	(SELECT DISTINCT ON (id) ss.id, ext_archive_id FROM source.source ss
				INNER JOIN administrative.source_describes_ba_unit su ON (ss.id = su.source_id)
				WHERE su.ba_unit_id IN (SELECT  ba_unit_id FROM rrrDocs)
				ORDER BY 1),
     regDocs AS		(SELECT DISTINCT ON (id) ss.id, ext_archive_id FROM source.source ss
				INNER JOIN transaction.transaction tn ON (ss.transaction_id = tn.id)
				INNER JOIN application.service sv ON (tn.from_service_id = sv.id)
				WHERE sv.id = #{id}
				AND sv.request_type_code IN ('regnPowerOfAttorney', 'regnStandardDocument', 'cnclPowerOfAttorney', 'cnclStandardDocument')
				ORDER BY 1),
     serviceDocs AS	((SELECT * FROM rrrDocs) UNION (SELECT * FROM cadastreDocs) UNION (SELECT * FROM titleDocs) UNION (SELECT * FROM regDocs))
     
     
 SELECT (((SELECT COUNT(*) FROM serviceDocs) - (SELECT COUNT(*) FROM serviceDocs WHERE ext_archive_id IS NOT NULL)) = 0) AS vl


INSERT INTO system.version SELECT '1604b' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1604b');