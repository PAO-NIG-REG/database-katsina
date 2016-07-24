
INSERT INTO system.version SELECT '1607f' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1607f');