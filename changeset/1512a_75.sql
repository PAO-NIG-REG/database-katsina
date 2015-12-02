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
	
INSERT INTO system.version SELECT '1512a' WHERE NOT EXISTS (SELECT version_num FROM system.version WHERE version_num = '1512a');	