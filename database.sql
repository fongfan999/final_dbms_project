--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: tien
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO tien;

--
-- Name: flights; Type: TABLE; Schema: public; Owner: tien
--

CREATE TABLE flights (
    id bigint NOT NULL,
    start_time timestamp without time zone,
    departure_id integer,
    destination_id integer,
    quantity integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    flight_model character varying
);


ALTER TABLE flights OWNER TO tien;

--
-- Name: flights_id_seq; Type: SEQUENCE; Schema: public; Owner: tien
--

CREATE SEQUENCE flights_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flights_id_seq OWNER TO tien;

--
-- Name: flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tien
--

ALTER SEQUENCE flights_id_seq OWNED BY flights.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: tien
--

CREATE TABLE locations (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE locations OWNER TO tien;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: tien
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_id_seq OWNER TO tien;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tien
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: tien
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO tien;

--
-- Name: tickets; Type: TABLE; Schema: public; Owner: tien
--

CREATE TABLE tickets (
    id bigint NOT NULL,
    price double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    seat character varying,
    flight_id bigint,
    owner_id bigint
);


ALTER TABLE tickets OWNER TO tien;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: tien
--

CREATE SEQUENCE tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tickets_id_seq OWNER TO tien;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tien
--

ALTER SEQUENCE tickets_id_seq OWNED BY tickets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tien
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin boolean DEFAULT false
);


ALTER TABLE users OWNER TO tien;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: tien
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO tien;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tien
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: tien
--

CREATE TABLE versions (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id integer NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object text,
    created_at timestamp without time zone
);


ALTER TABLE versions OWNER TO tien;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: tien
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE versions_id_seq OWNER TO tien;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tien
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tien
--

ALTER TABLE ONLY flights ALTER COLUMN id SET DEFAULT nextval('flights_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tien
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tien
--

ALTER TABLE ONLY tickets ALTER COLUMN id SET DEFAULT nextval('tickets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tien
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tien
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: tien
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-12-17 16:59:48.059652	2017-12-17 16:59:48.059652
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: tien
--

COPY flights (id, start_time, departure_id, destination_id, quantity, created_at, updated_at, flight_model) FROM stdin;
1	2018-01-17 17:01:00	1	17	12	2017-12-17 17:02:07.675886	2017-12-17 17:02:07.675886	vn123
2	2017-12-20 17:02:00	1	5	12	2017-12-17 17:02:40.539871	2017-12-17 17:02:40.539871	vn123
\.


--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tien
--

SELECT pg_catalog.setval('flights_id_seq', 2, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: tien
--

COPY locations (id, name, created_at, updated_at) FROM stdin;
1	Hà Nội  (HAN)	2017-12-17 16:59:48.457764	2017-12-17 16:59:48.457764
2	Hải Phòng (HPH)	2017-12-17 16:59:48.464845	2017-12-17 16:59:48.464845
3	Điện Biên (DIN)	2017-12-17 16:59:48.469125	2017-12-17 16:59:48.469125
4	Hồ Chí Minh  (SGN)	2017-12-17 16:59:48.473691	2017-12-17 16:59:48.473691
5	Phú Quốc (PQC)	2017-12-17 16:59:48.480267	2017-12-17 16:59:48.480267
6	Côn Đảo (VCS)	2017-12-17 16:59:48.485523	2017-12-17 16:59:48.485523
7	Cần Thơ (VCA)	2017-12-17 16:59:48.490092	2017-12-17 16:59:48.490092
8	Cà Mau (CAH)	2017-12-17 16:59:48.494912	2017-12-17 16:59:48.494912
9	Rạch Giá (VKG)	2017-12-17 16:59:48.49918	2017-12-17 16:59:48.49918
10	Đà Nẵng (DAD)	2017-12-17 16:59:48.503759	2017-12-17 16:59:48.503759
11	Nha Trang (CXR)	2017-12-17 16:59:48.507892	2017-12-17 16:59:48.507892
12	Đà Lạt (DLI)	2017-12-17 16:59:48.513009	2017-12-17 16:59:48.513009
13	Vinh (VII)	2017-12-17 16:59:48.517693	2017-12-17 16:59:48.517693
14	Huế (HUI)	2017-12-17 16:59:48.522201	2017-12-17 16:59:48.522201
15	Thanh Hóa (THD)	2017-12-17 16:59:48.526417	2017-12-17 16:59:48.526417
16	Ban Mê Thuột (BMV)	2017-12-17 16:59:48.531192	2017-12-17 16:59:48.531192
17	Pleiku (PXU)	2017-12-17 16:59:48.535503	2017-12-17 16:59:48.535503
18	Qui Nhơn (UIH)	2017-12-17 16:59:48.539906	2017-12-17 16:59:48.539906
19	Đồng Hới (VDH)	2017-12-17 16:59:48.544199	2017-12-17 16:59:48.544199
20	Tuy Hòa (TBB)	2017-12-17 16:59:48.548996	2017-12-17 16:59:48.548996
21	Chu Lai (VCL)	2017-12-17 16:59:48.553265	2017-12-17 16:59:48.553265
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tien
--

SELECT pg_catalog.setval('locations_id_seq', 21, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: tien
--

COPY schema_migrations (version) FROM stdin;
20171217074146
20171216025134
20171209042740
20171216024138
20171210023305
20171210061600
20171216031008
20171216022627
20171209142105
20171217042834
20171217052926
20171209032804
20171210023458
20171210135644
20171209032553
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: tien
--

COPY tickets (id, price, created_at, updated_at, lock_version, seat, flight_id, owner_id) FROM stdin;
1	12	2017-12-17 17:02:07.698544	2017-12-17 17:02:07.698544	0	VN123_1	1	\N
2	12	2017-12-17 17:02:07.721992	2017-12-17 17:02:07.721992	0	VN123_2	1	\N
3	12	2017-12-17 17:02:07.726443	2017-12-17 17:02:07.726443	0	VN123_3	1	\N
4	12	2017-12-17 17:02:07.72996	2017-12-17 17:02:07.72996	0	VN123_4	1	\N
5	12	2017-12-17 17:02:07.734805	2017-12-17 17:02:07.734805	0	VN123_5	1	\N
6	12	2017-12-17 17:02:07.738239	2017-12-17 17:02:07.738239	0	VN123_6	1	\N
7	12	2017-12-17 17:02:07.741355	2017-12-17 17:02:07.741355	0	VN123_7	1	\N
8	12	2017-12-17 17:02:07.744793	2017-12-17 17:02:07.744793	0	VN123_8	1	\N
9	12	2017-12-17 17:02:07.74934	2017-12-17 17:02:07.74934	0	VN123_9	1	\N
10	12	2017-12-17 17:02:07.753492	2017-12-17 17:02:07.753492	0	VN123_10	1	\N
11	12	2017-12-17 17:02:07.758282	2017-12-17 17:02:07.758282	0	VN123_11	1	\N
12	12	2017-12-17 17:02:07.761181	2017-12-17 17:02:07.761181	0	VN123_12	1	\N
13	123	2017-12-17 17:02:40.5495	2017-12-17 17:02:40.5495	0	VN123_1	2	\N
14	123	2017-12-17 17:02:40.554312	2017-12-17 17:02:40.554312	0	VN123_2	2	\N
15	123	2017-12-17 17:02:40.560034	2017-12-17 17:02:40.560034	0	VN123_3	2	\N
16	123	2017-12-17 17:02:40.565496	2017-12-17 17:02:40.565496	0	VN123_4	2	\N
17	123	2017-12-17 17:02:40.570434	2017-12-17 17:02:40.570434	0	VN123_5	2	\N
18	123	2017-12-17 17:02:40.576031	2017-12-17 17:02:40.576031	0	VN123_6	2	\N
19	123	2017-12-17 17:02:40.579478	2017-12-17 17:02:40.579478	0	VN123_7	2	\N
20	123	2017-12-17 17:02:40.583043	2017-12-17 17:02:40.583043	0	VN123_8	2	\N
21	123	2017-12-17 17:02:40.587344	2017-12-17 17:02:40.587344	0	VN123_9	2	\N
22	123	2017-12-17 17:02:40.591502	2017-12-17 17:02:40.591502	0	VN123_10	2	\N
23	123	2017-12-17 17:02:40.595956	2017-12-17 17:02:40.595956	0	VN123_11	2	\N
24	123	2017-12-17 17:02:40.599615	2017-12-17 17:02:40.599615	0	VN123_12	2	\N
\.


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tien
--

SELECT pg_catalog.setval('tickets_id_seq', 24, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tien
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, created_at, updated_at, admin) FROM stdin;
2	test2@otadi.com	$2a$11$kKpj6wGuOLeTlsX3nta/8uZSlQkogMy9q2aEYVwF48UqGu1ZLL1si	\N	\N	\N	0	\N	\N	\N	\N	u6vzBUzzbUVPVJ8GZWAV	2017-12-17 17:00:41.251716	2017-12-17 16:59:49.266399	\N	2017-12-17 16:59:49.26629	2017-12-17 17:00:41.25216	f
1	test@otadi.com	$2a$11$0ThbcBa.2Qbb7ruDd2gmd.KCc73UxAJmKWc8oOuToCnIykUhlqDEK	\N	\N	\N	0	\N	\N	\N	\N	BCeghFcdC6vLEzf6Kjd-	2017-12-17 17:00:47.042116	2017-12-17 16:59:48.725407	\N	2017-12-17 16:59:48.725235	2017-12-17 17:00:47.045249	f
3	admin@otadi.com	$2a$11$2OJjar8BkXOcvAo6DQGRx.wt.zWvoaEp.6aANB4WGFPqo0A8siQ8a	\N	\N	\N	1	2017-12-17 17:01:08.479921	2017-12-17 17:01:08.479921	127.0.0.1	127.0.0.1	9L75sz9oNnzHJnNgxyJs	2017-12-17 17:00:35.870761	2017-12-17 16:59:49.428216	\N	2017-12-17 16:59:49.42812	2017-12-17 17:01:08.48049	t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tien
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: tien
--

COPY versions (id, item_type, item_id, event, whodunnit, object, created_at) FROM stdin;
1	Ticket	1	create	\N	\N	2017-12-17 17:02:07.698544
2	Ticket	2	create	\N	\N	2017-12-17 17:02:07.721992
3	Ticket	3	create	\N	\N	2017-12-17 17:02:07.726443
4	Ticket	4	create	\N	\N	2017-12-17 17:02:07.72996
5	Ticket	5	create	\N	\N	2017-12-17 17:02:07.734805
6	Ticket	6	create	\N	\N	2017-12-17 17:02:07.738239
7	Ticket	7	create	\N	\N	2017-12-17 17:02:07.741355
8	Ticket	8	create	\N	\N	2017-12-17 17:02:07.744793
9	Ticket	9	create	\N	\N	2017-12-17 17:02:07.74934
10	Ticket	10	create	\N	\N	2017-12-17 17:02:07.753492
11	Ticket	11	create	\N	\N	2017-12-17 17:02:07.758282
12	Ticket	12	create	\N	\N	2017-12-17 17:02:07.761181
13	Ticket	13	create	\N	\N	2017-12-17 17:02:40.5495
14	Ticket	14	create	\N	\N	2017-12-17 17:02:40.554312
15	Ticket	15	create	\N	\N	2017-12-17 17:02:40.560034
16	Ticket	16	create	\N	\N	2017-12-17 17:02:40.565496
17	Ticket	17	create	\N	\N	2017-12-17 17:02:40.570434
18	Ticket	18	create	\N	\N	2017-12-17 17:02:40.576031
19	Ticket	19	create	\N	\N	2017-12-17 17:02:40.579478
20	Ticket	20	create	\N	\N	2017-12-17 17:02:40.583043
21	Ticket	21	create	\N	\N	2017-12-17 17:02:40.587344
22	Ticket	22	create	\N	\N	2017-12-17 17:02:40.591502
23	Ticket	23	create	\N	\N	2017-12-17 17:02:40.595956
24	Ticket	24	create	\N	\N	2017-12-17 17:02:40.599615
\.


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tien
--

SELECT pg_catalog.setval('versions_id_seq', 24, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: tien
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: flights_pkey; Type: CONSTRAINT; Schema: public; Owner: tien
--

ALTER TABLE ONLY flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: tien
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: tien
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: tien
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: tien
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: tien
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: index_flights_on_departure_id; Type: INDEX; Schema: public; Owner: tien
--

CREATE INDEX index_flights_on_departure_id ON flights USING btree (departure_id);


--
-- Name: index_flights_on_destination_id; Type: INDEX; Schema: public; Owner: tien
--

CREATE INDEX index_flights_on_destination_id ON flights USING btree (destination_id);


--
-- Name: index_tickets_on_flight_id; Type: INDEX; Schema: public; Owner: tien
--

CREATE INDEX index_tickets_on_flight_id ON tickets USING btree (flight_id);


--
-- Name: index_tickets_on_owner_id; Type: INDEX; Schema: public; Owner: tien
--

CREATE INDEX index_tickets_on_owner_id ON tickets USING btree (owner_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: tien
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: tien
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: tien
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: tien
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: fk_rails_41dfd55994; Type: FK CONSTRAINT; Schema: public; Owner: tien
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT fk_rails_41dfd55994 FOREIGN KEY (flight_id) REFERENCES flights(id);


--
-- Name: fk_rails_939b990649; Type: FK CONSTRAINT; Schema: public; Owner: tien
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT fk_rails_939b990649 FOREIGN KEY (owner_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

