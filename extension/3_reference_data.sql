DELETE FROM application.request_type  where  WHERE code = 'subdivideProperty';
INSERT INTO application.request_type (code, request_category_code, display_value, description, status, nr_days_to_complete, base_fee, area_base_fee, value_base_fee, nr_properties_required, notation_template, rrr_type_code, type_action_code, service_panel_code, display_group_code, display_order) VALUES ('subdivideProperty', 'registrationServices', 'SubDivision of Property (General)::::???????? ????? (?????)::::????? ?? (???)::::Varier Droit (Gꯩral)::::::::Variar Direitos (Geral)::::???? (??)', '...::::...::::...::::...::::::::...::::...', 'c', 5, 5.00, 0.00, 0.00, 1, 'Variation of <right> <reference>', NULL, 'vary', 'property', 'generalReg', 180);

DELETE FROM application.request_type_requires_source_type   where  WHERE request_type_code = 'subdivideProperty';
INSERT INTO application.request_type_requires_source_type (source_type_code, request_type_code) VALUES ('deed', 'subdivideProperty');

UPDATE source.administrative_source_type
   SET display_value='Diagram Image'
 WHERE code='cadastralSurvey';

UPDATE application.request_type
SET		base_fee= '2000',
		area_base_fee= '0',
		value_base_fee='0'
WHERE code = 'newFreehold';

UPDATE application.request_type
SET		base_fee= '3000',
		area_base_fee='0',
		value_base_fee='0'
WHERE code = 'titleSearch';

UPDATE application.request_type
SET		base_fee= '0',
		area_base_fee='0',
		value_base_fee='0.045'
WHERE code = 'mortgage';

UPDATE application.request_type
SET		base_fee= '0',
		area_base_fee='0',
		value_base_fee='0.06'
WHERE code = 'newOwnership';

UPDATE application.request_type
SET		base_fee= '20000',
		area_base_fee='0',
		value_base_fee='0'
WHERE code = 'varyRight';

UPDATE application.request_type
SET		base_fee= '20000',
		area_base_fee='0',
		value_base_fee='0'
WHERE code = 'subdivideProperty';