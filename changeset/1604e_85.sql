
--Required Documents for Deeds Registry Services

--Reported by Neil Pullar | April 17th, 2016 @ 09:52 PM

--Required Documents

--New CofO - Diagram, Application
--mortgage - Application, mortgage (this is already present in the link table)
--registerLease - Application, lease (this is already present in the link table)
--newOwnership - Application

--New CofO - Diagram, Application
INSERT INTO application.request_type_requires_source_type(
            source_type_code, request_type_code)
    VALUES ('cadastralSurvey', 'newFreehold');
INSERT INTO application.request_type_requires_source_type(
            source_type_code, request_type_code)
    VALUES ('application', 'newFreehold');

--mortgage - Application
INSERT INTO application.request_type_requires_source_type(
            source_type_code, request_type_code)
    VALUES ('application', 'mortgage');    


--registerLease - Application
INSERT INTO application.request_type_requires_source_type(
            source_type_code, request_type_code)
    VALUES ('application', 'registerLease');    


--newOwnership - Application
INSERT INTO application.request_type_requires_source_type(
            source_type_code, request_type_code)
    VALUES ('application', 'newOwnership');    




--New BR to ensure Diagram image File is jpg file

--Reported by Neil Pullar | April 17th, 2016 @ 10:36 PM

--I think the new BR should be directed at the Application Save or if that is not possible at the Service Complete

--PAOLA COMMENT:  SERVICE COMPLETE IS BETTER



ALTER TABLE system.br DISABLE TRIGGER ALL;
ALTER TABLE system.br_definition DISABLE TRIGGER ALL;
ALTER TABLE system.br_validation DISABLE TRIGGER ALL;

INSERT INTO system.br (id, display_name, technical_type_code, feedback, description, technical_description) VALUES ('diagram-is-jpg', 'diagram-is-jpg', 'sql',
 'Primary right created by the service must have a Diagram document attached and the Diagram must be in jpg format', NULL, '#{id}(application.service.id)');

INSERT INTO system.br_definition (br_id, active_from, active_until, body) VALUES ('diagram-is-jpg', '2014-02-20', 'infinity', 'Select count (d.id) > 0 AS vl
from document.document d, 
source.source s,
administrative.source_describes_rrr  sdr,
administrative.rrr rrr,
transaction.transaction t,
application.service ser
where s.ext_archive_id = d.id
and s.type_code = ''cadastralSurvey''
and upper(d.extension) = ''JPG''
and sdr.source_id = s.id
and sdr.rrr_id = rrr.id
and rrr.type_code = ''ownership''
and rrr.transaction_id = t.id 
and t.from_service_id = ser.id
and ser.request_type_code in (''newFreehold'',''newDigitalTitle'',''newOwnership'')
and ser.id = #{id}
');

INSERT INTO system.br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('diagram-is-jpg1', 'diagram-is-jpg', 'service', NULL, 'complete', NULL, 'newFreehold', NULL, 'critical', 751);
INSERT INTO system.br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('diagram-is-jpg2', 'diagram-is-jpg', 'service', NULL, 'complete', NULL, 'newDigitalTitle', NULL, 'critical', 752);
INSERT INTO system.br_validation (id, br_id, target_code, target_application_moment, target_service_moment, target_reg_moment, target_request_type_code, target_rrr_type_code, severity_code, order_of_execution) VALUES ('diagram-is-jpg3', 'diagram-is-jpg', 'service', NULL, 'complete', NULL, 'newOwnership', NULL, 'critical', 753);


ALTER TABLE system.br_validation ENABLE TRIGGER ALL;
ALTER TABLE system.br_definition ENABLE TRIGGER ALL;
ALTER TABLE system.br ENABLE TRIGGER ALL;




INSERT INTO system.version SELECT '1604d' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1604d');
INSERT INTO system.version SELECT '1604e' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1604e');