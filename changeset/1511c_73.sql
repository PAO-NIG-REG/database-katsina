
-- Nigeria SOLA Registry Katsina
-- Reference Data Changes
-- 09 November 2015
 

-- application.request_type

UPDATE application.request_type SET display_value = 'Convert to Digital CofO' WHERE code='title';
UPDATE application.request_type SET display_value = 'Register Sub-lease' WHERE code='lease';
UPDATE application.request_type SET notation_template = 'Certificate of Occupancy converted to digital format' WHERE code='newDigitalTitle';
UPDATE application.request_type SET notation_template = 'Right of Occupancy' WHERE code='newFreehold';
UPDATE application.request_type SET notation_template = 'Sub-lease of nn years to <name>' WHERE code='lease';
UPDATE application.request_type SET notation_template = 'Easement over <parcel1> in favour of <parcel2>' WHERE code='servitude';
UPDATE application.request_type SET notation_template = 'Certificate of Occupancy issued at completion of systematic registration' WHERE code='systematicRegn';
UPDATE application.request_type SET notation_template = 'Variation of Sub-lease <reference>' WHERE code='varyLease';

UPDATE source.administrative_source_type SET display_value = 'CofO Diagram' WHERE code='cadastralSurvey';
UPDATE source.administrative_source_type SET display_value = 'Certificate of Occupancy' WHERE code='title';

UPDATE system.config_map_layer SET active=FALSE WHERE name='sug_hierarchy';