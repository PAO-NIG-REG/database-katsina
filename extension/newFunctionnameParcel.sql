-- Function: cadastre.cadastre_object_name_is_valid(character varying, character varying)

-- DROP FUNCTION cadastre.cadastre_object_name_is_valid(character varying, character varying);

CREATE OR REPLACE FUNCTION cadastre.cadastre_object_name_is_valid(name_firstpart character varying, name_lastpart character varying)
  RETURNS boolean AS
$BODY$
begin
  if name_firstpart is null then return false; end if;
  if name_lastpart is null then return false; end if;
 -- if not (name_firstpart similar to 'Lot [0-9]+' or name_firstpart similar to '[0-9]+') then return false;  end if;
 -- if name_lastpart not similar to '(D|S)P [0-9 ]+' then return false;  end if;
  return true;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION cadastre.cadastre_object_name_is_valid(character varying, character varying)
  OWNER TO postgres;
COMMENT ON FUNCTION cadastre.cadastre_object_name_is_valid(character varying, character varying) IS 'Verifies that the name assigned to a new cadastre object is consistent with the cadastre object naming rules.';
