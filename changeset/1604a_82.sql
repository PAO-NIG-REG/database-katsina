-- Trigger: __track_changes on application.application

DROP TRIGGER __track_changes ON application.application;

CREATE TRIGGER __track_changes
  BEFORE INSERT OR UPDATE
  ON cadastre.cadastre_object
  FOR EACH ROW
  EXECUTE PROCEDURE f_for_trg_track_changes();



update application.request_type set notation_template='CofO converted to digital format' where code='newDigitalTitle';

update source.administrative_source_type set display_value='CofO' where code='title';

update system.config_map_layer set item_order = 100 where name ='parcels';

INSERT INTO system.version SELECT '1604a' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1604a');
