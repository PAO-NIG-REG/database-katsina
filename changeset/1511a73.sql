--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.3.1
-- Started on 2015-11-02 12:54:55

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = system, pg_catalog;

--
-- TOC entry 3992 (class 0 OID 818609)
-- Dependencies: 383
-- Data for Name: appuser; Type: TABLE DATA; Schema: system; Owner: postgres
--


INSERT INTO appuser (id, username, first_name, last_name, email, mobile_number, activation_code, passwd, active, description, rowidentifier, rowversion, change_action, change_user, change_time, activation_expiration) VALUES ('44932a77-bc91-4395-8cf7-906b58ed2118', 'forestry', 'Director', 'Forestry', NULL, NULL, NULL, '834f6c4b40fd73648c42209df8b3a5ece7db8152e15b2dfab0398e8eb6b34a3e', true, NULL, '1196b9a6-f681-47ee-90c3-556eec22e27f', 2, 'u', 'test', '2015-06-22 14:15:00.673004', NULL);
INSERT INTO appuser (id, username, first_name, last_name, email, mobile_number, activation_code, passwd, active, description, rowidentifier, rowversion, change_action, change_user, change_time, activation_expiration) VALUES ('04edbae5-64ea-4b92-96bc-198c4737d7a7', 'admin', 'SOLA', 'Admin', 'neil.pullar@fao.org', NULL, NULL, '7e19e31ae82d749034fc921f777f717ba5b57c6add9add889eb536ac6effcde0', true, NULL, 'bea0009b-3a13-4cfe-aef0-b66e261d430d', 2, 'u', 'test', '2015-06-25 14:43:03.426456', NULL);
INSERT INTO appuser (id, username, first_name, last_name, email, mobile_number, activation_code, passwd, active, description, rowidentifier, rowversion, change_action, change_user, change_time, activation_expiration) VALUES ('39ed8f0a-3b46-46aa-9786-edd3caa5a0e3', 'Aminu', 'Aminu', 'Ibrahim', NULL, NULL, NULL, '6cf615d5bcaac778352a8f1f3360d23f02f34ec182e259897fd6ce485d7870d4', true, 'Assistant Director of Deeds', 'bd5d25db-d4c9-4b73-a3d5-107c8cd9132b', 4, 'u', 'admin', '2015-07-13 10:50:58.988736', NULL);
INSERT INTO appuser (id, username, first_name, last_name, email, mobile_number, activation_code, passwd, active, description, rowidentifier, rowversion, change_action, change_user, change_time, activation_expiration) VALUES ('e2ce9ef2-690f-4e00-8661-8dd9002ad33a', 'Barau', 'Aminu', 'Barau', NULL, NULL, NULL, '8b2c86ea9cf2ea4eb517fd1e06b74f399e7fec0fef92e3b482a6cf2e2b092023', true, 'Deeds Registrar', '2976fb91-fd39-44f5-af56-b624e86597f8', 6, 'u', 'admin', '2015-07-13 10:51:24.983934', NULL);
INSERT INTO appuser (id, username, first_name, last_name, email, mobile_number, activation_code, passwd, active, description, rowidentifier, rowversion, change_action, change_user, change_time, activation_expiration) VALUES ('194620eb-e7df-45b6-8101-b552f08ca10f', 'Abdul', 'Abdulaziz', 'Tukur', NULL, NULL, NULL, '598a1a400c1dfdf36974e69d7e1bc98593f2e15015eed8e9b7e47a83b31693d5', true, 'Deeds Registrar', '59890781-e9ee-42fa-a0e3-3987090a3f79', 2, 'u', 'admin', '2015-07-13 10:49:01.865635', NULL);
INSERT INTO appuser (id, username, first_name, last_name, email, mobile_number, activation_code, passwd, active, description, rowidentifier, rowversion, change_action, change_user, change_time, activation_expiration) VALUES ('871eac61-bbe8-4c00-a591-d8096cb4d8fc', 'Nuhu', 'Nuhu Abubakar', 'Umar', NULL, NULL, NULL, '0b14d501a594442a01c6859541bcb3e8164d183d32937b851835442f69d5c94e', true, 'Director of Deeds', '5e46d63c-9ce9-4afc-bbb3-c107bea2c81e', 4, 'u', 'admin', '2015-07-13 10:51:49.208289', NULL);
INSERT INTO appuser (id, username, first_name, last_name, email, mobile_number, activation_code, passwd, active, description, rowidentifier, rowversion, change_action, change_user, change_time, activation_expiration) VALUES ('eb080a62-167d-4a83-8f06-4d439de802a1', 'Anas', 'Anas', 'Lawal', NULL, NULL, NULL, 'b97873a40f73abedd8d685a7cd5e5f85e4a9cfb83eac26886640a0813850122b', true, 'Deeds Registrar', '8c4973b6-0e98-440b-93eb-dcf629e9515c', 4, 'u', 'admin', '2015-07-13 10:49:46.687736', NULL);
INSERT INTO appuser (id, username, first_name, last_name, email, mobile_number, activation_code, passwd, active, description, rowidentifier, rowversion, change_action, change_user, change_time, activation_expiration) VALUES ('a4394821-78e8-446d-8571-b9be04d2fef7', 'Hassan', 'Hassan Ibrahim', 'DanHaire', NULL, NULL, NULL, '5906ac361a137e2d286465cd6588ebb5ac3f5ae955001100bc41577c3d751764', true, 'Senior Deeds Registrar', '0a91991f-8d21-4965-aca8-ec07fa32eeb1', 4, 'u', 'admin', '2015-07-13 10:50:09.643224', NULL);
INSERT INTO appuser (id, username, first_name, last_name, email, mobile_number, activation_code, passwd, active, description, rowidentifier, rowversion, change_action, change_user, change_time, activation_expiration) VALUES ('0f373776-4df1-4216-a17f-50d27303e1cd', 'Forestry', 'Hassan', 'Musa', 'musahassan55@gmail.com', '+2348034949578', NULL, '6d5d520617d55959f6a108be087ffdcf24201a7f5c32f50adcd9a4973417218a', false, 'Kabakawa', '14073a9f-de84-45d4-b4d4-99d3d3569f9a', 2, 'u', 'ANONYMOUS', '2015-08-08 13:36:46.012881', NULL);
INSERT INTO appuser (id, username, first_name, last_name, email, mobile_number, activation_code, passwd, active, description, rowidentifier, rowversion, change_action, change_user, change_time, activation_expiration) VALUES ('02ab22c2-d763-4e58-8ed3-699b9a63bb3a', 'neil', 'Neil', 'Pullar', 'puller@gmail.com', NULL, NULL, '61b6f092e4dd7d17cf191d0a11155f23dbda55116f80a8977d45599c0a5e86a8', true, NULL, 'dc49fe0c-2e0b-44c2-86ce-46c1eb9540b8', 2, 'u', 'admin', '2015-10-29 11:28:15.219587', NULL);


--
-- TOC entry 3989 (class 0 OID 818621)
-- Dependencies: 384
-- Data for Name: appuser_appgroup; Type: TABLE DATA; Schema: system; Owner: postgres
--
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('44932a77-bc91-4395-8cf7-906b58ed2118', 'CommunityRecorders', '66a9762a-58a4-4786-bb43-3918d378c9c3', 1, 'i', 'test', '2015-06-22 14:15:00.652773');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('04edbae5-64ea-4b92-96bc-198c4737d7a7', 'claim-moderators', '981c81d0-6dfa-417a-9222-64ecd0984fe6', 1, 'i', 'test', '2015-06-25 14:43:03.404926');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('04edbae5-64ea-4b92-96bc-198c4737d7a7', 'claim-reviewers', 'cfcd9995-3352-4cc0-ba86-f5c5b310bd87', 1, 'i', 'test', '2015-06-25 14:43:03.404926');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('04edbae5-64ea-4b92-96bc-198c4737d7a7', 'CommunityMembers', '6a186107-d717-4fb8-9fae-95d629a82a3e', 1, 'i', 'test', '2015-06-25 14:43:03.404926');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('04edbae5-64ea-4b92-96bc-198c4737d7a7', 'CommunityRecorders', '1250399b-92c3-47ec-add0-f9e83a974b25', 1, 'i', 'test', '2015-06-25 14:43:03.404926');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('04edbae5-64ea-4b92-96bc-198c4737d7a7', 'super-group-id', '516322b5-b715-403f-9295-76f4554314b0', 1, 'i', 'test', '2015-06-25 14:43:03.404926');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('04edbae5-64ea-4b92-96bc-198c4737d7a7', 'ff94bfad-7079-41ea-bf4b-6962e36cad1f', '4dbd3dd6-ad14-452c-aa1b-a12cac81a757', 1, 'i', 'test', '2015-06-25 14:43:03.404926');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('39ed8f0a-3b46-46aa-9786-edd3caa5a0e3', 'CommunityRecorders', '8c3c3e9d-9437-4b00-bba6-08be4970498f', 1, 'i', 'admin', '2015-07-13 10:42:35.346579');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('e2ce9ef2-690f-4e00-8661-8dd9002ad33a', 'CommunityRecorders', '00de2f27-7ebd-4834-9c77-bb660306ce56', 1, 'i', 'admin', '2015-07-13 10:48:00.613797');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('194620eb-e7df-45b6-8101-b552f08ca10f', 'CommunityRecorders', '4a334347-16ed-4c19-85e2-8a36f745700e', 1, 'i', 'admin', '2015-07-13 10:49:01.848494');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('871eac61-bbe8-4c00-a591-d8096cb4d8fc', 'CommunityRecorders', 'de198413-2711-4822-b4ce-a0650057da63', 1, 'i', 'admin', '2015-07-13 10:41:21.309269');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('eb080a62-167d-4a83-8f06-4d439de802a1', 'CommunityRecorders', '6ba75798-b192-43b9-84b5-33641e676051', 1, 'i', 'admin', '2015-07-13 10:45:41.553772');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('a4394821-78e8-446d-8571-b9be04d2fef7', 'CommunityRecorders', 'df251256-fae6-4d53-a805-d97888611eed', 1, 'i', 'admin', '2015-07-13 10:44:45.439215');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('0f373776-4df1-4216-a17f-50d27303e1cd', 'CommunityMembers', '1aae56da-4217-4d81-b08f-f4f0b1943db2', 1, 'i', 'ANONYMOUS', '2015-08-08 13:36:46.012881');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('02ab22c2-d763-4e58-8ed3-699b9a63bb3a', 'CommunityMembers', '1b31082e-00c5-4f24-bf3f-65730e46ba4e', 1, 'i', 'admin', '2015-10-29 11:28:15.186704');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('02ab22c2-d763-4e58-8ed3-699b9a63bb3a', 'CommunityRecorders', 'bb2f143e-c96c-47d2-a4d8-eb9135fc4d84', 1, 'i', 'admin', '2015-10-29 11:28:15.186704');
INSERT INTO appuser_appgroup (appuser_id, appgroup_id, rowidentifier, rowversion, change_action, change_user, change_time) VALUES ('02ab22c2-d763-4e58-8ed3-699b9a63bb3a', 'super-group-id', '20010160-3ab9-4741-a945-90aa87a176cc', 1, 'i', 'admin', '2015-10-29 11:28:15.186704');



-- Completed on 2015-11-02 12:54:56

--
-- PostgreSQL database dump complete
--

