---- RRR TABLE
   

---- NUMERIC FIELDS ---------------------------------------------------------

update administrative.ba_unit_detail bud
set custom_detail_text = replace (lower(custom_detail_text),'decinal', '10');
update administrative.ba_unit_detail bud
set custom_detail_text = replace (lower(custom_detail_text),'yearly', '1');
update administrative.ba_unit_detail bud
set custom_detail_text = replace (lower(custom_detail_text),'years', '');

update administrative.rrr rrr1
set review_period = 
	(select cast(coalesce(NULLIF(trim(custom_detail_text),''), '0') as integer)
	 from administrative.ba_unit_detail bud
	 where detail_code = 'reviewPeriod' 
	 and bud.ba_unit_id = rrr1.ba_unit_id
	 )
 where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;

update administrative.rrr rrr1
set yearly_rent = 
	(select cast(replace(coalesce(NULLIF(trim(custom_detail_text),''), '0'), ',', '') as numeric)
	 from administrative.ba_unit_detail bud
	 where detail_code = 'yearlyRent' 
	 and bud.ba_unit_id = rrr1.ba_unit_id
	 )
 where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;

update administrative.rrr rrr1
set advance_payment = 
	(select cast(replace(coalesce(NULLIF(trim(custom_detail_text),''), '0'), ',', '') as numeric)
	 from administrative.ba_unit_detail bud
	 where detail_code = 'advancePayment' 
	 and bud.ba_unit_id = rrr1.ba_unit_id
	 )
 where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;

update administrative.rrr rrr1
set term = 
	( select distinct( cast(coalesce(NULLIF(trim(custom_detail_text),''), '0') as integer))
	  from administrative.ba_unit_detail bud
	  where detail_code = 'term' 
	  and bud.ba_unit_id = rrr1.ba_unit_id
	 )
where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;

---- TEXT FIELDS ------------------------------------------------

----- update to make dynamic form labels in sola registry as in opentenure
UPDATE administrative.ba_unit_detail  SET detail_code='dateCommenced' WHERE detail_code='startdate';

  
update administrative.rrr rrr1
set rot_code = 
	(select custom_detail_text 
	 from administrative.ba_unit_detail bud
	 where detail_code = 'estate'
	 and bud.ba_unit_id = rrr1.ba_unit_id
	 )
 where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;
 
update administrative.rrr rrr1
set zone_code = 
	(select custom_detail_text 
	 from administrative.ba_unit_detail bud
	 where detail_code = 'zone' 
	 and bud.ba_unit_id = rrr1.ba_unit_id
	 )
 where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;

update administrative.rrr rrr1
set instrument_registration_no = 
	(select custom_detail_text 
	 from administrative.ba_unit_detail bud
	 where detail_code = 'instrumentRegistrationNo'
	 and bud.ba_unit_id = rrr1.ba_unit_id
	 )
 where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;


update administrative.rrr rrr1
set cofo = 
	(select distinct (custom_detail_text) 
	 from administrative.ba_unit_detail bud
	 where detail_code = 'cOfO'
	 and bud.ba_unit_id = rrr1.ba_unit_id
	 )
 where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;

---  DATE FIELDS  -----------------------------------------------------

update administrative.rrr rrr1
set date_commenced = 
	(select to_date(custom_detail_text, 'mon dd, yyyy') 
	 from administrative.ba_unit_detail bud
	 where detail_code = 'dateCommenced'
	 and bud.ba_unit_id = rrr1.ba_unit_id
	 )
 where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;


update administrative.rrr rrr1
set date_signed = 
	(select to_date(custom_detail_text, 'mon dd, yyyy') 
	 from administrative.ba_unit_detail bud
	 where detail_code = 'dateSigned'
	 and bud.ba_unit_id = rrr1.ba_unit_id
	 )
 where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;

update administrative.rrr rrr1
set registration_date = 
	(select to_date(custom_detail_text, 'mon dd, yyyy') 
	 from administrative.ba_unit_detail bud
	 where detail_code = 'dateRegistered'
	 and bud.ba_unit_id = rrr1.ba_unit_id
	 )
 where rrr1.type_code = 'ownership'
 and rrr1.is_primary
 ;

----  CONDITION FOR RRR TABLE
-- Function: administrative.insert_condition_for_rrr(character varying)

-- DROP FUNCTION administrative.insert_condition_for_rrr(character varying);

CREATE OR REPLACE FUNCTION administrative.insert_condition_for_rrr(input_detail_code character varying)
  RETURNS boolean AS
$BODY$
declare
  rec record;
  
  
BEGIN
  
	for rec in 
           SELECT rrr.id rrr_id, rrr.ba_unit_id, bud.detail_code, bud.custom_detail_text
			 from administrative.rrr rrr, administrative.ba_unit_detail bud
			 where rrr.ba_unit_id=bud.ba_unit_id
			 and bud.detail_code = input_detail_code
			 and bud.custom_detail_text is not null
	loop
          	INSERT INTO administrative.condition_for_rrr(
			    id, rrr_id, condition_code, custom_condition_text)
		VALUES (uuid_generate_v1(),  rec.rrr_id, 
		     rec.detail_code, 
		     rec.custom_detail_text);

		delete from administrative.ba_unit_detail bud
		where bud.ba_unit_id = rec.ba_unit_id 
		and   bud.detail_code = rec.detail_code
		and   bud.custom_detail_text = rec.custom_detail_text;
	end loop;

return true;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION administrative.insert_condition_for_rrr(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION administrative.insert_condition_for_rrr(character varying) IS 'Inserts condistions from the ba_unit_detail table into conditione_for_rrr table';

select administrative.insert_condition_for_rrr('yearsTodevelope');
select administrative.insert_condition_for_rrr('valueTodevelope');


-- CADASTRE TABLE 
 
-- Function: cadastre.cadastre_object_insert_update(character varying)

-- DROP FUNCTION cadastre.cadastre_object_insert_update(character varying);

CREATE OR REPLACE FUNCTION cadastre.cadastre_object_insert_update(bid character varying)
  RETURNS boolean AS
$BODY$

DECLARE
  i integer;
  rec record;
  recInt record;
  blockdet varchar; 
  plandet varchar; 
  plotdet varchar; 
  lgadet varchar; 
  sheetdet varchar; 
  landusedet varchar; 
  locdet varchar; 
  iddet varchar;

  
BEGIN

 for rec in 

 select * 
 from cadastre.cadastre_object co,
 administrative.ba_unit_contains_spatial_unit busu
 where co.id = busu.spatial_unit_id
 and busu.ba_unit_id in 
 (select bud.ba_unit_id from administrative.ba_unit_detail bud)
  
 loop

  update cadastre.cadastre_object coupd
  set source_reference = (select custom_detail_text 
  from administrative.ba_unit_detail bud
  where detail_code = 'layoutPlan' 
  and bud.ba_unit_id = rec.ba_unit_id)
  where id = rec.spatial_unit_id;
  
  update cadastre.cadastre_object coupd
  set block = (select custom_detail_text 
  from administrative.ba_unit_detail bud
  where detail_code = 'block' 
  and bud.ba_unit_id = rec.ba_unit_id)
  where id = rec.spatial_unit_id;

  update cadastre.cadastre_object coupd
  set plot_num = (select custom_detail_text 
  from administrative.ba_unit_detail bud
  where detail_code = 'plotNum' 
  and bud.ba_unit_id = rec.ba_unit_id)
  where id = rec.spatial_unit_id;

  update cadastre.cadastre_object coupd
  set lga_code = (select custom_detail_text 
  from administrative.ba_unit_detail bud
  where detail_code = 'LGA' 
  and bud.ba_unit_id = rec.ba_unit_id)
  where id = rec.spatial_unit_id;

  
  update cadastre.cadastre_object 
  set intell_map_sheet = (select custom_detail_text 
  from administrative.ba_unit_detail bud
  where detail_code = 'IntellMapSheet' 
  and bud.ba_unit_id = rec.ba_unit_id)
  where id = rec.spatial_unit_id;

  ----co.land_use_code ===== cOfOtype
 end loop;

for rec in 

 select 
 distinct (bud.ba_unit_id)
 from administrative.ba_unit_detail bud
 where bud.ba_unit_id not in 
 (select busu.ba_unit_id from administrative.ba_unit_contains_spatial_unit busu)
  
 loop
        blockdet = null; 
	plandet = null;
	plotdet = null;
	lgadet = null; 
	sheetdet = null; 
	landusedet = null; 
	locdet = null; 
	iddet = null; 

         select custom_detail_text
         into blockdet
         from administrative.ba_unit_detail bud
         where bud.ba_unit_id =  rec.ba_unit_id
         and detail_code = 'block';

         select custom_detail_text
         into plotdet
         from administrative.ba_unit_detail bud
         where bud.ba_unit_id =  rec.ba_unit_id
         and detail_code = 'plotNum';

         select custom_detail_text
         into plandet
         from administrative.ba_unit_detail bud
         where bud.ba_unit_id =  rec.ba_unit_id
         and detail_code = 'layoutPlan';

         select lower(custom_detail_text)
         into landusedet
         from administrative.ba_unit_detail bud
         where bud.ba_unit_id =  rec.ba_unit_id
         and detail_code = 'cOfOtype';
 
   	 select custom_detail_text
         into lgadet
         from administrative.ba_unit_detail bud
         where bud.ba_unit_id =  rec.ba_unit_id
         and detail_code = 'LGA';

	 select custom_detail_text
         into sheetdet
         from administrative.ba_unit_detail bud
         where bud.ba_unit_id =  rec.ba_unit_id
         and detail_code = 'IntellMapSheet';

         select custom_detail_text
         into locdet
         from administrative.ba_unit_detail bud
         where 
         bud.ba_unit_id =  rec.ba_unit_id
         and 
         detail_code = 'location';

	
    if (blockdet != null) and (plandet != null) and  (plotdet != null) then 
          select uuid_generate_v1() into iddet;

          insert into address.address (id, description)
          values (uuid_generate_v1(), locdet);   
          
	  insert into cadastre.cadastre_object 
	  (id, type_code, 
		 source_reference, name_firstpart, name_lastpart, status_code, 
		 transaction_id, land_use_code,block, plot_num, lga_code, intell_map_sheet)
	   VALUES (iddet, 'parcel', 
			 plandet, plotdet, blockdet||' '||plandet, 'pending',
		    (select transaction_id from administrative.ba_unit bu where bu.id = rec.ba_unit_id), 
            landusedet, blockdet, plotdet,lgadet, sheetdet );

            insert into administrative.ba_unit_contains_spatial_unit
            (ba_unit_id, spatial_unit_id)
            values (rec.ba_unit_id, iddet);

         end if;
 end loop;
 
  return true;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION cadastre.cadastre_object_insert_update(character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION cadastre.cadastre_object_insert_update(character varying) IS 'update existing values of co or insert a new one';



select cadastre.cadastre_object_insert_update('');

 -----------RE_ENABLE----------------------------------------------------------------
--DROP TABLE IF EXISTS administrative.ba_unit_detail;
--DROP TABLE IF EXISTS administrative.ba_unit_detail_historic;
--DROP TABLE IF EXISTS administrative.ba_unit_detail_type;
--DROP FUNCTION  IF EXISTS administrative.get_baunit_detail(ba_unit_id character varying, detail_code character varying , is_for character varying) CASCADE;
--DROP VIEW IF EXISTS cadastre.parcel_plan ;