UPDATE application.request_type
   SET  notation_template= 'Statutory Right of Occupancy'
 WHERE code = 'newFreehold';

INSERT INTO system.version SELECT '1607c' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1607c');