--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

-- Started on 2018-10-15 08:29:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 16505)
-- Name: facility; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA facility;


ALTER SCHEMA facility OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 190 (class 1259 OID 16516)
-- Name: areas; Type: TABLE; Schema: facility; Owner: postgres
--

CREATE TABLE facility.areas (
    id integer NOT NULL,
    label character varying(25),
    description_area text
);


ALTER TABLE facility.areas OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16514)
-- Name: areas_id_seq; Type: SEQUENCE; Schema: facility; Owner: postgres
--

CREATE SEQUENCE facility.areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE facility.areas_id_seq OWNER TO postgres;

--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 189
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: facility; Owner: postgres
--

ALTER SEQUENCE facility.areas_id_seq OWNED BY facility.areas.id;


--
-- TOC entry 194 (class 1259 OID 16554)
-- Name: bookings; Type: TABLE; Schema: facility; Owner: postgres
--

CREATE TABLE facility.bookings (
    id integer NOT NULL,
    facility_id integer,
    user_created character varying(25),
    user_booked character varying(25),
    "from" time without time zone,
    "to" time without time zone,
    status integer,
    mode integer,
    action_by character varying(25),
    "timestamp" timestamp without time zone,
    remarks text,
    code character varying(15),
    date date,
    book_id integer
);


ALTER TABLE facility.bookings OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16552)
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: facility; Owner: postgres
--

CREATE SEQUENCE facility.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE facility.bookings_id_seq OWNER TO postgres;

--
-- TOC entry 2210 (class 0 OID 0)
-- Dependencies: 193
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: facility; Owner: postgres
--

ALTER SEQUENCE facility.bookings_id_seq OWNED BY facility.bookings.id;


--
-- TOC entry 205 (class 1259 OID 16716)
-- Name: facilities; Type: TABLE; Schema: facility; Owner: postgres
--

CREATE TABLE facility.facilities (
    id integer NOT NULL,
    name character varying(100),
    pic character varying(25),
    code_id integer,
    area_id integer,
    description text
);


ALTER TABLE facility.facilities OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16714)
-- Name: facilities_id_seq; Type: SEQUENCE; Schema: facility; Owner: postgres
--

CREATE SEQUENCE facility.facilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE facility.facilities_id_seq OWNER TO postgres;

--
-- TOC entry 2211 (class 0 OID 0)
-- Dependencies: 204
-- Name: facilities_id_seq; Type: SEQUENCE OWNED BY; Schema: facility; Owner: postgres
--

ALTER SEQUENCE facility.facilities_id_seq OWNED BY facility.facilities.id;


--
-- TOC entry 196 (class 1259 OID 16564)
-- Name: facility_categories; Type: TABLE; Schema: facility; Owner: postgres
--

CREATE TABLE facility.facility_categories (
    id integer NOT NULL,
    code character varying(15),
    remark character varying(15)
);


ALTER TABLE facility.facility_categories OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16562)
-- Name: facility_categories_id_seq; Type: SEQUENCE; Schema: facility; Owner: postgres
--

CREATE SEQUENCE facility.facility_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE facility.facility_categories_id_seq OWNER TO postgres;

--
-- TOC entry 2212 (class 0 OID 0)
-- Dependencies: 195
-- Name: facility_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: facility; Owner: postgres
--

ALTER SEQUENCE facility.facility_categories_id_seq OWNED BY facility.facility_categories.id;


--
-- TOC entry 192 (class 1259 OID 16546)
-- Name: movements; Type: TABLE; Schema: facility; Owner: postgres
--

CREATE TABLE facility.movements (
    id integer NOT NULL,
    user_created character varying(10),
    "timestamp" time(6) without time zone,
    first_area character varying(25),
    end_area character varying(25),
    note character varying(25),
    id_facilities integer
);


ALTER TABLE facility.movements OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16544)
-- Name: movements_id_seq; Type: SEQUENCE; Schema: facility; Owner: postgres
--

CREATE SEQUENCE facility.movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE facility.movements_id_seq OWNER TO postgres;

--
-- TOC entry 2213 (class 0 OID 0)
-- Dependencies: 191
-- Name: movements_id_seq; Type: SEQUENCE OWNED BY; Schema: facility; Owner: postgres
--

ALTER SEQUENCE facility.movements_id_seq OWNED BY facility.movements.id;


--
-- TOC entry 188 (class 1259 OID 16508)
-- Name: users; Type: TABLE; Schema: facility; Owner: postgres
--

CREATE TABLE facility.users (
    id integer NOT NULL,
    nik character varying(10),
    role integer
);


ALTER TABLE facility.users OWNER TO postgres;

--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 188
-- Name: COLUMN users.nik; Type: COMMENT; Schema: facility; Owner: postgres
--

COMMENT ON COLUMN facility.users.nik IS 'Live Server tidak pakai NIK, tapi pakai GID';


--
-- TOC entry 187 (class 1259 OID 16506)
-- Name: users_id_seq; Type: SEQUENCE; Schema: facility; Owner: postgres
--

CREATE SEQUENCE facility.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE facility.users_id_seq OWNER TO postgres;

--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 187
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: facility; Owner: postgres
--

ALTER SEQUENCE facility.users_id_seq OWNED BY facility.users.id;


--
-- TOC entry 2058 (class 2604 OID 16519)
-- Name: areas id; Type: DEFAULT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.areas ALTER COLUMN id SET DEFAULT nextval('facility.areas_id_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 16557)
-- Name: bookings id; Type: DEFAULT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.bookings ALTER COLUMN id SET DEFAULT nextval('facility.bookings_id_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 16719)
-- Name: facilities id; Type: DEFAULT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.facilities ALTER COLUMN id SET DEFAULT nextval('facility.facilities_id_seq'::regclass);


--
-- TOC entry 2061 (class 2604 OID 16567)
-- Name: facility_categories id; Type: DEFAULT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.facility_categories ALTER COLUMN id SET DEFAULT nextval('facility.facility_categories_id_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 16549)
-- Name: movements id; Type: DEFAULT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.movements ALTER COLUMN id SET DEFAULT nextval('facility.movements_id_seq'::regclass);


--
-- TOC entry 2057 (class 2604 OID 16511)
-- Name: users id; Type: DEFAULT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.users ALTER COLUMN id SET DEFAULT nextval('facility.users_id_seq'::regclass);


--
-- TOC entry 2195 (class 0 OID 16516)
-- Dependencies: 190
-- Data for Name: areas; Type: TABLE DATA; Schema: facility; Owner: postgres
--

COPY facility.areas (id, label, description_area) FROM stdin;
15	HR Department	Ini daerah HR Department
16	Lapangan	Ini adalah area lapangan
1	Kantin	Ini merupakan area kantin
2	Perpus	ini area perpus
14	Lambo	ini area lambo
17	Mesjid	Area of mosque
\.


--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 189
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: facility; Owner: postgres
--

SELECT pg_catalog.setval('facility.areas_id_seq', 19, true);


--
-- TOC entry 2199 (class 0 OID 16554)
-- Dependencies: 194
-- Data for Name: bookings; Type: TABLE DATA; Schema: facility; Owner: postgres
--

COPY facility.bookings (id, facility_id, user_created, user_booked, "from", "to", status, mode, action_by, "timestamp", remarks, code, date, book_id) FROM stdin;
11	19	1234	1234	18:00:00	19:00:00	2	0	1234	2018-10-12 10:00:10	for training B	room	2018-10-12	0
12	19	1234	1234	18:00:00	19:00:00	2	1	1234	2018-10-12 10:00:10	for training B	room	2018-10-12	11
13	20	1234	1234	08:00:00	10:00:00	2	0	1234	2018-10-12 11:10:00	for training A	room	2018-10-12	0
14	20	1234	1234	08:00:00	10:00:00	2	1	1234	2018-10-12 11:10:00	for training A	room	2018-10-12	13
15	14	1234	1234	09:10:00	10:10:00	2	0	1234	2018-10-12 11:11:00	for training B	room	2018-10-12	0
16	14	1234	1234	09:10:00	10:10:00	2	1	1234	2018-10-12 11:11:00	for training B	room	2018-10-12	15
17	15	1234	1234	08:00:00	12:00:00	2	0	1234	2018-10-12 11:12:00	for training B	room	2018-10-12	0
18	15	1234	1234	08:00:00	12:00:00	2	1	1234	2018-10-12 11:12:00	for training B	room	2018-10-12	17
19	16	1234	1234	10:00:00	14:00:00	2	0	1234	2018-10-12 11:15:00	for training B	room	2018-10-12	0
20	16	1234	1234	10:00:00	14:00:00	2	1	1234	2018-10-12 11:15:00	for training B	room	2018-10-12	19
1	14	1234	1234	13:40:05	14:00:00	2	0	1234	2018-10-12 08:00:00	for training A	room	2018-10-12	0
2	14	1234	1234	13:40:05	14:00:00	2	1	1234	2018-10-12 08:00:00	for training A	room	2018-10-12	1
3	15	1234	1234	11:28:16	15:28:17	2	0	1234	2018-10-12 09:00:00		room	2018-10-12	0
4	15	1234	1234	11:28:16	15:28:17	2	1	1234	2018-10-12 09:00:00		room	2018-10-12	3
5	16	1234	1234	13:50:33	17:51:34	2	0	1234	2018-10-12 09:10:00	for training A	room	2018-10-12	0
6	16	1234	1234	13:50:33	17:51:34	2	1	1234	2018-10-12 09:10:00	for training A	room	2018-10-12	5
7	17	1234	1234	11:21:47	14:21:47	2	0	1234	2018-10-12 09:10:05		room	2018-10-12	0
8	17	1234	1234	11:21:47	14:21:47	2	1	1234	2018-10-12 09:10:05		room	2018-10-12	7
9	18	1234	1234	11:35:33	16:35:34	2	0	1234	2018-10-12 10:00:00		room	2018-10-12	0
10	18	1234	1234	11:35:33	16:35:34	2	1	1234	2018-10-12 10:00:00		room	2018-10-12	9
\.


--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 193
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: facility; Owner: postgres
--

SELECT pg_catalog.setval('facility.bookings_id_seq', 23, true);


--
-- TOC entry 2203 (class 0 OID 16716)
-- Dependencies: 205
-- Data for Name: facilities; Type: TABLE DATA; Schema: facility; Owner: postgres
--

COPY facility.facilities (id, name, pic, code_id, area_id, description) FROM stdin;
10	ITBTM18138	618034	2	2	{"name":"Laptop DELL Latitude 5480", "processor":"Core i5", "ram":"8GB","office":"Libre", "os":"Windows 10","serial":"8594973002"}
11	IT-HRD-0014	618034	2	2	{"name":"Laptop DELL Latitude E5430", "processor":"Core i5", "ram":"4GB","office":"WPS, Libre", "os":"Linux Fedora 23","serial":"24308485044"}
12	ITBTM12176	618034	2	2	{"name":"Laptop DELL Latitude E5430", "processor":"Core i5", "ram":"4GB","office":"WPS, Libre", "os":"Linux"}
13	\N	618034	2	2	{"name":"Laptop DELL Latitude E5430", "processor":"Core i5", "ram":"4GB","office":"WPS, Libre", "os":"Linux"}
28	IT-HRD-0043	618034	2	15	{"name":"Laptop DELL Latitude E5420", "processor":"Core i3", "ram":"4GB","office":"WPS, Libre", "os":"Windows 7","serial":"7959275893"}
29	\N	618034	2	15	{"name":"Laptop DELL Latitude", "processor":"Core i3", "ram":"","office":"", "os":"","serial":""}
30	\N	618034	2	15	{"name":"Laptop DELL Inspiron 630m Centrino", "processor":"", "ram":"","office":"", "os":"","serial":""}
31	IT-HRD-0050	618034	2	15	{"name":"Laptop DELL Vostro 1400 Centrino", "processor":"Core 2 Duo", "ram":"4GB","office":"Libre", "os":"Windows XP","serial":"7021159120"}
32	IT-PPC-0010	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
1	ITBTM18166	618034	2	15	{"name":"Laptop DELL Latitude 5480", "processor":"Core i5", "ram":"8GB","office":"Microsoft, Libre", "os":"Windows 10","serial":"8723465066"}
2	ITBTM18139	618034	2	15	{"name":"Laptop DELL Latitude 5480", "processor":"Core i5", "ram":"8GB","office":"Microsoft, Libre", "os":"Windows 10","serial":"17112352394"}
3	\N	618034	2	15	{"name":"Laptop DELL Latitude E5430", "processor":"Core i5", "ram":"4GB","office":"WPS, Libre", "os":"Windows 7","serial":""}
4	\N	618034	2	15	{"name":"Laptop DELL Latitude E5420", "processor":"Core i3", "ram":"4GB","office":"Microsoft, Libre", "os":"Windows 7","serial":""}
5	\N	618034	2	2	{"name":"Laptop DELL Latitude E5450", "processor":"Core i5", "ram":"4GB","office":"Microsoft, Libre", "os":"Windows","serial":""}
33	IT-HRD-0047	618034	2	15	{"name":"PC Lenovo", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
34	IT-HRD-0055	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
44	THIN 3	618034	2	15	{"name":"PC HP", "processor":"", "ram":"","office":"", "os":"","serial":""}
45	THIN 4	618034	2	15	{"name":"PC HP", "processor":"", "ram":"","office":"", "os":"Linux Fedora 17","serial":""}
6	\N	618034	2	2	{"name":"Laptop DELL Latitude 5480", "processor":"Core i5", "ram":"8GB","office":" Libre", "os":"Windows 10","serial":""}
35	IT-HRD-0045	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
14	Toyoda Meeting Room	618034	1	2	{"capacity":"8"}
15	Hummer Meeting Hall	618034	1	2	{"capacity":"75"}
16	Jaguar Meeting Room	618034	1	2	{"capacity":"20"}
17	Lexus Training Room	618034	1	2	{"capacity":"15"}
36	IT-HRD-0025	618034	2	15	{"name":"PC Lenovo", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
7	ITBTM13119	618034	2	15	{"name":"Laptop DELL Latitude E5430", "processor":"Core i5", "ram":"4GB","office":"WPS, Libre", "os":"Linux Fedora 27","serial":"37306712881"}
8	ITBTM18165	618034	2	14	{"name":"Laptop DELL Latitude 5480", "processor":"Core i5", "ram":"8GB","office":"WPS, Libre", "os":"Windows 10"}
9	IT-HRD-0020	618034	2	2	{"name":"Laptop DELL Latitude E5440", "processor":"Core i5", "ram":"4GB","office":"Microsoft, Libre", "os":"Windows 7","serial":"34991520518"}
37	\N	618034	2	15	{"name":"PC Lenovo", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
38	ITBTM11171	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
39	IT-YARD-0013	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
40	IT-HRD-0051	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
41	IT-HRD-0060	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
42	THIN1	618034	2	15	{"name":"PC HP", "processor":"", "ram":"","office":"", "os":"HP","serial":""}
43	THIN 2	618034	2	15	{"name":"PC HP", "processor":"", "ram":"","office":"", "os":"","serial":""}
18	Lambo Training Room	618034	1	2	{"capacity":"30"}
19	Mercy Training Room	618034	1	2	{"capacity":"15"}
20	Ferrari Training Room	618034	1	2	{"capacity":"15"}
21	HR-12-0001	618034	2	1	{"name":"Samsung Galaxy Tab", "version":"4.1.2", "ram":"2GB","internal":"12GB"}
22	HR-12-0002	618034	2	1	{"name":"Samsung Galaxy Tab", "version":"4.1.2", "ram":"2GB","internal":"12GB"}
23	HR-12-0003	618034	2	1	{"name":"Samsung Galaxy Tab", "version":"4.4.2", "ram":"2GB","internal":"12GB"}
24	HR-12-0004	618034	2	1	{"name":"Samsung Galaxy Tab", "version":"-", "ram":"-","internal":"-"}
25	HR-12-0005	618034	2	1	{"name":"Samsung Galaxy Tab", "version":"4.4.2", "ram":"2GB","internal":"12GB"}
26	HR-12-0006	618034	2	1	{"name":"Samsung Galaxy Tab", "version":"-", "ram":"-","internal":"-"}
27	HR-12-0007	618034	2	1	{"name":"Samsung Galaxy Tab", "version":"4.4.2", "ram":"2GB","internal":"12GB"}
46	THIN 5	618034	2	15	{"name":"PC HP", "processor":"", "ram":"","office":"", "os":"","serial":""}
47	THIN 6	618034	2	15	{"name":"PC HP", "processor":"", "ram":"","office":"", "os":"Linux Ubuntu","serial":""}
48	\N	618034	2	15	{"name":"PC Dell", "processor":"", "ram":"","office":"", "os":"Linux Debian","serial":""}
49	ITBTM17064	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
50	020.ACT.CH.HRD	618034	2	15	{"name":"PC Asus", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
51	IT-HRD-0048	618034	2	15	{"name":"PC Lenovo", "processor":"", "ram":"","office":"", "os":"Linux Fedora 23","serial":""}
52	IT-HRD-0006	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
53	IT-HRD-0057	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"WPS, Libre", "os":"Linux Fedora 23","serial":""}
54	HPU-IT-05006	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"Microsoft, Libre", "os":"Windows 7","serial":""}
55	IT-HRD-0017	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux Fedora 23","serial":""}
56	IT-HRD-0008	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Windows XP","serial":""}
57	ITBTM15082	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"WPS, Libre", "os":"Linux Fedora 27","serial":""}
58	IT-HRD-0005	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"WPS, Libre", "os":"Linux Fedora 23","serial":""}
59	\N	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
60	IT-HRD-0052	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
61	ITBTM17067	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
62	\N	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
63	ITBTM17065	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
64	ITBTM17066	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
65	\N	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
66	ITBTM17064	618034	2	15	{"name":"PC", "processor":"", "ram":"","office":"", "os":"Linux","serial":""}
\.


--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 204
-- Name: facilities_id_seq; Type: SEQUENCE SET; Schema: facility; Owner: postgres
--

SELECT pg_catalog.setval('facility.facilities_id_seq', 26, true);


--
-- TOC entry 2201 (class 0 OID 16564)
-- Dependencies: 196
-- Data for Name: facility_categories; Type: TABLE DATA; Schema: facility; Owner: postgres
--

COPY facility.facility_categories (id, code, remark) FROM stdin;
2	inv	Inventory
1	room	Room
105	trans	Transportation
\.


--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 195
-- Name: facility_categories_id_seq; Type: SEQUENCE SET; Schema: facility; Owner: postgres
--

SELECT pg_catalog.setval('facility.facility_categories_id_seq', 105, true);


--
-- TOC entry 2197 (class 0 OID 16546)
-- Dependencies: 192
-- Data for Name: movements; Type: TABLE DATA; Schema: facility; Owner: postgres
--

COPY facility.movements (id, user_created, "timestamp", first_area, end_area, note, id_facilities) FROM stdin;
\.


--
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 191
-- Name: movements_id_seq; Type: SEQUENCE SET; Schema: facility; Owner: postgres
--

SELECT pg_catalog.setval('facility.movements_id_seq', 1, false);


--
-- TOC entry 2193 (class 0 OID 16508)
-- Dependencies: 188
-- Data for Name: users; Type: TABLE DATA; Schema: facility; Owner: postgres
--

COPY facility.users (id, nik, role) FROM stdin;
1	1234	1
2	2345	2
3	3456	3
\.


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 187
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: facility; Owner: postgres
--

SELECT pg_catalog.setval('facility.users_id_seq', 11, true);


--
-- TOC entry 2066 (class 2606 OID 16524)
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- TOC entry 2070 (class 2606 OID 16559)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- TOC entry 2074 (class 2606 OID 16724)
-- Name: facilities facilities_pkey; Type: CONSTRAINT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.facilities
    ADD CONSTRAINT facilities_pkey PRIMARY KEY (id);


--
-- TOC entry 2072 (class 2606 OID 16569)
-- Name: facility_categories facility_categories_pkey; Type: CONSTRAINT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.facility_categories
    ADD CONSTRAINT facility_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2068 (class 2606 OID 16551)
-- Name: movements movements_pkey; Type: CONSTRAINT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.movements
    ADD CONSTRAINT movements_pkey PRIMARY KEY (id);


--
-- TOC entry 2064 (class 2606 OID 16513)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: facility; Owner: postgres
--

ALTER TABLE ONLY facility.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2018-10-15 08:29:01

--
-- PostgreSQL database dump complete
--

