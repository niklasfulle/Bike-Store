SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: bike-store; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bike_store WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE bike_store OWNER TO postgres;

\connect bike_store

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: production; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA production;


ALTER SCHEMA production OWNER TO postgres;

--
-- Name: sales; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA sales;


ALTER SCHEMA sales OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    brand_id integer NOT NULL,
    brand_name character varying(255)
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_brand_id_seq OWNER TO postgres;

--
-- Name: brands_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_brand_id_seq OWNED BY public.brands.brand_id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(255)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    city character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    phone character varying(255),
    state character varying(255),
    street character varying(255),
    zip_code character varying(255)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    item_id integer NOT NULL,
    order_id integer NOT NULL,
    discount numeric(19,2),
    list_price numeric(19,2),
    quantity integer,
    product_id integer
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    order_date date,
    order_status integer,
    required_date date,
    shipped_date date,
    customer_id integer,
    staff_id integer,
    store_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    list_price numeric(19,2),
    model_year integer,
    product_name character varying(255),
    brand_id integer,
    category_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: staffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staffs (
    staff_id integer NOT NULL,
    active integer,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    phone character varying(255),
    manager_id integer,
    store_id integer
);


ALTER TABLE public.staffs OWNER TO postgres;

--
-- Name: staffs_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staffs_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staffs_staff_id_seq OWNER TO postgres;

--
-- Name: staffs_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staffs_staff_id_seq OWNED BY public.staffs.staff_id;


--
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    product_id integer NOT NULL,
    store_id integer NOT NULL,
    quantity integer
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    store_id integer NOT NULL,
    city character varying(255),
    email character varying(255),
    phone character varying(255),
    state character varying(255),
    store_name character varying(255),
    street character varying(255),
    zip_code character varying(255)
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_store_id_seq OWNER TO postgres;

--
-- Name: stores_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_store_id_seq OWNED BY public.stores.store_id;


--
-- Name: brands brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN brand_id SET DEFAULT nextval('public.brands_brand_id_seq'::regclass);


--
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: staffs staff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffs ALTER COLUMN staff_id SET DEFAULT nextval('public.staffs_staff_id_seq'::regclass);


--
-- Name: stores store_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN store_id SET DEFAULT nextval('public.stores_store_id_seq'::regclass);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (brand_id, brand_name) FROM stdin;
1	Electra
2	Haro
3	Heller
4	Pure Cycles
5	Ritchey
6	Strider
7	Sun Bicycles
8	Surly
9	Trek
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
1	Children Bicycles
2	Comfort Bicycles
3	Cruisers Bicycles
4	Cyclocross Bicycles
5	Electric Bikes
6	Mountain Bikes
7	Road Bikes
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, city, email, first_name, last_name, phone, state, street, zip_code) FROM stdin;
1	Orchard Park	debra.burks@yahoo.com	Debra	Burks	\N	NY	9273 Thorne Ave. 	14127
2	Campbell	kasha.todd@yahoo.com	Kasha	Todd	\N	CA	910 Vine Street 	95008
3	Redondo Beach	tameka.fisher@aol.com	Tameka	Fisher	\N	CA	769C Honey Creek St. 	90278
4	Uniondale	daryl.spence@aol.com	Daryl	Spence	\N	NY	988 Pearl Lane 	11553
5	Sacramento	charolette.rice@msn.com	Charolette	Rice	(916) 381-6003	CA	107 River Dr. 	95820
6	Fairport	lyndsey.bean@hotmail.com	Lyndsey	Bean	\N	NY	769 West Road 	14450
7	Buffalo	latasha.hays@hotmail.com	Latasha	Hays	(716) 986-3359	NY	7014 Manor Station Rd. 	14215
8	Jackson Heights	jacquline.duncan@yahoo.com	Jacquline	Duncan	\N	NY	15 Brown St. 	11372
9	Port Washington	genoveva.baldwin@msn.com	Genoveva	Baldwin	\N	NY	8550 Spruce Drive 	11050
10	Monroe	pamelia.newman@gmail.com	Pamelia	Newman	\N	NY	476 Chestnut Ave. 	10950
11	Monsey	deshawn.mendoza@yahoo.com	Deshawn	Mendoza	\N	NY	8790 Cobblestone Street 	10952
12	Hempstead	robby.sykes@hotmail.com	Robby	Sykes	(516) 583-7761	NY	486 Rock Maple Street 	11550
13	Longview	lashawn.ortiz@msn.com	Lashawn	Ortiz	\N	TX	27 Washington Rd. 	75604
14	Forney	garry.espinoza@hotmail.com	Garry	Espinoza	\N	TX	7858 Rockaway Court 	75126
15	Plattsburgh	linnie.branch@gmail.com	Linnie	Branch	\N	NY	314 South Columbia Ave. 	12901
16	New York	emmitt.sanchez@hotmail.com	Emmitt	Sanchez	(212) 945-8823	NY	461 Squaw Creek Road 	10002
17	Scarsdale	caren.stephens@msn.com	Caren	Stephens	\N	NY	914 Brook St. 	10583
18	Canandaigua	georgetta.hardin@aol.com	Georgetta	Hardin	\N	NY	474 Chapel Dr. 	14424
19	Orchard Park	lizzette.stein@yahoo.com	Lizzette	Stein	\N	NY	19 Green Hill Lane 	14127
20	Sugar Land	aleta.shepard@aol.com	Aleta	Shepard	\N	TX	684 Howard St. 	77478
21	Victoria	tobie.little@gmail.com	Tobie	Little	\N	TX	10 Silver Spear Dr. 	77904
22	East Northport	adelle.larsen@gmail.com	Adelle	Larsen	\N	NY	683 West Kirkland Dr. 	11731
23	Hollis	kaylee.english@msn.com	Kaylee	English	\N	NY	8786 Fulton Rd. 	11423
24	Atwater	corene.wall@msn.com	Corene	Wall	\N	CA	9601 Ocean Rd. 	95301
25	Mahopac	regenia.vaughan@gmail.com	Regenia	Vaughan	\N	NY	44 Stonybrook Street 	10541
26	Long Beach	theo.reese@gmail.com	Theo	Reese	(562) 215-2907	NY	8755 W. Wild Horse St. 	11561
27	Sunnyside	santos.valencia@yahoo.com	Santos	Valencia	\N	NY	7479 Carpenter Street 	11104
28	Ossining	jeanice.frost@hotmail.com	Jeanice	Frost	\N	NY	76 Devon Lane 	10562
29	Mahopac	syreeta.hendricks@msn.com	Syreeta	Hendricks	\N	NY	193 Spruce Road 	10541
30	Torrance	jamaal.albert@gmail.com	Jamaal	Albert	\N	CA	853 Stonybrook Street 	90505
31	Oakland	williemae.holloway@msn.com	Williemae	Holloway	(510) 246-8375	CA	69 Cypress St. 	94603
32	Fullerton	araceli.golden@msn.com	Araceli	Golden	\N	CA	12 Ridgeview Ave. 	92831
33	Palos Verdes Peninsula	deloris.burke@hotmail.com	Deloris	Burke	\N	CA	895 Edgemont Drive 	90274
34	East Northport	brittney.woodward@aol.com	Brittney	Woodward	\N	NY	960 River St. 	11731
35	Baldwinsville	guillermina.noble@msn.com	Guillermina	Noble	\N	NY	6 Del Monte Lane 	13027
36	Liverpool	bernita.mcdaniel@hotmail.com	Bernita	Mcdaniel	\N	NY	2 Peg Shop Ave. 	13090
37	Maspeth	melia.brady@gmail.com	Melia	Brady	\N	NY	907 Shirley Rd. 	11378
38	Astoria	zelma.browning@aol.com	Zelma	Browning	\N	NY	296 Second Street 	11102
39	Lancaster	janetta.aguirre@aol.com	Janetta	Aguirre	(717) 670-2634	NY	214 Second Court 	14086
40	Encino	ronna.butler@gmail.com	Ronna	Butler	\N	CA	9438 Plymouth Court 	91316
41	Queensbury	kathie.freeman@msn.com	Kathie	Freeman	\N	NY	667 Temple Dr. 	12804
42	Richmond Hill	tangela.quinn@aol.com	Tangela	Quinn	\N	NY	4 S. Purple Finch Road 	11418
43	Houston	mozelle.carter@aol.com	Mozelle	Carter	(281) 489-9656	TX	895 Chestnut Ave. 	77016
44	Elmont	onita.johns@msn.com	Onita	Johns	\N	NY	32 Glen Creek Lane 	11003
45	Bethpage	bennett.armstrong@aol.com	Bennett	Armstrong	\N	NY	688 Walnut Street 	11714
46	Encino	monika.berg@gmail.com	Monika	Berg	\N	CA	369 Vernon Dr. 	91316
47	San Lorenzo	bridgette.guerra@hotmail.com	Bridgette	Guerra	\N	CA	9982 Manor Drive 	94580
48	Liverpool	cesar.jackson@gmail.com	Cesar	Jackson	\N	NY	8068 N. Griffin Ave. 	13090
49	Fairport	caroll.hays@yahoo.com	Caroll	Hays	\N	NY	9381 Wrangler St. 	14450
50	Sugar Land	cleotilde.booth@gmail.com	Cleotilde	Booth	\N	TX	17 Corona St. 	77478
51	Merrick	gertrud.rhodes@aol.com	Gertrud	Rhodes	\N	NY	9961 Meadowbrook Street 	11566
52	East Elmhurst	tu.ramirez@hotmail.com	Tu	Ramirez	\N	NY	24 W. Courtland Street 	11369
53	Glendora	saturnina.garner@gmail.com	Saturnina	Garner	\N	CA	8538 Fairground St. 	91740
54	Utica	fran.yang@hotmail.com	Fran	Yang	\N	NY	440 Pearl St. 	13501
55	Merrick	diana.guerra@hotmail.com	Diana	Guerra	\N	NY	45 Chapel Ave. 	11566
56	Houston	lolita.mosley@hotmail.com	Lolita	Mosley	(281) 363-3309	TX	376 S. High Ridge St. 	77016
57	Bronx	pamala.henry@aol.com	Pamala	Henry	\N	NY	197 Bridgeton Ave. 	10451
58	Central Islip	damien.dorsey@yahoo.com	Damien	Dorsey	\N	NY	161 Old York Street 	11722
59	Rockville Centre	latasha.stanley@gmail.com	Latasha	Stanley	\N	NY	8068 Fordham Drive 	11570
60	San Carlos	neil.mccall@gmail.com	Neil	Mccall	\N	CA	7476 Oakland Dr. 	94070
61	San Angelo	elinore.aguilar@msn.com	Elinore	Aguilar	\N	TX	9766 Rockcrest Ave. 	76901
62	East Elmhurst	alica.hunter@hotmail.com	Alica	Hunter	\N	NY	8 San Juan Drive 	11369
63	Amityville	tenisha.lyons@aol.com	Tenisha	Lyons	\N	NY	78 E. Rock Creek Street 	11701
64	Desoto	bobbie.foster@yahoo.com	Bobbie	Foster	\N	TX	988 Pineknoll Ave. 	75115
65	Rome	kanesha.vega@gmail.com	Kanesha	Vega	\N	NY	771 E. Oxford Drive 	13440
66	Garland	lorrie.becker@yahoo.com	Lorrie	Becker	\N	TX	19 North Court 	75043
67	Sacramento	tommie.melton@gmail.com	Tommie	Melton	(916) 802-2952	CA	8 West Old York St. 	95820
68	Rowlett	jayne.kirkland@hotmail.com	Jayne	Kirkland	\N	TX	7800 Second Lane 	75088
69	Rocklin	katelin.kennedy@gmail.com	Katelin	Kennedy	\N	CA	286 Myrtle Lane 	95677
70	East Elmhurst	tomasa.carson@aol.com	Tomasa	Carson	\N	NY	10 Clark Avenue 	11369
71	Bronx	takako.casey@aol.com	Takako	Casey	\N	NY	7548 Court Lane 	10451
72	South El Monte	petronila.norris@aol.com	Petronila	Norris	\N	CA	72 South Marshall Lane 	91733
73	Liverpool	melanie.hayes@msn.com	Melanie	Hayes	\N	NY	5 N. Hall Dr. 	13090
74	North Tonawanda	georgeann.waller@yahoo.com	Georgeann	Waller	\N	NY	9797 Bald Hill Ave. 	14120
75	Amityville	abby.gamble@aol.com	Abby	Gamble	\N	NY	60 Myers Dr. 	11701
76	Port Jefferson Station	parker.prince@hotmail.com	Parker	Prince	\N	NY	21 Sulphur Springs Drive 	11776
77	Richardson	keri.bridges@gmail.com	Keri	Bridges	\N	TX	8504 Brickell Ave. 	75080
78	Palos Verdes Peninsula	chi.goff@aol.com	Chi	Goff	\N	CA	3 W. Glen Ridge Avenue 	90274
79	Baldwin	ashanti.parks@hotmail.com	Ashanti	Parks	\N	NY	846 N. Helen St. 	11510
80	Buffalo	sarai.mckee@msn.com	Sarai	Mckee	(716) 912-8110	NY	641 Glenwood Avenue 	14215
81	San Lorenzo	zina.bonner@hotmail.com	Zina	Bonner	\N	CA	9312 8th Street 	94580
82	Coachella	lizzie.joyner@msn.com	Lizzie	Joyner	\N	CA	8541 Roberts St. 	92236
83	Scarsdale	tiesha.daniel@yahoo.com	Tiesha	Daniel	\N	NY	6 West Bohemia Lane 	10583
84	Lindenhurst	armand.whitehead@hotmail.com	Armand	Whitehead	\N	NY	639 Harvey St. 	11757
85	Huntington Station	teofila.fischer@aol.com	Teofila	Fischer	\N	NY	1 West Brickyard St. 	11746
86	Oswego	lissa.vargas@yahoo.com	Lissa	Vargas	\N	NY	517 Victoria Ave. 	13126
87	Duarte	yan.mcgowan@msn.com	Yan	Mcgowan	\N	CA	8960 Newport Ave. 	91010
88	Hollis	titus.bullock@gmail.com	Titus	Bullock	\N	NY	29 Oxford Avenue 	11423
89	Upland	arvilla.osborn@gmail.com	Arvilla	Osborn	\N	CA	60 Acacia Lane 	91784
90	Franklin Square	marjorie.logan@msn.com	Marjorie	Logan	\N	NY	95 Grandrose St. 	11010
91	San Diego	marvin.mullins@aol.com	Marvin	Mullins	(619) 635-2027	CA	7489 Redwood Drive 	92111
92	Farmingdale	tena.cruz@yahoo.com	Tena	Cruz	\N	NY	1 South St. 	11735
93	Troy	corrina.sawyer@yahoo.com	Corrina	Sawyer	(248) 370-1364	NY	95 Briarwood Lane 	12180
94	Baldwinsville	sharyn.hopkins@hotmail.com	Sharyn	Hopkins	\N	NY	4 South Temple Ave. 	13027
95	Saratoga Springs	letitia.franco@aol.com	Letitia	Franco	\N	NY	607 Lakeview Drive 	12866
96	Bayside	floretta.higgins@hotmail.com	Floretta	Higgins	\N	NY	870 Lilac Dr. 	11361
97	Yuba City	louanne.martin@hotmail.com	Louanne	Martin	\N	CA	1 Campfire Ave. 	95993
98	Plattsburgh	violet.valenzuela@msn.com	Violet	Valenzuela	\N	NY	8668 Piper Street 	12901
99	Monroe	carie.kidd@yahoo.com	Carie	Kidd	\N	NY	6 East Clinton Street 	10950
100	Commack	kellie.franco@yahoo.com	Kellie	Franco	\N	NY	444 South Walnut Rd. 	11725
101	Scarsdale	nichelle.howell@aol.com	Nichelle	Howell	\N	NY	7670 Forest St. 	10583
102	Canandaigua	marisol.goodman@gmail.com	Marisol	Goodman	\N	NY	864 East Cherry St. 	14424
103	Syosset	sylvie.wilkerson@yahoo.com	Sylvie	Wilkerson	\N	NY	750 Central Ave. 	11791
104	Campbell	katharina.bates@gmail.com	Katharina	Bates	\N	CA	54 South Greenview Drive 	95008
105	Woodhaven	marget.hodge@msn.com	Marget	Hodge	\N	NY	7199 Selby Lane 	11421
106	Elmhurst	raul.melendez@hotmail.com	Raul	Melendez	\N	NY	9772 Manhattan St. 	11373
107	Central Islip	cecil.hopper@yahoo.com	Cecil	Hopper	\N	NY	471 Glenlake Ave. 	11722
108	Floral Park	shae.hickman@hotmail.com	Shae	Hickman	\N	NY	740 Pin Oak Street 	11001
109	San Jose	monica.sears@aol.com	Monica	Sears	(408) 704-8863	CA	57 Glenholme St. 	95127
110	Anaheim	ollie.zimmerman@yahoo.com	Ollie	Zimmerman	(657) 648-2863	CA	69 Wood Rd. 	92806
111	Orchard Park	shila.white@msn.com	Shila	White	\N	NY	94 Lakeshore Street 	14127
112	West Hempstead	yuk.vega@yahoo.com	Yuk	Vega	\N	NY	413 Wood St. 	11552
113	Farmingdale	eliana.silva@gmail.com	Eliana	Silva	\N	NY	7119 Summer Rd. 	11735
114	Amityville	thalia.horne@yahoo.com	Thalia	Horne	\N	NY	9312 Harvard Street 	11701
115	Monroe	rey.lindsay@gmail.com	Rey	Lindsay	\N	NY	16 Philmont St. 	10950
116	Euless	merlene.vinson@gmail.com	Merlene	Vinson	\N	TX	431 Vine Dr. 	76039
117	Sugar Land	dacia.william@msn.com	Dacia	William	\N	TX	62 Cypress Drive 	77478
118	Pittsford	le.wood@yahoo.com	Le	Wood	\N	NY	90 Primrose Dr. 	14534
119	San Angelo	thalia.dillard@yahoo.com	Thalia	Dillard	\N	TX	987 NE. Gates Street 	76901
120	Fresno	luz.house@gmail.com	Luz	House	(559) 114-2580	CA	491 Railroad Street 	93706
121	Palos Verdes Peninsula	lucy.woods@gmail.com	Lucy	Woods	\N	CA	8437 West Rockaway St. 	90274
122	Howard Beach	shena.carter@yahoo.com	Shena	Carter	\N	NY	72 University Road 	11414
123	Corpus Christi	robena.hill@hotmail.com	Robena	Hill	(361) 598-4414	TX	263 Cross St. 	78418
124	South El Monte	jeni.booker@gmail.com	Jeni	Booker	\N	CA	546 Railroad Dr. 	91733
125	Canandaigua	herlinda.stone@msn.com	Herlinda	Stone	\N	NY	725 Gulf St. 	14424
126	Newburgh	lavina.dejesus@msn.com	Lavina	Dejesus	\N	NY	59 E. Valley Avenue 	12550
127	Maspeth	erlinda.nielsen@aol.com	Erlinda	Nielsen	\N	NY	728 Oxford Lane 	11378
128	Plattsburgh	terrance.lynn@yahoo.com	Terrance	Lynn	\N	NY	91 East Buckingham Drive 	12901
129	Lockport	walton.dejesus@yahoo.com	Walton	Dejesus	\N	NY	15 Washington Rd. 	14094
130	Troy	wes.stanton@msn.com	Wes	Stanton	(248) 247-5074	NY	8662 Tunnel Street 	12180
131	Syosset	tanesha.hampton@hotmail.com	Tanesha	Hampton	\N	NY	19 Belmont Ave. 	11791
132	Hamburg	boyd.irwin@hotmail.com	Boyd	Irwin	\N	NY	221 Whitemarsh St. 	14075
133	Coram	delbert.wilkins@aol.com	Delbert	Wilkins	\N	NY	420 Greenview St. 	11727
134	Hempstead	brianna.moss@msn.com	Brianna	Moss	(516) 156-8031	NY	4 Longfellow St. 	11550
135	Houston	dorthey.jackson@msn.com	Dorthey	Jackson	(281) 926-8010	TX	9768 Brookside St. 	77016
136	Forney	sarita.parks@msn.com	Sarita	Parks	\N	TX	7809 Second Lane 	75126
137	Massapequa	shonta.mercer@aol.com	Shonta	Mercer	\N	NY	319 NE. La Sierra Avenue 	11758
138	Anaheim	jone.bernard@hotmail.com	Jone	Bernard	(657) 536-5165	CA	99 Longbranch Court 	92806
139	Spring Valley	wanita.davenport@aol.com	Wanita	Davenport	\N	NY	525 Dogwood Ave. 	10977
140	East Elmhurst	cleopatra.tate@aol.com	Cleopatra	Tate	\N	NY	97 N. Glenwood St. 	11369
141	Saint Albans	ramiro.byers@gmail.com	Ramiro	Byers	\N	NY	16 Pleasant St. 	11412
142	West Hempstead	nicholas.vazquez@hotmail.com	Nicholas	Vazquez	\N	NY	9 Roosevelt Street 	11552
143	Jackson Heights	janae.doyle@gmail.com	Janae	Doyle	\N	NY	760 Rose Ave. 	11372
144	Port Chester	hans.price@hotmail.com	Hans	Price	\N	NY	51 Glendale Road 	10573
145	Staten Island	miquel.neal@hotmail.com	Miquel	Neal	\N	NY	9564 Deerfield Lane 	10301
146	Saratoga Springs	stefany.potter@gmail.com	Stefany	Potter	\N	NY	256 South Academy St. 	12866
147	Smithtown	bernetta.marquez@hotmail.com	Bernetta	Marquez	\N	NY	626 E. Dunbar Street 	11787
148	Richmond Hill	julee.woodard@yahoo.com	Julee	Woodard	\N	NY	869 Summerhouse Dr. 	11418
149	Spring Valley	meredith.bryan@hotmail.com	Meredith	Bryan	\N	NY	8935 E. Oxford St. 	10977
150	Huntington	weldon.michael@hotmail.com	Weldon	Michael	\N	NY	9952 Nut Swamp St. 	11743
151	Atwater	joesph.delacruz@aol.com	Joesph	Delacruz	\N	CA	184 Cypress Street 	95301
152	Plainview	katherina.odom@yahoo.com	Katherina	Odom	\N	NY	897 N. Oak Drive 	11803
153	San Angelo	laraine.robbins@yahoo.com	Laraine	Robbins	\N	TX	8214 E. Pin Oak Lane 	76901
154	Helotes	jenise.preston@yahoo.com	Jenise	Preston	\N	TX	9 Littleton Drive 	78023
155	Bay Shore	lory.page@hotmail.com	Lory	Page	\N	NY	58 Summerhouse Street 	11706
156	West Islip	charlyn.cantrell@yahoo.com	Charlyn	Cantrell	\N	NY	8756 Euclid St. 	11795
157	Banning	carola.rodriquez@hotmail.com	Carola	Rodriquez	\N	CA	9433 Heritage Lane 	92220
158	Spring Valley	alane.kennedy@yahoo.com	Alane	Kennedy	\N	NY	34 Green Lake Street 	10977
159	Garland	regina.burns@aol.com	Regina	Burns	\N	TX	713 Buckingham St. 	75043
160	Rowlett	omer.estrada@gmail.com	Omer	Estrada	\N	TX	9 Honey Creek Street 	75088
161	Smithtown	crystle.gilliam@yahoo.com	Crystle	Gilliam	\N	NY	86 Edgewater Road 	11787
162	Newburgh	kam.wilder@hotmail.com	Kam	Wilder	\N	NY	500 West Clay Ave. 	12550
163	Rome	margert.stevens@aol.com	Margert	Stevens	\N	NY	502 North Poplar St. 	13440
164	Woodside	tomika.larson@yahoo.com	Tomika	Larson	\N	NY	254 Canal St. 	11377
165	San Jose	jeromy.burch@msn.com	Jeromy	Burch	(408) 955-8238	CA	889 Mulberry Street 	95127
166	Woodhaven	lena.mills@yahoo.com	Lena	Mills	\N	NY	42 Homestead St. 	11421
167	Spring Valley	loreta.johnston@yahoo.com	Loreta	Johnston	\N	NY	39 Lafayette Dr. 	10977
168	South Ozone Park	nettie.mcdaniel@hotmail.com	Nettie	Mcdaniel	\N	NY	7004 E. Wakehurst St. 	11420
169	Palos Verdes Peninsula	karla.kirk@yahoo.com	Karla	Kirk	\N	CA	9718 Harvard Rd. 	90274
170	Oxnard	regine.gonzales@gmail.com	Regine	Gonzales	(805) 763-4045	CA	798 Court Drive 	93035
171	Uniondale	miriam.baker@hotmail.com	Miriam	Baker	\N	NY	90 Studebaker St. 	11553
172	Santa Clara	jeanie.kirkland@aol.com	Jeanie	Kirkland	\N	CA	7643 Old Theatre St. 	95050
173	Garland	marquerite.dawson@gmail.com	Marquerite	Dawson	\N	TX	37 Hamilton Court 	75043
174	Scarsdale	babara.ochoa@aol.com	Babara	Ochoa	\N	NY	872 Smith Store St. 	10583
175	Duarte	nova.hess@msn.com	Nova	Hess	\N	CA	773 South Lafayette St. 	91010
176	South El Monte	carley.reynolds@gmail.com	Carley	Reynolds	\N	CA	2 Snake Hill Drive 	91733
177	Maspeth	carissa.foreman@msn.com	Carissa	Foreman	\N	NY	69C N. Ridge Rd. 	11378
178	New York	genoveva.tyler@gmail.com	Genoveva	Tyler	(212) 152-6381	NY	8121 Windfall Ave. 	10002
179	Pittsford	deane.sears@hotmail.com	Deane	Sears	\N	NY	3 Bradford Court 	14534
180	Farmingdale	karey.steele@gmail.com	Karey	Steele	\N	NY	8879 Kent Lane 	11735
181	Redondo Beach	olevia.pitts@gmail.com	Olevia	Pitts	\N	CA	39 Fieldstone Drive 	90278
182	Bay Shore	jenniffer.bullock@msn.com	Jenniffer	Bullock	\N	NY	38 Oxford Avenue 	11706
183	Floral Park	jeniffer.ratliff@gmail.com	Jeniffer	Ratliff	\N	NY	510 Rocky River Court 	11001
184	Webster	klara.stanley@aol.com	Klara	Stanley	\N	NY	603 Mechanic St. 	14580
185	San Angelo	morton.lee@yahoo.com	Morton	Lee	\N	TX	313 Ridge St. 	76901
186	Monsey	ken.charles@msn.com	Ken	Charles	\N	NY	9124 W. Piper Lane 	10952
187	Apple Valley	hedwig.paul@msn.com	Hedwig	Paul	\N	CA	422 Manor Ave. 	92307
188	Oxnard	sharla.flynn@hotmail.com	Sharla	Flynn	(805) 478-7724	CA	7 Brown Drive 	93035
189	Liverpool	damian.dawson@hotmail.com	Damian	Dawson	\N	NY	528 St Margarets Street 	13090
190	Long Beach	toya.pratt@yahoo.com	Toya	Pratt	(562) 218-6405	NY	485 San Pablo Drive 	11561
191	Oxnard	graciela.barber@hotmail.com	Graciela	Barber	(805) 656-6987	CA	1 E. Young St. 	93035
192	Torrance	bong.hebert@gmail.com	Bong	Hebert	\N	CA	545 Brook St. 	90505
193	Hicksville	ayanna.rhodes@msn.com	Ayanna	Rhodes	\N	NY	7425 Pheasant St. 	11801
194	Santa Cruz	dorine.roberson@msn.com	Dorine	Roberson	\N	CA	396 Meadowbrook Lane 	95060
195	Franklin Square	addie.hahn@hotmail.com	Addie	Hahn	\N	NY	8165 Baker Ave. 	11010
196	North Tonawanda	edythe.valencia@yahoo.com	Edythe	Valencia	\N	NY	9346 Wall St. 	14120
197	Rego Park	andy.o'neill@msn.com	Andy	O'neill	\N	NY	9544 Mulberry Drive 	11374
198	Amarillo	luis.tyler@gmail.com	Luis	Tyler	\N	TX	9568 Campfire Circle 	79106
199	New Windsor	clelia.workman@yahoo.com	Clelia	Workman	\N	NY	620 North Somerset St. 	12553
200	Farmingdale	ashely.holmes@aol.com	Ashely	Holmes	\N	NY	45 High Ridge Ave. 	11735
201	Ballston Spa	candis.harding@gmail.com	Candis	Harding	\N	NY	33 NW. Cambridge Ave. 	12020
202	Lancaster	marni.bolton@msn.com	Marni	Bolton	(717) 670-6268	NY	7469 Plymouth Ave. 	14086
203	Houston	minerva.decker@yahoo.com	Minerva	Decker	(281) 271-6390	TX	794 Greenrose Street 	77016
204	Rockville Centre	alpha.king@hotmail.com	Alpha	King	\N	NY	14 Henry Smith St. 	11570
205	Jamaica	harris.pittman@yahoo.com	Harris	Pittman	\N	NY	404 Cherry Hill Road 	11432
206	Brooklyn	stephaine.riddle@hotmail.com	Stephaine	Riddle	\N	NY	199 Vermont Court 	11201
207	Forney	michel.blankenship@msn.com	Michel	Blankenship	\N	TX	382 West Hill Dr. 	75126
208	Ridgecrest	denis.logan@msn.com	Denis	Logan	\N	CA	121 Rockcrest Street 	93555
209	Selden	jutta.everett@gmail.com	Jutta	Everett	\N	NY	27 Taylor Ave. 	11784
210	Albany	priscilla.wilkins@aol.com	Priscilla	Wilkins	(229) 322-2269	NY	653 Pawnee Rd. 	12203
211	Scarsdale	gilma.dejesus@yahoo.com	Gilma	Dejesus	\N	NY	777 Thompson Ave. 	10583
212	Troy	buford.bridges@msn.com	Buford	Bridges	(248) 604-7346	NY	239 Oak Valley Court 	12180
213	Hamburg	elenore.hensley@hotmail.com	Elenore	Hensley	\N	NY	7037 Aspen St. 	14075
214	North Tonawanda	ross.pugh@msn.com	Ross	Pugh	\N	NY	8598 Saxon St. 	14120
215	Whitestone	judith.finley@hotmail.com	Judith	Finley	\N	NY	474 West Bank Road 	11357
216	Bethpage	wai.soto@msn.com	Wai	Soto	\N	NY	30 Arch Drive 	11714
217	Fresno	carline.collier@msn.com	Carline	Collier	(559) 810-6070	CA	28 Trenton Lane 	93706
218	Port Washington	casey.gill@gmail.com	Casey	Gill	\N	NY	636 Prospect Avenue 	11050
219	Oceanside	darcie.morgan@aol.com	Darcie	Morgan	(442) 618-7068	NY	476 East Adams Ave. 	11572
220	Smithtown	lucio.sherman@gmail.com	Lucio	Sherman	\N	NY	842 Corona Ave. 	11787
221	Mcallen	clementine.mooney@yahoo.com	Clementine	Mooney	\N	TX	678 Charles Court 	78501
222	East Northport	anya.contreras@msn.com	Anya	Contreras	\N	NY	38 Old Fairground St. 	11731
223	Patchogue	scarlet.yates@hotmail.com	Scarlet	Yates	\N	NY	687 Shirley St. 	11772
224	Lawndale	moses.pope@yahoo.com	Moses	Pope	\N	CA	654 Theatre Street 	90260
225	Plainview	barbera.riggs@aol.com	Barbera	Riggs	\N	NY	12 Gartner Drive 	11803
226	Richmond Hill	kiana.rivera@gmail.com	Kiana	Rivera	\N	NY	9 Sheffield Dr. 	11418
227	Patchogue	danielle.bond@msn.com	Danielle	Bond	\N	NY	8589 Shub Farm Street 	11772
228	Brentwood	whitney.estes@gmail.com	Whitney	Estes	(631) 315-4020	NY	454 Bear Hill Street 	11717
229	Holbrook	molly.langley@aol.com	Molly	Langley	\N	NY	63 Bridgeton Street 	11741
230	Deer Park	chelsey.hardin@hotmail.com	Chelsey	Hardin	\N	NY	13 Brickyard Street 	11729
231	Sacramento	jenee.rasmussen@hotmail.com	Jenee	Rasmussen	(916) 219-1774	CA	19 George Lane 	95820
232	Euless	freddie.mathis@hotmail.com	Freddie	Mathis	\N	TX	31 Shady St. 	76039
233	Santa Clara	mariana.strong@msn.com	Mariana	Strong	\N	CA	972 Dunbar Dr. 	95050
234	East Meadow	winfred.harris@msn.com	Winfred	Harris	\N	NY	734 Glen Eagles St. 	11554
235	Bay Shore	jeromy.elliott@gmail.com	Jeromy	Elliott	\N	NY	7112 Laurel Street 	11706
236	Selden	verona.o'neill@hotmail.com	Verona	O'neill	\N	NY	8279 W. Sussex St. 	11784
237	Banning	elvera.peck@yahoo.com	Elvera	Peck	\N	CA	759 Lakewood Street 	92220
238	Howard Beach	cindi.larson@msn.com	Cindi	Larson	\N	NY	896 Golden Star Rd. 	11414
239	Canyon Country	felice.guzman@hotmail.com	Felice	Guzman	\N	CA	7 Creekside Lane 	91387
240	Banning	le.deleon@msn.com	Le	Deleon	\N	CA	58 Clark Court 	92220
241	Queensbury	manie.sanchez@hotmail.com	Manie	Sanchez	\N	NY	471 Illinois Ave. 	12804
242	Canyon Country	rutha.howell@gmail.com	Rutha	Howell	\N	CA	9247 Jones Street 	91387
243	Ballston Spa	natosha.rowland@aol.com	Natosha	Rowland	\N	NY	51 Elmwood St. 	12020
244	San Pablo	jessika.bray@yahoo.com	Jessika	Bray	\N	CA	37 East Greystone St. 	94806
245	Palos Verdes Peninsula	delila.hamilton@yahoo.com	Delila	Hamilton	\N	CA	7451 East James Ave. 	90274
246	Niagara Falls	dionne.norris@yahoo.com	Dionne	Norris	\N	NY	9993 Greenview Circle 	14304
247	Palos Verdes Peninsula	muriel.juarez@gmail.com	Muriel	Juarez	\N	CA	8073 Cemetery Drive 	90274
248	Mcallen	cecelia.gill@aol.com	Cecelia	Gill	\N	TX	372 Silver Spear Dr. 	78501
249	Ossining	magda.eaton@aol.com	Magda	Eaton	\N	NY	860 Middle River Street 	10562
250	El Paso	ivonne.yang@gmail.com	Ivonne	Yang	(915) 181-1950	TX	7359 North Lake View St. 	79930
251	Ballston Spa	kasie.rodriquez@aol.com	Kasie	Rodriquez	\N	NY	7 North Beech St. 	12020
252	Richmond Hill	eleni.gordon@hotmail.com	Eleni	Gordon	\N	NY	583 W. San Carlos Street 	11418
253	Atwater	maurice.norton@hotmail.com	Maurice	Norton	\N	CA	32 Mayflower Dr. 	95301
254	Lawndale	cristobal.hutchinson@gmail.com	Cristobal	Hutchinson	\N	CA	58 Washington Avenue 	90260
255	Massapequa Park	flossie.holder@msn.com	Flossie	Holder	\N	NY	8459 W. Newport Court 	11762
256	Merrick	erma.salinas@gmail.com	Erma	Salinas	\N	NY	347 Sheffield St. 	11566
257	Elmhurst	earl.stanley@gmail.com	Earl	Stanley	\N	NY	569 Lake Lane 	11373
258	Torrance	maribel.william@aol.com	Maribel	William	\N	CA	65 Magnolia Ave. 	90505
259	Pleasanton	johnathan.velazquez@hotmail.com	Johnathan	Velazquez	\N	CA	9680 E. Somerset Street 	94566
260	Canyon Country	rodrick.shelton@hotmail.com	Rodrick	Shelton	\N	CA	7157 Addison Street 	91387
261	Fullerton	ferne.kline@hotmail.com	Ferne	Kline	\N	CA	303 Shady St. 	92831
262	Buffalo	rubin.decker@gmail.com	Rubin	Decker	(716) 950-9835	NY	9875 Shady Ave. 	14215
263	Oceanside	dortha.jarvis@yahoo.com	Dortha	Jarvis	(442) 919-8256	NY	76 Prince Drive 	11572
264	Garden City	mariela.huffman@gmail.com	Mariela	Huffman	\N	NY	531 Fieldstone Road 	11530
265	Central Islip	mellisa.farley@yahoo.com	Mellisa	Farley	\N	NY	21 West Princess St. 	11722
266	Elmont	myung.hooper@gmail.com	Myung	Hooper	\N	NY	951 Mill Road 	11003
267	Apple Valley	angelina.lloyd@yahoo.com	Angelina	Lloyd	\N	CA	9593 North Sherman Dr. 	92307
268	Ballston Spa	trinity.riddle@aol.com	Trinity	Riddle	\N	NY	23 Oakland Lane 	12020
269	Bellmore	barton.crosby@msn.com	Barton	Crosby	\N	NY	896 Edgewater St. 	11710
270	Kingston	claudio.wise@hotmail.com	Claudio	Wise	\N	NY	810 Oxford Ave. 	12401
271	Longview	katheleen.marks@yahoo.com	Katheleen	Marks	\N	TX	69 North Tower St. 	75604
272	Jamaica	deja.chaney@hotmail.com	Deja	Chaney	\N	NY	52 Woodside Ave. 	11432
273	Ozone Park	queenie.vance@gmail.com	Queenie	Vance	\N	NY	172 Arcadia Ave. 	11417
274	Hopewell Junction	josh.shaw@gmail.com	Josh	Shaw	\N	NY	212 North Leeton Ridge Street 	12533
275	San Angelo	pinkie.kirkland@yahoo.com	Pinkie	Kirkland	\N	TX	18 Myers St. 	76901
276	Ronkonkoma	lavette.wright@msn.com	Lavette	Wright	\N	NY	6 Windsor Street 	11779
277	Monroe	mark.garrett@msn.com	Mark	Garrett	\N	NY	285 Rosewood Dr. 	10950
278	Campbell	myesha.burgess@gmail.com	Myesha	Burgess	\N	CA	306 Trenton Rd. 	95008
279	South El Monte	justina.long@aol.com	Justina	Long	\N	CA	39 Littleton Ave. 	91733
280	San Angelo	brenda.tate@msn.com	Brenda	Tate	\N	TX	36 Hilltop Street 	76901
281	Ozone Park	rayna.perry@hotmail.com	Rayna	Perry	\N	NY	7238 Oakland St. 	11417
282	San Lorenzo	randolph.chase@yahoo.com	Randolph	Chase	\N	CA	828 Bridle Ave. 	94580
283	Poughkeepsie	jaimee.day@aol.com	Jaimee	Day	\N	NY	7534 Whitemarsh Ave. 	12601
284	Commack	susann.bass@msn.com	Susann	Bass	\N	NY	21 Old Rock Maple Ave. 	11725
285	Astoria	leola.gould@gmail.com	Leola	Gould	\N	NY	8 Kirkland St. 	11102
286	Levittown	virgil.frost@gmail.com	Virgil	Frost	\N	NY	9798 Beacon St. 	11756
287	Oxnard	mireille.puckett@hotmail.com	Mireille	Puckett	(805) 961-9909	CA	378 Purple Finch Drive 	93035
288	Banning	keturah.massey@msn.com	Keturah	Massey	\N	CA	189 Arnold Drive 	92220
289	Richardson	charmain.webster@hotmail.com	Charmain	Webster	\N	TX	36 East Stonybrook Rd. 	75080
290	Centereach	barry.buckner@gmail.com	Barry	Buckner	\N	NY	8779 High Noon Rd. 	11720
291	Sunnyside	boyce.burks@gmail.com	Boyce	Burks	\N	NY	879 Harvey Dr. 	11104
292	Hempstead	monty.frost@aol.com	Monty	Frost	(516) 460-5396	NY	76 Foxrun Dr. 	11550
293	Plainview	tiny.french@hotmail.com	Tiny	French	\N	NY	7163 Hall St. 	11803
294	Rome	clementina.sargent@hotmail.com	Clementina	Sargent	\N	NY	9853 Catherine Road 	13440
295	South Ozone Park	danny.kim@msn.com	Danny	Kim	\N	NY	74 Essex Drive 	11420
296	Uniondale	sophia.mcmillan@msn.com	Sophia	Mcmillan	\N	NY	8541 S. Pleasant Street 	11553
297	Helotes	christia.carson@gmail.com	Christia	Carson	\N	TX	220 Orchard Street 	78023
298	Upland	jennie.middleton@gmail.com	Jennie	Middleton	\N	CA	95 High Noon Dr. 	91784
299	Bay Shore	jame.riggs@hotmail.com	Jame	Riggs	\N	NY	9237 Hudson Drive 	11706
300	Mountain View	rayford.simon@msn.com	Rayford	Simon	\N	CA	998 Whitemarsh Road 	94043
301	Scarsdale	annett.garrett@yahoo.com	Annett	Garrett	\N	NY	19 Euclid Lane 	10583
302	Apple Valley	hayden.cross@gmail.com	Hayden	Cross	\N	CA	90 Pumpkin Hill St. 	92307
303	Woodhaven	rolanda.larsen@yahoo.com	Rolanda	Larsen	\N	NY	5 West University Court 	11421
304	Springfield Gardens	jayme.zamora@gmail.com	Jayme	Zamora	\N	NY	2 Ridge Lane 	11413
305	Redondo Beach	hope.cotton@aol.com	Hope	Cotton	\N	CA	9092 Blue Spring Dr. 	90278
306	Kingston	vikki.erickson@yahoo.com	Vikki	Erickson	\N	NY	24 Jones Street 	12401
307	Glendora	fransisca.nicholson@aol.com	Fransisca	Nicholson	\N	CA	945 Schoolhouse Street 	91740
308	Webster	mazie.fernandez@hotmail.com	Mazie	Fernandez	\N	NY	583 Harvard Ave. 	14580
309	Canandaigua	anderson.martin@hotmail.com	Anderson	Martin	\N	NY	9051 Hillside Dr. 	14424
310	Middle Village	gilberto.parsons@gmail.com	Gilberto	Parsons	\N	NY	8115 North Edgewater Drive 	11379
311	Fresno	charise.burt@aol.com	Charise	Burt	(559) 888-2229	CA	582 Creek St. 	93706
312	Longview	cameron.carroll@yahoo.com	Cameron	Carroll	\N	TX	9133 South Halifax Ave. 	75604
313	Maspeth	melani.jarvis@hotmail.com	Melani	Jarvis	\N	NY	8 Tunnel St. 	11378
314	Rowlett	javier.nichols@msn.com	Javier	Nichols	\N	TX	8944 Marconi St. 	75088
315	Baldwin	justina.jenkins@yahoo.com	Justina	Jenkins	\N	NY	8236 Creek St. 	11510
316	Euless	hortencia.graham@aol.com	Hortencia	Graham	\N	TX	7764 Greenrose Street 	76039
317	Woodside	christia.wilkins@msn.com	Christia	Wilkins	\N	NY	7062 Willow Court 	11377
318	Fullerton	eliz.whitney@msn.com	Eliz	Whitney	\N	CA	523 Crescent Court 	92831
319	Apple Valley	justin.newton@hotmail.com	Justin	Newton	\N	CA	93 Shore Rd. 	92307
320	Oceanside	aron.wiggins@aol.com	Aron	Wiggins	(442) 497-3353	NY	6 Bradford St. 	11572
321	Brooklyn	chere.hardin@yahoo.com	Chere	Hardin	\N	NY	763 Fulton Road 	11201
322	Poughkeepsie	merideth.preston@yahoo.com	Merideth	Preston	\N	NY	794 Rockaway St. 	12601
323	Schenectady	jeniffer.slater@aol.com	Jeniffer	Slater	\N	NY	30 Old Orange Lane 	12302
324	Bellmore	laureen.paul@yahoo.com	Laureen	Paul	\N	NY	617 Squaw Creek Rd. 	11710
325	Bronx	berna.moore@hotmail.com	Berna	Moore	\N	NY	7230 Lafayette Drive 	10451
326	Rocklin	shiela.calderon@msn.com	Shiela	Calderon	\N	CA	844 Albany St. 	95677
327	New York	sharie.alvarez@msn.com	Sharie	Alvarez	(212) 211-7621	NY	987 West Leatherwood Dr. 	10002
328	Euless	bettie.glover@gmail.com	Bettie	Glover	\N	TX	9083 Addison Dr. 	76039
329	Port Chester	marilyn.frank@aol.com	Marilyn	Frank	\N	NY	8878 Branch Street 	10573
330	Woodside	sheba.knapp@aol.com	Sheba	Knapp	\N	NY	86 Gates Street 	11377
331	Bay Shore	aleta.mack@yahoo.com	Aleta	Mack	\N	NY	8869 W. Edgemont Lane 	11706
332	Canyon Country	reena.higgins@gmail.com	Reena	Higgins	\N	CA	900 South Columbia Street 	91387
333	Sunnyside	ami.mcmahon@aol.com	Ami	Mcmahon	\N	NY	566 Hilldale Drive 	11104
334	Huntington Station	somer.jordan@msn.com	Somer	Jordan	\N	NY	7046 Helen Avenue 	11746
335	Bronx	scarlet.reed@hotmail.com	Scarlet	Reed	\N	NY	151 S. Myers Court 	10451
336	Lancaster	trisha.johnson@msn.com	Trisha	Johnson	(717) 126-8787	NY	59 Wild Horse St. 	14086
337	South Ozone Park	majorie.wyatt@yahoo.com	Majorie	Wyatt	\N	NY	8507 Miller St. 	11420
338	Forest Hills	abbey.pugh@gmail.com	Abbey	Pugh	\N	NY	26 Market Drive 	11375
339	Central Islip	tamela.harrell@aol.com	Tamela	Harrell	\N	NY	7316 Cypress Rd. 	11722
340	Smithtown	yanira.bradshaw@gmail.com	Yanira	Bradshaw	\N	NY	7484 Ann Court 	11787
341	Mount Vernon	delana.scott@yahoo.com	Delana	Scott	\N	NY	7372 Ridgeview St. 	10550
342	Merrick	cassondra.pruitt@aol.com	Cassondra	Pruitt	\N	NY	4 Alderwood Circle 	11566
343	Commack	jesica.fields@yahoo.com	Jesica	Fields	\N	NY	318 Country Dr. 	11725
344	Mountain View	herta.rollins@msn.com	Herta	Rollins	\N	CA	287 1st Drive 	94043
345	Albany	mi.gray@aol.com	Mi	Gray	(229) 813-2130	NY	27 Roehampton Dr. 	12203
346	Maspeth	jacalyn.barnett@gmail.com	Jacalyn	Barnett	\N	NY	7537 Swanson Street 	11378
347	Oakland	kanesha.hudson@gmail.com	Kanesha	Hudson	(510) 788-7298	CA	8293 Gartner Drive 	94603
348	Coachella	darren.witt@aol.com	Darren	Witt	\N	CA	916 Hillcrest Ave. 	92236
349	Coachella	mable.pratt@gmail.com	Mable	Pratt	\N	CA	254 SW. Temple Street 	92236
350	Bay Shore	christoper.mccall@msn.com	Christoper	Mccall	\N	NY	72 Summit St. 	11706
351	Monsey	margorie.wynn@gmail.com	Margorie	Wynn	\N	NY	707 Schoolhouse St. 	10952
352	Jamaica	josef.greer@gmail.com	Josef	Greer	\N	NY	92 Summer Court 	11432
353	Monsey	tisa.whitney@yahoo.com	Tisa	Whitney	\N	NY	549 Newbridge Dr. 	10952
354	Sunnyside	tonda.armstrong@aol.com	Tonda	Armstrong	\N	NY	19 Forest Rd. 	11104
355	Bay Shore	arvilla.weiss@msn.com	Arvilla	Weiss	\N	NY	477 Blue Spring St. 	11706
356	Bronx	vashti.rosario@yahoo.com	Vashti	Rosario	\N	NY	623 Johnson Circle 	10451
357	San Jose	sheri.cole@aol.com	Sheri	Cole	(408) 658-2285	CA	479 Chapel Court 	95127
358	Wantagh	kandace.giles@msn.com	Kandace	Giles	\N	NY	30 NE. Walt Whitman Drive 	11793
359	Pomona	angie.powers@aol.com	Angie	Powers	\N	CA	6 Rockland Dr. 	91768
360	Houston	van.peters@yahoo.com	Van	Peters	(281) 658-7772	TX	45 Fifth Dr. 	77016
361	Valley Stream	virgina.berg@yahoo.com	Virgina	Berg	\N	NY	804 South Purple Finch Drive 	11580
362	Kingston	olevia.noel@yahoo.com	Olevia	Noel	\N	NY	39 N. Rosewood Dr. 	12401
363	Ballston Spa	kaci.gallegos@gmail.com	Kaci	Gallegos	\N	NY	8573 Halifax St. 	12020
364	Ithaca	bev.chang@yahoo.com	Bev	Chang	\N	NY	104 Rockville St. 	14850
365	Bayside	rodger.rojas@yahoo.com	Rodger	Rojas	\N	NY	8442 Cooper Ave. 	11361
366	Floral Park	lavonne.anderson@aol.com	Lavonne	Anderson	\N	NY	9420 Wintergreen Court 	11001
367	Ozone Park	blanca.hooper@msn.com	Blanca	Hooper	\N	NY	340 Bald Hill St. 	11417
368	Forest Hills	alysha.powers@msn.com	Alysha	Powers	\N	NY	39 West Marshall Ave. 	11375
369	Woodside	mary.singleton@hotmail.com	Mary	Singleton	\N	NY	474 Amerige Ave. 	11377
370	Howard Beach	jina.cooper@aol.com	Jina	Cooper	\N	NY	8947 W. Lexington Rd. 	11414
371	Rosedale	loni.duncan@gmail.com	Loni	Duncan	\N	NY	80 Saxton Lane 	11422
372	Wappingers Falls	collene.roman@aol.com	Collene	Roman	\N	NY	30 North Argyle Dr. 	12590
373	Utica	mariette.trevino@aol.com	Mariette	Trevino	\N	NY	4 Border Court 	13501
374	Merrick	candelaria.coffey@aol.com	Candelaria	Coffey	\N	NY	45 Newport Lane 	11566
375	Uniondale	yan.trevino@gmail.com	Yan	Trevino	\N	NY	796 Jefferson Rd. 	11553
376	Victoria	elanor.patrick@aol.com	Elanor	Patrick	\N	TX	51 Howard Ave. 	77904
377	Port Chester	klara.mosley@gmail.com	Klara	Mosley	\N	NY	518 Devon Court 	10573
378	Mount Vernon	rosalba.o'neal@yahoo.com	Rosalba	O'neal	\N	NY	7517 Pennsylvania St. 	10550
379	Uniondale	mina.carrillo@aol.com	Mina	Carrillo	\N	NY	8659 Trenton Lane 	11553
380	Selden	alesia.horne@aol.com	Alesia	Horne	\N	NY	9229 Amherst Lane 	11784
381	Bronx	kristen.alvarez@aol.com	Kristen	Alvarez	\N	NY	9778 North River St. 	10451
382	Howard Beach	collin.webster@aol.com	Collin	Webster	\N	NY	475 Cottage Rd. 	11414
383	Whitestone	ashlee.pena@aol.com	Ashlee	Pena	\N	NY	966 Highland St. 	11357
384	Flushing	aimee.merritt@yahoo.com	Aimee	Merritt	\N	NY	537 East Meadowbrook St. 	11354
385	Glendora	rochelle.ward@yahoo.com	Rochelle	Ward	\N	CA	7855 La Sierra Street 	91740
386	Upland	nelle.beck@aol.com	Nelle	Beck	\N	CA	8998 Wakehurst Drive 	91784
387	Elmhurst	kaila.walters@msn.com	Kaila	Walters	\N	NY	57 Gates Drive 	11373
388	Whitestone	aleta.stone@aol.com	Aleta	Stone	\N	NY	8 Elm Dr. 	11357
389	San Angelo	leif.short@gmail.com	Leif	Short	\N	TX	962 Carpenter Ave. 	76901
390	Ronkonkoma	lorrie.pollard@yahoo.com	Lorrie	Pollard	\N	NY	7834 Shore Ave. 	11779
391	Los Banos	vernita.ball@gmail.com	Vernita	Ball	\N	CA	126 Arnold Dr. 	93635
392	Elmhurst	cyndi.bush@gmail.com	Cyndi	Bush	\N	NY	18 Smoky Hollow Drive 	11373
393	Upland	gertrude.terry@hotmail.com	Gertrude	Terry	\N	CA	34 Airport Dr. 	91784
394	South El Monte	virgen.clemons@gmail.com	Virgen	Clemons	\N	CA	354 Cactus Drive 	91733
395	Liverpool	fairy.robinson@msn.com	Fairy	Robinson	\N	NY	8837 Joy Ridge St. 	13090
396	Niagara Falls	laverna.hernandez@hotmail.com	Laverna	Hernandez	\N	NY	34 South Longfellow St. 	14304
397	Franklin Square	jeannie.wilcox@yahoo.com	Jeannie	Wilcox	\N	NY	7744 Miles Dr. 	11010
398	Sunnyside	suellen.mercado@yahoo.com	Suellen	Mercado	\N	NY	3 Taylor Drive 	11104
399	Kingston	bart.hess@aol.com	Bart	Hess	\N	NY	799 N. Maiden Street 	12401
400	Depew	alfredo.dodson@hotmail.com	Alfredo	Dodson	\N	NY	8960 Glenholme Dr. 	14043
401	Longview	shaunda.barnett@gmail.com	Shaunda	Barnett	\N	TX	9366 San Carlos Lane 	75604
402	Pittsford	kerrie.morton@hotmail.com	Kerrie	Morton	\N	NY	8772 State St. 	14534
403	Canyon Country	elouise.fry@aol.com	Elouise	Fry	\N	CA	49 Bohemia Street 	91387
404	Ballston Spa	augustus.steele@aol.com	Augustus	Steele	\N	NY	7474 N. Orchard St. 	12020
405	Commack	greta.page@hotmail.com	Greta	Page	\N	NY	8316 Augusta Drive 	11725
406	Shirley	kerrie.o'neill@gmail.com	Kerrie	O'neill	\N	NY	69 Wellington Ave. 	11967
407	San Pablo	dannette.guerrero@gmail.com	Dannette	Guerrero	\N	CA	68 Carriage Street 	94806
408	Central Islip	edra.fitzgerald@msn.com	Edra	Fitzgerald	\N	NY	8892 Birchwood St. 	11722
409	Carmel	jerome.bolton@msn.com	Jerome	Bolton	\N	NY	9921 Argyle Street 	10512
410	Bellmore	conception.slater@gmail.com	Conception	Slater	\N	NY	5 Sunset Street 	11710
411	New York	octavia.case@aol.com	Octavia	Case	(212) 171-1335	NY	40 Charles Road 	10002
412	Sunnyside	dexter.roberts@gmail.com	Dexter	Roberts	\N	NY	84 Thatcher Court 	11104
413	Baldwin	ginette.edwards@hotmail.com	Ginette	Edwards	\N	NY	9262 NW. Center Ave. 	11510
414	Ithaca	romaine.haley@aol.com	Romaine	Haley	\N	NY	737 Edgefield Drive 	14850
415	Harlingen	gwendolyn.miller@msn.com	Gwendolyn	Miller	\N	TX	90 Fordham Ave. 	78552
416	Hempstead	luke.fuller@hotmail.com	Luke	Fuller	(516) 363-2253	NY	576 Cleveland Lane 	11550
417	Huntington Station	zoraida.patton@aol.com	Zoraida	Patton	\N	NY	95 Grand Dr. 	11746
418	Oxnard	georgeanna.webster@msn.com	Georgeanna	Webster	(805) 885-8830	CA	40 Creekside Circle 	93035
419	Poughkeepsie	krystin.marshall@hotmail.com	Krystin	Marshall	\N	NY	10 Old Proctor Lane 	12601
420	Merrick	vince.schneider@hotmail.com	Vince	Schneider	\N	NY	473 Corona Ave. 	11566
421	Monroe	iola.rasmussen@yahoo.com	Iola	Rasmussen	\N	NY	283 N. Manor Station Dr. 	10950
422	Victoria	valery.saunders@msn.com	Valery	Saunders	\N	TX	42 Marlborough St. 	77904
423	Deer Park	johna.powers@hotmail.com	Johna	Powers	\N	NY	379 Central Ave. 	11729
424	Utica	charleen.hurst@yahoo.com	Charleen	Hurst	\N	NY	87 Country Avenue 	13501
425	Mount Vernon	augustina.joyner@aol.com	Augustina	Joyner	\N	NY	7931 Honey Creek Court 	10550
426	Pomona	daisy.ward@msn.com	Daisy	Ward	\N	CA	45 Silver Spear Ave. 	91768
427	Garland	latonya.dixon@hotmail.com	Latonya	Dixon	\N	TX	9399 Evergreen Street 	75043
428	New Rochelle	hipolito.padilla@hotmail.com	Hipolito	Padilla	\N	NY	311 E. Rose Avenue 	10801
429	Valley Stream	emmett.casey@yahoo.com	Emmett	Casey	\N	NY	893 Logan St. 	11580
430	Massapequa Park	kandi.mcneil@msn.com	Kandi	Mcneil	\N	NY	402 Border Street 	11762
431	Bellmore	luciano.marsh@aol.com	Luciano	Marsh	\N	NY	7685 South Willow Drive 	11710
432	East Meadow	julius.holt@aol.com	Julius	Holt	\N	NY	386 Lower River Street 	11554
433	Longview	holly.nieves@aol.com	Holly	Nieves	\N	TX	60 Cleveland St. 	75604
434	Duarte	douglass.little@hotmail.com	Douglass	Little	\N	CA	294 Harvey Drive 	91010
435	Woodhaven	izola.hobbs@gmail.com	Izola	Hobbs	\N	NY	685 Beacon Dr. 	11421
436	Bayside	honey.camacho@gmail.com	Honey	Camacho	\N	NY	934 2nd St. 	11361
437	Orchard Park	laureen.barry@yahoo.com	Laureen	Barry	\N	NY	909 Ridge St. 	14127
438	Queensbury	katharine.herrera@hotmail.com	Katharine	Herrera	\N	NY	395 SE. Branch St. 	12804
439	Jamaica	sunshine.rosario@aol.com	Sunshine	Rosario	\N	NY	1 Chestnut Lane 	11432
440	Ballston Spa	yevette.todd@aol.com	Yevette	Todd	\N	NY	119 Lakewood Rd. 	12020
441	Port Washington	dorthea.walker@aol.com	Dorthea	Walker	\N	NY	11 Third St. 	11050
442	Yonkers	alane.munoz@gmail.com	Alane	Munoz	(914) 706-7576	NY	8 Strawberry Dr. 	10701
443	Oxnard	ayana.keith@hotmail.com	Ayana	Keith	(805) 230-2101	CA	182 Thorne Road 	93035
444	San Lorenzo	caridad.compton@aol.com	Caridad	Compton	\N	CA	9575 SW. Kingston Court 	94580
445	Mount Vernon	earline.ballard@hotmail.com	Earline	Ballard	\N	NY	939 Lyme Road 	10550
446	Amsterdam	nathanael.bradley@aol.com	Nathanael	Bradley	\N	NY	58 Third St. 	12010
447	Vista	chasidy.tran@msn.com	Chasidy	Tran	\N	CA	9286 Anderson Street 	92083
448	Rochester	janella.bright@aol.com	Janella	Bright	(507) 616-2958	NY	7317 Tower Dr. 	14606
449	Canyon Country	josie.schultz@hotmail.com	Josie	Schultz	\N	CA	225 Mammoth Street 	91387
450	Carmel	ellsworth.michael@yahoo.com	Ellsworth	Michael	\N	NY	9982 White St. 	10512
451	Rowlett	jennette.wooten@msn.com	Jennette	Wooten	\N	TX	8221 Bow Ridge Lane 	75088
452	Hicksville	cassandra.nichols@yahoo.com	Cassandra	Nichols	\N	NY	4 Glenwood Circle 	11801
453	Garden City	courtney.wyatt@gmail.com	Courtney	Wyatt	\N	NY	369 Arrowhead St. 	11530
454	Bay Shore	terese.palmer@hotmail.com	Terese	Palmer	\N	NY	8 Sugar Drive 	11706
455	Liverpool	sherita.cherry@gmail.com	Sherita	Cherry	\N	NY	9636 Old Cedarwood Street 	13090
456	Jamaica	serina.hensley@yahoo.com	Serina	Hensley	\N	NY	53 Proctor Drive 	11432
457	Richmond Hill	jeni.farley@aol.com	Jeni	Farley	\N	NY	4 Mill Lane 	11418
458	Holbrook	everett.vega@yahoo.com	Everett	Vega	\N	NY	7859 James Ave. 	11741
459	Bakersfield	latosha.dalton@yahoo.com	Latosha	Dalton	(661) 529-4501	CA	59 E. Wintergreen Ave. 	93306
460	Garden City	romelia.myers@msn.com	Romelia	Myers	\N	NY	8630 Brook St. 	11530
461	Brentwood	effie.jenkins@msn.com	Effie	Jenkins	(631) 477-1277	NY	75 South Glen Eagles Court 	11717
462	Nanuet	efren.oliver@gmail.com	Efren	Oliver	\N	NY	9343 1st Rd. 	10954
463	Plainview	jerlene.rios@yahoo.com	Jerlene	Rios	\N	NY	32 Griffin St. 	11803
464	Garden City	bess.mcbride@yahoo.com	Bess	Mcbride	\N	NY	9832 Winchester St. 	11530
465	Troy	birdie.kramer@hotmail.com	Birdie	Kramer	(248) 725-2174	NY	311 Newcastle Dr. 	12180
466	Smithtown	collen.hayes@yahoo.com	Collen	Hayes	\N	NY	117 Eagle St. 	11787
467	Mahopac	clare.neal@msn.com	Clare	Neal	\N	NY	8922 Shady Ave. 	10541
468	Lindenhurst	jeanett.herman@hotmail.com	Jeanett	Herman	\N	NY	839 East Arch Street 	11757
469	Richmond Hill	micki.rutledge@aol.com	Micki	Rutledge	\N	NY	9868 Marvon Street 	11418
470	Shirley	loise.walker@aol.com	Loise	Walker	\N	NY	201 Glen Eagles St. 	11967
471	Freeport	burma.summers@yahoo.com	Burma	Summers	\N	NY	890 East Elmwood Street 	11520
472	Amityville	myron.ruiz@gmail.com	Myron	Ruiz	\N	NY	45 Shadow Brook Lane 	11701
473	Baldwin	lashawna.richardson@hotmail.com	Lashawna	Richardson	\N	NY	9920 Purple Finch St. 	11510
474	Webster	lavern.orr@hotmail.com	Lavern	Orr	\N	NY	913 N. Young Street 	14580
475	Victoria	alec.peck@hotmail.com	Alec	Peck	\N	TX	4 W. Belmont St. 	77904
476	Santa Cruz	christopher.richardson@gmail.com	Christopher	Richardson	\N	CA	7846 Windfall Dr. 	95060
477	Bellmore	arminda.weber@yahoo.com	Arminda	Weber	\N	NY	6 Hill Field St. 	11710
478	Freeport	emmett.hahn@hotmail.com	Emmett	Hahn	\N	NY	7727 6th St. 	11520
479	Flushing	gertha.mejia@yahoo.com	Gertha	Mejia	\N	NY	518 Orchard St. 	11354
480	Amsterdam	garland.weaver@gmail.com	Garland	Weaver	\N	NY	7161 Goldfield Court 	12010
481	Lake Jackson	jayson.rutledge@yahoo.com	Jayson	Rutledge	\N	TX	8672 Coffee St. 	77566
482	Amarillo	narcisa.knapp@aol.com	Narcisa	Knapp	\N	TX	435 Dogwood Dr. 	79106
483	Lindenhurst	gayla.sims@gmail.com	Gayla	Sims	\N	NY	98 Hall Street 	11757
484	Euless	chelsey.boyd@yahoo.com	Chelsey	Boyd	\N	TX	9569 Birchpond Ave. 	76039
485	East Elmhurst	catherine.miles@msn.com	Catherine	Miles	\N	NY	7189 Elm Dr. 	11369
486	East Meadow	valeri.marshall@hotmail.com	Valeri	Marshall	\N	NY	494 East Brewery Dr. 	11554
487	San Pablo	grace.madden@gmail.com	Grace	Madden	\N	CA	606 East Rocky River St. 	94806
488	Anaheim	joaquin.hawkins@aol.com	Joaquin	Hawkins	(657) 557-1746	CA	3 Oklahoma Lane 	92806
489	Saratoga Springs	kirstie.vazquez@gmail.com	Kirstie	Vazquez	\N	NY	8006 Rockland Ave. 	12866
490	Ossining	yu.mcdonald@aol.com	Yu	Mcdonald	\N	NY	784 Pheasant Rd. 	10562
491	Massapequa	celestine.jacobs@gmail.com	Celestine	Jacobs	\N	NY	87 Hanover Rd. 	11758
492	Corona	justa.thompson@aol.com	Justa	Thompson	\N	NY	43 Manor Ave. 	11368
493	Hamburg	lise.alvarado@gmail.com	Lise	Alvarado	\N	NY	9816 Newcastle Dr. 	14075
494	Uniondale	pearl.fox@yahoo.com	Pearl	Fox	\N	NY	9415 Honey Creek Dr. 	11553
495	Los Banos	travis.goodman@yahoo.com	Travis	Goodman	\N	CA	65 Rockcrest Dr. 	93635
496	Astoria	shu.mays@gmail.com	Shu	Mays	\N	NY	996 St Margarets Lane 	11102
497	Nanuet	ezra.fowler@hotmail.com	Ezra	Fowler	\N	NY	16 Pearl St. 	10954
498	North Tonawanda	edda.young@gmail.com	Edda	Young	\N	NY	50 S. Airport Street 	14120
499	Baldwinsville	lidia.ashley@hotmail.com	Lidia	Ashley	\N	NY	8436 Meadow St. 	13027
500	Jackson Heights	moira.lester@msn.com	Moira	Lester	\N	NY	496 Greystone Court 	11372
501	Anaheim	tony.hicks@gmail.com	Tony	Hicks	(657) 260-6783	CA	226 Carriage Street 	92806
502	Whitestone	malinda.baxter@yahoo.com	Malinda	Baxter	\N	NY	7698 Briarwood Ave. 	11357
503	Niagara Falls	marlo.jefferson@gmail.com	Marlo	Jefferson	\N	NY	39 Trenton Rd. 	14304
504	Franklin Square	tiana.henderson@aol.com	Tiana	Henderson	\N	NY	62 Orange St. 	11010
505	Jamaica	wilda.petersen@aol.com	Wilda	Petersen	\N	NY	899 Helen St. 	11432
506	Torrance	irving.pitts@msn.com	Irving	Pitts	\N	CA	346 College Court 	90505
507	Staten Island	sheree.pena@yahoo.com	Sheree	Pena	\N	NY	822 Virginia Court 	10301
508	Lancaster	vance.taylor@msn.com	Vance	Taylor	(717) 218-5607	NY	8279 Military Dr. 	14086
509	Amsterdam	terra.pickett@aol.com	Terra	Pickett	\N	NY	7822 Depot Avenue 	12010
510	South Richmond Hill	faustino.delacruz@msn.com	Faustino	Delacruz	\N	NY	88 West Greenview Street 	11419
511	Fort Worth	julienne.moody@hotmail.com	Julienne	Moody	(682) 841-4643	TX	35 South Oxford Rd. 	76110
512	Selden	hee.greer@hotmail.com	Hee	Greer	\N	NY	41 North Garfield Ave. 	11784
513	Hamburg	whitney.cash@gmail.com	Whitney	Cash	\N	NY	8 Surrey Street 	14075
514	Hollis	clarita.curry@hotmail.com	Clarita	Curry	\N	NY	661 Tanglewood Street 	11423
515	Scarsdale	reita.dickson@hotmail.com	Reita	Dickson	\N	NY	7506 Mechanic Dr. 	10583
516	Brooklyn	rosa.kinney@yahoo.com	Rosa	Kinney	\N	NY	330 Highland Drive 	11201
517	Bellmore	buford.gilbert@yahoo.com	Buford	Gilbert	\N	NY	9 East Ketch Harbour Street 	11710
518	Palos Verdes Peninsula	homer.powers@msn.com	Homer	Powers	\N	CA	8207 East El Dorado Ave. 	90274
519	Palos Verdes Peninsula	rudolf.gilliam@aol.com	Rudolf	Gilliam	\N	CA	17 Marlborough Circle 	90274
520	Mount Vernon	andreas.herman@msn.com	Andreas	Herman	\N	NY	456 Rock Creek Street 	10550
521	Glen Cove	max.charles@gmail.com	Max	Charles	\N	NY	695 St Paul Street 	11542
522	Oakland	tammera.fischer@hotmail.com	Tammera	Fischer	(510) 534-8845	CA	405 Olive St. 	94603
523	Patchogue	joshua.robertson@gmail.com	Joshua	Robertson	\N	NY	81 Campfire Court 	11772
524	Utica	larraine.horn@msn.com	Larraine	Horn	\N	NY	368 South Summerhouse Dr. 	13501
525	New Rochelle	andreas.mayer@hotmail.com	Andreas	Mayer	\N	NY	8577 Galvin Circle 	10801
526	Sugar Land	lazaro.moran@gmail.com	Lazaro	Moran	\N	TX	83 E. Buttonwood Street 	77478
527	Coram	afton.juarez@gmail.com	Afton	Juarez	\N	NY	8330 Riverview Drive 	11727
528	New City	angele.schroeder@yahoo.com	Angele	Schroeder	(845) 804-6312	NY	33 S. Shadow Brook Street 	10956
529	Santa Monica	ellena.clements@aol.com	Ellena	Clements	\N	CA	7918 Mulberry Street 	90403
530	Duarte	selene.austin@msn.com	Selene	Austin	\N	CA	9042 Linda Circle 	91010
531	Troy	kimberely.bowen@hotmail.com	Kimberely	Bowen	(248) 199-2582	NY	88 Belmont Street 	12180
532	Coachella	mia.delgado@yahoo.com	Mia	Delgado	\N	CA	850 Wakehurst Drive 	92236
533	Corpus Christi	garret.clay@yahoo.com	Garret	Clay	(361) 687-9477	TX	9516 College Drive 	78418
534	Wantagh	alejandro.haney@msn.com	Alejandro	Haney	\N	NY	3 Griffin Street 	11793
535	Long Beach	inge.olsen@msn.com	Inge	Olsen	(562) 719-5041	NY	295 Iroquois Rd. 	11561
536	Orchard Park	christiane.bradford@gmail.com	Christiane	Bradford	\N	NY	9043 Woodland Ave. 	14127
537	Carmel	carter.bentley@yahoo.com	Carter	Bentley	\N	NY	145 North Bridle Ave. 	10512
538	South El Monte	sherie.ayala@msn.com	Sherie	Ayala	\N	CA	5 Beech Ave. 	91733
539	Ozone Park	jamika.acevedo@yahoo.com	Jamika	Acevedo	\N	NY	8027 NW. Poplar St. 	11417
540	Ontario	shery.randolph@hotmail.com	Shery	Randolph	\N	CA	602 Laurel Street 	91762
541	Coachella	lanita.burton@msn.com	Lanita	Burton	\N	CA	8980 Aspen Avenue 	92236
542	Ronkonkoma	timothy.byers@msn.com	Timothy	Byers	\N	NY	8645 Devonshire Lane 	11779
543	Helotes	jasmin.young@gmail.com	Jasmin	Young	\N	TX	337 Beach Street 	78023
544	West Islip	catarina.mendez@hotmail.com	Catarina	Mendez	\N	NY	444 Hanover Court 	11795
545	Oswego	tajuana.rollins@msn.com	Tajuana	Rollins	\N	NY	724 N. Glen Creek Street 	13126
546	Brentwood	thad.castro@msn.com	Thad	Castro	(631) 943-1407	NY	71 Surrey Ave. 	11717
547	Newburgh	tena.huber@gmail.com	Tena	Huber	\N	NY	185 East Littleton St. 	12550
548	Kingston	dori.alvarez@msn.com	Dori	Alvarez	\N	NY	8208 Brandywine St. 	12401
549	Long Beach	elmo.arnold@aol.com	Elmo	Arnold	(562) 841-9339	NY	7616 Lyme Rd. 	11561
550	Lockport	felicidad.golden@yahoo.com	Felicidad	Golden	\N	NY	9712 Coffee Ave. 	14094
551	Fort Worth	jenine.crane@msn.com	Jenine	Crane	(682) 183-6555	TX	7381 Alderwood Drive 	76110
552	Banning	lea.key@yahoo.com	Lea	Key	\N	CA	7 Ocean St. 	92220
553	Rocklin	rory.cooper@gmail.com	Rory	Cooper	\N	CA	459 West Street 	95677
554	Campbell	hilde.nieves@gmail.com	Hilde	Nieves	\N	CA	9437 Fordham Lane 	95008
555	Forney	marry.benjamin@yahoo.com	Marry	Benjamin	\N	TX	33 Amerige Street 	75126
556	Monroe	vernell.goff@msn.com	Vernell	Goff	\N	NY	77 Cobblestone St. 	10950
557	Mount Vernon	erlene.cook@gmail.com	Erlene	Cook	\N	NY	89 Blue Spring Street 	10550
558	Monroe	carroll.kelly@yahoo.com	Carroll	Kelly	\N	NY	346 Grant Circle 	10950
559	Brentwood	basilia.thornton@hotmail.com	Basilia	Thornton	(631) 592-9548	NY	9033 Pine Dr. 	11717
560	Forney	tricia.daniels@gmail.com	Tricia	Daniels	\N	TX	8628 Crescent Court 	75126
561	San Lorenzo	kandace.hughes@hotmail.com	Kandace	Hughes	\N	CA	482 Ryan Ave. 	94580
562	Upland	alejandro.norman@yahoo.com	Alejandro	Norman	\N	CA	8918 Marsh Lane 	91784
563	Richmond Hill	rodney.odom@yahoo.com	Rodney	Odom	\N	NY	7782 North Deerfield Lane 	11418
564	Farmingdale	bettie.pierce@gmail.com	Bettie	Pierce	\N	NY	787 North Vernon Lane 	11735
565	San Angelo	dagny.owen@hotmail.com	Dagny	Owen	\N	TX	8028 Thompson Drive 	76901
566	Lake Jackson	cinthia.poole@aol.com	Cinthia	Poole	\N	TX	7 Central Ave. 	77566
567	Longview	sheila.travis@yahoo.com	Sheila	Travis	\N	TX	9285 Front St. 	75604
568	West Islip	arcelia.vinson@gmail.com	Arcelia	Vinson	\N	NY	40 Dogwood St. 	11795
569	Santa Monica	lucas.estes@yahoo.com	Lucas	Estes	\N	CA	99 Old Church St. 	90403
570	Saint Albans	marissa.summers@msn.com	Marissa	Summers	\N	NY	81 Carpenter St. 	11412
571	Palos Verdes Peninsula	kaley.blanchard@msn.com	Kaley	Blanchard	\N	CA	74 Evergreen Court 	90274
572	Auburn	wm.pope@msn.com	Wm	Pope	\N	NY	212 Marsh Court 	13021
573	Troy	rubye.mccall@hotmail.com	Rubye	Mccall	(248) 764-3359	NY	71 Sherwood Dr. 	12180
574	Encino	adriene.rivera@hotmail.com	Adriene	Rivera	\N	CA	973 Yukon Avenue 	91316
575	Jamaica	laurence.christian@gmail.com	Laurence	Christian	\N	NY	2 Maple St. 	11432
576	El Paso	shirely.stanley@gmail.com	Shirely	Stanley	(915) 437-6113	TX	73 White Avenue 	79930
577	Rocklin	danille.mcfarland@msn.com	Danille	Mcfarland	\N	CA	14 Tailwater St. 	95677
578	San Lorenzo	salena.day@msn.com	Salena	Day	\N	CA	8067 Park Court 	94580
579	Harlingen	matilda.larson@hotmail.com	Matilda	Larson	\N	TX	336 Saxon Court 	78552
580	Los Angeles	mellisa.kim@aol.com	Mellisa	Kim	(424) 151-6481	CA	17 Lyme Dr. 	90008
581	Santa Clara	vonda.berger@yahoo.com	Vonda	Berger	\N	CA	615 S. Proctor Ave. 	95050
582	Jackson Heights	soledad.moses@yahoo.com	Soledad	Moses	\N	NY	85 Hickory Ave. 	11372
583	Long Beach	lashandra.turner@hotmail.com	Lashandra	Turner	(562) 327-9469	NY	11 Marlborough Rd. 	11561
584	El Paso	lynne.anderson@msn.com	Lynne	Anderson	(915) 789-6666	TX	325 Inverness St. 	79930
585	Rocklin	chasidy.webster@msn.com	Chasidy	Webster	\N	CA	8296 S. Lookout Lane 	95677
586	Monsey	ulysses.gaines@aol.com	Ulysses	Gaines	\N	NY	22 Gregory Lane 	10952
587	Carmel	euna.lopez@gmail.com	Euna	Lopez	\N	NY	7979 South Mountainview Ave. 	10512
588	Valley Stream	cherelle.key@msn.com	Cherelle	Key	\N	NY	7739 Snake Hill Lane 	11580
589	Pleasanton	jeffry.church@msn.com	Jeffry	Church	\N	CA	426 Grandrose Ave. 	94566
590	Baldwin	cyndi.dyer@msn.com	Cyndi	Dyer	\N	NY	313 West Argyle Ave. 	11510
591	Hicksville	danilo.holmes@gmail.com	Danilo	Holmes	\N	NY	657 Manor Station Dr. 	11801
592	Centereach	joni.lee@gmail.com	Joni	Lee	\N	NY	8573 Proctor Street 	11720
593	Smithtown	antony.atkinson@msn.com	Antony	Atkinson	\N	NY	680 East Birchwood Lane 	11787
594	Lindenhurst	deanne.parsons@aol.com	Deanne	Parsons	\N	NY	76 Amherst Drive 	11757
595	Ithaca	frederica.rojas@yahoo.com	Frederica	Rojas	\N	NY	7835 West Jockey Hollow Rd. 	14850
596	Hamburg	emelda.dickerson@aol.com	Emelda	Dickerson	\N	NY	7457 6th St. 	14075
597	Maspeth	rudolf.moran@gmail.com	Rudolf	Moran	\N	NY	5 Birchwood Rd. 	11378
598	Depew	benito.hendrix@gmail.com	Benito	Hendrix	\N	NY	676 S. Bowman Lane 	14043
599	Amarillo	jonell.rivas@msn.com	Jonell	Rivas	\N	TX	8415 East High Point St. 	79106
600	San Diego	joi.reeves@msn.com	Joi	Reeves	(619) 952-9613	CA	9101 Williams Court 	92111
601	Encino	leland.mcdowell@gmail.com	Leland	Mcdowell	\N	CA	8034 E. Washington Lane 	91316
602	Amarillo	delaine.estes@yahoo.com	Delaine	Estes	\N	TX	8916 Hartford Rd. 	79106
603	New Hyde Park	genevieve.juarez@gmail.com	Genevieve	Juarez	\N	NY	93 Goldfield Drive 	11040
604	Amityville	kylee.dickson@gmail.com	Kylee	Dickson	\N	NY	7908 Sherwood Street 	11701
605	New Rochelle	renita.henry@msn.com	Renita	Henry	\N	NY	474 Woodland Ave. 	10801
606	Wappingers Falls	sarah.kirkland@aol.com	Sarah	Kirkland	\N	NY	42 N. Glendale Avenue 	12590
607	Vista	paul.lester@gmail.com	Paul	Lester	\N	CA	275 Clay St. 	92083
608	Shirley	taisha.vang@yahoo.com	Taisha	Vang	\N	NY	660 East Foster Lane 	11967
609	Woodhaven	eliana.reese@hotmail.com	Eliana	Reese	\N	NY	7079 NE. Cross Drive 	11421
610	Jackson Heights	leonore.dorsey@yahoo.com	Leonore	Dorsey	\N	NY	8213 South Branch Avenue 	11372
611	Levittown	ashleigh.frank@gmail.com	Ashleigh	Frank	\N	NY	9008 Plymouth Street 	11756
612	Ballston Spa	gabriel.wagner@msn.com	Gabriel	Wagner	\N	NY	7921 Manhattan Ave. 	12020
613	Wantagh	margene.eaton@yahoo.com	Margene	Eaton	\N	NY	43 Sugar Street 	11793
614	Amsterdam	toshia.cardenas@gmail.com	Toshia	Cardenas	\N	NY	878 Bayberry Street 	12010
615	Fresh Meadows	jamika.blanchard@gmail.com	Jamika	Blanchard	\N	NY	420 Cambridge Street 	11365
616	Saratoga Springs	shery.acosta@yahoo.com	Shery	Acosta	\N	NY	17 Canal Ave. 	12866
617	Yorktown Heights	jenna.saunders@aol.com	Jenna	Saunders	\N	NY	4 Young St. 	10598
618	Richmond Hill	skye.pope@yahoo.com	Skye	Pope	\N	NY	121 S. Bay Meadows Ave. 	11418
619	Anaheim	ana.palmer@yahoo.com	Ana	Palmer	(657) 323-8684	CA	7 Buckingham St. 	92806
620	Jamaica	eric.hardin@gmail.com	Eric	Hardin	\N	NY	39 S. Parker Drive 	11432
621	San Lorenzo	basil.ballard@yahoo.com	Basil	Ballard	\N	CA	7477 Belmont Ave. 	94580
622	Clifton Park	gabriel.pitts@gmail.com	Gabriel	Pitts	\N	NY	8462 Marshall Drive 	12065
623	Coram	cayla.johnson@msn.com	Cayla	Johnson	\N	NY	7091 Rockaway Avenue 	11727
624	Long Beach	sharika.colon@gmail.com	Sharika	Colon	(562) 452-6136	NY	509 Henry Smith St. 	11561
625	Webster	donnetta.henson@hotmail.com	Donnetta	Henson	\N	NY	2 Tallwood Drive 	14580
626	Schenectady	leigh.burke@hotmail.com	Leigh	Burke	\N	NY	7651 Creek St. 	12302
627	Duarte	deloris.larson@aol.com	Deloris	Larson	\N	CA	242 Branch Street 	91010
628	Lockport	ehtel.cobb@hotmail.com	Ehtel	Cobb	\N	NY	741 Rockville Drive 	14094
629	Buffalo	evelina.byrd@msn.com	Evelina	Byrd	(716) 601-7704	NY	628 S. Church St. 	14215
630	Amsterdam	zulema.browning@gmail.com	Zulema	Browning	\N	NY	12 NW. Lafayette St. 	12010
631	Ossining	tressa.weiss@msn.com	Tressa	Weiss	\N	NY	52 Wild Rose Avenue 	10562
632	Franklin Square	yvette.rogers@aol.com	Yvette	Rogers	\N	NY	3 SE. Oklahoma Drive 	11010
633	Anaheim	kiara.deleon@gmail.com	Kiara	Deleon	(657) 378-8011	CA	164 Addison Drive 	92806
634	Carmel	taylor.cole@gmail.com	Taylor	Cole	\N	NY	9408 Holly Lane 	10512
635	Merrick	myrtie.james@yahoo.com	Myrtie	James	\N	NY	566 North Livingston Ave. 	11566
636	Floral Park	ashton.lott@hotmail.com	Ashton	Lott	\N	NY	609 Windfall Lane 	11001
637	Ossining	kara.higgins@aol.com	Kara	Higgins	\N	NY	758 Jennings Street 	10562
638	Poughkeepsie	tomeka.higgins@msn.com	Tomeka	Higgins	\N	NY	591 W. Corona St. 	12601
639	Maspeth	ronald.parsons@msn.com	Ronald	Parsons	\N	NY	268 Pin Oak Rd. 	11378
640	New City	allison.nolan@gmail.com	Allison	Nolan	(845) 276-5729	NY	7421 Victoria St. 	10956
641	Glendora	derrick.marks@yahoo.com	Derrick	Marks	\N	CA	7247 East Prairie Lane 	91740
642	Webster	yang.roth@aol.com	Yang	Roth	\N	NY	234 E. Shub Farm Ave. 	14580
643	Floral Park	melba.wilkinson@gmail.com	Melba	Wilkinson	\N	NY	255 Harvard Dr. 	11001
644	Lindenhurst	valentin.mclaughlin@hotmail.com	Valentin	Mclaughlin	\N	NY	56 Squaw Creek Street 	11757
645	Brentwood	lewis.garner@gmail.com	Lewis	Garner	(631) 871-2512	NY	9550 East Greenrose St. 	11717
646	South El Monte	ann.heath@msn.com	Ann	Heath	\N	CA	413 East St. 	91733
647	Richmond Hill	janelle.maldonado@gmail.com	Janelle	Maldonado	\N	NY	34 Mammoth Street 	11418
648	San Pablo	catrice.hicks@yahoo.com	Catrice	Hicks	\N	CA	403 Inverness Street 	94806
649	Ronkonkoma	eli.contreras@hotmail.com	Eli	Contreras	\N	NY	35 Highland Ave. 	11779
650	Ossining	rita.bailey@hotmail.com	Rita	Bailey	\N	NY	69 Glenwood Street 	10562
651	Wappingers Falls	laure.pena@yahoo.com	Laure	Pena	\N	NY	9849 West Elmwood St. 	12590
652	Troy	tilda.melton@msn.com	Tilda	Melton	(248) 767-4165	NY	237 Elmwood Drive 	12180
653	Jamestown	florencio.davenport@yahoo.com	Florencio	Davenport	\N	NY	8759 Brookside Ave. 	14701
654	San Diego	eun.harris@gmail.com	Eun	Harris	(619) 378-2432	CA	623 Jones St. 	92111
655	Scarsdale	marylyn.browning@msn.com	Marylyn	Browning	\N	NY	915 Lakeshore Street 	10583
656	Floral Park	romana.barnes@yahoo.com	Romana	Barnes	\N	NY	9776 Shipley Rd. 	11001
657	Baldwin	sam.lester@gmail.com	Sam	Lester	\N	NY	563 South Beacon Lane 	11510
658	Monsey	nicki.larson@yahoo.com	Nicki	Larson	\N	NY	8317 West Leatherwood Dr. 	10952
659	Port Chester	antonetta.rocha@yahoo.com	Antonetta	Rocha	\N	NY	9858 Newcastle St. 	10573
660	Ridgecrest	shara.pope@msn.com	Shara	Pope	\N	CA	194 Amherst Dr. 	93555
661	Monroe	trena.hudson@hotmail.com	Trena	Hudson	\N	NY	135 Grand Ave. 	10950
662	Scarsdale	loraine.sykes@yahoo.com	Loraine	Sykes	\N	NY	9239 Windsor Ave. 	10583
663	New Windsor	alissa.hood@gmail.com	Alissa	Hood	\N	NY	8032 Maple Drive 	12553
664	Corona	augustus.schmidt@msn.com	Augustus	Schmidt	\N	NY	624 Jones Dr. 	11368
665	Oakland	stacie.sims@hotmail.com	Stacie	Sims	(510) 194-5117	CA	47 Orange Ave. 	94603
666	Floral Park	brittni.green@msn.com	Brittni	Green	\N	NY	842 El Dorado Lane 	11001
667	Richmond Hill	etsuko.garrison@yahoo.com	Etsuko	Garrison	\N	NY	1 Arrowhead Street 	11418
668	Lake Jackson	calandra.stanton@aol.com	Calandra	Stanton	\N	TX	36 Livingston Dr. 	77566
669	Harlingen	willis.randolph@yahoo.com	Willis	Randolph	\N	TX	332 Constitution St. 	78552
670	Liverpool	shawnda.glover@gmail.com	Shawnda	Glover	\N	NY	138 Belmont Ave. 	13090
671	Banning	jennette.baker@gmail.com	Jennette	Baker	\N	CA	798 Marvon St. 	92220
672	New Rochelle	elma.molina@msn.com	Elma	Molina	\N	NY	8565 Devon Ave. 	10801
673	Los Banos	adam.henderson@hotmail.com	Adam	Henderson	\N	CA	167 James St. 	93635
674	Saratoga Springs	ira.moore@gmail.com	Ira	Moore	\N	NY	1 Pineknoll Court 	12866
675	El Paso	kermit.bowman@gmail.com	Kermit	Bowman	(915) 996-5952	TX	3 Airport Street 	79930
676	Lindenhurst	gayle.wilkinson@yahoo.com	Gayle	Wilkinson	\N	NY	4 Riverside Ave. 	11757
677	Helotes	launa.hull@yahoo.com	Launa	Hull	\N	TX	936 Grove Street 	78023
678	Whitestone	myron.johns@msn.com	Myron	Johns	\N	NY	5 N. Woodsman Rd. 	11357
679	West Babylon	tuan.wolfe@aol.com	Tuan	Wolfe	\N	NY	7641 Oak Meadow Dr. 	11704
680	New City	mathilda.pennington@gmail.com	Mathilda	Pennington	(845) 407-9524	NY	14 S. Argyle Ave. 	10956
681	Holbrook	reatha.perez@aol.com	Reatha	Perez	\N	NY	9917 1st St. 	11741
682	Orchard Park	arnita.thomas@gmail.com	Arnita	Thomas	\N	NY	154 2nd St. 	14127
683	Merrick	amparo.burks@aol.com	Amparo	Burks	\N	NY	7781 Augusta St. 	11566
684	Niagara Falls	jenny.bell@hotmail.com	Jenny	Bell	\N	NY	38 Crescent St. 	14304
685	Forest Hills	laverne.craft@aol.com	Laverne	Craft	\N	NY	829 N. Pierce Street 	11375
686	Santa Clara	darcel.harmon@msn.com	Darcel	Harmon	\N	CA	966 Hickory Street 	95050
687	Desoto	cecilia.camacho@yahoo.com	Cecilia	Camacho	\N	TX	682 Mountainview Rd. 	75115
688	Campbell	pearlie.cochran@msn.com	Pearlie	Cochran	\N	CA	23 Homewood Rd. 	95008
689	Utica	deirdre.ryan@yahoo.com	Deirdre	Ryan	\N	NY	83 Jefferson Lane 	13501
690	Jackson Heights	yevette.elliott@aol.com	Yevette	Elliott	\N	NY	182 Euclid Street 	11372
691	Houston	ladawn.downs@yahoo.com	Ladawn	Downs	(281) 165-2090	TX	7452 S. Airport Court 	77016
692	Astoria	dorothea.chang@gmail.com	Dorothea	Chang	\N	NY	75 Oak Ave. 	11102
693	Hempstead	merlin.foreman@msn.com	Merlin	Foreman	(516) 150-1321	NY	8198 North Rockaway St. 	11550
694	North Tonawanda	lanie.dunn@gmail.com	Lanie	Dunn	\N	NY	7583 Pilgrim Ave. 	14120
695	Shirley	christoper.gould@aol.com	Christoper	Gould	\N	NY	8718 South Constitution St. 	11967
696	Encino	norine.huffman@aol.com	Norine	Huffman	\N	CA	363 Dunbar Drive 	91316
697	San Diego	alane.mccarty@hotmail.com	Alane	Mccarty	(619) 377-8586	CA	8254 Hilldale Street 	92111
698	Corona	charleen.joyner@aol.com	Charleen	Joyner	\N	NY	735 N. John Dr. 	11368
699	Rockville Centre	zella.fernandez@yahoo.com	Zella	Fernandez	\N	NY	8 Marshall Dr. 	11570
700	Corpus Christi	collene.knox@msn.com	Collene	Knox	(361) 760-1523	TX	7 North Branch Lane 	78418
701	Oxnard	alysia.nicholson@hotmail.com	Alysia	Nicholson	(805) 493-7311	CA	868 Trusel St. 	93035
702	Merrick	sharie.whitaker@hotmail.com	Sharie	Whitaker	\N	NY	7 Bayport Lane 	11566
703	Fullerton	diana.cobb@hotmail.com	Diana	Cobb	\N	CA	558 Vale St. 	92831
704	Bakersfield	morton.barron@msn.com	Morton	Barron	(661) 386-4884	CA	542 Circle Rd. 	93306
705	Huntington	camille.harvey@hotmail.com	Camille	Harvey	\N	NY	859 Beaver Ridge Ave. 	11743
706	Massapequa Park	lolita.o'neill@aol.com	Lolita	O'neill	\N	NY	36 Prairie Dr. 	11762
707	Woodside	terese.briggs@msn.com	Terese	Briggs	\N	NY	16 N. Oak Valley St. 	11377
708	Apple Valley	majorie.glover@msn.com	Majorie	Glover	\N	CA	4 Garden Ave. 	92307
709	Forest Hills	vinnie.chan@aol.com	Vinnie	Chan	\N	NY	8750 Surrey St. 	11375
710	New Windsor	ezra.silva@msn.com	Ezra	Silva	\N	NY	8629 Catherine Rd. 	12553
711	Staten Island	jovita.bishop@aol.com	Jovita	Bishop	\N	NY	8123 Wild Horse St. 	10301
712	Santa Cruz	kecia.olsen@msn.com	Kecia	Olsen	\N	CA	8389 Central St. 	95060
713	Port Jefferson Station	ilona.spears@gmail.com	Ilona	Spears	\N	NY	984 Canterbury Lane 	11776
714	Bronx	senaida.thompson@msn.com	Senaida	Thompson	\N	NY	578 Golf Drive 	10451
715	Sunnyside	larae.carney@msn.com	Larae	Carney	\N	NY	9322 Glen Ridge Dr. 	11104
716	Coram	sebrina.hart@yahoo.com	Sebrina	Hart	\N	NY	7679 Pacific St. 	11727
717	Plainview	kristofer.craig@yahoo.com	Kristofer	Craig	\N	NY	6 Delaware Lane 	11803
718	Selden	luciana.mcgee@msn.com	Luciana	Mcgee	\N	NY	8002 Cross St. 	11784
719	Endicott	nicki.fry@hotmail.com	Nicki	Fry	\N	NY	950 Snake Hill Lane 	13760
720	Rochester	devin.shaffer@gmail.com	Devin	Shaffer	(507) 557-2191	NY	382 Third Ave. 	14606
721	West Islip	erlinda.osborne@yahoo.com	Erlinda	Osborne	\N	NY	148 Elm St. 	11795
722	San Antonio	camila.carroll@yahoo.com	Camila	Carroll	(210) 436-8676	TX	72 Shub Farm Avenue 	78213
723	Wappingers Falls	vicki.wiggins@hotmail.com	Vicki	Wiggins	\N	NY	71 Broad Ave. 	12590
724	Ossining	lois.steele@yahoo.com	Lois	Steele	\N	NY	7501 South Marlborough Street 	10562
725	Rego Park	carola.mcpherson@hotmail.com	Carola	Mcpherson	\N	NY	578 Shirley Dr. 	11374
726	Port Jefferson Station	rochell.cantrell@yahoo.com	Rochell	Cantrell	\N	NY	437 Water Dr. 	11776
727	Scarsdale	kasha.sullivan@hotmail.com	Kasha	Sullivan	\N	NY	48 Foster Rd. 	10583
728	Orchard Park	viva.dawson@yahoo.com	Viva	Dawson	\N	NY	446 Princess Ave. 	14127
729	Apple Valley	hue.dalton@hotmail.com	Hue	Dalton	\N	CA	7940 Oakwood Street 	92307
730	Amarillo	andria.rivers@aol.com	Andria	Rivers	\N	TX	183 Ohio Ave. 	79106
731	Oxnard	hilary.savage@yahoo.com	Hilary	Savage	(805) 753-6881	CA	696 Howard Court 	93035
732	Utica	lavona.austin@yahoo.com	Lavona	Austin	\N	NY	926 South Euclid St. 	13501
733	Huntington	doreatha.ford@yahoo.com	Doreatha	Ford	\N	NY	9413 Ryan Ave. 	11743
734	Patchogue	alina.mcleod@msn.com	Alina	Mcleod	\N	NY	20 Winchester Street 	11772
735	Atwater	aide.franco@msn.com	Aide	Franco	\N	CA	8017 Lake Forest St. 	95301
736	Redondo Beach	genny.hensley@yahoo.com	Genny	Hensley	\N	CA	8849 Marconi Ave. 	90278
737	Auburn	melita.dominguez@msn.com	Melita	Dominguez	\N	NY	9903 Santa Clara Lane 	13021
738	Oxnard	fannie.jenkins@msn.com	Fannie	Jenkins	(805) 774-5696	CA	7858 E. Pawnee Dr. 	93035
739	Bayside	bobbi.banks@yahoo.com	Bobbi	Banks	\N	NY	396 Wagon Rd. 	11361
740	Centereach	gwenn.melton@yahoo.com	Gwenn	Melton	\N	NY	9545 Wakehurst Drive 	11720
741	Saint Albans	laci.castro@hotmail.com	Laci	Castro	\N	NY	130 Birchpond Street 	11412
742	Mount Vernon	evelina.manning@aol.com	Evelina	Manning	\N	NY	7515 Spring St. 	10550
743	Longview	tania.swanson@yahoo.com	Tania	Swanson	\N	TX	8646 Glen Eagles Ave. 	75604
744	Mount Vernon	laurel.schultz@hotmail.com	Laurel	Schultz	\N	NY	812 E. 1st Lane 	10550
745	Floral Park	carolyne.conley@gmail.com	Carolyne	Conley	\N	NY	431 Lees Creek Drive 	11001
746	Central Islip	eldridge.greer@aol.com	Eldridge	Greer	\N	NY	131 E. Madison St. 	11722
747	Forney	margret.barnett@gmail.com	Margret	Barnett	\N	TX	7509 Depot Rd. 	75126
748	Elmhurst	oliva.blackwell@hotmail.com	Oliva	Blackwell	\N	NY	54 Ramblewood St. 	11373
749	Upland	oralia.farley@hotmail.com	Oralia	Farley	\N	CA	747B E. Coffee Street 	91784
750	Monsey	romaine.salazar@yahoo.com	Romaine	Salazar	\N	NY	7700 Wentworth Rd. 	10952
751	Coachella	hermila.mckay@yahoo.com	Hermila	Mckay	\N	CA	23 Garfield Dr. 	92236
752	Encino	lloyd.miranda@hotmail.com	Lloyd	Miranda	\N	CA	9098 Jennings St. 	91316
753	East Elmhurst	mandi.gibbs@gmail.com	Mandi	Gibbs	\N	NY	80 Sycamore Drive 	11369
754	Valley Stream	hue.may@aol.com	Hue	May	\N	NY	19 S. Lawrence Dr. 	11580
755	New Hyde Park	tomika.wilder@aol.com	Tomika	Wilder	\N	NY	142 South Ocean St. 	11040
756	West Babylon	graig.roth@aol.com	Graig	Roth	\N	NY	7516 Wrangler Street 	11704
757	Levittown	lamar.greer@gmail.com	Lamar	Greer	\N	NY	7909 Golden Star Ave. 	11756
758	Queensbury	raymonde.garcia@aol.com	Raymonde	Garcia	\N	NY	55 NE. North St. 	12804
759	Oakland	cira.downs@gmail.com	Cira	Downs	(510) 788-4456	CA	672 Sussex Ave. 	94603
760	Amityville	marisa.chambers@msn.com	Marisa	Chambers	\N	NY	15 E. Rock Creek Ave. 	11701
761	Ronkonkoma	rod.hatfield@hotmail.com	Rod	Hatfield	\N	NY	7090 Bridge Dr. 	11779
762	Central Islip	quyen.houston@gmail.com	Quyen	Houston	\N	NY	7758 Homewood Dr. 	11722
763	Elmhurst	han.schneider@gmail.com	Han	Schneider	\N	NY	40 Holly Street 	11373
764	Selden	terrell.mathis@aol.com	Terrell	Mathis	\N	NY	9320 Center Ave. 	11784
765	Ossining	spring.hayes@hotmail.com	Spring	Hayes	\N	NY	8591 Wentworth St. 	10562
766	Schenectady	lecia.hancock@hotmail.com	Lecia	Hancock	\N	NY	9167 Pineknoll St. 	12302
767	Anaheim	twana.arnold@msn.com	Twana	Arnold	(657) 988-1904	CA	47 North Fairground Lane 	92806
768	San Pablo	yvone.yates@gmail.com	Yvone	Yates	\N	CA	9269 Blue Spring Ave. 	94806
769	Springfield Gardens	agatha.melton@yahoo.com	Agatha	Melton	\N	NY	89 East Illinois Street 	11413
770	Bay Shore	lavonda.stephenson@gmail.com	Lavonda	Stephenson	\N	NY	37 Birchwood Dr. 	11706
771	Buffalo	agnes.sims@aol.com	Agnes	Sims	(716) 780-9901	NY	170 Queen Lane 	14215
772	Yorktown Heights	latricia.lindsey@hotmail.com	Latricia	Lindsey	\N	NY	288 Campfire Dr. 	10598
773	Massapequa	yolando.wade@hotmail.com	Yolando	Wade	\N	NY	310 Wilson Ave. 	11758
774	Lawndale	nenita.mooney@hotmail.com	Nenita	Mooney	\N	CA	10 W. Bishop Street 	90260
775	Patchogue	kermit.hyde@hotmail.com	Kermit	Hyde	\N	NY	87 SE. Carson St. 	11772
776	South El Monte	angelique.merrill@gmail.com	Angelique	Merrill	\N	CA	8490 West High Noon Ave. 	91733
777	Kingston	ilda.roberson@aol.com	Ilda	Roberson	\N	NY	8853 Lake St. 	12401
778	Victoria	corrinne.garrison@yahoo.com	Corrinne	Garrison	\N	TX	81 East Glenwood Ave. 	77904
779	Astoria	major.merrill@aol.com	Major	Merrill	\N	NY	78 Thatcher Court 	11102
780	Merrick	ouida.gregory@aol.com	Ouida	Gregory	\N	NY	7984 8th Street 	11566
781	Bayside	tajuana.riddle@hotmail.com	Tajuana	Riddle	\N	NY	24 St Margarets Ave. 	11361
782	Woodside	ricki.bullock@hotmail.com	Ricki	Bullock	\N	NY	79 Pennington Rd. 	11377
783	Lancaster	celestine.kent@aol.com	Celestine	Kent	(717) 890-4260	NY	697 Fordham Street 	14086
784	Ballston Spa	debbra.jacobson@yahoo.com	Debbra	Jacobson	\N	NY	8316 West Bedford Ave. 	12020
785	Hamburg	kandis.mills@hotmail.com	Kandis	Mills	\N	NY	64 Beechwood Drive 	14075
786	South Richmond Hill	wallace.lane@aol.com	Wallace	Lane	\N	NY	901 Liberty St. 	11419
787	Mount Vernon	malisa.mitchell@msn.com	Malisa	Mitchell	\N	NY	87 Ridgewood Court 	10550
788	Copperas Cove	lilliam.nolan@msn.com	Lilliam	Nolan	\N	TX	8976 Berkshire Court 	76522
789	Niagara Falls	tad.gardner@hotmail.com	Tad	Gardner	\N	NY	9745 E. Wilson St. 	14304
790	Howard Beach	petronila.gallegos@gmail.com	Petronila	Gallegos	\N	NY	8053 Aspen St. 	11414
791	Ballston Spa	yun.nelson@hotmail.com	Yun	Nelson	\N	NY	529 Durham Street 	12020
792	West Babylon	edgar.horn@aol.com	Edgar	Horn	\N	NY	7270 W. Cherry Hill Lane 	11704
793	Elmhurst	chantay.maynard@gmail.com	Chantay	Maynard	\N	NY	7483 1st Ave. 	11373
794	Redondo Beach	donette.mccarthy@yahoo.com	Donette	Mccarthy	\N	CA	500 NW. Maiden Dr. 	90278
795	Franklin Square	mariam.miranda@aol.com	Mariam	Miranda	\N	NY	18 East Washington Avenue 	11010
796	Upland	rosalie.coffey@gmail.com	Rosalie	Coffey	\N	CA	789 Amerige Dr. 	91784
797	Bayside	cathey.lamb@msn.com	Cathey	Lamb	\N	NY	9621 Ryan Drive 	11361
798	Massapequa Park	alyse.jacobson@yahoo.com	Alyse	Jacobson	\N	NY	10 West Devon Lane 	11762
799	Huntington	india.barron@msn.com	India	Barron	\N	NY	834 W. Pleasant Rd. 	11743
800	Pittsford	cris.dunn@yahoo.com	Cris	Dunn	\N	NY	1 Pawnee Street 	14534
801	Hopewell Junction	ophelia.rodgers@gmail.com	Ophelia	Rodgers	\N	NY	133 Joy Ridge Drive 	12533
802	Longview	barrett.sanders@aol.com	Barrett	Sanders	\N	TX	32 Hawthorne St. 	75604
803	Whitestone	bernardina.cooper@msn.com	Bernardina	Cooper	\N	NY	223 Glen Creek Ave. 	11357
804	Valley Stream	douglas.richards@hotmail.com	Douglas	Richards	\N	NY	221 Arcadia Lane 	11580
805	Clifton Park	phillis.fowler@aol.com	Phillis	Fowler	\N	NY	8976 N. Hall Street 	12065
806	Staten Island	reyes.merritt@yahoo.com	Reyes	Merritt	\N	NY	48 Lexington Rd. 	10301
807	West Islip	nathalie.knowles@aol.com	Nathalie	Knowles	\N	NY	4 Cactus Street 	11795
808	Rowlett	vallie.dixon@yahoo.com	Vallie	Dixon	\N	TX	85 E. Ann Drive 	75088
809	Bellmore	elnora.simpson@yahoo.com	Elnora	Simpson	\N	NY	7157 Shore Ave. 	11710
810	Houston	ivelisse.nixon@aol.com	Ivelisse	Nixon	(281) 941-4933	TX	782 Boston Ave. 	77016
811	Staten Island	shanti.johnston@gmail.com	Shanti	Johnston	\N	NY	722 Alderwood Drive 	10301
812	Woodhaven	martha.burgess@msn.com	Martha	Burgess	\N	NY	9631 St Margarets Lane 	11421
813	West Hempstead	neville.mcclain@yahoo.com	Neville	Mcclain	\N	NY	781 Buttonwood Ave. 	11552
814	Lindenhurst	ghislaine.compton@aol.com	Ghislaine	Compton	\N	NY	8930 Princess St. 	11757
815	Hicksville	leanna.manning@yahoo.com	Leanna	Manning	\N	NY	39 E. Stillwater Ave. 	11801
816	Vista	marshall.johnson@yahoo.com	Marshall	Johnson	\N	CA	44 Greenview St. 	92083
817	Lancaster	zelda.pratt@gmail.com	Zelda	Pratt	(717) 428-4018	NY	74 Trusel Drive 	14086
818	San Diego	joel.wynn@aol.com	Joel	Wynn	(619) 210-6032	CA	7 North Oak Ave. 	92111
819	Endicott	yahaira.robertson@yahoo.com	Yahaira	Robertson	\N	NY	142 Roehampton Dr. 	13760
820	Schenectady	sandy.mills@gmail.com	Sandy	Mills	\N	NY	333 Olive Ave. 	12302
821	Astoria	cassidy.clark@hotmail.com	Cassidy	Clark	\N	NY	9879 Old Kingston Road 	11102
822	Howard Beach	kristy.watkins@gmail.com	Kristy	Watkins	\N	NY	977 South Brook Ave. 	11414
823	Maspeth	tina.bush@aol.com	Tina	Bush	\N	NY	8038 Bellevue Street 	11378
824	Webster	veronika.rollins@yahoo.com	Veronika	Rollins	\N	NY	94 Arnold Ave. 	14580
825	Hicksville	kristel.byrd@hotmail.com	Kristel	Byrd	\N	NY	9967 Piper Street 	11801
826	Smithtown	shay.stephenson@aol.com	Shay	Stephenson	\N	NY	9569 4th Lane 	11787
827	Sunnyside	george.pickett@msn.com	George	Pickett	\N	NY	691 Rocky River St. 	11104
828	Mount Vernon	renato.morton@msn.com	Renato	Morton	\N	NY	8526 Sherwood Street 	10550
829	Lockport	marcy.rodriguez@gmail.com	Marcy	Rodriguez	\N	NY	97 Trusel Drive 	14094
830	Copperas Cove	edmund.gaines@gmail.com	Edmund	Gaines	\N	TX	8643 Gartner St. 	76522
831	Oswego	lory.berg@aol.com	Lory	Berg	\N	NY	64 Vine Drive 	13126
832	Ballston Spa	pamala.fowler@gmail.com	Pamala	Fowler	\N	NY	399 Leatherwood St. 	12020
833	Whitestone	leone.emerson@msn.com	Leone	Emerson	\N	NY	460 Smith Store Ave. 	11357
834	Euless	brain.skinner@hotmail.com	Brain	Skinner	\N	TX	8676 Ketch Harbour Ave. 	76039
835	Euless	roseanne.maynard@yahoo.com	Roseanne	Maynard	\N	TX	219 Old Paris Hill Dr. 	76039
836	Rosedale	corinna.adams@msn.com	Corinna	Adams	\N	NY	38 Trenton Court 	11422
837	Baldwinsville	kellye.campbell@gmail.com	Kellye	Campbell	\N	NY	75 Marsh St. 	13027
838	Howard Beach	erna.sloan@aol.com	Erna	Sloan	\N	NY	9449 Fifth Avenue 	11414
839	Glen Cove	carolann.russell@hotmail.com	Carolann	Russell	\N	NY	9308 Selby Ave. 	11542
840	East Elmhurst	gilbert.calhoun@msn.com	Gilbert	Calhoun	\N	NY	7339 Summer Drive 	11369
841	Ronkonkoma	manie.maxwell@gmail.com	Manie	Maxwell	\N	NY	85 Brickell Ave. 	11779
842	San Angelo	giselle.robles@hotmail.com	Giselle	Robles	\N	TX	9747 N. El Dorado Dr. 	76901
843	Plattsburgh	tessie.farmer@msn.com	Tessie	Farmer	\N	NY	870 Cottage Ave. 	12901
844	South Ozone Park	felica.munoz@aol.com	Felica	Munoz	\N	NY	24 West Rockwell Dr. 	11420
845	Bronx	kathyrn.bush@gmail.com	Kathyrn	Bush	\N	NY	90 Devon St. 	10451
846	Rocklin	sylvester.chan@hotmail.com	Sylvester	Chan	\N	CA	659 Arcadia Street 	95677
847	Port Washington	lizette.ellison@hotmail.com	Lizette	Ellison	\N	NY	865 Sunbeam Street 	11050
848	Elmhurst	ernestina.skinner@hotmail.com	Ernestina	Skinner	\N	NY	52 Spring Drive 	11373
849	Syosset	phyllis.hill@yahoo.com	Phyllis	Hill	\N	NY	576 Devon Ave. 	11791
850	Rowlett	stephanie.browning@yahoo.com	Stephanie	Browning	\N	TX	9156 Lantern St. 	75088
851	New Hyde Park	arlena.buckner@hotmail.com	Arlena	Buckner	\N	NY	629 Locust Ave. 	11040
852	Freeport	lezlie.thompson@yahoo.com	Lezlie	Thompson	\N	NY	73 Vernon St. 	11520
853	Kingston	brittney.rojas@aol.com	Brittney	Rojas	\N	NY	2 E. Overlook Ave. 	12401
854	New York	phylis.adkins@msn.com	Phylis	Adkins	(212) 325-9145	NY	7781 James Ave. 	10002
855	Upland	lean.stark@msn.com	Lean	Stark	\N	CA	215 Old Pumpkin Hill St. 	91784
856	Ronkonkoma	lara.guy@aol.com	Lara	Guy	\N	NY	9809 E. Walnut Drive 	11779
857	New Windsor	inga.koch@msn.com	Inga	Koch	\N	NY	8445 South New Court 	12553
858	Rome	klara.kim@gmail.com	Klara	Kim	\N	NY	9660 Sherman Lane 	13440
859	Sugar Land	julianne.shannon@hotmail.com	Julianne	Shannon	\N	TX	28 Applegate Street 	77478
860	South Ozone Park	loni.mullen@msn.com	Loni	Mullen	\N	NY	55 Thompson Avenue 	11420
861	Hopewell Junction	olympia.figueroa@hotmail.com	Olympia	Figueroa	\N	NY	587 Surrey St. 	12533
862	Fresh Meadows	mellie.puckett@yahoo.com	Mellie	Puckett	\N	NY	64 Van Dyke St. 	11365
863	Utica	shonta.preston@msn.com	Shonta	Preston	\N	NY	74 Division St. 	13501
864	Buffalo	lore.sykes@aol.com	Lore	Sykes	(716) 382-5169	NY	7050 Beach Drive 	14215
865	Astoria	julia.joyner@msn.com	Julia	Joyner	\N	NY	2 Valley View Dr. 	11102
866	Longview	lynwood.jackson@aol.com	Lynwood	Jackson	\N	TX	9449 Linda Street 	75604
867	Campbell	rosalva.hamilton@aol.com	Rosalva	Hamilton	\N	CA	9883 Cedar Dr. 	95008
868	San Jose	domingo.casey@msn.com	Domingo	Casey	(408) 761-9212	CA	8665 Cypress Street 	95127
869	Richmond Hill	rodrigo.durham@aol.com	Rodrigo	Durham	\N	NY	82 Old Church Road 	11418
870	Smithtown	dwain.carlson@gmail.com	Dwain	Carlson	\N	NY	951 North Trusel Ave. 	11787
871	New Windsor	erlinda.humphrey@hotmail.com	Erlinda	Humphrey	\N	NY	532 South Victoria St. 	12553
872	Corpus Christi	silas.tate@yahoo.com	Silas	Tate	(361) 219-2149	TX	9754 53rd Court 	78418
873	Niagara Falls	patience.clayton@hotmail.com	Patience	Clayton	\N	NY	68 Chestnut Dr. 	14304
874	Plattsburgh	mila.good@yahoo.com	Mila	Good	\N	NY	812 East Longbranch Ave. 	12901
875	Rosedale	tanesha.sawyer@aol.com	Tanesha	Sawyer	\N	NY	9B Kingston Lane 	11422
876	Glen Cove	onita.macdonald@yahoo.com	Onita	Macdonald	\N	NY	94 Wood St. 	11542
877	Howard Beach	janine.manning@gmail.com	Janine	Manning	\N	NY	9118B Campfire St. 	11414
878	Smithtown	melodie.melton@yahoo.com	Melodie	Melton	\N	NY	12 S. 8th Road 	11787
879	Garden City	ethelyn.ray@yahoo.com	Ethelyn	Ray	\N	NY	80 South Sutor Lane 	11530
880	Sunnyside	phebe.turner@aol.com	Phebe	Turner	\N	NY	4 West York Street 	11104
881	Santa Monica	chloe.patel@yahoo.com	Chloe	Patel	\N	CA	407 Homewood Street 	90403
882	Ballston Spa	hilda.harvey@gmail.com	Hilda	Harvey	\N	NY	9808 W. Cleveland Ave. 	12020
883	El Paso	gilberte.duke@gmail.com	Gilberte	Duke	(915) 903-7860	TX	12 Birchwood Dr. 	79930
884	Oswego	willian.hardin@msn.com	Willian	Hardin	\N	NY	836 West Street 	13126
885	Longview	janna.hayden@msn.com	Janna	Hayden	\N	TX	32 Hilldale Street 	75604
886	North Tonawanda	letisha.may@yahoo.com	Letisha	May	\N	NY	9965 Princeton Lane 	14120
887	Syosset	graig.cannon@gmail.com	Graig	Cannon	\N	NY	36 Oklahoma Ave. 	11791
888	Webster	coleen.navarro@aol.com	Coleen	Navarro	\N	NY	990 Broad Rd. 	14580
889	San Carlos	lucilla.williams@hotmail.com	Lucilla	Williams	\N	CA	42 Cedar Street 	94070
890	Ossining	rosanne.george@yahoo.com	Rosanne	George	\N	NY	38 Pleasant St. 	10562
891	Monsey	ashlie.parrish@hotmail.com	Ashlie	Parrish	\N	NY	48 Mill Drive 	10952
892	Ossining	alissa.craft@hotmail.com	Alissa	Craft	\N	NY	249 Maple Street 	10562
893	Depew	letty.cobb@msn.com	Letty	Cobb	\N	NY	8652 Wellington Street 	14043
894	New Windsor	nathaniel.richard@gmail.com	Nathaniel	Richard	\N	NY	3 Nicolls Lane 	12553
895	Plainview	elaina.key@msn.com	Elaina	Key	\N	NY	1 Main St. 	11803
896	New City	stefani.gamble@aol.com	Stefani	Gamble	(845) 724-2996	NY	9119 W. Victoria St. 	10956
897	Lancaster	bettyann.acosta@gmail.com	Bettyann	Acosta	(717) 746-6658	NY	7949 Chapel St. 	14086
898	Houston	crysta.velez@yahoo.com	Crysta	Velez	(281) 529-3469	TX	64 South Front Street 	77016
899	Victoria	carisa.carpenter@hotmail.com	Carisa	Carpenter	\N	TX	551 Belmont Lane 	77904
900	San Carlos	jule.davenport@aol.com	Jule	Davenport	\N	CA	19 River St. 	94070
901	Ontario	lonna.franks@yahoo.com	Lonna	Franks	\N	CA	667 Brickyard Street 	91762
902	Oswego	elease.dejesus@gmail.com	Elease	Dejesus	\N	NY	7800 Magnolia Street 	13126
903	Hicksville	maira.long@msn.com	Maira	Long	\N	NY	7587 Bear Hill Street 	11801
904	San Jose	jana.thomas@yahoo.com	Jana	Thomas	(408) 624-8137	CA	283 E. Spring Dr. 	95127
905	Baldwinsville	hae.ramirez@hotmail.com	Hae	Ramirez	\N	NY	9367 Lake Street 	13027
906	Sugar Land	erik.leblanc@aol.com	Erik	Leblanc	\N	TX	7 East Nut Swamp Street 	77478
907	Longview	daina.sampson@msn.com	Daina	Sampson	\N	TX	556 Wellington St. 	75604
908	Lockport	delmar.wise@yahoo.com	Delmar	Wise	\N	NY	8355 Kingston Avenue 	14094
909	Uniondale	alita.salinas@hotmail.com	Alita	Salinas	\N	NY	8550 Bear Hill Ave. 	11553
910	Mcallen	elenore.william@msn.com	Elenore	William	\N	TX	23 Rockland St. 	78501
911	Pittsford	nikita.roy@aol.com	Nikita	Roy	\N	NY	9703 N. Snake Hill St. 	14534
912	Massapequa Park	inocencia.key@hotmail.com	Inocencia	Key	\N	NY	36 Wild Rose Ave. 	11762
913	Desoto	liliana.kerr@yahoo.com	Liliana	Kerr	\N	TX	3 Cherry Drive 	75115
914	Rockville Centre	hortencia.o'neil@hotmail.com	Hortencia	O'neil	\N	NY	1 Gulf Rd. 	11570
915	Sacramento	beryl.bennett@aol.com	Beryl	Bennett	(916) 422-6956	CA	9563 Edgemont St. 	95820
916	Mount Vernon	alishia.elliott@aol.com	Alishia	Elliott	\N	NY	8905 Courtland Ave. 	10550
917	Troy	vernia.madden@aol.com	Vernia	Madden	(248) 206-3697	NY	5 Iroquois Street 	12180
918	Smithtown	kristel.bullock@yahoo.com	Kristel	Bullock	\N	NY	7292 Armstrong Drive 	11787
919	Torrance	ruthanne.hoover@aol.com	Ruthanne	Hoover	\N	CA	835 Paris Hill Road 	90505
920	North Tonawanda	james.robles@aol.com	James	Robles	\N	NY	9 Chapel Lane 	14120
921	Webster	evelin.vargas@msn.com	Evelin	Vargas	\N	NY	7049 Pin Oak Ave. 	14580
922	Massapequa	elvia.cardenas@hotmail.com	Elvia	Cardenas	\N	NY	8 Paris Hill St. 	11758
923	Canyon Country	randee.pitts@msn.com	Randee	Pitts	\N	CA	7371B Essex Street 	91387
924	New Windsor	lea.irwin@gmail.com	Lea	Irwin	\N	NY	845 Adams Lane 	12553
925	Kingston	bryce.monroe@aol.com	Bryce	Monroe	\N	NY	52 Cooper Lane 	12401
926	Bakersfield	katina.mcintosh@yahoo.com	Katina	Mcintosh	(661) 464-1523	CA	263 Swanson Dr. 	93306
927	New York	guillermo.hart@hotmail.com	Guillermo	Hart	(212) 652-7198	NY	81 Indian Summer Drive 	10002
928	Santa Monica	joann.barber@gmail.com	Joann	Barber	\N	CA	8945 Courtland Street 	90403
929	Pleasanton	thurman.ellis@gmail.com	Thurman	Ellis	\N	CA	20 Augusta Road 	94566
930	Clifton Park	delana.wagner@aol.com	Delana	Wagner	\N	NY	8499 Mill Pond Road 	12065
931	San Angelo	porter.bass@hotmail.com	Porter	Bass	\N	TX	370 North Alderwood Dr. 	76901
932	Wappingers Falls	yvonne.bean@yahoo.com	Yvonne	Bean	\N	NY	20 W. Marsh Ave. 	12590
933	Howard Beach	lurline.rivers@msn.com	Lurline	Rivers	\N	NY	69 Pine Street 	11414
934	Hamburg	ocie.slater@msn.com	Ocie	Slater	\N	NY	7799 W. Bohemia Dr. 	14075
935	Monroe	genevie.miles@aol.com	Genevie	Miles	\N	NY	45 West Sulphur Springs Ave. 	10950
936	Ossining	sherilyn.wilcox@gmail.com	Sherilyn	Wilcox	\N	NY	905 North Buckingham Lane 	10562
937	West Hempstead	aida.koch@gmail.com	Aida	Koch	\N	NY	9778 3rd Drive 	11552
938	Rochester	emory.o'connor@gmail.com	Emory	O'connor	(507) 606-2192	NY	34 Foxrun Street 	14606
939	Corpus Christi	maximina.hutchinson@hotmail.com	Maximina	Hutchinson	(361) 164-3098	TX	53 Stillwater Avenue 	78418
940	Encino	marina.hinton@yahoo.com	Marina	Hinton	\N	CA	7440 North Oxford St. 	91316
941	Central Islip	danyell.dickerson@msn.com	Danyell	Dickerson	\N	NY	8306 Fieldstone Dr. 	11722
942	Lancaster	davis.long@msn.com	Davis	Long	(717) 653-1755	NY	929 Elmwood Dr. 	14086
943	Scarsdale	lynn.mcmahon@msn.com	Lynn	Mcmahon	\N	NY	9 Surrey St. 	10583
944	Scarsdale	tonja.henderson@aol.com	Tonja	Henderson	\N	NY	82 Alton St. 	10583
945	Port Washington	krissy.ochoa@msn.com	Krissy	Ochoa	\N	NY	80 Queen Ave. 	11050
946	Pittsford	angella.bridges@yahoo.com	Angella	Bridges	\N	NY	8708 Sycamore St. 	14534
947	Palos Verdes Peninsula	angele.castro@yahoo.com	Angele	Castro	\N	CA	15 Acacia Drive 	90274
948	Levittown	siobhan.lang@gmail.com	Siobhan	Lang	\N	NY	3 Monroe Lane 	11756
949	Scarsdale	venessa.frost@msn.com	Venessa	Frost	\N	NY	621 West School Rd. 	10583
950	Rochester	verna.solis@yahoo.com	Verna	Solis	(507) 115-1633	NY	7 Lincoln Lane 	14606
951	Scarsdale	steve.bender@gmail.com	Steve	Bender	\N	NY	908 N. Pennington Dr. 	10583
952	Torrance	aileen.marquez@msn.com	Aileen	Marquez	\N	CA	8899 Newbridge Street 	90505
953	Helotes	kattie.stevenson@aol.com	Kattie	Stevenson	\N	TX	52 Carson Street 	78023
954	Hicksville	hassan.nash@yahoo.com	Hassan	Nash	\N	NY	8105 University Lane 	11801
955	West Babylon	delfina.gilliam@hotmail.com	Delfina	Gilliam	\N	NY	9463 Bayberry Rd. 	11704
956	Farmingdale	venus.hewitt@msn.com	Venus	Hewitt	\N	NY	9835 Old Cemetery Lane 	11735
957	Anaheim	stephen.vega@msn.com	Stephen	Vega	(657) 288-3778	CA	5 Briarwood St. 	92806
958	Euless	ciera.koch@gmail.com	Ciera	Koch	\N	TX	881 Lawrence Drive 	76039
959	Sacramento	christel.barber@hotmail.com	Christel	Barber	(916) 679-3547	CA	320 Briarwood Lane 	95820
960	Hempstead	arline.lawson@gmail.com	Arline	Lawson	(516) 792-3395	NY	48 Whitemarsh Lane 	11550
961	Kingston	iva.wilcox@aol.com	Iva	Wilcox	\N	NY	452 South Mayflower Drive 	12401
962	Copperas Cove	maple.griffin@gmail.com	Maple	Griffin	\N	TX	20 Glendale Drive 	76522
963	Rome	anisha.lang@aol.com	Anisha	Lang	\N	NY	265 Peachtree St. 	13440
964	Corpus Christi	brent.calderon@aol.com	Brent	Calderon	(361) 981-8725	TX	3 Thomas St. 	78418
965	Plainview	margit.osborn@yahoo.com	Margit	Osborn	\N	NY	909 Gulf Drive 	11803
966	Glen Cove	novella.patel@gmail.com	Novella	Patel	\N	NY	500 Livingston Street 	11542
967	Canandaigua	laurette.hebert@msn.com	Laurette	Hebert	\N	NY	18 South Constitution Court 	14424
968	Mahopac	jonna.brown@aol.com	Jonna	Brown	\N	NY	1 Spring Drive 	10541
969	Rochester	jennell.solis@hotmail.com	Jennell	Solis	(507) 421-7354	NY	194 2nd Rd. 	14606
970	Hollis	ruth.horton@gmail.com	Ruth	Horton	\N	NY	488 Mulberry Ave. 	11423
971	Brentwood	samual.warner@gmail.com	Samual	Warner	(631) 151-4988	NY	8735 Thatcher Dr. 	11717
972	Long Beach	damian.mills@yahoo.com	Damian	Mills	(562) 924-3079	NY	7747 Elm Dr. 	11561
973	Ridgecrest	margaretta.clayton@yahoo.com	Margaretta	Clayton	\N	CA	524 San Pablo Ave. 	93555
974	Astoria	marcell.barrett@gmail.com	Marcell	Barrett	\N	NY	266 Elm Drive 	11102
975	Los Angeles	annis.sanchez@aol.com	Annis	Sanchez	(424) 352-6275	CA	4 Edgewater Road 	90008
976	Smithtown	ayanna.cherry@yahoo.com	Ayanna	Cherry	\N	NY	8829 Galvin Rd. 	11787
977	Amityville	barton.cox@yahoo.com	Barton	Cox	\N	NY	8220 Creekside Street 	11701
978	Bronx	diana.reyes@msn.com	Diana	Reyes	\N	NY	7415 Annadale St. 	10451
979	Ithaca	ingeborg.ellison@yahoo.com	Ingeborg	Ellison	\N	NY	360 Trusel St. 	14850
980	Port Chester	carter.booth@msn.com	Carter	Booth	\N	NY	82 Beech Drive 	10573
981	Long Beach	christel.cardenas@aol.com	Christel	Cardenas	(562) 342-8083	NY	428 S. Swanson Drive 	11561
982	San Angelo	orval.hunter@aol.com	Orval	Hunter	\N	TX	35 Wagon Drive 	76901
983	Fullerton	marguerite.berger@aol.com	Marguerite	Berger	\N	CA	875 Arch Lane 	92831
984	Franklin Square	ivette.warren@gmail.com	Ivette	Warren	\N	NY	8408 Thomas Street 	11010
985	Harlingen	milagros.weber@hotmail.com	Milagros	Weber	\N	TX	7591 Glendale Ave. 	78552
986	Ossining	marcel.lindsay@hotmail.com	Marcel	Lindsay	\N	NY	249 Peninsula St. 	10562
987	Staten Island	louis.powell@aol.com	Louis	Powell	\N	NY	368 Sugar Rd. 	10301
988	Syosset	vanda.holmes@aol.com	Vanda	Holmes	\N	NY	9835 Wild Rose Drive 	11791
989	South Ozone Park	loreen.byers@yahoo.com	Loreen	Byers	\N	NY	83 S. Rockledge Circle 	11420
990	Monroe	casimira.chapman@yahoo.com	Casimira	Chapman	\N	NY	67 Snake Hill St. 	10950
991	Canyon Country	brigida.larson@hotmail.com	Brigida	Larson	\N	CA	8789 Sycamore Lane 	91387
992	Patchogue	chere.alston@gmail.com	Chere	Alston	\N	NY	16 Lower River Street 	11772
993	Ridgecrest	giovanna.jefferson@gmail.com	Giovanna	Jefferson	\N	CA	9394 Riverside St. 	93555
994	Yorktown Heights	demarcus.reese@gmail.com	Demarcus	Reese	\N	NY	8087 Armstrong Dr. 	10598
995	Canandaigua	amina.salazar@aol.com	Amina	Salazar	\N	NY	944 Wellington Street 	14424
996	Shirley	serafina.clemons@gmail.com	Serafina	Clemons	\N	NY	851 Brown Ave. 	11967
997	Baldwin	trinidad.mcclain@msn.com	Trinidad	Mcclain	\N	NY	98 Tunnel Drive 	11510
998	Jamestown	heather.chaney@yahoo.com	Heather	Chaney	\N	NY	4 Morris Dr. 	14701
999	Ballston Spa	latoya.johns@hotmail.com	Latoya	Johns	\N	NY	7914 W. Woodsman St. 	12020
1000	West Babylon	shiloh.reeves@msn.com	Shiloh	Reeves	\N	NY	818 Kirkland Lane 	11704
1001	Brentwood	lee.roman@gmail.com	Lee	Roman	(631) 913-6967	NY	4 Canal Ave. 	11717
1002	Massapequa	cami.williamson@hotmail.com	Cami	Williamson	\N	NY	9511A Windsor Drive 	11758
1003	Vista	sharell.ross@msn.com	Sharell	Ross	\N	CA	7830 Devonshire Ave. 	92083
1004	East Elmhurst	jerald.blackwell@hotmail.com	Jerald	Blackwell	\N	NY	8364 South Wakehurst Ave. 	11369
1005	Astoria	ruthanne.franco@yahoo.com	Ruthanne	Franco	\N	NY	61 Applegate St. 	11102
1006	Apple Valley	marjory.leonard@msn.com	Marjory	Leonard	\N	CA	800 Greystone Lane 	92307
1007	Howard Beach	jimmy.russell@hotmail.com	Jimmy	Russell	\N	NY	33 Iroquois Ave. 	11414
1008	Forney	berneice.pollard@hotmail.com	Berneice	Pollard	\N	TX	607 Bohemia Street 	75126
1009	Rosedale	deangelo.cooley@aol.com	Deangelo	Cooley	\N	NY	3 NE. Edgewood Rd. 	11422
1010	Bethpage	katia.henry@msn.com	Katia	Henry	\N	NY	69 E. Columbia Ave. 	11714
1011	Garland	sebrina.gross@yahoo.com	Sebrina	Gross	\N	TX	993 Glendale Drive 	75043
1012	Baldwinsville	josephine.dale@aol.com	Josephine	Dale	\N	NY	8214 West Drive 	13027
1013	Corona	alma.peck@aol.com	Alma	Peck	\N	NY	298 South Bay Meadows Drive 	11368
1014	South Richmond Hill	ling.newman@msn.com	Ling	Newman	\N	NY	832 Spring Road 	11419
1015	Garden City	nichelle.rosario@hotmail.com	Nichelle	Rosario	\N	NY	709 Dunbar Ave. 	11530
1016	New York	shenna.benton@msn.com	Shenna	Benton	(212) 578-2912	NY	57 Shadow Brook Road 	10002
1017	Oakland	philip.bryan@hotmail.com	Philip	Bryan	(510) 533-4262	CA	914 Devonshire Court 	94603
1018	Maspeth	carita.salinas@yahoo.com	Carita	Salinas	\N	NY	90 Griffin Street 	11378
1019	Elmhurst	janie.herrera@gmail.com	Janie	Herrera	\N	NY	652 Westport Street 	11373
1020	San Carlos	lorraine.marks@msn.com	Lorraine	Marks	\N	CA	160 North Pearl Street 	94070
1021	Saint Albans	nicolas.carlson@yahoo.com	Nicolas	Carlson	\N	NY	7899 Spruce Street 	11412
1022	Mahopac	hye.mercer@gmail.com	Hye	Mercer	\N	NY	9681 Redwood St. 	10541
1023	Ballston Spa	adena.blake@hotmail.com	Adena	Blake	\N	NY	684 Westport Drive 	12020
1024	El Paso	coleman.boyd@yahoo.com	Coleman	Boyd	(915) 607-6336	TX	9740 Bay Meadows Drive 	79930
1025	Farmingdale	daphine.willis@msn.com	Daphine	Willis	\N	NY	152 Shady St. 	11735
1026	Endicott	jenine.dawson@msn.com	Jenine	Dawson	\N	NY	17 Park Street 	13760
1027	Saint Albans	shanita.wiley@yahoo.com	Shanita	Wiley	\N	NY	121 Bridge Lane 	11412
1028	Canandaigua	shanna.bonner@msn.com	Shanna	Bonner	\N	NY	386 Lafayette Road 	14424
1029	Rowlett	ping.quinn@gmail.com	Ping	Quinn	\N	TX	9051 Hanover Dr. 	75088
1030	Brooklyn	saran.moses@yahoo.com	Saran	Moses	\N	NY	94 Hall Dr. 	11201
1031	Fairport	tonja.bean@aol.com	Tonja	Bean	\N	NY	9 Middle River St. 	14450
1032	Huntington Station	vernon.knowles@yahoo.com	Vernon	Knowles	\N	NY	5 Olive Lane 	11746
1033	Forest Hills	jeannette.skinner@yahoo.com	Jeannette	Skinner	\N	NY	8886 High Point Drive 	11375
1034	Centereach	rico.salas@msn.com	Rico	Salas	\N	NY	8041 Walt Whitman St. 	11720
1035	Campbell	tangela.hurley@msn.com	Tangela	Hurley	\N	CA	49 North Cross St. 	95008
1036	Centereach	randee.lester@gmail.com	Randee	Lester	\N	NY	81 Bear Hill Street 	11720
1037	Nanuet	ashanti.hammond@msn.com	Ashanti	Hammond	\N	NY	9202 W. Lyme Ave. 	10954
1038	Forest Hills	garry.juarez@hotmail.com	Garry	Juarez	\N	NY	670 Nut Swamp Drive 	11375
1039	Liverpool	bee.baker@aol.com	Bee	Baker	\N	NY	307 E. Magnolia St. 	13090
1040	Victoria	shantae.hammond@hotmail.com	Shantae	Hammond	\N	TX	526 Harvard Drive 	77904
1041	Oswego	bettye.espinoza@yahoo.com	Bettye	Espinoza	\N	NY	76 Rockwell Street 	13126
1042	Elmont	larissa.hays@aol.com	Larissa	Hays	\N	NY	66 2nd Drive 	11003
1043	Fresh Meadows	diane.jones@gmail.com	Diane	Jones	\N	NY	859 Prince St. 	11365
1044	Rosedale	zenia.bruce@aol.com	Zenia	Bruce	\N	NY	349 James Road 	11422
1045	Vista	pasquale.hogan@aol.com	Pasquale	Hogan	\N	CA	403 Bank St. 	92083
1046	Canandaigua	dane.mcdaniel@hotmail.com	Dane	Mcdaniel	\N	NY	891 Court Ave. 	14424
1047	Elmhurst	jamaal.baker@hotmail.com	Jamaal	Baker	\N	NY	186 Big Rock Cove Ave. 	11373
1048	Apple Valley	ji.burt@hotmail.com	Ji	Burt	\N	CA	40 S. Roberts Street 	92307
1049	Clifton Park	marcelino.mcbride@hotmail.com	Marcelino	Mcbride	\N	NY	29 Oxford Ave. 	12065
1050	Shirley	rozella.fitzgerald@yahoo.com	Rozella	Fitzgerald	\N	NY	7795 Myers Ave. 	11967
1051	Huntington Station	tonisha.fowler@msn.com	Tonisha	Fowler	\N	NY	9270 Valley View Lane 	11746
1052	Sacramento	zora.ford@gmail.com	Zora	Ford	(916) 192-3196	CA	7416 La Sierra Dr. 	95820
1053	Mahopac	parthenia.figueroa@msn.com	Parthenia	Figueroa	\N	NY	550 Theatre Dr. 	10541
1054	Garland	arielle.levine@yahoo.com	Arielle	Levine	\N	TX	7100 High Ridge St. 	75043
1055	Maspeth	hildegarde.christensen@hotmail.com	Hildegarde	Christensen	\N	NY	488 East Mill Pond Ave. 	11378
1056	Mount Vernon	rebbecca.espinoza@hotmail.com	Rebbecca	Espinoza	\N	NY	8266 Valley Farms Road 	10550
1057	Mount Vernon	conchita.boone@gmail.com	Conchita	Boone	\N	NY	814 Birchpond Lane 	10550
1058	Webster	aisha.woods@gmail.com	Aisha	Woods	\N	NY	9292 Bear Hill Ave. 	14580
1059	East Northport	season.harvey@yahoo.com	Season	Harvey	\N	NY	388 Arnold Court 	11731
1060	Lancaster	tommie.cooley@yahoo.com	Tommie	Cooley	(717) 634-4113	NY	92 Hickory St. 	14086
1061	Euless	alanna.barry@yahoo.com	Alanna	Barry	\N	TX	33 Laurel Avenue 	76039
1062	Carmel	jerri.guthrie@msn.com	Jerri	Guthrie	\N	NY	95 Sugar Dr. 	10512
1063	Lake Jackson	tammy.austin@yahoo.com	Tammy	Austin	\N	TX	182 Stillwater Ave. 	77566
1064	Rowlett	patsy.russo@gmail.com	Patsy	Russo	\N	TX	8438 Fairway Avenue 	75088
1065	San Lorenzo	desiree.branch@msn.com	Desiree	Branch	\N	CA	67 Bayport Drive 	94580
1066	Anaheim	raeann.duncan@aol.com	Raeann	Duncan	(657) 256-2008	CA	126 Edgewood St. 	92806
1067	Rego Park	lillia.gillespie@hotmail.com	Lillia	Gillespie	\N	NY	382 Cardinal Dr. 	11374
1068	Duarte	doris.kaufman@gmail.com	Doris	Kaufman	\N	CA	69 Fairground Dr. 	91010
1069	Shirley	rodolfo.buck@gmail.com	Rodolfo	Buck	\N	NY	8359 Brewery Street 	11967
1070	Oakland Gardens	olimpia.mays@aol.com	Olimpia	Mays	\N	NY	42 Nichols Lane 	11364
1071	Pomona	shemeka.lyons@msn.com	Shemeka	Lyons	\N	CA	97 South Jockey Hollow St. 	91768
1072	Richardson	maryalice.henry@msn.com	Maryalice	Henry	\N	TX	85 Prince Street 	75080
1073	Bayside	leeanne.cross@yahoo.com	Leeanne	Cross	\N	NY	424 Newcastle Road 	11361
1074	Floral Park	lanelle.guerra@yahoo.com	Lanelle	Guerra	\N	NY	989 Wrangler St. 	11001
1075	Huntington Station	dann.huff@gmail.com	Dann	Huff	\N	NY	475 S. Rockville St. 	11746
1076	Vista	sherise.mercer@gmail.com	Sherise	Mercer	\N	CA	9401 Catherine Dr. 	92083
1077	Sunnyside	heather.perry@gmail.com	Heather	Perry	\N	NY	982 Durham Street 	11104
1078	Forest Hills	theresia.barron@aol.com	Theresia	Barron	\N	NY	951 Wild Rose Street 	11375
1079	Floral Park	cindi.ellis@yahoo.com	Cindi	Ellis	\N	NY	6 Cypress Lane 	11001
1080	Longview	mirella.duffy@yahoo.com	Mirella	Duffy	\N	TX	43 University Ave. 	75604
1081	New Rochelle	carson.macias@gmail.com	Carson	Macias	\N	NY	7 Pennington St. 	10801
1082	Long Beach	divina.madden@gmail.com	Divina	Madden	(562) 264-3998	NY	7314 Armstrong St. 	11561
1083	Wantagh	cher.alston@msn.com	Cher	Alston	\N	NY	38 Wild Horse Road 	11793
1084	Franklin Square	regine.odom@msn.com	Regine	Odom	\N	NY	684 N. Mayfield Ave. 	11010
1085	Central Islip	adam.thornton@hotmail.com	Adam	Thornton	\N	NY	755 East Henry Lane 	11722
1086	Jamaica	cori.schwartz@msn.com	Cori	Schwartz	\N	NY	43 Lancaster Lane 	11432
1087	Pleasanton	willow.gardner@gmail.com	Willow	Gardner	\N	CA	57 S. Lakewood Dr. 	94566
1088	Apple Valley	jane.henderson@hotmail.com	Jane	Henderson	\N	CA	46 Carson Drive 	92307
1089	Orchard Park	chere.mcfadden@yahoo.com	Chere	Mcfadden	\N	NY	695 San Pablo Drive 	14127
1090	Port Jefferson Station	ira.erickson@aol.com	Ira	Erickson	\N	NY	6 Lake Forest St. 	11776
1091	Rocklin	risa.gallagher@yahoo.com	Risa	Gallagher	\N	CA	8281 Edgefield Drive 	95677
1092	East Northport	lavinia.cotton@yahoo.com	Lavinia	Cotton	\N	NY	7485 Bridle Street 	11731
1093	Deer Park	alejandrina.hodges@msn.com	Alejandrina	Hodges	\N	NY	7598 Shadow Brook St. 	11729
1094	Lindenhurst	keitha.black@yahoo.com	Keitha	Black	\N	NY	7670 Hilldale Ave. 	11757
1095	Rego Park	corene.swanson@aol.com	Corene	Swanson	\N	NY	597 Lakeshore Lane 	11374
1096	Baldwinsville	tonda.webb@yahoo.com	Tonda	Webb	\N	NY	53 SW. Edgemont Rd. 	13027
1097	San Pablo	collen.dennis@gmail.com	Collen	Dennis	\N	CA	284 E. Mill Street 	94806
1098	Rockville Centre	treasa.dickerson@hotmail.com	Treasa	Dickerson	\N	NY	70 W. Creekside Road 	11570
1099	Jackson Heights	jewell.reyes@hotmail.com	Jewell	Reyes	\N	NY	8711 Glen Creek Drive 	11372
1100	Ballston Spa	penny.acevedo@yahoo.com	Penny	Acevedo	\N	NY	318 Mulberry Drive 	12020
1101	Depew	louise.flowers@yahoo.com	Louise	Flowers	\N	NY	28 N. Gregory Court 	14043
1102	Fort Worth	henrietta.wagner@hotmail.com	Henrietta	Wagner	(682) 143-2224	TX	54 Brickyard St. 	76110
1103	Canyon Country	ardelia.cooley@aol.com	Ardelia	Cooley	\N	CA	59 Henry Smith St. 	91387
1104	Spring Valley	khalilah.robertson@aol.com	Khalilah	Robertson	\N	NY	22 Longbranch Rd. 	10977
1105	Richardson	armando.black@gmail.com	Armando	Black	\N	TX	8611 N. Poor House St. 	75080
1106	Spring Valley	jerri.henry@msn.com	Jerri	Henry	\N	NY	141 N. Purple Finch Avenue 	10977
1107	Saratoga Springs	lynda.newman@msn.com	Lynda	Newman	\N	NY	44 SW. Thomas Ave. 	12866
1108	Desoto	bao.wade@gmail.com	Bao	Wade	\N	TX	7587 Church St. 	75115
1109	Deer Park	gussie.harding@gmail.com	Gussie	Harding	\N	NY	41 Edgefield Avenue 	11729
1110	West Hempstead	shirely.cantrell@aol.com	Shirely	Cantrell	\N	NY	6 Kent Street 	11552
1111	Richardson	caroline.jenkins@msn.com	Caroline	Jenkins	\N	TX	86 River Lane 	75080
1112	Massapequa	hollis.rasmussen@yahoo.com	Hollis	Rasmussen	\N	NY	8949 S. Gates Road 	11758
1113	Jamestown	kendra.harrington@yahoo.com	Kendra	Harrington	\N	NY	768 Cooper Street 	14701
1114	Albany	douglass.blankenship@hotmail.com	Douglass	Blankenship	(229) 891-2087	NY	409 W. Rock Maple Lane 	12203
1115	Glen Cove	lina.meadows@aol.com	Lina	Meadows	\N	NY	7020 Ashley Rd. 	11542
1116	Astoria	patria.harper@msn.com	Patria	Harper	\N	NY	90 Arlington St. 	11102
1117	Rosedale	jeffrey.hill@gmail.com	Jeffrey	Hill	\N	NY	2 Shub Farm St. 	11422
1118	Canyon Country	ja.dillard@yahoo.com	Ja	Dillard	\N	CA	25 Orchard St. 	91387
1119	Monsey	tora.dunlap@hotmail.com	Tora	Dunlap	\N	NY	9903 North Halifax Ave. 	10952
1120	East Northport	karole.alvarez@gmail.com	Karole	Alvarez	\N	NY	69 Woodland St. 	11731
1121	Yorktown Heights	shasta.combs@yahoo.com	Shasta	Combs	\N	NY	726 James Dr. 	10598
1122	Massapequa Park	cicely.deleon@yahoo.com	Cicely	Deleon	\N	NY	751 Newbridge Ave. 	11762
1123	Fairport	raphael.o'neil@aol.com	Raphael	O'neil	\N	NY	762 East Lantern Dr. 	14450
1124	Amityville	hubert.reilly@hotmail.com	Hubert	Reilly	\N	NY	9004 N. Lake Rd. 	11701
1125	Pleasanton	caleb.england@gmail.com	Caleb	England	\N	CA	649 Marvon St. 	94566
1126	Spring Valley	elmira.levy@gmail.com	Elmira	Levy	\N	NY	6 Columbia Dr. 	10977
1127	Queensbury	waldo.hart@yahoo.com	Waldo	Hart	\N	NY	9782 Pineknoll Lane 	12804
1128	Mahopac	bea.kane@aol.com	Bea	Kane	\N	NY	398 Green Lake Ave. 	10541
1129	Woodside	gilberto.sanders@hotmail.com	Gilberto	Sanders	\N	NY	186 Roehampton Ave. 	11377
1130	Elmont	benny.bender@aol.com	Benny	Bender	\N	NY	520 W. Hamilton St. 	11003
1131	Mount Vernon	desmond.rose@hotmail.com	Desmond	Rose	\N	NY	9956 Lexington Rd. 	10550
1132	Ithaca	parthenia.holman@gmail.com	Parthenia	Holman	\N	NY	17 Orange Court 	14850
1133	West Islip	dung.king@aol.com	Dung	King	\N	NY	523 Prairie St. 	11795
1134	Desoto	sherril.alvarado@hotmail.com	Sherril	Alvarado	\N	TX	9434 Cypress Court 	75115
1135	Garland	alisia.albert@gmail.com	Alisia	Albert	\N	TX	9490 Coffee St. 	75043
1136	Rochester	kallie.best@aol.com	Kallie	Best	(507) 997-4112	NY	9842 Fairview St. 	14606
1137	Port Washington	dottie.roberts@aol.com	Dottie	Roberts	\N	NY	8252 Theatre St. 	11050
1138	Ridgecrest	hubert.stone@hotmail.com	Hubert	Stone	\N	CA	203 Penn St. 	93555
1139	Mount Vernon	gabriella.jones@hotmail.com	Gabriella	Jones	\N	NY	9100 Gates Ave. 	10550
1140	Liverpool	penney.hall@msn.com	Penney	Hall	\N	NY	8306 Jockey Hollow Street 	13090
1141	Newburgh	mallie.osborn@gmail.com	Mallie	Osborn	\N	NY	9022 Bridgeton St. 	12550
1142	Pittsford	britteny.schroeder@aol.com	Britteny	Schroeder	\N	NY	855 Bohemia Dr. 	14534
1143	Tonawanda	sommer.hopkins@gmail.com	Sommer	Hopkins	\N	NY	827 Laurel Ave. 	14150
1144	Oakland Gardens	jewel.sparks@aol.com	Jewel	Sparks	\N	NY	12 Vine Road 	11364
1145	Yonkers	deandrea.vega@gmail.com	Deandrea	Vega	(914) 818-7312	NY	613 Mill Pond St. 	10701
1146	Saint Albans	charlsie.carson@hotmail.com	Charlsie	Carson	\N	NY	3 South Grant Avenue 	11412
1147	Santa Monica	kandace.ayers@gmail.com	Kandace	Ayers	\N	CA	9005 Lookout Lane 	90403
1148	Spring Valley	lenore.valdez@msn.com	Lenore	Valdez	\N	NY	829 Birchpond Street 	10977
1149	Santa Clara	drucilla.gilliam@hotmail.com	Drucilla	Gilliam	\N	CA	8257 E. Westminster Ave. 	95050
1150	Corpus Christi	keturah.reid@yahoo.com	Keturah	Reid	(361) 394-2024	TX	747 SE. Beech Ave. 	78418
1151	Centereach	herminia.reyes@gmail.com	Herminia	Reyes	\N	NY	782 Stonybrook Street 	11720
1152	South El Monte	tuyet.rosa@aol.com	Tuyet	Rosa	\N	CA	9038 Golden Star Street 	91733
1153	San Carlos	ara.vazquez@msn.com	Ara	Vazquez	\N	CA	343 2nd Court 	94070
1154	Auburn	barry.albert@gmail.com	Barry	Albert	\N	NY	13 Grand St. 	13021
1155	Far Rockaway	verdell.joyner@aol.com	Verdell	Joyner	\N	NY	9191 Sierra St. 	11691
1156	Howard Beach	han.wade@hotmail.com	Han	Wade	\N	NY	587 Sulphur Springs St. 	11414
1157	Buffalo	anton.barton@msn.com	Anton	Barton	(716) 472-3707	NY	7284 East Indian Spring Rd. 	14215
1158	Canandaigua	vito.pickett@hotmail.com	Vito	Pickett	\N	NY	93 High Point Street 	14424
1159	Syosset	charlene.norris@msn.com	Charlene	Norris	\N	NY	972 South Sierra Drive 	11791
1160	Euless	efren.whitfield@gmail.com	Efren	Whitfield	\N	TX	139 Union Rd. 	76039
1161	Valley Stream	santa.larson@gmail.com	Santa	Larson	\N	NY	5 Bellevue Dr. 	11580
1162	Ithaca	carmelina.sellers@hotmail.com	Carmelina	Sellers	\N	NY	12 Race St. 	14850
1163	Lawndale	carmela.hays@aol.com	Carmela	Hays	\N	CA	149 Pennington Ave. 	90260
1164	Scarsdale	patrina.tanner@gmail.com	Patrina	Tanner	\N	NY	7136 Selby Road 	10583
1165	Fort Worth	rikki.morrow@hotmail.com	Rikki	Morrow	(682) 936-1482	TX	7096 Plumb Branch Road 	76110
1166	Bay Shore	junita.reese@gmail.com	Junita	Reese	\N	NY	8773 North Walt Whitman Court 	11706
1167	Nanuet	ryan.carter@yahoo.com	Ryan	Carter	\N	NY	8684 Studebaker Road 	10954
1168	Sunnyside	almeta.benjamin@aol.com	Almeta	Benjamin	\N	NY	8456 Oakwood St. 	11104
1169	Spring Valley	beatris.joyner@gmail.com	Beatris	Joyner	\N	NY	7463 Gonzales Rd. 	10977
1170	Richmond Hill	mechelle.chan@gmail.com	Mechelle	Chan	\N	NY	458 Overlook Street 	11418
1171	Rome	earlean.pena@yahoo.com	Earlean	Pena	\N	NY	7698 Fulton St. 	13440
1172	Pittsford	katherin.clark@yahoo.com	Katherin	Clark	\N	NY	996 Iroquois Street 	14534
1173	Garden City	chanel.may@msn.com	Chanel	May	\N	NY	806 Saxton Court 	11530
1174	Yonkers	aaron.knapp@yahoo.com	Aaron	Knapp	(914) 402-4335	NY	807 Grandrose Ave. 	10701
1175	Pomona	sindy.anderson@gmail.com	Sindy	Anderson	\N	CA	543 Halifax Ave. 	91768
1176	Queensbury	sheree.blanchard@gmail.com	Sheree	Blanchard	\N	NY	41 Glenwood Ave. 	12804
1177	Poughkeepsie	charlesetta.soto@yahoo.com	Charlesetta	Soto	\N	NY	25 South Colonial Drive 	12601
1178	Oxnard	wendie.nash@hotmail.com	Wendie	Nash	(805) 389-2549	CA	9 South Road 	93035
1179	Brooklyn	vernetta.banks@aol.com	Vernetta	Banks	\N	NY	7633 Albany St. 	11201
1180	Farmingdale	myrtle.gardner@aol.com	Myrtle	Gardner	\N	NY	303 Creekside Street 	11735
1181	Brooklyn	agustina.lawrence@yahoo.com	Agustina	Lawrence	\N	NY	9347 Delaware Ave. 	11201
1182	Ronkonkoma	trinidad.chapman@aol.com	Trinidad	Chapman	\N	NY	7371 Glen Eagles Street 	11779
1183	Merrick	kim.clark@msn.com	Kim	Clark	\N	NY	19 Liberty St. 	11566
1184	Spring Valley	annabelle.hebert@aol.com	Annabelle	Hebert	\N	NY	9745 Nicolls Lane 	10977
1185	Clifton Park	corine.stuart@msn.com	Corine	Stuart	\N	NY	5 Penn Street 	12065
1186	San Carlos	kiesha.bond@aol.com	Kiesha	Bond	\N	CA	29 Marvon St. 	94070
1187	Flushing	kenyetta.mason@msn.com	Kenyetta	Mason	\N	NY	98 Poplar Ave. 	11354
1188	Yonkers	marcene.curtis@msn.com	Marcene	Curtis	(914) 361-6045	NY	7699 Illinois Lane 	10701
1189	Uniondale	sheila.goodman@msn.com	Sheila	Goodman	\N	NY	9586 Chestnut St. 	11553
1190	Port Jefferson Station	romeo.steele@msn.com	Romeo	Steele	\N	NY	162 Crescent Lane 	11776
1191	Rochester	tam.fisher@aol.com	Tam	Fisher	(507) 351-9375	NY	8000 Woodsman Lane 	14606
1192	Desoto	gena.owens@gmail.com	Gena	Owens	\N	TX	43 Buckingham St. 	75115
1193	South Ozone Park	phebe.soto@hotmail.com	Phebe	Soto	\N	NY	9239 Leatherwood Rd. 	11420
1194	Pittsford	leticia.snyder@yahoo.com	Leticia	Snyder	\N	NY	173 Lyme Dr. 	14534
1195	Buffalo	chantell.bridges@yahoo.com	Chantell	Bridges	(716) 941-6072	NY	8478 N. Wrangler Dr. 	14215
1196	Patchogue	ileana.holt@msn.com	Ileana	Holt	\N	NY	817 Adams St. 	11772
1197	Port Washington	nakisha.clay@gmail.com	Nakisha	Clay	\N	NY	8996 Beechwood Ave. 	11050
1198	Brooklyn	cheryll.snyder@yahoo.com	Cheryll	Snyder	\N	NY	77 E. Liberty St. 	11201
1199	North Tonawanda	consuela.collier@msn.com	Consuela	Collier	\N	NY	338 S. Holly Avenue 	14120
1200	Port Washington	aubrey.durham@aol.com	Aubrey	Durham	\N	NY	14 Foster Ave. 	11050
1201	Port Chester	nita.guy@hotmail.com	Nita	Guy	\N	NY	75 Academy Street 	10573
1202	Banning	carmina.emerson@hotmail.com	Carmina	Emerson	\N	CA	7137 Monroe Road 	92220
1203	Desoto	georgeann.rojas@msn.com	Georgeann	Rojas	\N	TX	691 Devon Ave. 	75115
1204	Saratoga Springs	leslie.higgins@hotmail.com	Leslie	Higgins	\N	NY	805 Logan Ave. 	12866
1205	Mount Vernon	emmaline.huber@gmail.com	Emmaline	Huber	\N	NY	7975 Harrison Rd. 	10550
1206	Hollis	mercy.brown@msn.com	Mercy	Brown	\N	NY	8207 Central Street 	11423
1207	Brentwood	jenell.crosby@hotmail.com	Jenell	Crosby	(631) 544-4772	NY	507 Fulton Street 	11717
1208	Carmel	leila.barr@yahoo.com	Leila	Barr	\N	NY	120 Fremont Rd. 	10512
1209	Huntington	deandrea.cox@msn.com	Deandrea	Cox	\N	NY	617 Sycamore Street 	11743
1210	Woodside	shawnna.frank@hotmail.com	Shawnna	Frank	\N	NY	17 NW. Cottage Lane 	11377
1211	Niagara Falls	brenton.whitaker@gmail.com	Brenton	Whitaker	\N	NY	25 Elmwood Rd. 	14304
1212	Huntington Station	jaqueline.cummings@hotmail.com	Jaqueline	Cummings	\N	NY	478 Wrangler St. 	11746
1213	San Angelo	yang.giles@gmail.com	Yang	Giles	\N	TX	25 Bridle Lane 	76901
1214	Santa Clara	brigid.sharp@hotmail.com	Brigid	Sharp	\N	CA	495 Sleepy Hollow Court 	95050
1215	Rockville Centre	karl.stephens@gmail.com	Karl	Stephens	\N	NY	208 Thatcher Rd. 	11570
1216	Pleasanton	elvina.gates@hotmail.com	Elvina	Gates	\N	CA	112 Smith St. 	94566
1217	Yonkers	carlie.terrell@yahoo.com	Carlie	Terrell	(914) 517-8036	NY	7437 Snake Hill Road 	10701
1218	Oakland	donovan.cantrell@msn.com	Donovan	Cantrell	(510) 624-3824	CA	601 Winchester Dr. 	94603
1219	Shirley	alden.atkinson@gmail.com	Alden	Atkinson	\N	NY	46 Valley St. 	11967
1220	Huntington Station	carissa.cross@yahoo.com	Carissa	Cross	\N	NY	9335 West Main Dr. 	11746
1221	Apple Valley	joy.underwood@gmail.com	Joy	Underwood	\N	CA	7297 Armstrong Dr. 	92307
1222	Flushing	geraldine.o'donnell@hotmail.com	Geraldine	O'donnell	\N	NY	8241 Lookout Rd. 	11354
1223	New Windsor	bronwyn.vargas@msn.com	Bronwyn	Vargas	\N	NY	35 James Street 	12553
1224	Harlingen	abram.copeland@gmail.com	Abram	Copeland	\N	TX	9782 Indian Spring Lane 	78552
1225	Los Banos	mellisa.griffin@msn.com	Mellisa	Griffin	\N	CA	49 Alton Circle 	93635
1226	East Northport	qiana.jackson@gmail.com	Qiana	Jackson	\N	NY	56 Galvin Street 	11731
1227	Troy	magali.dixon@msn.com	Magali	Dixon	(248) 279-5331	NY	815 Del Monte Court 	12180
1228	Oakland	zulema.clemons@aol.com	Zulema	Clemons	(510) 565-8496	CA	75 W. Howard St. 	94603
1229	Wappingers Falls	carina.lynch@gmail.com	Carina	Lynch	\N	NY	64 Jennings Road 	12590
1230	Desoto	jesus.burch@hotmail.com	Jesus	Burch	\N	TX	7024 Squaw Creek Street 	75115
1231	Campbell	selene.vega@gmail.com	Selene	Vega	\N	CA	11 Sierra St. 	95008
1232	Bethpage	jong.guthrie@hotmail.com	Jong	Guthrie	\N	NY	889 Leatherwood Drive 	11714
1233	Vista	lise.hebert@gmail.com	Lise	Hebert	\N	CA	140 East Broad Lane 	92083
1234	Ossining	joshua.berg@hotmail.com	Joshua	Berg	\N	NY	16 East St. 	10562
1235	Endicott	georgina.gonzales@yahoo.com	Georgina	Gonzales	\N	NY	307 Chapel St. 	13760
1236	Mount Vernon	rudolph.velez@yahoo.com	Rudolph	Velez	\N	NY	9397 Pleasant Drive 	10550
1237	Bethpage	luke.kramer@hotmail.com	Luke	Kramer	\N	NY	7955 Delaware Drive 	11714
1238	Harlingen	edgar.quinn@aol.com	Edgar	Quinn	\N	TX	556 Dogwood Ave. 	78552
1239	Lindenhurst	tara.maynard@hotmail.com	Tara	Maynard	\N	NY	9375 Fordham Street 	11757
1240	Duarte	bella.perez@msn.com	Bella	Perez	\N	CA	43 Green Lake Street 	91010
1241	Rome	nathaniel.davidson@hotmail.com	Nathaniel	Davidson	\N	NY	7476 Henry Smith Street 	13440
1242	Franklin Square	chauncey.donaldson@aol.com	Chauncey	Donaldson	\N	NY	7412 Golf Ave. 	11010
1243	Floral Park	heide.reed@yahoo.com	Heide	Reed	\N	NY	9174 Coffee Drive 	11001
1244	Depew	trang.hardin@yahoo.com	Trang	Hardin	\N	NY	9255 Myers Drive 	14043
1245	Long Beach	gabriela.warren@aol.com	Gabriela	Warren	(562) 986-2247	NY	9947 Brewery Ave. 	11561
1246	Kingston	dale.rasmussen@aol.com	Dale	Rasmussen	\N	NY	8590 Adams Street 	12401
1247	Massapequa	tammie.cherry@hotmail.com	Tammie	Cherry	\N	NY	791 Wakehurst Dr. 	11758
1248	Port Jefferson Station	bethany.herring@yahoo.com	Bethany	Herring	\N	NY	7563 High Point Street 	11776
1249	Ridgecrest	barbra.dickerson@gmail.com	Barbra	Dickerson	\N	CA	8424 E. Rockcrest Dr. 	93555
1250	Mount Vernon	neoma.daugherty@gmail.com	Neoma	Daugherty	\N	NY	80 Spring Street 	10550
1251	Glendora	nanette.roman@yahoo.com	Nanette	Roman	\N	CA	8254 North Riverview Street 	91740
1252	Plainview	adriene.rollins@msn.com	Adriene	Rollins	\N	NY	55 Cambridge Street 	11803
1253	Far Rockaway	susannah.fields@hotmail.com	Susannah	Fields	\N	NY	17 Railroad Street 	11691
1254	Canyon Country	dung.reid@msn.com	Dung	Reid	\N	CA	468 West Washington Ave. 	91387
1255	Ithaca	ben.stone@gmail.com	Ben	Stone	\N	NY	8855 University St. 	14850
1256	Ronkonkoma	nubia.anderson@aol.com	Nubia	Anderson	\N	NY	584 NW. Hilldale Drive 	11779
1257	Webster	rosamaria.meyer@yahoo.com	Rosamaria	Meyer	\N	NY	446 Elizabeth St. 	14580
1258	Bay Shore	todd.waters@yahoo.com	Todd	Waters	\N	NY	92 Cedar Swamp Street 	11706
1259	San Carlos	kimbery.nieves@msn.com	Kimbery	Nieves	\N	CA	768 Roehampton St. 	94070
1260	Schenectady	phuong.wolf@yahoo.com	Phuong	Wolf	\N	NY	7765 N. Annadale Dr. 	12302
1261	San Pablo	adelaida.hancock@aol.com	Adelaida	Hancock	\N	CA	669 S. Gartner Street 	94806
1262	San Pablo	brianne.hays@gmail.com	Brianne	Hays	\N	CA	88 Tailwater Ave. 	94806
1263	New Hyde Park	rufina.chandler@aol.com	Rufina	Chandler	\N	NY	7985 Alderwood Street 	11040
1264	Brentwood	devin.velazquez@aol.com	Devin	Velazquez	(631) 254-8497	NY	61 Redwood St. 	11717
1265	Endicott	bonita.marshall@msn.com	Bonita	Marshall	\N	NY	48 Bald Hill Drive 	13760
1266	Garland	myrl.gay@hotmail.com	Myrl	Gay	\N	TX	8708 Taylor Lane 	75043
1267	Ronkonkoma	earline.gordon@gmail.com	Earline	Gordon	\N	NY	81 Railroad Drive 	11779
1268	Kingston	sung.chambers@gmail.com	Sung	Chambers	\N	NY	369 N. Virginia Street 	12401
1269	Port Washington	gustavo.gamble@msn.com	Gustavo	Gamble	\N	NY	8054 W. Meadowbrook Street 	11050
1270	Orchard Park	ciera.webb@yahoo.com	Ciera	Webb	\N	NY	958 Anderson Ave. 	14127
1271	Pomona	roy.chan@hotmail.com	Roy	Chan	\N	CA	7578 Middle River St. 	91768
1272	Fullerton	houston.vasquez@msn.com	Houston	Vasquez	\N	CA	845 Aspen Street 	92831
1273	Oswego	cheree.hale@yahoo.com	Cheree	Hale	\N	NY	95 Lyme Avenue 	13126
1274	Newburgh	odette.moses@gmail.com	Odette	Moses	\N	NY	899 Overlook Lane 	12550
1275	Los Banos	lenita.bonner@aol.com	Lenita	Bonner	\N	CA	7286 Swanson Drive 	93635
1276	Apple Valley	shona.mcmillan@msn.com	Shona	Mcmillan	\N	CA	57 West Maple Dr. 	92307
1277	Coram	piedad.irwin@hotmail.com	Piedad	Irwin	\N	NY	581 Garden St. 	11727
1278	Jackson Heights	loan.graham@yahoo.com	Loan	Graham	\N	NY	57 Glen Eagles St. 	11372
1279	Canandaigua	stan.saunders@yahoo.com	Stan	Saunders	\N	NY	407 Essex Dr. 	14424
1280	Wappingers Falls	jackeline.colon@msn.com	Jackeline	Colon	\N	NY	9916 Cedarwood Drive 	12590
1281	Woodside	marlen.dawson@msn.com	Marlen	Dawson	\N	NY	67 Oak Valley Street 	11377
1282	New City	alexis.mack@aol.com	Alexis	Mack	(845) 707-6088	NY	7767 Sutor Ave. 	10956
1283	Hopewell Junction	mica.barry@yahoo.com	Mica	Barry	\N	NY	3 SE. Sugar St. 	12533
1284	Brooklyn	shanice.spears@msn.com	Shanice	Spears	\N	NY	5 Piper Ave. 	11201
1285	Glendora	garth.huff@yahoo.com	Garth	Huff	\N	CA	794 East University St. 	91740
1286	Pleasanton	dione.pratt@msn.com	Dione	Pratt	\N	CA	864 Winding Way St. 	94566
1287	Astoria	victor.pittman@aol.com	Victor	Pittman	\N	NY	9294 Devon Dr. 	11102
1288	Lawndale	allie.conley@msn.com	Allie	Conley	\N	CA	96 High Point Road 	90260
1289	Bethpage	shanelle.anderson@yahoo.com	Shanelle	Anderson	\N	NY	646 Surrey Street 	11714
1290	South Richmond Hill	minnie.compton@gmail.com	Minnie	Compton	\N	NY	185 Hudson Street 	11419
1291	Monsey	shiloh.bates@msn.com	Shiloh	Bates	\N	NY	15 Wellington Dr. 	10952
1292	San Lorenzo	lakenya.oliver@yahoo.com	Lakenya	Oliver	\N	CA	82 Bayport Court 	94580
1293	Floral Park	sally.kinney@msn.com	Sally	Kinney	\N	NY	7565 High Dr. 	11001
1294	Ontario	edith.davenport@gmail.com	Edith	Davenport	\N	CA	685 Alton Road 	91762
1295	North Tonawanda	alline.beasley@yahoo.com	Alline	Beasley	\N	NY	8704 NE. Olive Ave. 	14120
1296	Saint Albans	travis.whitley@aol.com	Travis	Whitley	\N	NY	60 Euclid Ave. 	11412
1297	New Rochelle	vanessa.west@gmail.com	Vanessa	West	\N	NY	34 Prairie Lane 	10801
1298	Schenectady	trudy.riddle@aol.com	Trudy	Riddle	\N	NY	8943 Johnson Street 	12302
1299	Yorktown Heights	shauna.edwards@msn.com	Shauna	Edwards	\N	NY	8 Dogwood Ave. 	10598
1300	Jamestown	clorinda.donovan@msn.com	Clorinda	Donovan	\N	NY	9690 E. Morris Ave. 	14701
1301	Lawndale	raven.curtis@aol.com	Raven	Curtis	\N	CA	18 Summit Lane 	90260
1302	East Northport	verda.gilbert@gmail.com	Verda	Gilbert	\N	NY	54 Hillcrest Drive 	11731
1303	Woodside	renay.atkins@aol.com	Renay	Atkins	\N	NY	7146 Leeton Ridge Ave. 	11377
1304	Hollis	tama.berg@hotmail.com	Tama	Berg	\N	NY	3 Cardinal Avenue 	11423
1305	Rochester	dalia.carson@aol.com	Dalia	Carson	(507) 186-2004	NY	7175 Galvin St. 	14606
1306	Webster	america.swanson@msn.com	America	Swanson	\N	NY	83 South Arlington Lane 	14580
1307	Los Banos	cinda.rocha@hotmail.com	Cinda	Rocha	\N	CA	926 North Oklahoma Dr. 	93635
1308	South El Monte	shea.howell@msn.com	Shea	Howell	\N	CA	67 Arch Rd. 	91733
1309	Centereach	kimberli.cline@yahoo.com	Kimberli	Cline	\N	NY	7115 Stonybrook Court 	11720
1310	Schenectady	emanuel.mckee@yahoo.com	Emanuel	Mckee	\N	NY	9411 Lake Dr. 	12302
1311	Coram	whitley.cannon@msn.com	Whitley	Cannon	\N	NY	614 High Point Lane 	11727
1312	Ronkonkoma	tereasa.bird@aol.com	Tereasa	Bird	\N	NY	7526 Vine Drive 	11779
1313	Duarte	dante.grimes@yahoo.com	Dante	Grimes	\N	CA	23 Shore St. 	91010
1314	Ontario	joeann.garrison@yahoo.com	Joeann	Garrison	\N	CA	1 Harrison St. 	91762
1315	Canyon Country	omega.johnston@gmail.com	Omega	Johnston	\N	CA	9935 Tarkiln Hill St. 	91387
1316	Massapequa	conrad.mueller@yahoo.com	Conrad	Mueller	\N	NY	3 Myrtle St. 	11758
1317	Syosset	glady.wells@gmail.com	Glady	Wells	\N	NY	627 Ramblewood Ave. 	11791
1318	San Antonio	tisha.petty@msn.com	Tisha	Petty	(210) 851-3122	TX	9083 Lake View Ave. 	78213
1319	Newburgh	claris.santiago@msn.com	Claris	Santiago	\N	NY	763 Mountainview Dr. 	12550
1320	Newburgh	obdulia.barber@gmail.com	Obdulia	Barber	\N	NY	878 Lexington Rd. 	12550
1321	West Islip	shantel.gregory@yahoo.com	Shantel	Gregory	\N	NY	7722 Second Lane 	11795
1322	Franklin Square	ai.forbes@yahoo.com	Ai	Forbes	\N	NY	254 Central St. 	11010
1323	West Babylon	ebony.cotton@yahoo.com	Ebony	Cotton	\N	NY	8979 Miller St. 	11704
1324	Utica	arla.ellis@yahoo.com	Arla	Ellis	\N	NY	127 Crescent Ave. 	13501
1325	Oswego	magdalena.sherman@gmail.com	Magdalena	Sherman	\N	NY	176 Sunbeam St. 	13126
1326	Auburn	tarra.guerrero@aol.com	Tarra	Guerrero	\N	NY	10 Baker St. 	13021
1327	Monroe	consuela.romero@hotmail.com	Consuela	Romero	\N	NY	54 Elm Court 	10950
1328	Lawndale	cindie.franklin@yahoo.com	Cindie	Franklin	\N	CA	7249 Franklin St. 	90260
1329	Hollis	sharyn.brewer@aol.com	Sharyn	Brewer	\N	NY	70 Columbia Ave. 	11423
1330	San Carlos	karren.stevenson@aol.com	Karren	Stevenson	\N	CA	155 Old York St. 	94070
1331	Newburgh	divina.reeves@hotmail.com	Divina	Reeves	\N	NY	767 Bradford Dr. 	12550
1332	Glendora	novella.ross@gmail.com	Novella	Ross	\N	CA	9418 Acacia Drive 	91740
1333	Santa Monica	omega.huff@aol.com	Omega	Huff	\N	CA	63 Devon St. 	90403
1334	Newburgh	ashleigh.finch@yahoo.com	Ashleigh	Finch	\N	NY	82 Hudson Court 	12550
1335	Rosedale	corina.lynch@msn.com	Corina	Lynch	\N	NY	44 Sunbeam Dr. 	11422
1336	New Windsor	joe.melton@gmail.com	Joe	Melton	\N	NY	8998 Hartford Street 	12553
1337	Longview	bernetta.summers@aol.com	Bernetta	Summers	\N	TX	1 Young Ave. 	75604
1338	Ronkonkoma	inez.snider@gmail.com	Inez	Snider	\N	NY	837 Catherine Lane 	11779
1339	Oceanside	neida.king@aol.com	Neida	King	(442) 778-1121	NY	137 Bohemia St. 	11572
1340	Whitestone	tona.velasquez@msn.com	Tona	Velasquez	\N	NY	9166 Trout St. 	11357
1341	Garden City	rozanne.reyes@aol.com	Rozanne	Reyes	\N	NY	11 W. Surrey Drive 	11530
1342	Freeport	lekisha.pope@msn.com	Lekisha	Pope	\N	NY	390 Livingston Avenue 	11520
1343	Upland	jama.rodriquez@msn.com	Jama	Rodriquez	\N	CA	681 Smith Dr. 	91784
1344	Howard Beach	eloisa.tucker@hotmail.com	Eloisa	Tucker	\N	NY	7268 Leatherwood Ave. 	11414
1345	Flushing	arie.hunter@msn.com	Arie	Hunter	\N	NY	66 Old State Rd. 	11354
1346	Los Angeles	sanora.webster@msn.com	Sanora	Webster	(424) 464-7290	CA	74 Beach St. 	90008
1347	Saratoga Springs	kate.barber@hotmail.com	Kate	Barber	\N	NY	46 W. Oak Valley Ave. 	12866
1348	Merrick	yvone.guerrero@aol.com	Yvone	Guerrero	\N	NY	8548 Jackson Ave. 	11566
1349	Encino	kami.rios@yahoo.com	Kami	Rios	\N	CA	8400 8th Dr. 	91316
1350	Rosedale	annett.rush@hotmail.com	Annett	Rush	\N	NY	758 Fordham Lane 	11422
1351	Jamestown	carman.hardy@yahoo.com	Carman	Hardy	\N	NY	800 Whitemarsh St. 	14701
1352	Upland	dorothea.miranda@aol.com	Dorothea	Miranda	\N	CA	7882 Parker St. 	91784
1353	South El Monte	agatha.daniels@yahoo.com	Agatha	Daniels	\N	CA	125 Canal St. 	91733
1354	Schenectady	alexandria.zamora@yahoo.com	Alexandria	Zamora	\N	NY	95 Cherry Circle 	12302
1355	Levittown	thad.gilliam@hotmail.com	Thad	Gilliam	\N	NY	8844 Gonzales Court 	11756
1356	Patchogue	inger.jennings@yahoo.com	Inger	Jennings	\N	NY	38 NW. Shore Lane 	11772
1357	Fresno	karren.lamb@aol.com	Karren	Lamb	(559) 628-2239	CA	35 N. Chapel St. 	93706
1358	Orchard Park	noble.glover@gmail.com	Noble	Glover	\N	NY	728 W. Rocky River Street 	14127
1359	Levittown	octavia.donaldson@hotmail.com	Octavia	Donaldson	\N	NY	8095 Wayne Ave. 	11756
1360	Upland	latashia.travis@yahoo.com	Latashia	Travis	\N	CA	7877 King Rd. 	91784
1361	Westbury	destiny.goodman@msn.com	Destiny	Goodman	\N	NY	29 Smoky Hollow St. 	11590
1362	Orchard Park	christiana.gross@yahoo.com	Christiana	Gross	\N	NY	645 North Richardson Road 	14127
1363	Houston	nestor.haynes@msn.com	Nestor	Haynes	(281) 969-4579	TX	27 Nut Swamp Street 	77016
1364	Ballston Spa	grisel.maynard@msn.com	Grisel	Maynard	\N	NY	353 North Arch St. 	12020
1365	Queensbury	shenna.espinoza@gmail.com	Shenna	Espinoza	\N	NY	202 North George Street 	12804
1366	Campbell	trena.rogers@aol.com	Trena	Rogers	\N	CA	502 Sherwood St. 	95008
1367	Campbell	lucile.manning@yahoo.com	Lucile	Manning	\N	CA	511 Livingston Lane 	95008
1368	Ballston Spa	veronique.fulton@yahoo.com	Veronique	Fulton	\N	NY	81 Hilldale Ave. 	12020
1369	Shirley	starr.schneider@aol.com	Starr	Schneider	\N	NY	77 Mulberry Street 	11967
1370	San Jose	rona.rojas@gmail.com	Rona	Rojas	(408) 611-3553	CA	815 Riverview St. 	95127
1371	New Hyde Park	pandora.estes@aol.com	Pandora	Estes	\N	NY	228 Shadow Brook Drive 	11040
1372	South Ozone Park	renna.williams@hotmail.com	Renna	Williams	\N	NY	7398 SW. Glen Ridge Road 	11420
1373	West Babylon	lanora.robbins@hotmail.com	Lanora	Robbins	\N	NY	31 W. Maiden Lane 	11704
1374	Glendora	juliane.dillard@aol.com	Juliane	Dillard	\N	CA	63 Birchwood Court 	91740
1375	Jamaica	carlena.salinas@gmail.com	Carlena	Salinas	\N	NY	1 Wagon Street 	11432
1376	Port Washington	kimberley.reynolds@aol.com	Kimberley	Reynolds	\N	NY	8475 Homewood Street 	11050
1377	Rochester	johana.jacobson@gmail.com	Johana	Jacobson	(507) 407-9384	NY	29 San Juan St. 	14606
1378	Fresno	enoch.rosario@hotmail.com	Enoch	Rosario	(559) 329-7615	CA	186 Arlington St. 	93706
1379	Sunnyside	dorine.thornton@gmail.com	Dorine	Thornton	\N	NY	8730 N. Atlantic Street 	11104
1380	Uniondale	eliz.lynch@hotmail.com	Eliz	Lynch	\N	NY	717 West Deerfield Ave. 	11553
1381	Duarte	mercedez.brooks@hotmail.com	Mercedez	Brooks	\N	CA	7483 Ann St. 	91010
1382	Harlingen	wynona.douglas@msn.com	Wynona	Douglas	\N	TX	6 Country Ave. 	78552
1383	Bakersfield	desire.mcgowan@msn.com	Desire	Mcgowan	(661) 800-8091	CA	942 North Ohio Road 	93306
1384	San Carlos	elmo.sweeney@yahoo.com	Elmo	Sweeney	\N	CA	43 Arch Ave. 	94070
1385	Canandaigua	kenton.hughes@gmail.com	Kenton	Hughes	\N	NY	632 Sleepy Hollow Drive 	14424
1386	San Diego	cesar.wilkins@hotmail.com	Cesar	Wilkins	(619) 685-5786	CA	7 Inverness St. 	92111
1387	Canandaigua	phylicia.stout@aol.com	Phylicia	Stout	\N	NY	8842 Littleton Lane 	14424
1388	East Meadow	nanette.harris@hotmail.com	Nanette	Harris	\N	NY	26 Pin Oak Lane 	11554
1389	Port Chester	ulrike.chan@aol.com	Ulrike	Chan	\N	NY	7949 Lancaster St. 	10573
1390	Bayside	genoveva.lloyd@aol.com	Genoveva	Lloyd	\N	NY	706 Devonshire St. 	11361
1391	Floral Park	sheryl.chase@gmail.com	Sheryl	Chase	\N	NY	388 Cedar Avenue 	11001
1392	Fairport	trista.lambert@gmail.com	Trista	Lambert	\N	NY	79 River Street 	14450
1393	Jamaica	vivian.deleon@msn.com	Vivian	Deleon	\N	NY	9925 Hamilton Street 	11432
1394	Amityville	genny.fields@msn.com	Genny	Fields	\N	NY	9145 San Juan Dr. 	11701
1395	Woodhaven	eliseo.knight@msn.com	Eliseo	Knight	\N	NY	693 Holly Street 	11421
1396	Anaheim	delma.bailey@gmail.com	Delma	Bailey	(657) 454-8493	CA	9883 West King Lane 	92806
1397	Webster	dewayne.herring@aol.com	Dewayne	Herring	\N	NY	9015 Willow Lane 	14580
1398	Hopewell Junction	nevada.hood@aol.com	Nevada	Hood	\N	NY	515 Bank Rd. 	12533
1399	Canandaigua	angelika.perry@msn.com	Angelika	Perry	\N	NY	7684 South Branch Drive 	14424
1400	Woodhaven	shayla.hart@msn.com	Shayla	Hart	\N	NY	9092 Aspen St. 	11421
1401	East Elmhurst	willetta.murphy@msn.com	Willetta	Murphy	\N	NY	436 Devonshire Street 	11369
1402	Depew	sandee.alvarado@aol.com	Sandee	Alvarado	\N	NY	69 Bowman Street 	14043
1403	Troy	mila.moody@gmail.com	Mila	Moody	(248) 234-5902	NY	675 Williams St. 	12180
1404	Central Islip	loyce.conway@aol.com	Loyce	Conway	\N	NY	729 State Lane 	11722
1405	Mount Vernon	thanh.figueroa@yahoo.com	Thanh	Figueroa	\N	NY	6 Roberts Drive 	10550
1406	New Hyde Park	farrah.orr@msn.com	Farrah	Orr	\N	NY	8711 W. Ashley St. 	11040
1407	Centereach	hugh.craft@msn.com	Hugh	Craft	\N	NY	8716 Homewood Court 	11720
1408	Port Chester	eleanor.mendez@yahoo.com	Eleanor	Mendez	\N	NY	4 West St. 	10573
1409	Buffalo	lamar.bush@msn.com	Lamar	Bush	(716) 294-7174	NY	76 Lilac Drive 	14215
1410	Yonkers	lurlene.finch@msn.com	Lurlene	Finch	(914) 367-7691	NY	849 Magnolia St. 	10701
1411	Freeport	shanda.stevenson@yahoo.com	Shanda	Stevenson	\N	NY	9547 N. Courtland St. 	11520
1412	Rego Park	adrien.hunter@yahoo.com	Adrien	Hunter	\N	NY	720 Thompson Lane 	11374
1413	New Windsor	ophelia.decker@yahoo.com	Ophelia	Decker	\N	NY	69 Rockwell Court 	12553
1414	Queensbury	sonja.walls@aol.com	Sonja	Walls	\N	NY	30 Marshall Dr. 	12804
1415	Santa Cruz	harold.o'connor@gmail.com	Harold	O'connor	\N	CA	9530 Summerhouse Street 	95060
1416	Astoria	miranda.kennedy@gmail.com	Miranda	Kennedy	\N	NY	726 East High St. 	11102
1417	Forney	jasper.castro@aol.com	Jasper	Castro	\N	TX	977 SE. Railroad Road 	75126
1418	Anaheim	penni.best@msn.com	Penni	Best	(657) 611-2991	CA	875 Second Drive 	92806
1419	Pleasanton	lurlene.cotton@yahoo.com	Lurlene	Cotton	\N	CA	8218 George St. 	94566
1420	Mount Vernon	kelsey.noble@hotmail.com	Kelsey	Noble	\N	NY	36 Pearl Court 	10550
1421	Plattsburgh	edris.barrett@hotmail.com	Edris	Barrett	\N	NY	36 Pulaski Drive 	12901
1422	Smithtown	tempie.jacobson@hotmail.com	Tempie	Jacobson	\N	NY	136 Old Fairview St. 	11787
1423	Fort Worth	dollie.cervantes@aol.com	Dollie	Cervantes	(682) 362-7457	TX	8828 Applegate Drive 	76110
1424	Monsey	lashunda.cole@hotmail.com	Lashunda	Cole	\N	NY	783 Baker St. 	10952
1425	Shirley	justina.jenkins@msn.com	Justina	Jenkins	\N	NY	345 SE. Green Lane 	11967
1426	Corpus Christi	londa.gould@aol.com	Londa	Gould	(361) 206-5550	TX	9169 Beech Lane 	78418
1427	Atwater	mikel.wilkerson@msn.com	Mikel	Wilkerson	\N	CA	9233 Clinton St. 	95301
1428	Santa Cruz	carola.johns@msn.com	Carola	Johns	\N	CA	7077 Fordham Rd. 	95060
1429	Pomona	lorrie.justice@gmail.com	Lorrie	Justice	\N	CA	8396 Brook Drive 	91768
1430	Bakersfield	tayna.wade@hotmail.com	Tayna	Wade	(661) 858-1224	CA	65 Smith Store Dr. 	93306
1431	East Elmhurst	mark.benton@aol.com	Mark	Benton	\N	NY	83 Eagle St. 	11369
1432	East Northport	zona.cameron@aol.com	Zona	Cameron	\N	NY	42 Bridle Court 	11731
1433	Scarsdale	nicola.knight@aol.com	Nicola	Knight	\N	NY	25 SE. Miles Lane 	10583
1434	Liverpool	elana.miles@yahoo.com	Elana	Miles	\N	NY	7077 Euclid Ave. 	13090
1435	Scarsdale	merrie.fowler@aol.com	Merrie	Fowler	\N	NY	532 Leatherwood Ave. 	10583
1436	Bellmore	macie.ayers@msn.com	Macie	Ayers	\N	NY	8730 Longfellow St. 	11710
1437	Rockville Centre	son.warner@hotmail.com	Son	Warner	\N	NY	20 W. Rosewood Ave. 	11570
1438	San Jose	lee.dunn@aol.com	Lee	Dunn	(408) 807-6157	CA	8626 Grand Ave. 	95127
1439	New Rochelle	florrie.little@yahoo.com	Florrie	Little	\N	NY	8330 Marsh St. 	10801
1440	Oakland Gardens	ernest.rollins@yahoo.com	Ernest	Rollins	\N	NY	4 West Ridge Dr. 	11364
1441	Staten Island	jamaal.morrison@msn.com	Jamaal	Morrison	\N	NY	796 SE. Nut Swamp St. 	10301
1442	Brooklyn	cassie.cline@gmail.com	Cassie	Cline	\N	NY	947 Lafayette Drive 	11201
1443	Central Islip	lezlie.lamb@gmail.com	Lezlie	Lamb	\N	NY	401 Brandywine Street 	11722
1444	Canandaigua	ivette.estes@gmail.com	Ivette	Estes	\N	NY	88 N. Canterbury Ave. 	14424
1445	San Lorenzo	ester.acevedo@gmail.com	Ester	Acevedo	\N	CA	671 Miles Court 	94580
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (item_id, order_id, discount, list_price, quantity, product_id) FROM stdin;
1	1	0.20	599.99	1	20
2	1	0.07	1799.99	2	8
3	1	0.05	1549.00	2	10
4	1	0.05	599.99	2	16
5	1	0.20	2899.99	1	4
1	2	0.07	599.99	1	20
2	2	0.05	599.99	2	16
1	3	0.05	999.99	1	3
2	3	0.05	599.99	1	20
1	4	0.10	749.99	2	2
1	5	0.05	1549.00	2	10
2	5	0.07	429.00	1	17
3	5	0.07	599.99	1	26
1	6	0.07	449.00	1	18
2	6	0.05	549.99	2	12
3	6	0.10	599.99	1	20
4	6	0.07	999.99	2	3
5	6	0.07	2999.99	2	9
1	7	0.07	529.99	1	15
2	7	0.10	999.99	1	3
3	7	0.10	429.00	2	17
1	8	0.05	269.99	1	22
2	8	0.07	599.99	2	20
1	9	0.10	3999.99	2	7
1	10	0.10	269.99	1	14
1	11	0.05	1799.99	1	8
2	11	0.10	269.99	2	22
3	11	0.20	599.99	2	16
1	12	0.10	2899.99	2	4
2	12	0.05	1680.99	1	11
1	13	0.10	269.99	1	13
2	13	0.05	429.00	2	17
3	13	0.10	599.99	2	20
4	13	0.05	599.99	2	16
1	14	0.07	469.99	1	6
1	15	0.07	549.99	2	12
2	15	0.07	1799.99	1	8
3	15	0.05	449.00	2	18
4	15	0.20	299.99	2	23
1	16	0.20	1799.99	1	8
2	16	0.05	269.99	1	21
3	16	0.07	269.99	2	13
4	16	0.07	269.99	1	14
1	17	0.07	1799.99	1	8
2	17	0.10	299.99	1	23
3	17	0.10	1320.99	1	5
4	17	0.20	599.99	2	20
1	18	0.20	749.99	2	2
2	18	0.05	269.99	1	22
3	18	0.10	3999.99	1	7
4	18	0.05	499.99	2	25
5	18	0.10	2999.99	2	9
1	19	0.07	1549.00	1	10
2	19	0.20	2999.99	2	9
1	20	0.07	2999.99	1	9
2	20	0.07	1549.00	2	10
1	21	0.05	269.99	1	14
2	21	0.10	429.00	1	17
3	21	0.07	1549.00	1	10
1	22	0.20	529.99	2	15
2	22	0.05	269.99	1	22
1	23	0.05	2899.99	2	4
2	23	0.10	299.99	2	23
3	23	0.20	269.99	1	13
1	24	0.10	999.99	2	3
2	24	0.07	449.00	2	18
1	25	0.20	299.99	2	23
2	25	0.20	1549.00	2	10
3	25	0.20	269.99	1	22
4	25	0.20	269.99	1	14
5	25	0.10	269.99	1	21
1	26	0.05	3999.99	1	7
2	26	0.20	749.99	1	2
3	26	0.20	549.99	1	12
4	26	0.07	269.99	2	21
1	27	0.20	1320.99	1	5
2	27	0.20	449.00	1	19
3	27	0.07	599.99	2	26
4	27	0.07	1799.99	1	8
1	28	0.05	1320.99	1	5
2	28	0.20	3999.99	2	7
3	28	0.10	269.99	2	14
4	28	0.05	469.99	1	6
1	29	0.05	549.99	2	24
2	29	0.20	469.99	1	6
3	29	0.10	269.99	2	21
4	29	0.20	1799.99	1	8
5	29	0.05	269.99	2	14
1	30	0.05	599.99	1	26
2	30	0.07	429.00	1	17
3	30	0.10	449.00	1	19
4	30	0.10	2899.99	1	4
5	30	0.10	3999.99	2	7
1	31	0.05	1680.99	2	11
2	31	0.20	2999.99	2	9
1	32	0.07	1799.99	2	8
2	32	0.07	549.99	2	12
3	32	0.10	499.99	2	25
1	33	0.07	299.99	2	23
2	33	0.10	3999.99	1	7
1	34	0.07	1799.99	2	8
2	34	0.10	1549.00	2	10
3	34	0.20	429.00	2	17
1	35	0.05	449.00	1	18
2	35	0.05	599.99	2	20
3	35	0.20	1320.99	1	5
4	35	0.07	269.99	2	21
5	35	0.07	269.99	1	22
1	36	0.07	2999.99	1	9
2	36	0.05	1320.99	1	5
3	36	0.20	999.99	2	3
1	37	0.05	599.99	2	16
1	38	0.05	3999.99	2	7
2	38	0.07	299.99	1	23
3	38	0.20	499.99	1	25
4	38	0.10	1549.00	2	10
5	38	0.07	549.99	1	24
1	39	0.20	269.99	2	22
2	39	0.20	599.99	2	16
3	39	0.05	999.99	2	3
4	39	0.10	529.99	1	15
1	40	0.20	429.00	1	17
2	40	0.20	1799.99	2	8
1	41	0.10	1320.99	1	5
2	41	0.20	449.00	2	19
3	41	0.20	599.99	2	26
1	42	0.05	449.00	1	19
1	43	0.10	269.99	2	13
2	43	0.05	549.99	2	12
1	44	0.10	3999.99	1	7
2	44	0.05	599.99	1	16
1	45	0.20	2899.99	2	4
2	45	0.07	269.99	1	22
3	45	0.05	269.99	2	21
1	46	0.10	429.00	1	17
1	47	0.05	469.99	1	6
2	47	0.10	529.99	1	15
3	47	0.07	499.99	2	25
4	47	0.20	269.99	1	13
1	48	0.10	1680.99	1	11
2	48	0.20	2899.99	1	4
3	48	0.10	1320.99	2	5
4	48	0.07	269.99	2	14
1	49	0.07	269.99	2	13
1	50	0.05	999.99	1	3
2	50	0.07	599.99	2	26
3	50	0.20	269.99	2	13
1	51	0.05	269.99	1	13
2	51	0.05	599.99	1	20
3	51	0.20	599.99	2	26
1	52	0.07	499.99	1	25
1	53	0.20	1799.99	2	8
2	53	0.05	299.99	2	23
3	53	0.20	269.99	2	14
4	53	0.10	499.99	2	25
1	54	0.20	599.99	2	26
2	54	0.20	999.99	1	3
1	55	0.05	269.99	1	21
2	55	0.20	499.99	2	25
3	55	0.20	529.99	2	15
1	56	0.07	599.99	2	20
1	57	0.10	299.99	2	23
2	57	0.20	449.00	2	19
3	57	0.07	269.99	1	13
1	58	0.05	269.99	2	14
2	58	0.07	449.00	1	18
3	58	0.10	299.99	1	23
1	59	0.05	269.99	1	21
2	59	0.10	749.99	1	2
3	59	0.10	429.00	2	17
1	60	0.05	269.99	2	14
2	60	0.10	2899.99	1	4
3	60	0.07	529.99	1	15
4	60	0.20	269.99	1	22
1	61	0.10	499.99	1	25
2	61	0.05	529.99	2	15
3	61	0.20	1320.99	2	5
1	62	0.07	269.99	1	14
2	62	0.10	1799.99	2	8
3	62	0.10	269.99	2	22
1	63	0.10	499.99	2	25
2	63	0.05	449.00	2	19
3	63	0.10	999.99	1	3
1	64	0.10	499.99	2	25
2	64	0.20	269.99	2	22
3	64	0.20	299.99	2	23
4	64	0.10	549.99	2	24
1	65	0.10	549.99	1	12
1	66	0.20	749.99	1	2
2	66	0.07	299.99	1	23
3	66	0.07	549.99	1	12
1	67	0.20	299.99	2	23
2	67	0.10	549.99	2	12
3	67	0.20	269.99	1	21
4	67	0.10	1320.99	2	5
5	67	0.20	449.00	1	19
1	68	0.07	269.99	2	13
2	68	0.10	429.00	1	17
1	69	0.10	269.99	2	22
2	69	0.20	1320.99	1	5
3	69	0.05	1549.00	1	10
1	70	0.05	999.99	2	3
2	70	0.20	449.00	1	18
3	70	0.05	599.99	1	20
1	71	0.05	599.99	2	26
2	71	0.20	549.99	1	24
3	71	0.10	449.00	1	18
1	72	0.07	429.00	2	17
2	72	0.05	549.99	1	12
3	72	0.10	269.99	2	13
1	73	0.07	269.99	1	22
2	73	0.05	599.99	2	26
3	73	0.07	999.99	2	3
4	73	0.07	499.99	1	25
5	73	0.20	299.99	2	23
1	74	0.05	599.99	2	16
2	74	0.07	469.99	1	6
1	75	0.10	999.99	1	3
2	75	0.07	3999.99	2	7
3	75	0.20	529.99	1	15
1	76	0.05	549.99	1	12
2	76	0.10	1680.99	2	11
3	76	0.07	1320.99	1	5
1	77	0.07	599.99	1	20
2	77	0.10	549.99	2	24
3	77	0.20	599.99	1	26
4	77	0.20	499.99	1	25
1	78	0.07	429.00	1	17
2	78	0.20	449.00	1	19
3	78	0.10	449.00	2	18
4	78	0.10	269.99	2	14
1	79	0.10	2999.99	2	9
2	79	0.05	429.00	2	17
3	79	0.10	469.99	1	6
4	79	0.07	499.99	2	25
1	80	0.10	599.99	1	26
2	80	0.10	549.99	1	24
3	80	0.20	429.00	1	17
1	81	0.20	1549.00	2	10
2	81	0.05	299.99	2	23
3	81	0.05	499.99	2	25
1	82	0.10	499.99	2	25
2	82	0.20	1680.99	2	11
1	83	0.20	599.99	1	20
2	83	0.05	999.99	2	3
1	84	0.07	299.99	2	23
2	84	0.07	529.99	2	15
1	85	0.05	2899.99	2	4
2	85	0.07	449.00	1	18
1	86	0.10	2999.99	2	9
2	86	0.07	299.99	2	23
3	86	0.20	269.99	2	21
4	86	0.10	529.99	1	15
1	87	0.20	599.99	2	20
2	87	0.10	299.99	2	23
1	88	0.07	1549.00	1	10
2	88	0.10	1799.99	2	8
3	88	0.10	3999.99	1	7
1	89	0.05	1320.99	1	5
2	89	0.10	469.99	2	6
1	90	0.10	999.99	1	3
2	90	0.07	469.99	1	6
1	91	0.10	1680.99	1	11
2	91	0.05	499.99	1	25
3	91	0.07	529.99	2	15
4	91	0.07	269.99	2	13
1	92	0.10	1799.99	1	8
1	93	0.07	269.99	2	22
2	93	0.05	429.00	1	17
3	93	0.10	269.99	1	21
4	93	0.20	749.99	1	2
5	93	0.07	1549.00	2	10
1	94	0.05	549.99	1	12
2	94	0.20	2899.99	1	4
3	94	0.20	1680.99	1	11
4	94	0.07	269.99	2	21
1	95	0.20	1549.00	2	10
2	95	0.10	449.00	1	19
3	95	0.20	1799.99	2	8
4	95	0.05	599.99	2	20
1	96	0.10	599.99	1	26
2	96	0.05	299.99	1	23
1	97	0.20	599.99	2	20
2	97	0.07	749.99	1	2
3	97	0.20	469.99	2	6
4	97	0.10	449.00	1	19
1	98	0.07	449.00	1	19
2	98	0.10	269.99	1	21
3	98	0.20	749.99	1	2
4	98	0.20	269.99	2	22
1	99	0.20	269.99	1	13
2	99	0.20	269.99	1	21
3	99	0.05	499.99	2	25
4	99	0.07	3999.99	2	7
5	99	0.20	299.99	2	23
1	100	0.05	549.99	2	12
2	100	0.10	1680.99	2	11
3	100	0.20	3999.99	2	7
4	100	0.20	599.99	2	16
5	100	0.10	549.99	2	24
1	101	0.20	549.99	2	12
1	102	0.05	529.99	1	15
2	102	0.07	269.99	1	22
1	103	0.07	429.00	1	17
2	103	0.05	999.99	1	3
3	103	0.20	449.00	1	18
4	103	0.10	529.99	2	15
5	103	0.10	2999.99	2	9
1	104	0.10	449.00	2	19
2	104	0.05	599.99	1	26
1	105	0.20	1680.99	2	11
2	105	0.05	999.99	1	3
3	105	0.05	2999.99	1	9
1	106	0.10	429.00	1	17
2	106	0.10	269.99	2	13
1	107	0.20	449.00	1	19
2	107	0.10	269.99	2	13
1	108	0.10	1680.99	1	11
2	108	0.07	269.99	2	22
3	108	0.05	599.99	2	16
1	109	0.10	269.99	2	22
2	109	0.07	469.99	1	6
1	110	0.10	269.99	1	14
1	111	0.10	269.99	1	14
2	111	0.07	549.99	2	12
1	112	0.20	299.99	2	23
2	112	0.07	499.99	2	25
3	112	0.05	549.99	2	24
4	112	0.20	1320.99	1	5
1	113	0.07	549.99	2	12
2	113	0.10	549.99	2	24
3	113	0.07	469.99	1	6
4	113	0.20	299.99	1	23
5	113	0.20	1320.99	2	5
1	114	0.05	549.99	1	12
2	114	0.07	749.99	1	2
3	114	0.10	269.99	2	13
1	115	0.20	269.99	1	22
2	115	0.10	449.00	1	19
1	116	0.05	599.99	1	26
1	117	0.20	269.99	2	22
2	117	0.05	599.99	1	26
3	117	0.20	269.99	1	14
4	117	0.05	449.00	1	19
1	118	0.07	449.00	1	18
2	118	0.07	2899.99	1	4
3	118	0.07	469.99	1	6
4	118	0.10	999.99	2	3
5	118	0.07	299.99	2	23
1	119	0.05	499.99	1	25
1	120	0.05	269.99	2	13
2	120	0.05	469.99	2	6
3	120	0.05	1549.00	2	10
4	120	0.05	429.00	1	17
5	120	0.20	599.99	2	16
1	121	0.20	1320.99	1	5
2	121	0.10	269.99	2	14
3	121	0.10	2899.99	2	4
4	121	0.07	549.99	2	24
5	121	0.05	749.99	2	2
1	122	0.10	599.99	1	16
1	123	0.10	549.99	2	12
1	124	0.05	599.99	1	16
2	124	0.07	2899.99	1	4
3	124	0.05	3999.99	2	7
1	125	0.10	429.00	1	17
1	126	0.05	2999.99	2	9
1	127	0.07	429.00	1	17
2	127	0.10	599.99	1	20
3	127	0.07	2899.99	2	4
1	128	0.10	549.99	2	24
2	128	0.10	599.99	2	16
3	128	0.20	2899.99	2	4
4	128	0.20	999.99	2	3
1	129	0.10	449.00	1	18
2	129	0.10	2999.99	1	9
1	130	0.05	599.99	1	26
2	130	0.07	1320.99	2	5
1	131	0.20	269.99	2	22
2	131	0.07	2899.99	2	4
3	131	0.10	549.99	2	24
1	132	0.05	749.99	2	2
2	132	0.05	599.99	1	20
3	132	0.10	2999.99	1	9
1	133	0.05	269.99	2	13
2	133	0.20	269.99	1	22
1	134	0.10	449.00	2	19
2	134	0.07	749.99	2	2
3	134	0.07	449.00	2	18
1	135	0.05	1320.99	2	5
2	135	0.05	449.00	2	18
3	135	0.20	499.99	1	25
4	135	0.05	749.99	1	2
1	136	0.20	3999.99	2	7
2	136	0.05	999.99	2	3
1	137	0.07	299.99	1	23
2	137	0.10	269.99	1	22
1	138	0.10	599.99	2	16
2	138	0.20	469.99	1	6
1	139	0.07	449.00	2	19
2	139	0.07	999.99	1	3
1	140	0.20	529.99	1	15
2	140	0.20	269.99	1	21
3	140	0.20	549.99	2	12
4	140	0.05	999.99	1	3
1	141	0.20	449.00	1	18
1	142	0.10	599.99	2	16
2	142	0.10	1680.99	2	11
3	142	0.07	449.00	1	19
1	143	0.20	469.99	1	6
1	144	0.05	1799.99	2	8
1	145	0.20	1680.99	1	11
2	145	0.10	2999.99	2	9
1	146	0.20	999.99	2	3
2	146	0.10	549.99	1	12
3	146	0.10	599.99	2	20
4	146	0.05	469.99	2	6
5	146	0.07	749.99	1	2
1	147	0.20	599.99	2	26
1	148	0.05	269.99	1	14
1	149	0.07	549.99	2	12
2	149	0.07	269.99	2	21
1	150	0.10	3999.99	1	7
2	150	0.20	999.99	1	3
3	150	0.07	429.00	1	17
4	150	0.07	499.99	2	25
1	151	0.10	429.00	1	17
2	151	0.10	599.99	1	26
1	152	0.20	469.99	2	6
2	152	0.20	269.99	2	22
3	152	0.07	599.99	2	16
1	153	0.07	599.99	1	16
2	153	0.07	1799.99	1	8
3	153	0.05	529.99	2	15
1	154	0.10	549.99	1	12
1	155	0.10	1799.99	1	8
1	156	0.20	449.00	2	18
2	156	0.05	429.00	2	17
3	156	0.07	469.99	1	6
1	157	0.10	2899.99	1	4
2	157	0.07	3999.99	2	7
1	158	0.10	549.99	1	24
1	159	0.20	269.99	1	13
1	160	0.07	269.99	1	21
2	160	0.07	529.99	2	15
3	160	0.10	449.00	2	18
4	160	0.05	1680.99	1	11
1	161	0.07	549.99	2	24
2	161	0.05	269.99	1	22
3	161	0.05	3999.99	2	7
1	162	0.07	449.00	1	18
2	162	0.07	269.99	2	21
3	162	0.10	999.99	2	3
1	163	0.10	549.99	1	12
2	163	0.20	449.00	1	18
1	164	0.05	2899.99	2	4
2	164	0.05	1549.00	2	10
3	164	0.10	269.99	1	14
1	165	0.05	2899.99	2	4
2	165	0.20	299.99	1	23
3	165	0.05	749.99	1	2
1	166	0.10	1549.00	2	10
2	166	0.20	1680.99	1	11
1	167	0.05	549.99	1	12
2	167	0.20	1549.00	1	10
3	167	0.05	269.99	2	13
4	167	0.05	3999.99	2	7
1	168	0.10	469.99	1	6
2	168	0.07	1680.99	2	11
3	168	0.07	549.99	2	12
4	168	0.20	269.99	2	22
1	169	0.10	599.99	2	20
2	169	0.05	1320.99	1	5
3	169	0.20	1549.00	1	10
4	169	0.20	1680.99	1	11
5	169	0.05	269.99	2	14
1	170	0.10	549.99	2	12
2	170	0.05	549.99	1	24
3	170	0.20	3999.99	1	7
4	170	0.05	449.00	2	18
1	171	0.05	1799.99	1	8
1	172	0.07	299.99	1	23
2	172	0.20	599.99	1	16
1	173	0.05	269.99	1	14
2	173	0.20	599.99	1	16
3	173	0.05	599.99	2	20
1	174	0.20	269.99	2	22
2	174	0.10	449.00	2	19
1	175	0.10	1320.99	1	5
2	175	0.20	749.99	2	2
3	175	0.10	269.99	2	21
4	175	0.07	449.00	1	19
1	176	0.07	749.99	2	2
2	176	0.20	1680.99	2	11
3	176	0.05	599.99	2	16
1	177	0.10	599.99	2	20
1	178	0.20	1549.00	2	10
2	178	0.05	549.99	1	12
3	178	0.10	999.99	1	3
4	178	0.07	449.00	1	18
1	179	0.05	269.99	2	13
2	179	0.10	599.99	1	26
3	179	0.20	449.00	1	18
4	179	0.20	549.99	2	12
5	179	0.10	599.99	2	20
1	180	0.07	599.99	1	16
1	181	0.05	1549.00	1	10
2	181	0.10	1680.99	1	11
3	181	0.20	529.99	2	15
4	181	0.05	549.99	2	24
1	182	0.05	499.99	2	25
2	182	0.07	549.99	2	24
1	183	0.20	1680.99	2	11
2	183	0.05	549.99	2	12
3	183	0.07	449.00	1	19
4	183	0.07	429.00	1	17
1	184	0.20	2899.99	1	4
2	184	0.10	1320.99	1	5
3	184	0.10	269.99	1	14
1	185	0.10	599.99	1	20
2	185	0.05	1799.99	1	8
1	186	0.10	2899.99	1	4
2	186	0.10	469.99	1	6
1	187	0.05	1320.99	1	5
1	188	0.07	3999.99	2	7
1	189	0.20	599.99	2	16
1	190	0.05	549.99	1	24
2	190	0.20	529.99	1	15
3	190	0.20	999.99	2	3
1	191	0.05	499.99	1	25
2	191	0.20	549.99	2	12
3	191	0.07	999.99	1	3
4	191	0.05	1799.99	2	8
5	191	0.05	299.99	1	23
1	192	0.10	1799.99	2	8
2	192	0.07	499.99	1	25
3	192	0.05	749.99	1	2
4	192	0.07	549.99	2	24
5	192	0.20	1549.00	2	10
1	193	0.10	549.99	2	12
1	194	0.20	269.99	2	21
1	195	0.20	449.00	1	18
2	195	0.05	269.99	1	14
3	195	0.20	1320.99	2	5
4	195	0.20	2899.99	2	4
5	195	0.10	269.99	2	21
1	196	0.05	469.99	1	6
2	196	0.07	999.99	2	3
3	196	0.07	1549.00	2	10
4	196	0.07	549.99	1	12
5	196	0.10	599.99	1	20
1	197	0.20	2899.99	2	4
2	197	0.07	749.99	2	2
1	198	0.05	469.99	2	6
2	198	0.07	599.99	2	20
3	198	0.20	1799.99	2	8
4	198	0.05	269.99	2	13
5	198	0.05	429.00	1	17
1	199	0.05	499.99	2	25
2	199	0.07	449.00	2	18
3	199	0.20	2899.99	1	4
1	200	0.05	299.99	2	23
2	200	0.07	269.99	2	22
1	201	0.05	549.99	1	24
2	201	0.20	3999.99	1	7
3	201	0.10	269.99	2	14
4	201	0.05	429.00	1	17
1	202	0.07	1799.99	1	8
2	202	0.05	429.00	1	17
3	202	0.05	529.99	2	15
4	202	0.05	499.99	2	25
1	203	0.05	599.99	1	26
2	203	0.10	999.99	2	3
3	203	0.20	429.00	2	17
4	203	0.07	449.00	2	19
1	204	0.07	469.99	2	6
2	204	0.10	429.00	2	17
1	205	0.05	269.99	2	22
2	205	0.10	549.99	2	24
1	206	0.05	499.99	1	25
2	206	0.20	599.99	1	20
1	207	0.20	549.99	2	12
2	207	0.05	1320.99	1	5
3	207	0.07	1680.99	2	11
4	207	0.10	3999.99	2	7
1	208	0.05	469.99	2	6
2	208	0.07	2899.99	2	4
3	208	0.05	999.99	1	3
4	208	0.20	549.99	1	12
5	208	0.05	1549.00	2	10
1	209	0.10	269.99	1	13
1	210	0.07	269.99	1	14
2	210	0.20	269.99	2	13
1	211	0.07	1549.00	1	10
2	211	0.07	749.99	2	2
1	212	0.07	599.99	2	16
2	212	0.20	549.99	2	12
3	212	0.10	449.00	1	19
4	212	0.20	3999.99	1	7
1	213	0.10	269.99	1	13
1	214	0.10	269.99	1	21
1	215	0.07	449.00	1	19
2	215	0.10	549.99	2	12
1	216	0.10	269.99	2	22
2	216	0.05	599.99	2	16
1	217	0.10	449.00	1	18
2	217	0.10	1549.00	2	10
3	217	0.07	429.00	1	17
1	218	0.10	749.99	2	2
2	218	0.07	269.99	1	13
3	218	0.05	549.99	1	12
1	219	0.05	599.99	1	26
2	219	0.20	1320.99	1	5
1	220	0.05	469.99	2	6
2	220	0.07	499.99	1	25
3	220	0.10	269.99	2	22
4	220	0.20	999.99	2	3
1	221	0.07	1680.99	2	11
1	222	0.10	1549.00	1	10
2	222	0.10	749.99	2	2
1	223	0.05	3999.99	2	7
2	223	0.20	1320.99	1	5
3	223	0.10	269.99	2	21
4	223	0.05	599.99	1	20
5	223	0.05	529.99	1	15
1	224	0.07	469.99	1	6
2	224	0.10	1680.99	2	11
3	224	0.20	1549.00	2	10
4	224	0.05	499.99	1	25
1	225	0.10	269.99	1	21
2	225	0.10	2999.99	1	9
1	226	0.05	749.99	1	2
1	227	0.05	999.99	2	3
2	227	0.10	529.99	2	15
1	228	0.20	499.99	1	25
2	228	0.07	749.99	2	2
3	228	0.10	299.99	2	23
4	228	0.20	2899.99	1	4
5	228	0.05	269.99	1	22
1	229	0.20	499.99	2	25
2	229	0.10	1320.99	2	5
3	229	0.20	1799.99	1	8
1	230	0.07	1680.99	2	11
1	231	0.07	1799.99	2	8
2	231	0.20	269.99	2	14
3	231	0.20	1320.99	2	5
1	232	0.07	449.00	1	18
2	232	0.05	1680.99	2	11
3	232	0.07	599.99	2	26
4	232	0.10	1799.99	2	8
1	233	0.10	269.99	1	14
2	233	0.10	599.99	2	16
3	233	0.20	549.99	1	12
4	233	0.07	529.99	2	15
1	234	0.20	1680.99	2	11
2	234	0.05	429.00	2	17
3	234	0.10	549.99	1	12
4	234	0.05	3999.99	1	7
5	234	0.10	299.99	1	23
1	235	0.07	469.99	1	6
2	235	0.05	269.99	2	13
3	235	0.05	3999.99	2	7
1	236	0.07	999.99	2	3
2	236	0.10	749.99	2	2
3	236	0.10	2899.99	2	4
1	237	0.20	529.99	1	15
2	237	0.07	549.99	1	24
3	237	0.20	599.99	2	20
4	237	0.05	599.99	1	26
1	238	0.20	599.99	2	20
2	238	0.07	499.99	1	25
3	238	0.20	269.99	2	13
4	238	0.05	269.99	2	22
5	238	0.07	3999.99	1	7
1	239	0.10	599.99	2	16
2	239	0.05	269.99	2	21
3	239	0.07	449.00	1	18
4	239	0.07	2899.99	2	4
1	240	0.07	2999.99	1	9
2	240	0.07	1799.99	1	8
3	240	0.07	1320.99	1	5
4	240	0.07	449.00	2	18
1	241	0.20	3999.99	1	7
1	242	0.20	999.99	1	3
1	243	0.05	499.99	2	25
2	243	0.07	449.00	2	19
3	243	0.05	3999.99	2	7
1	244	0.07	449.00	1	19
2	244	0.20	499.99	1	25
3	244	0.10	269.99	1	22
1	245	0.05	1549.00	2	10
2	245	0.10	1799.99	1	8
1	246	0.20	429.00	2	17
1	247	0.07	499.99	1	25
2	247	0.20	999.99	1	3
1	248	0.10	269.99	1	13
2	248	0.10	599.99	2	26
3	248	0.10	429.00	1	17
4	248	0.20	2999.99	1	9
1	249	0.05	3999.99	2	7
2	249	0.05	449.00	2	18
3	249	0.10	269.99	1	22
1	250	0.05	429.00	2	17
2	250	0.10	1680.99	2	11
1	251	0.20	299.99	2	23
2	251	0.05	269.99	2	22
1	252	0.10	1680.99	2	11
2	252	0.07	2899.99	1	4
3	252	0.10	449.00	1	19
1	253	0.07	1680.99	2	11
1	254	0.07	469.99	2	6
2	254	0.05	999.99	1	3
3	254	0.05	549.99	1	12
1	255	0.10	1320.99	2	5
2	255	0.20	269.99	1	14
3	255	0.20	749.99	2	2
4	255	0.07	269.99	1	21
1	256	0.10	1680.99	1	11
2	256	0.05	269.99	1	21
1	257	0.07	1799.99	2	8
2	257	0.20	269.99	2	13
3	257	0.10	1549.00	2	10
4	257	0.10	529.99	1	15
1	258	0.05	1799.99	2	8
2	258	0.07	2899.99	1	4
3	258	0.07	449.00	1	19
4	258	0.05	449.00	1	18
1	259	0.05	599.99	1	26
2	259	0.10	469.99	2	6
3	259	0.20	749.99	2	2
4	259	0.10	2899.99	1	4
1	260	0.20	299.99	2	23
2	260	0.20	1549.00	1	10
3	260	0.20	549.99	2	24
1	261	0.05	599.99	2	16
2	261	0.10	269.99	1	14
3	261	0.10	429.00	2	17
1	262	0.07	749.99	1	2
2	262	0.05	2999.99	2	9
1	263	0.07	2999.99	1	9
2	263	0.20	999.99	1	3
3	263	0.05	749.99	2	2
1	264	0.20	1549.00	1	10
2	264	0.05	549.99	2	24
3	264	0.10	529.99	2	15
4	264	0.07	999.99	2	3
1	265	0.20	2999.99	2	9
1	266	0.07	469.99	2	6
2	266	0.20	449.00	1	19
3	266	0.05	499.99	1	25
1	267	0.20	269.99	2	22
2	267	0.10	299.99	2	23
3	267	0.10	549.99	1	24
4	267	0.07	3999.99	2	7
5	267	0.05	269.99	1	21
1	268	0.05	3999.99	1	7
2	268	0.20	469.99	2	6
3	268	0.10	2999.99	1	9
1	269	0.07	1320.99	1	5
2	269	0.07	299.99	2	23
3	269	0.05	449.00	1	18
4	269	0.05	999.99	1	3
1	270	0.20	499.99	2	25
2	270	0.10	529.99	1	15
1	271	0.07	1680.99	2	11
2	271	0.05	469.99	2	6
3	271	0.10	269.99	1	13
4	271	0.10	3999.99	2	7
1	272	0.07	749.99	2	2
2	272	0.07	1680.99	1	11
1	273	0.10	269.99	1	21
1	274	0.05	1680.99	2	11
2	274	0.10	499.99	2	25
3	274	0.07	2999.99	2	9
1	275	0.05	449.00	1	18
2	275	0.10	499.99	1	25
3	275	0.05	3999.99	2	7
1	276	0.20	999.99	2	3
2	276	0.05	429.00	1	17
3	276	0.07	2999.99	2	9
1	277	0.20	599.99	2	20
2	277	0.20	469.99	2	6
3	277	0.10	269.99	2	13
1	278	0.20	599.99	1	16
2	278	0.07	449.00	2	19
3	278	0.07	269.99	1	13
4	278	0.07	1680.99	2	11
1	279	0.07	499.99	1	25
1	280	0.07	499.99	1	25
2	280	0.07	599.99	2	26
3	280	0.07	269.99	1	13
1	281	0.07	269.99	1	22
2	281	0.10	269.99	2	14
3	281	0.07	3999.99	2	7
1	282	0.07	599.99	1	20
2	282	0.07	3999.99	2	7
3	282	0.05	999.99	2	3
4	282	0.07	599.99	2	16
1	283	0.05	2999.99	1	9
2	283	0.20	599.99	2	16
1	284	0.20	549.99	2	24
2	284	0.20	599.99	1	20
1	285	0.05	599.99	2	16
2	285	0.05	549.99	1	12
3	285	0.10	749.99	1	2
1	286	0.20	599.99	2	26
2	286	0.07	269.99	2	21
3	286	0.10	599.99	2	16
4	286	0.10	3999.99	1	7
1	287	0.20	1320.99	1	5
2	287	0.05	1549.00	1	10
3	287	0.05	749.99	1	2
4	287	0.05	599.99	1	20
1	288	0.20	2899.99	1	4
2	288	0.10	1549.00	1	10
3	288	0.05	3999.99	2	7
1	289	0.07	269.99	1	13
2	289	0.20	549.99	1	24
3	289	0.20	429.00	1	17
1	290	0.07	749.99	2	2
2	290	0.07	1320.99	2	5
3	290	0.10	269.99	1	21
1	291	0.05	469.99	2	6
2	291	0.07	269.99	2	21
1	292	0.10	449.00	2	18
2	292	0.07	2899.99	1	4
3	292	0.05	1549.00	2	10
1	293	0.05	449.00	2	19
2	293	0.20	469.99	1	6
1	294	0.20	449.00	1	18
2	294	0.20	269.99	1	14
3	294	0.05	3999.99	2	7
4	294	0.20	499.99	2	25
1	295	0.07	269.99	2	22
1	296	0.07	499.99	2	25
2	296	0.10	549.99	2	12
3	296	0.10	1680.99	2	11
4	296	0.20	2999.99	1	9
1	297	0.20	2899.99	2	4
1	298	0.20	299.99	1	23
2	298	0.05	469.99	2	6
3	298	0.20	269.99	1	22
4	298	0.07	2999.99	1	9
5	298	0.10	269.99	2	14
1	299	0.05	1680.99	2	11
2	299	0.20	1549.00	2	10
1	300	0.10	599.99	2	16
2	300	0.10	2999.99	2	9
3	300	0.10	1549.00	1	10
4	300	0.20	1680.99	2	11
1	301	0.05	469.99	1	6
2	301	0.10	269.99	1	22
1	302	0.20	549.99	2	24
2	302	0.07	449.00	2	18
3	302	0.20	749.99	2	2
1	303	0.05	1799.99	2	8
2	303	0.05	549.99	2	24
1	304	0.05	1549.00	1	10
2	304	0.10	3999.99	2	7
3	304	0.10	599.99	1	20
1	305	0.07	1549.00	1	10
2	305	0.10	469.99	1	6
3	305	0.20	999.99	2	3
1	306	0.20	1549.00	1	10
2	306	0.07	269.99	1	22
1	307	0.05	529.99	2	15
1	308	0.10	3999.99	1	7
2	308	0.20	449.00	2	18
3	308	0.20	269.99	1	14
1	309	0.05	999.99	1	3
2	309	0.05	549.99	1	12
1	310	0.07	3999.99	2	7
2	310	0.10	269.99	2	14
3	310	0.20	1320.99	2	5
4	310	0.20	1799.99	1	8
1	311	0.05	429.00	2	17
2	311	0.20	1320.99	2	5
1	312	0.05	549.99	2	24
2	312	0.07	269.99	2	14
3	312	0.05	599.99	2	16
1	313	0.07	2899.99	1	4
2	313	0.07	1549.00	2	10
1	314	0.07	1320.99	1	5
2	314	0.05	2999.99	1	9
3	314	0.20	269.99	2	22
4	314	0.07	3999.99	2	7
1	315	0.20	1680.99	1	11
2	315	0.10	2999.99	1	9
1	316	0.20	749.99	2	2
2	316	0.10	599.99	2	16
3	316	0.10	599.99	1	20
4	316	0.20	449.00	1	19
5	316	0.05	429.00	1	17
1	317	0.20	1549.00	1	10
2	317	0.05	269.99	1	22
3	317	0.05	529.99	1	15
4	317	0.20	269.99	2	13
1	318	0.10	269.99	2	13
2	318	0.20	499.99	2	25
3	318	0.05	2999.99	1	9
1	319	0.07	1680.99	1	11
2	319	0.20	269.99	1	21
3	319	0.10	529.99	2	15
4	319	0.05	299.99	1	23
1	320	0.10	749.99	1	2
1	321	0.20	2899.99	2	4
2	321	0.20	549.99	2	12
3	321	0.20	599.99	1	26
4	321	0.20	299.99	2	23
1	322	0.20	269.99	2	13
2	322	0.07	269.99	1	21
1	323	0.07	269.99	2	13
2	323	0.10	599.99	2	26
1	324	0.10	749.99	2	2
2	324	0.20	429.00	1	17
3	324	0.20	269.99	2	22
4	324	0.05	449.00	1	19
5	324	0.05	549.99	1	12
1	325	0.05	3999.99	1	7
2	325	0.20	549.99	1	12
3	325	0.20	469.99	2	6
1	326	0.10	549.99	1	12
2	326	0.07	299.99	1	23
1	327	0.07	549.99	2	12
2	327	0.07	269.99	1	13
3	327	0.05	2899.99	1	4
1	328	0.10	469.99	2	6
1	329	0.07	269.99	2	14
2	329	0.05	1799.99	2	8
3	329	0.20	299.99	1	23
4	329	0.07	429.00	1	17
5	329	0.05	599.99	2	26
1	330	0.05	269.99	2	21
1	331	0.10	429.00	2	17
1	332	0.05	449.00	2	18
1	333	0.07	449.00	2	18
2	333	0.05	1799.99	2	8
3	333	0.20	999.99	1	3
1	334	0.20	599.99	2	16
2	334	0.05	2999.99	1	9
3	334	0.05	999.99	2	3
1	335	0.10	469.99	1	6
2	335	0.10	749.99	2	2
3	335	0.07	269.99	1	21
1	336	0.10	2899.99	1	4
2	336	0.20	549.99	1	12
1	337	0.05	449.00	1	18
2	337	0.05	2899.99	1	4
1	338	0.07	469.99	2	6
2	338	0.07	1549.00	1	10
3	338	0.10	269.99	1	22
4	338	0.07	1680.99	2	11
5	338	0.05	2999.99	1	9
1	339	0.10	269.99	1	13
2	339	0.05	529.99	2	15
1	340	0.05	1680.99	1	11
2	340	0.05	549.99	1	24
3	340	0.10	269.99	2	13
4	340	0.07	549.99	2	12
5	340	0.10	1549.00	2	10
1	341	0.05	299.99	2	23
1	342	0.07	599.99	1	26
2	342	0.20	2999.99	1	9
3	342	0.10	599.99	2	16
1	343	0.20	599.99	2	20
2	343	0.05	499.99	1	25
3	343	0.05	1320.99	2	5
4	343	0.10	1549.00	1	10
1	344	0.05	269.99	1	22
2	344	0.07	449.00	2	18
3	344	0.20	269.99	1	14
1	345	0.10	449.00	2	18
2	345	0.07	549.99	2	24
1	346	0.07	269.99	1	13
2	346	0.20	299.99	1	23
3	346	0.10	269.99	1	21
4	346	0.05	529.99	1	15
5	346	0.05	449.00	2	18
1	347	0.07	299.99	1	23
1	348	0.05	1320.99	2	5
2	348	0.07	529.99	2	15
1	349	0.20	599.99	2	20
1	350	0.05	469.99	2	6
2	350	0.07	599.99	1	20
3	350	0.07	999.99	1	3
1	351	0.05	2899.99	2	4
2	351	0.10	549.99	2	24
3	351	0.20	599.99	1	20
4	351	0.07	269.99	2	22
1	352	0.20	1680.99	1	11
2	352	0.20	269.99	1	14
1	353	0.20	749.99	2	2
1	354	0.20	269.99	1	21
2	354	0.05	449.00	1	19
1	355	0.10	599.99	1	16
2	355	0.07	269.99	2	14
1	356	0.05	299.99	2	23
2	356	0.05	2899.99	1	4
3	356	0.05	269.99	1	13
1	357	0.05	429.00	2	17
2	357	0.07	269.99	2	21
3	357	0.07	549.99	1	24
4	357	0.05	2999.99	1	9
1	358	0.10	269.99	2	21
2	358	0.07	469.99	2	6
3	358	0.05	1799.99	2	8
4	358	0.10	449.00	2	18
1	359	0.07	529.99	2	15
2	359	0.07	2999.99	2	9
3	359	0.20	3999.99	2	7
1	360	0.05	599.99	1	26
2	360	0.20	3999.99	2	7
3	360	0.05	269.99	2	13
4	360	0.10	499.99	1	25
1	361	0.05	549.99	2	24
2	361	0.10	469.99	2	6
3	361	0.10	1680.99	1	11
1	362	0.07	749.99	1	2
1	363	0.10	269.99	2	21
2	363	0.07	269.99	1	14
3	363	0.10	529.99	1	15
4	363	0.20	599.99	1	20
1	364	0.05	499.99	2	25
1	365	0.07	549.99	2	24
1	366	0.10	269.99	1	21
2	366	0.07	2899.99	1	4
3	366	0.20	599.99	2	16
1	367	0.10	599.99	2	26
2	367	0.05	269.99	1	14
3	367	0.05	1549.00	2	10
1	368	0.20	1320.99	1	5
2	368	0.20	1549.00	2	10
3	368	0.10	269.99	2	21
4	368	0.05	449.00	1	19
1	369	0.07	1549.00	2	10
1	370	0.05	499.99	2	25
2	370	0.10	2899.99	2	4
1	371	0.20	269.99	1	14
2	371	0.20	549.99	1	12
1	372	0.05	1680.99	1	11
2	372	0.10	269.99	2	14
3	372	0.10	1320.99	1	5
1	373	0.05	1799.99	2	8
2	373	0.10	269.99	1	22
3	373	0.20	449.00	2	19
4	373	0.10	549.99	1	12
5	373	0.10	269.99	1	13
1	374	0.10	1549.00	1	10
2	374	0.07	3999.99	1	7
1	375	0.05	269.99	2	21
2	375	0.05	749.99	2	2
3	375	0.07	2899.99	2	4
4	375	0.05	549.99	2	12
1	376	0.07	749.99	2	2
2	376	0.10	299.99	2	23
1	377	0.05	1799.99	1	8
2	377	0.07	269.99	1	14
1	378	0.05	599.99	2	26
1	379	0.07	2999.99	1	9
2	379	0.20	599.99	1	16
1	380	0.05	599.99	1	16
2	380	0.05	1680.99	2	11
1	381	0.07	269.99	2	21
1	382	0.10	1799.99	1	8
2	382	0.10	2999.99	1	9
3	382	0.07	269.99	1	13
1	383	0.07	449.00	1	19
2	383	0.05	269.99	2	22
3	383	0.10	269.99	1	13
4	383	0.05	269.99	2	21
5	383	0.10	269.99	1	14
1	384	0.10	599.99	1	20
2	384	0.20	269.99	2	21
3	384	0.05	1799.99	1	8
4	384	0.10	529.99	1	15
5	384	0.20	2899.99	1	4
1	385	0.07	269.99	1	21
2	385	0.20	3999.99	2	7
3	385	0.05	599.99	2	26
1	386	0.20	1799.99	1	8
2	386	0.05	999.99	2	3
3	386	0.20	599.99	2	16
1	387	0.20	449.00	1	18
1	388	0.20	449.00	2	19
2	388	0.07	269.99	2	13
3	388	0.07	749.99	1	2
4	388	0.10	1680.99	1	11
1	389	0.07	749.99	1	2
2	389	0.07	529.99	2	15
3	389	0.05	1549.00	2	10
4	389	0.05	1320.99	1	5
5	389	0.20	2999.99	1	9
1	390	0.05	299.99	1	23
2	390	0.07	3999.99	2	7
3	390	0.05	2999.99	1	9
1	391	0.07	1799.99	1	8
2	391	0.20	1320.99	2	5
3	391	0.07	549.99	2	24
1	392	0.10	269.99	2	14
2	392	0.05	999.99	2	3
1	393	0.20	469.99	2	6
1	394	0.05	299.99	1	23
2	394	0.20	599.99	1	16
3	394	0.20	269.99	2	14
1	395	0.05	269.99	1	14
1	396	0.10	549.99	1	12
2	396	0.05	499.99	2	25
3	396	0.20	1320.99	1	5
1	397	0.05	3999.99	1	7
1	398	0.05	1799.99	2	8
2	398	0.05	449.00	2	18
3	398	0.20	499.99	1	25
4	398	0.05	429.00	1	17
1	399	0.05	499.99	1	25
2	399	0.05	1680.99	2	11
3	399	0.10	269.99	1	14
1	400	0.07	549.99	2	24
2	400	0.20	2999.99	1	9
3	400	0.20	999.99	2	3
1	401	0.20	299.99	1	23
2	401	0.20	1549.00	2	10
1	402	0.07	469.99	2	6
2	402	0.07	1320.99	1	5
3	402	0.05	599.99	1	26
1	403	0.10	549.99	2	12
2	403	0.20	3999.99	2	7
3	403	0.05	269.99	2	22
4	403	0.20	549.99	1	24
1	404	0.07	2999.99	1	9
2	404	0.05	499.99	2	25
3	404	0.20	599.99	2	16
1	405	0.20	999.99	2	3
2	405	0.10	1549.00	2	10
3	405	0.07	269.99	2	14
1	406	0.20	2899.99	1	4
1	407	0.20	599.99	1	20
2	407	0.05	1320.99	1	5
1	408	0.20	449.00	1	18
2	408	0.07	999.99	1	3
3	408	0.07	749.99	2	2
4	408	0.20	429.00	2	17
1	409	0.07	529.99	1	15
2	409	0.20	599.99	2	16
3	409	0.05	269.99	1	21
1	410	0.10	499.99	1	25
2	410	0.05	2999.99	2	9
3	410	0.10	549.99	2	24
1	411	0.07	749.99	1	2
2	411	0.05	599.99	2	26
1	412	0.10	3999.99	1	7
2	412	0.07	549.99	1	24
3	412	0.10	429.00	1	17
1	413	0.05	1799.99	2	8
2	413	0.10	499.99	1	25
3	413	0.07	2999.99	1	9
1	414	0.10	2899.99	2	4
1	415	0.07	999.99	1	3
2	415	0.20	299.99	2	23
3	415	0.20	1320.99	1	5
4	415	0.05	469.99	2	6
1	416	0.07	269.99	1	22
2	416	0.07	269.99	1	14
3	416	0.10	549.99	1	24
1	417	0.07	599.99	2	26
2	417	0.07	469.99	2	6
1	418	0.05	549.99	1	12
2	418	0.05	599.99	1	20
1	419	0.05	2999.99	1	9
1	420	0.20	429.00	2	17
2	420	0.10	529.99	2	15
3	420	0.05	999.99	2	3
1	421	0.07	469.99	2	6
2	421	0.20	999.99	2	3
3	421	0.20	599.99	2	20
4	421	0.07	2899.99	1	4
5	421	0.20	299.99	2	23
1	422	0.05	599.99	2	20
1	423	0.05	1799.99	2	8
2	423	0.20	429.00	1	17
3	423	0.07	299.99	2	23
4	423	0.20	749.99	1	2
1	424	0.10	269.99	1	22
2	424	0.05	469.99	1	6
1	425	0.10	469.99	1	6
2	425	0.07	269.99	2	21
3	425	0.05	449.00	1	19
1	426	0.10	1549.00	1	10
2	426	0.05	299.99	2	23
1	427	0.07	549.99	2	12
2	427	0.10	529.99	2	15
3	427	0.07	599.99	2	26
1	428	0.20	1320.99	2	5
2	428	0.20	269.99	1	14
1	429	0.20	1680.99	1	11
2	429	0.10	2899.99	2	4
3	429	0.05	1320.99	2	5
4	429	0.07	469.99	1	6
5	429	0.10	749.99	1	2
1	430	0.10	269.99	2	22
2	430	0.07	1680.99	1	11
3	430	0.20	2899.99	2	4
4	430	0.20	269.99	2	13
5	430	0.20	1799.99	1	8
1	431	0.20	269.99	2	14
2	431	0.10	469.99	1	6
3	431	0.20	449.00	1	18
4	431	0.07	269.99	2	13
5	431	0.07	449.00	1	19
1	432	0.20	1549.00	2	10
2	432	0.05	3999.99	2	7
1	433	0.10	469.99	1	6
2	433	0.20	1549.00	1	10
3	433	0.10	549.99	1	24
4	433	0.20	2899.99	1	4
1	434	0.05	269.99	1	21
2	434	0.10	599.99	1	20
3	434	0.20	2999.99	1	9
4	434	0.07	1680.99	2	11
5	434	0.05	449.00	2	18
1	435	0.05	269.99	1	22
2	435	0.05	2999.99	1	9
3	435	0.05	449.00	1	18
1	436	0.05	999.99	1	3
2	436	0.20	299.99	1	23
1	437	0.05	999.99	1	3
2	437	0.05	1549.00	1	10
3	437	0.05	1799.99	2	8
1	438	0.07	2899.99	1	4
2	438	0.10	269.99	1	22
3	438	0.05	1799.99	2	8
4	438	0.05	269.99	2	13
1	439	0.07	469.99	2	6
2	439	0.05	3999.99	2	7
1	440	0.07	449.00	2	19
2	440	0.07	2899.99	2	4
1	441	0.07	549.99	1	12
2	441	0.10	529.99	1	15
1	442	0.07	599.99	2	16
2	442	0.20	599.99	2	26
3	442	0.20	469.99	2	6
1	443	0.05	1320.99	1	5
2	443	0.20	599.99	1	26
1	444	0.07	269.99	1	22
2	444	0.07	529.99	2	15
3	444	0.05	599.99	2	20
4	444	0.10	599.99	1	16
5	444	0.20	1549.00	2	10
1	445	0.20	3999.99	1	7
2	445	0.07	599.99	1	16
3	445	0.20	299.99	1	23
1	446	0.20	269.99	1	22
2	446	0.07	599.99	2	16
1	447	0.05	2899.99	2	4
2	447	0.10	999.99	1	3
3	447	0.07	1799.99	1	8
1	448	0.05	269.99	2	13
2	448	0.05	469.99	2	6
1	449	0.05	429.00	2	17
2	449	0.05	749.99	1	2
3	449	0.07	3999.99	2	7
4	449	0.20	599.99	2	26
1	450	0.05	549.99	1	24
2	450	0.07	549.99	1	12
3	450	0.10	1320.99	1	5
1	451	0.05	269.99	2	14
1	452	0.05	1680.99	1	11
2	452	0.05	599.99	1	16
3	452	0.10	3999.99	2	7
4	452	0.10	1799.99	1	8
1	453	0.05	299.99	1	23
2	453	0.20	599.99	2	20
3	453	0.20	2899.99	1	4
1	454	0.07	499.99	2	25
2	454	0.05	269.99	2	13
3	454	0.10	549.99	2	24
1	455	0.05	2999.99	1	9
1	456	0.07	429.00	2	17
2	456	0.07	299.99	1	23
1	457	0.07	549.99	2	24
2	457	0.05	749.99	1	2
3	457	0.10	3999.99	2	7
4	457	0.20	429.00	1	17
1	458	0.20	749.99	1	2
2	458	0.07	269.99	2	21
3	458	0.10	1680.99	1	11
4	458	0.20	549.99	1	24
5	458	0.20	999.99	2	3
1	459	0.20	1680.99	1	11
1	460	0.05	449.00	1	19
2	460	0.07	449.00	2	18
3	460	0.20	2899.99	1	4
4	460	0.10	269.99	2	22
1	461	0.07	599.99	1	16
2	461	0.20	2899.99	1	4
3	461	0.05	1799.99	2	8
4	461	0.10	549.99	1	24
5	461	0.10	449.00	2	18
1	462	0.10	549.99	2	12
1	463	0.07	269.99	2	13
1	464	0.10	3999.99	1	7
1	465	0.10	469.99	2	6
2	465	0.10	499.99	2	25
1	466	0.20	449.00	2	19
2	466	0.20	469.99	1	6
3	466	0.05	3999.99	2	7
4	466	0.10	529.99	1	15
5	466	0.10	1320.99	1	5
1	467	0.07	449.00	1	19
2	467	0.07	1549.00	1	10
3	467	0.10	269.99	2	22
4	467	0.07	429.00	2	17
5	467	0.10	1680.99	1	11
1	468	0.10	449.00	1	19
2	468	0.05	2999.99	2	9
3	468	0.05	1549.00	2	10
4	468	0.10	499.99	1	25
1	469	0.10	1799.99	2	8
2	469	0.07	2899.99	1	4
3	469	0.20	529.99	2	15
1	470	0.05	449.00	1	18
2	470	0.05	269.99	1	13
3	470	0.20	1799.99	2	8
1	471	0.20	269.99	1	14
2	471	0.05	269.99	2	13
1	472	0.10	529.99	1	15
2	472	0.10	269.99	2	21
1	473	0.07	599.99	1	26
1	474	0.05	449.00	2	19
2	474	0.20	1680.99	1	11
1	475	0.07	429.00	2	17
2	475	0.20	599.99	2	26
3	475	0.20	499.99	1	25
1	476	0.07	269.99	2	22
2	476	0.20	2899.99	2	4
3	476	0.07	1680.99	2	11
4	476	0.05	599.99	2	20
1	477	0.10	469.99	1	6
2	477	0.05	1549.00	1	10
1	478	0.07	269.99	2	21
1	479	0.07	599.99	1	26
2	479	0.05	549.99	1	12
3	479	0.20	269.99	1	21
4	479	0.05	3999.99	1	7
5	479	0.20	1549.00	1	10
1	480	0.05	2899.99	1	4
2	480	0.05	529.99	1	15
3	480	0.07	299.99	2	23
1	481	0.20	269.99	2	13
2	481	0.07	599.99	2	16
3	481	0.10	2999.99	2	9
1	482	0.20	269.99	1	13
2	482	0.10	269.99	1	14
1	483	0.07	429.00	1	17
1	484	0.10	1799.99	2	8
2	484	0.05	549.99	1	24
3	484	0.05	2999.99	2	9
4	484	0.20	469.99	1	6
1	485	0.10	269.99	1	13
2	485	0.05	599.99	2	26
1	486	0.07	2999.99	1	9
2	486	0.05	299.99	2	23
1	487	0.20	469.99	1	6
1	488	0.07	269.99	2	13
2	488	0.05	299.99	2	23
3	488	0.05	269.99	1	22
1	489	0.10	1799.99	2	8
1	490	0.10	549.99	1	12
2	490	0.05	299.99	1	23
3	490	0.10	269.99	1	14
4	490	0.07	269.99	2	13
1	491	0.20	2999.99	2	9
2	491	0.05	269.99	2	21
3	491	0.05	529.99	2	15
1	492	0.10	469.99	1	6
2	492	0.10	269.99	2	22
3	492	0.05	599.99	1	26
1	493	0.05	529.99	1	15
2	493	0.05	449.00	2	18
3	493	0.05	599.99	1	26
1	494	0.10	299.99	1	23
1	495	0.20	269.99	1	22
2	495	0.05	2999.99	1	9
1	496	0.20	299.99	1	23
2	496	0.10	269.99	1	13
3	496	0.20	269.99	2	21
1	497	0.07	499.99	2	25
1	498	0.07	549.99	1	24
2	498	0.10	269.99	1	21
3	498	0.07	1549.00	1	10
1	499	0.20	1680.99	1	11
2	499	0.07	529.99	1	15
3	499	0.20	269.99	2	14
4	499	0.10	599.99	2	20
1	500	0.05	549.99	2	12
2	500	0.20	269.99	1	14
1	501	0.05	449.00	2	19
2	501	0.07	1799.99	1	8
3	501	0.10	269.99	1	14
4	501	0.07	299.99	2	23
1	502	0.05	269.99	1	13
1	503	0.07	269.99	2	13
2	503	0.05	1549.00	1	10
1	504	0.10	549.99	2	24
2	504	0.05	749.99	2	2
1	505	0.20	599.99	1	26
1	506	0.10	499.99	1	25
2	506	0.07	3999.99	1	7
1	507	0.05	1680.99	2	11
2	507	0.07	269.99	2	13
3	507	0.10	599.99	2	20
1	508	0.05	1799.99	1	8
2	508	0.05	749.99	2	2
3	508	0.05	1549.00	2	10
4	508	0.07	499.99	1	25
1	509	0.20	299.99	2	23
2	509	0.05	2899.99	2	4
1	510	0.10	429.00	1	17
1	511	0.05	269.99	2	22
2	511	0.10	269.99	1	13
1	512	0.07	269.99	1	21
1	513	0.07	3999.99	1	7
2	513	0.20	269.99	1	13
3	513	0.07	299.99	1	23
1	514	0.20	449.00	2	18
2	514	0.07	429.00	2	17
1	515	0.07	1799.99	1	8
2	515	0.10	1320.99	1	5
3	515	0.07	499.99	2	25
4	515	0.20	469.99	2	6
1	516	0.05	3999.99	1	7
2	516	0.10	1320.99	2	5
1	517	0.07	269.99	2	21
1	518	0.20	599.99	2	16
2	518	0.05	1320.99	2	5
3	518	0.05	499.99	2	25
4	518	0.20	529.99	2	15
5	518	0.07	1680.99	2	11
1	519	0.07	469.99	1	6
2	519	0.10	599.99	1	16
3	519	0.05	299.99	2	23
4	519	0.20	449.00	2	18
5	519	0.05	3999.99	1	7
1	520	0.10	599.99	1	26
2	520	0.20	549.99	1	24
3	520	0.07	1549.00	1	10
1	521	0.20	1320.99	1	5
2	521	0.20	269.99	1	14
1	522	0.07	2899.99	2	4
2	522	0.07	269.99	2	22
3	522	0.05	269.99	1	21
1	523	0.20	549.99	1	12
2	523	0.05	599.99	1	20
3	523	0.10	1320.99	2	5
4	523	0.07	599.99	2	16
1	524	0.07	1680.99	1	11
2	524	0.05	749.99	1	2
3	524	0.20	2999.99	1	9
4	524	0.07	999.99	2	3
5	524	0.05	599.99	1	26
1	525	0.07	2999.99	2	9
2	525	0.07	469.99	2	6
3	525	0.10	1549.00	1	10
1	526	0.10	999.99	2	3
2	526	0.10	1799.99	1	8
3	526	0.05	269.99	1	21
4	526	0.07	529.99	1	15
1	527	0.07	449.00	2	18
2	527	0.20	2899.99	1	4
3	527	0.10	449.00	1	19
4	527	0.20	2999.99	2	9
1	528	0.05	269.99	2	21
1	529	0.07	549.99	2	12
1	530	0.05	749.99	2	2
2	530	0.07	2899.99	1	4
3	530	0.20	469.99	2	6
1	531	0.20	469.99	1	6
2	531	0.20	549.99	2	12
3	531	0.07	499.99	1	25
1	532	0.07	429.00	2	17
2	532	0.20	599.99	2	16
3	532	0.10	549.99	1	12
1	533	0.20	2899.99	1	4
2	533	0.10	549.99	2	12
3	533	0.20	1549.00	1	10
4	533	0.05	499.99	1	25
1	534	0.05	269.99	2	21
2	534	0.05	2999.99	2	9
3	534	0.07	749.99	1	2
4	534	0.10	549.99	2	24
1	535	0.05	549.99	1	24
2	535	0.10	529.99	1	15
3	535	0.10	269.99	2	22
1	536	0.10	269.99	1	22
2	536	0.10	749.99	1	2
3	536	0.05	549.99	2	12
4	536	0.07	269.99	1	14
1	537	0.05	1549.00	1	10
2	537	0.05	599.99	1	26
3	537	0.10	429.00	2	17
4	537	0.20	499.99	2	25
1	538	0.20	749.99	2	2
1	539	0.10	2999.99	2	9
2	539	0.05	299.99	1	23
3	539	0.07	269.99	2	21
1	540	0.10	449.00	1	19
2	540	0.10	599.99	2	26
3	540	0.07	299.99	2	23
1	541	0.05	269.99	2	22
1	542	0.20	599.99	2	16
2	542	0.10	2999.99	1	9
3	542	0.10	599.99	1	20
4	542	0.20	449.00	2	19
1	543	0.20	499.99	1	25
2	543	0.20	449.00	1	18
3	543	0.05	599.99	2	26
1	544	0.05	549.99	1	12
2	544	0.10	429.00	1	17
3	544	0.05	269.99	1	21
1	545	0.20	499.99	2	25
2	545	0.07	469.99	1	6
3	545	0.20	549.99	1	24
4	545	0.07	599.99	2	20
1	546	0.05	429.00	2	17
2	546	0.10	1799.99	1	8
3	546	0.07	449.00	2	18
1	547	0.05	1680.99	2	11
2	547	0.20	2999.99	1	9
3	547	0.10	1320.99	1	5
1	548	0.10	1799.99	1	8
2	548	0.07	1680.99	2	11
1	549	0.07	529.99	1	15
2	549	0.05	599.99	1	16
3	549	0.07	999.99	1	3
4	549	0.05	3999.99	1	7
5	549	0.10	269.99	2	13
1	550	0.05	2899.99	1	4
1	551	0.05	599.99	1	16
2	551	0.07	599.99	1	26
3	551	0.20	1680.99	2	11
4	551	0.20	529.99	2	15
1	552	0.20	299.99	1	23
2	552	0.20	749.99	1	2
3	552	0.20	549.99	1	24
4	552	0.10	449.00	1	18
5	552	0.20	449.00	2	19
1	553	0.10	549.99	1	24
2	553	0.07	449.00	2	18
3	553	0.07	549.99	1	12
1	554	0.07	999.99	2	3
2	554	0.05	269.99	1	22
3	554	0.20	2899.99	2	4
1	555	0.20	1799.99	1	8
2	555	0.10	3999.99	1	7
3	555	0.07	599.99	2	20
1	556	0.10	599.99	1	16
2	556	0.20	2899.99	2	4
1	557	0.10	2999.99	2	9
2	557	0.10	1549.00	1	10
1	558	0.07	3999.99	1	7
2	558	0.07	599.99	1	16
3	558	0.10	2999.99	1	9
4	558	0.05	269.99	2	21
5	558	0.07	1549.00	2	10
1	559	0.10	529.99	2	15
2	559	0.10	469.99	1	6
3	559	0.07	3999.99	2	7
1	560	0.05	599.99	1	16
2	560	0.10	599.99	2	26
1	561	0.05	529.99	2	15
2	561	0.05	449.00	1	18
3	561	0.05	1320.99	1	5
4	561	0.07	429.00	2	17
1	562	0.07	499.99	2	25
2	562	0.05	599.99	1	26
1	563	0.10	469.99	2	6
2	563	0.05	449.00	1	19
3	563	0.10	269.99	2	13
1	564	0.20	2899.99	1	4
2	564	0.20	529.99	1	15
1	565	0.20	449.00	1	18
2	565	0.10	499.99	2	25
3	565	0.05	2999.99	1	9
4	565	0.10	429.00	1	17
1	566	0.07	549.99	2	24
2	566	0.20	3999.99	2	7
3	566	0.10	1799.99	1	8
4	566	0.20	269.99	2	21
1	567	0.20	2999.99	1	9
2	567	0.07	1320.99	1	5
1	568	0.05	1320.99	1	5
2	568	0.05	1549.00	1	10
1	569	0.05	599.99	1	16
2	569	0.10	549.99	2	24
1	570	0.07	449.00	1	18
2	570	0.10	549.99	2	24
3	570	0.20	999.99	2	3
4	570	0.10	1680.99	1	11
5	570	0.05	599.99	1	16
1	571	0.05	2899.99	1	4
2	571	0.10	2999.99	1	9
1	572	0.05	999.99	1	3
2	572	0.10	269.99	2	13
3	572	0.20	1680.99	2	11
1	573	0.20	749.99	1	2
1	574	0.05	599.99	1	26
2	574	0.10	269.99	2	13
3	574	0.10	549.99	2	12
4	574	0.10	299.99	2	23
5	574	0.05	1680.99	2	11
1	575	0.07	2899.99	2	4
2	575	0.20	549.99	1	12
1	576	0.10	2999.99	1	9
1	577	0.20	999.99	2	3
1	578	0.07	269.99	1	21
2	578	0.20	499.99	2	25
3	578	0.05	449.00	2	18
4	578	0.20	1799.99	2	8
1	579	0.05	3999.99	2	7
2	579	0.20	469.99	1	6
1	580	0.20	599.99	2	16
2	580	0.07	529.99	1	15
3	580	0.20	269.99	2	21
4	580	0.07	2999.99	2	9
5	580	0.20	449.00	1	19
1	581	0.07	1799.99	2	8
1	582	0.20	1549.00	2	10
2	582	0.07	429.00	2	17
1	583	0.20	529.99	2	15
1	584	0.07	449.00	1	19
2	584	0.07	299.99	1	23
3	584	0.10	529.99	1	15
4	584	0.05	269.99	1	22
5	584	0.07	1799.99	2	8
1	585	0.20	1549.00	1	10
2	585	0.20	449.00	2	18
3	585	0.05	529.99	1	15
4	585	0.07	549.99	2	12
1	586	0.10	1680.99	2	11
2	586	0.20	299.99	2	23
1	587	0.05	549.99	1	24
2	587	0.05	299.99	1	23
3	587	0.05	449.00	1	18
4	587	0.20	269.99	1	21
1	588	0.07	1549.00	2	10
2	588	0.20	299.99	1	23
1	589	0.05	529.99	2	15
1	590	0.10	749.99	2	2
2	590	0.07	599.99	1	20
3	590	0.05	1799.99	2	8
4	590	0.10	1320.99	2	5
5	590	0.10	549.99	1	24
1	591	0.05	599.99	2	16
2	591	0.05	499.99	2	25
3	591	0.10	749.99	2	2
1	592	0.10	269.99	2	21
2	592	0.05	599.99	1	16
3	592	0.07	449.00	2	18
1	593	0.10	999.99	2	3
2	593	0.07	499.99	1	25
1	594	0.10	599.99	1	26
2	594	0.05	269.99	2	21
1	595	0.07	2899.99	1	4
2	595	0.07	449.00	2	19
3	595	0.07	999.99	1	3
4	595	0.07	1549.00	1	10
5	595	0.05	599.99	2	26
1	596	0.05	1320.99	1	5
2	596	0.10	299.99	2	23
3	596	0.05	2999.99	1	9
1	597	0.20	429.00	2	17
2	597	0.07	1799.99	1	8
1	598	0.05	2899.99	2	4
2	598	0.07	599.99	2	16
3	598	0.10	269.99	1	14
1	599	0.05	2999.99	2	9
2	599	0.20	269.99	2	22
3	599	0.07	299.99	1	23
4	599	0.10	1549.00	2	10
1	600	0.07	599.99	2	26
2	600	0.20	2899.99	1	4
3	600	0.07	449.00	2	18
1	601	0.20	549.99	2	12
1	602	0.05	529.99	2	15
2	602	0.07	1320.99	2	5
1	603	0.07	549.99	1	12
2	603	0.10	2899.99	1	4
1	604	0.07	1549.00	2	10
2	604	0.20	2999.99	2	9
1	605	0.07	449.00	1	19
2	605	0.05	499.99	2	25
3	605	0.20	269.99	2	13
4	605	0.20	1680.99	1	11
1	606	0.20	469.99	2	6
2	606	0.05	449.00	2	18
1	607	0.20	1680.99	2	11
2	607	0.20	599.99	2	26
3	607	0.07	269.99	1	14
1	608	0.20	2899.99	2	4
2	608	0.10	3999.99	2	7
3	608	0.10	549.99	1	24
1	609	0.07	1549.00	1	10
2	609	0.10	3999.99	1	7
3	609	0.10	269.99	2	22
4	609	0.10	1320.99	1	5
1	610	0.10	599.99	1	26
2	610	0.07	549.99	1	24
3	610	0.07	449.00	2	18
4	610	0.07	999.99	1	3
5	610	0.10	1799.99	1	8
1	611	0.07	599.99	2	16
1	612	0.10	269.99	1	13
2	612	0.10	269.99	1	14
3	612	0.07	429.00	1	17
4	612	0.20	599.99	1	20
1	613	0.10	2999.99	2	9
2	613	0.05	449.00	2	18
3	613	0.07	549.99	1	12
1	614	0.10	449.00	1	18
2	614	0.05	269.99	1	21
1	615	0.07	1680.99	1	11
2	615	0.05	299.99	1	23
3	615	0.10	469.99	2	6
4	615	0.10	449.00	2	19
1	616	0.20	549.99	1	24
2	616	0.20	599.99	2	16
1	617	0.20	529.99	2	15
2	617	0.07	1680.99	2	11
1	618	0.10	429.00	2	17
2	618	0.07	1680.99	1	11
1	619	0.07	499.99	1	25
1	620	0.20	1320.99	2	5
1	621	0.07	429.00	2	17
1	622	0.07	2999.99	2	9
2	622	0.10	449.00	1	18
3	622	0.20	1549.00	1	10
4	622	0.07	499.99	1	25
1	623	0.07	1799.99	1	8
1	624	0.05	269.99	2	21
2	624	0.07	599.99	1	16
3	624	0.07	269.99	1	22
4	624	0.20	269.99	2	14
1	625	0.07	429.00	1	17
2	625	0.20	1680.99	2	11
3	625	0.07	599.99	1	26
4	625	0.10	299.99	2	23
1	626	0.20	529.99	1	15
1	627	0.07	449.00	1	19
2	627	0.20	2999.99	2	9
3	627	0.07	599.99	1	26
1	628	0.10	529.99	2	15
1	629	0.05	449.00	1	19
2	629	0.05	1320.99	2	5
3	629	0.10	299.99	2	23
4	629	0.05	269.99	2	14
5	629	0.10	469.99	2	6
1	630	0.05	1320.99	1	5
2	630	0.10	499.99	1	25
3	630	0.10	449.00	2	18
4	630	0.07	269.99	2	21
1	631	0.07	549.99	2	24
2	631	0.07	529.99	2	15
1	632	0.20	499.99	1	25
2	632	0.10	1680.99	2	11
3	632	0.07	529.99	1	15
4	632	0.05	469.99	1	6
5	632	0.10	269.99	2	22
1	633	0.05	549.99	2	12
2	633	0.20	269.99	2	13
3	633	0.20	1320.99	2	5
4	633	0.20	1549.00	2	10
1	634	0.05	2899.99	2	4
2	634	0.10	549.99	1	12
1	635	0.05	2899.99	1	4
1	636	0.20	329.99	2	85
1	637	0.10	2999.99	1	9
2	637	0.10	449.99	2	106
1	638	0.05	551.99	1	103
2	638	0.20	5499.99	1	56
3	638	0.05	749.99	2	53
1	639	0.07	529.99	1	15
2	639	0.05	749.99	1	73
3	639	0.05	619.99	1	72
4	639	0.10	4999.99	2	61
1	640	0.05	449.99	2	106
2	640	0.07	469.99	1	32
3	640	0.07	999.99	1	30
4	640	0.07	299.99	2	76
5	640	0.20	416.99	2	109
1	641	0.05	529.99	1	15
2	641	0.20	3499.99	1	62
3	641	0.20	489.99	1	64
1	642	0.07	449.99	2	68
1	643	0.05	749.99	1	53
1	644	0.07	2999.99	1	9
1	645	0.07	299.99	1	99
2	645	0.05	2299.99	2	42
3	645	0.05	469.99	1	6
4	645	0.07	5299.99	2	47
5	645	0.07	269.99	2	21
1	646	0.20	529.99	2	15
2	646	0.07	2899.99	1	4
3	646	0.05	299.99	1	95
4	646	0.20	549.99	1	12
1	647	0.07	499.99	2	25
2	647	0.10	269.99	1	13
1	648	0.07	549.99	1	24
1	649	0.10	349.99	2	97
2	649	0.07	209.99	1	90
3	649	0.10	1680.99	2	11
4	649	0.05	647.99	1	78
1	650	0.20	999.99	1	3
1	651	0.10	402.99	1	79
2	651	0.05	329.99	1	85
3	651	0.05	489.99	2	102
4	651	0.05	249.99	2	94
1	652	0.10	489.99	1	102
2	652	0.20	3499.99	2	62
3	652	0.20	250.99	2	67
4	652	0.10	299.99	1	23
5	652	0.05	439.99	1	74
1	653	0.07	469.99	1	6
2	653	0.10	5299.99	1	43
3	653	0.10	749.99	2	2
4	653	0.20	761.99	1	80
5	653	0.07	189.99	2	88
1	654	0.10	2999.99	1	9
2	654	0.10	299.99	1	95
3	654	0.07	470.99	2	110
4	654	0.07	349.99	2	97
1	655	0.10	250.99	1	67
1	656	0.10	149.99	1	83
2	656	0.07	269.99	1	22
3	656	0.05	469.99	2	33
1	657	0.05	875.99	1	52
2	657	0.05	3199.99	2	54
1	658	0.20	3499.99	2	49
2	658	0.05	999.99	1	29
3	658	0.05	2999.99	1	9
1	659	0.05	2299.99	2	42
2	659	0.07	1499.99	2	39
3	659	0.05	659.99	1	70
4	659	0.07	4999.99	2	61
1	660	0.20	999.99	1	30
2	660	0.07	2599.99	2	59
3	660	0.05	5299.99	2	47
4	660	0.20	999.99	2	29
1	661	0.07	3499.99	2	63
2	661	0.05	269.99	2	22
1	662	0.10	2699.99	2	55
2	662	0.20	299.99	2	95
3	662	0.07	489.99	2	102
4	662	0.07	269.99	1	22
5	662	0.07	449.99	2	106
1	663	0.05	1469.99	2	41
2	663	0.20	429.00	2	17
3	663	0.05	249.99	1	94
4	663	0.07	416.99	1	71
5	663	0.20	449.99	1	106
1	664	0.07	875.99	2	52
2	664	0.07	1320.99	1	5
3	664	0.20	5999.99	1	50
4	664	0.20	339.99	2	101
5	664	0.07	5299.99	1	47
1	665	0.07	4999.99	1	58
2	665	0.20	2299.99	2	42
3	665	0.05	499.99	2	25
1	666	0.20	489.99	2	98
2	666	0.05	1499.99	1	39
1	667	0.20	402.99	1	79
2	667	0.10	109.99	1	84
3	667	0.20	999.99	1	3
4	667	0.10	299.99	1	99
5	667	0.05	329.99	1	85
1	668	0.05	1499.99	2	48
2	668	0.10	449.00	2	19
1	669	0.07	599.99	2	16
2	669	0.07	619.99	1	72
1	670	0.10	449.99	1	108
2	670	0.07	2499.99	1	28
3	670	0.20	481.99	2	104
4	670	0.05	869.99	2	45
1	671	0.05	999.99	1	30
2	671	0.05	416.99	1	69
3	671	0.20	2699.99	1	55
4	671	0.07	2899.99	1	4
5	671	0.07	416.99	2	109
1	672	0.07	6499.99	2	51
2	672	0.20	349.99	2	96
3	672	0.07	1499.99	2	48
1	673	0.20	250.99	1	66
2	673	0.20	549.99	1	38
3	673	0.07	1320.99	1	5
4	673	0.10	269.99	1	13
1	674	0.20	599.99	2	26
1	675	0.05	429.00	1	17
2	675	0.05	209.99	2	89
3	675	0.07	449.00	1	19
4	675	0.20	469.99	1	32
1	676	0.20	659.99	1	70
2	676	0.07	481.99	2	104
3	676	0.10	549.99	1	24
4	676	0.20	999.99	1	29
1	677	0.07	599.99	1	75
2	677	0.07	3999.99	2	7
3	677	0.07	533.99	2	105
4	677	0.05	349.99	2	91
5	677	0.10	3199.99	2	54
1	678	0.05	875.99	2	52
2	678	0.07	379.99	2	37
1	679	0.20	529.99	2	15
2	679	0.05	149.99	2	83
1	680	0.05	1099.99	2	81
2	680	0.20	3999.99	1	7
3	680	0.07	5999.99	1	50
1	681	0.05	659.99	1	82
2	681	0.07	3499.99	1	63
3	681	0.20	4999.99	1	61
4	681	0.05	469.99	2	6
5	681	0.07	999.99	1	30
1	682	0.20	1499.99	1	39
2	682	0.20	1559.99	2	60
3	682	0.20	299.99	1	99
1	683	0.10	749.99	2	2
1	684	0.07	5499.99	1	56
2	684	0.10	469.99	1	33
1	685	0.05	2599.99	1	59
2	685	0.05	1499.99	2	48
3	685	0.05	416.99	1	107
4	685	0.20	489.99	2	98
5	685	0.05	5499.99	2	56
1	686	0.20	599.99	1	16
2	686	0.10	999.99	1	30
3	686	0.20	189.99	2	88
4	686	0.20	449.00	2	19
5	686	0.20	481.99	1	104
1	687	0.05	1499.99	2	48
2	687	0.07	299.99	1	95
3	687	0.20	1320.99	2	5
4	687	0.07	149.99	1	83
1	688	0.10	1799.99	1	8
2	688	0.05	189.99	1	88
1	689	0.10	469.99	2	33
1	690	0.20	109.99	1	84
2	690	0.07	1680.99	2	11
3	690	0.05	329.99	1	85
4	690	0.20	416.99	2	109
1	691	0.05	299.99	2	23
2	691	0.10	1320.99	2	5
3	691	0.20	2699.99	2	55
4	691	0.20	599.99	1	20
1	692	0.20	2599.99	1	59
2	692	0.07	599.99	1	75
3	692	0.07	529.99	2	15
4	692	0.10	5499.99	2	56
1	693	0.20	481.99	2	104
2	693	0.20	269.99	1	13
3	693	0.05	1320.99	2	5
4	693	0.07	1632.99	1	31
1	694	0.20	1499.99	1	48
2	694	0.05	1499.99	1	39
3	694	0.10	2699.99	2	55
4	694	0.20	551.99	2	103
5	694	0.10	869.99	2	45
1	695	0.10	659.99	2	82
2	695	0.20	1999.99	2	57
1	696	0.07	189.99	2	88
2	696	0.10	3999.99	1	7
3	696	0.07	869.99	1	45
1	697	0.05	1320.99	2	5
1	698	0.07	349.99	1	96
2	698	0.07	549.99	1	12
3	698	0.05	4999.99	2	40
1	699	0.10	449.99	2	106
2	699	0.07	1499.99	1	48
3	699	0.20	1632.99	1	31
4	699	0.10	549.99	2	24
5	699	0.20	659.99	2	82
1	700	0.05	3999.99	2	7
2	700	0.20	3499.99	1	63
1	701	0.05	109.99	1	84
1	702	0.05	499.99	2	25
2	702	0.10	481.99	1	104
3	702	0.07	999.99	2	3
1	703	0.20	869.99	2	45
2	703	0.05	250.99	2	66
3	703	0.20	619.99	1	72
4	703	0.20	2899.99	2	4
1	704	0.05	1549.00	2	10
2	704	0.20	3499.99	1	62
3	704	0.07	489.99	2	100
1	705	0.10	4999.99	1	61
1	706	0.10	999.99	1	27
2	706	0.05	299.99	2	23
3	706	0.20	1559.99	1	60
1	707	0.05	449.99	2	106
2	707	0.07	489.99	1	100
3	707	0.10	1680.99	2	11
4	707	0.10	599.99	2	26
1	708	0.07	469.99	1	6
2	708	0.10	5299.99	1	47
3	708	0.20	469.99	2	34
1	709	0.05	2699.99	2	55
2	709	0.07	339.99	2	101
3	709	0.07	1499.99	1	48
1	710	0.05	2299.99	1	42
2	710	0.20	1559.99	2	60
3	710	0.20	1499.99	2	39
4	710	0.20	1999.99	1	57
5	710	0.05	2499.99	1	28
1	711	0.05	1320.99	2	5
2	711	0.20	299.99	2	95
3	711	0.05	619.99	2	72
1	712	0.20	539.99	2	44
2	712	0.10	439.99	2	74
3	712	0.20	832.99	1	35
4	712	0.20	299.99	1	76
5	712	0.05	2899.99	2	4
1	713	0.20	209.99	2	93
2	713	0.10	349.99	2	97
3	713	0.07	749.99	1	53
4	713	0.07	449.99	2	108
1	714	0.20	209.99	2	92
1	715	0.10	4999.99	2	61
2	715	0.20	5999.99	1	50
1	716	0.10	470.99	2	111
2	716	0.07	209.99	2	93
3	716	0.10	402.99	1	79
4	716	0.05	2899.99	2	4
1	717	0.05	5499.99	2	56
2	717	0.20	209.99	1	93
1	718	0.07	209.99	2	92
2	718	0.07	4999.99	2	40
3	718	0.10	489.99	2	64
1	719	0.20	489.99	1	100
1	720	0.07	470.99	1	111
2	720	0.10	469.99	1	6
1	721	0.07	869.99	2	45
2	721	0.10	489.99	1	102
3	721	0.05	749.99	2	73
4	721	0.20	469.99	1	33
1	722	0.07	269.99	2	22
2	722	0.05	999.99	1	3
3	722	0.10	481.99	2	104
1	723	0.07	549.99	2	24
2	723	0.05	599.99	1	16
3	723	0.07	449.99	1	108
1	724	0.05	299.99	1	23
2	724	0.20	599.99	1	75
3	724	0.05	489.99	1	102
4	724	0.20	2699.99	1	55
1	725	0.10	209.99	1	90
2	725	0.05	349.99	1	91
3	725	0.07	799.99	2	77
4	725	0.10	3499.99	2	62
1	726	0.20	489.99	1	64
1	727	0.07	647.99	1	78
2	727	0.05	659.99	2	82
1	728	0.05	659.99	1	70
2	728	0.10	5499.99	1	56
3	728	0.10	349.99	1	91
4	728	0.07	4999.99	1	58
1	729	0.10	339.99	2	101
1	730	0.05	2599.99	2	59
2	730	0.10	402.99	1	79
3	730	0.07	349.99	2	96
4	730	0.10	269.99	1	13
1	731	0.05	349.99	1	91
2	731	0.20	3499.99	1	49
3	731	0.20	250.99	2	67
4	731	0.20	999.99	1	29
1	732	0.07	5299.99	1	47
2	732	0.07	2899.99	2	4
1	733	0.05	109.99	1	84
2	733	0.20	2699.99	1	55
3	733	0.10	489.99	2	102
1	734	0.20	599.99	1	26
2	734	0.05	999.99	1	3
3	734	0.20	109.99	2	84
4	734	0.10	346.99	2	65
1	735	0.10	416.99	2	71
2	735	0.07	1549.00	2	10
1	736	0.05	5499.99	2	56
2	736	0.10	429.00	1	17
3	736	0.20	3499.99	2	62
1	737	0.05	875.99	1	52
2	737	0.07	449.00	2	19
3	737	0.07	799.99	2	77
4	737	0.20	469.99	1	34
1	738	0.07	659.99	2	82
2	738	0.20	549.99	2	38
3	738	0.10	499.99	1	25
4	738	0.07	3499.99	1	63
1	739	0.20	999.99	1	3
1	740	0.05	1099.99	1	81
2	740	0.20	249.99	2	94
3	740	0.20	1680.99	1	11
4	740	0.20	449.00	1	19
5	740	0.07	549.99	2	12
1	741	0.05	4999.99	1	58
2	741	0.07	299.99	1	76
3	741	0.07	269.99	2	21
4	741	0.05	5499.99	2	56
1	742	0.05	416.99	2	107
2	742	0.07	869.99	1	45
1	743	0.05	761.99	1	80
1	744	0.20	469.99	2	33
1	745	0.05	299.99	2	95
2	745	0.20	269.99	2	22
3	745	0.10	647.99	1	78
1	746	0.10	299.99	1	99
1	747	0.07	470.99	1	110
2	747	0.20	149.99	1	86
3	747	0.10	469.99	2	33
4	747	0.07	1099.99	1	81
1	748	0.10	599.99	2	16
2	748	0.05	149.99	2	83
3	748	0.07	1469.99	1	41
4	748	0.20	832.99	2	35
1	749	0.20	2999.99	1	9
2	749	0.05	2499.99	1	28
3	749	0.20	402.99	1	79
4	749	0.05	549.99	1	24
5	749	0.07	4999.99	1	40
1	750	0.05	619.99	1	72
2	750	0.10	647.99	2	78
1	751	0.05	869.99	2	45
1	752	0.05	549.99	2	12
2	752	0.05	1632.99	2	31
1	753	0.07	533.99	2	105
2	753	0.20	3999.99	2	7
3	753	0.10	832.99	2	36
4	753	0.07	299.99	1	95
5	753	0.20	250.99	1	66
1	754	0.07	439.99	2	74
2	754	0.07	549.99	2	12
3	754	0.05	999.99	1	3
4	754	0.05	250.99	2	67
5	754	0.20	3999.99	1	7
1	755	0.07	761.99	2	80
2	755	0.05	5299.99	2	43
3	755	0.10	1999.99	2	57
1	756	0.10	489.99	1	64
2	756	0.05	429.00	2	17
1	757	0.10	299.99	1	95
1	758	0.07	269.99	2	22
2	758	0.10	299.99	1	99
3	758	0.07	999.99	1	27
4	758	0.07	346.99	2	65
5	758	0.20	416.99	1	109
1	759	0.05	209.99	2	93
2	759	0.07	647.99	1	78
1	760	0.07	269.99	2	21
2	760	0.07	999.99	2	29
1	761	0.07	5299.99	1	43
2	761	0.20	875.99	2	52
1	762	0.05	489.99	2	102
1	763	0.07	209.99	1	90
2	763	0.10	551.99	1	103
1	764	0.07	2699.99	1	55
2	764	0.05	299.99	2	95
3	764	0.07	1099.99	2	81
1	765	0.20	2499.99	2	28
2	765	0.07	549.99	1	12
3	765	0.20	499.99	1	25
4	765	0.20	749.99	1	53
5	765	0.05	346.99	1	65
1	766	0.20	470.99	1	111
1	767	0.10	3499.99	1	63
2	767	0.07	999.99	1	29
3	767	0.05	1469.99	2	41
4	767	0.05	799.99	2	77
1	768	0.20	1632.99	1	31
2	768	0.20	299.99	1	76
1	769	0.10	1799.99	1	8
2	769	0.05	469.99	2	6
3	769	0.07	832.99	2	36
1	770	0.05	470.99	1	110
2	770	0.20	2299.99	1	42
3	770	0.20	551.99	1	103
4	770	0.05	1680.99	2	11
1	771	0.20	269.99	2	13
2	771	0.20	189.99	1	88
1	772	0.07	551.99	1	103
1	773	0.10	209.99	1	92
2	773	0.05	269.99	1	14
3	773	0.20	429.00	2	17
4	773	0.07	469.99	2	33
1	774	0.05	346.99	1	65
2	774	0.05	832.99	2	36
3	774	0.20	599.99	1	20
4	774	0.05	749.99	1	73
5	774	0.10	4999.99	2	58
1	775	0.07	1499.99	1	39
1	776	0.20	2499.99	1	28
2	776	0.20	2299.99	2	42
3	776	0.10	416.99	1	71
4	776	0.10	832.99	1	35
1	777	0.20	1320.99	1	5
2	777	0.20	3999.99	2	7
3	777	0.20	749.99	1	2
1	778	0.10	489.99	1	64
2	778	0.05	329.99	1	85
1	779	0.05	339.99	1	101
2	779	0.20	209.99	2	90
3	779	0.20	5299.99	1	47
4	779	0.20	1799.99	1	8
5	779	0.20	329.99	1	85
1	780	0.10	469.99	1	32
1	781	0.05	416.99	2	109
2	781	0.20	3999.99	2	7
3	781	0.10	1999.99	2	57
1	782	0.07	599.99	2	20
2	782	0.07	1999.99	1	57
3	782	0.07	299.99	1	99
4	782	0.20	599.99	2	16
1	783	0.20	209.99	1	92
2	783	0.05	269.99	2	22
3	783	0.05	249.99	1	94
4	783	0.10	999.99	1	29
1	784	0.07	269.99	1	22
2	784	0.10	619.99	2	72
3	784	0.20	599.99	1	16
1	785	0.20	2599.99	2	59
2	785	0.07	4999.99	1	40
3	785	0.07	499.99	1	25
1	786	0.05	761.99	1	80
1	787	0.07	6499.99	2	51
2	787	0.10	250.99	2	66
1	788	0.20	1499.99	1	48
2	788	0.10	449.00	1	19
3	788	0.05	269.99	1	13
1	789	0.20	489.99	2	100
2	789	0.07	209.99	2	93
1	790	0.07	3499.99	2	62
2	790	0.10	349.99	1	91
1	791	0.20	3199.99	1	54
2	791	0.07	499.99	2	25
1	792	0.20	599.99	2	16
2	792	0.20	1499.99	1	39
3	792	0.20	5499.99	1	56
4	792	0.05	999.99	1	30
5	792	0.20	749.99	1	2
1	793	0.05	1559.99	1	60
2	793	0.05	299.99	2	95
3	793	0.05	599.99	2	75
1	794	0.05	1469.99	2	41
2	794	0.20	449.99	1	68
3	794	0.07	429.00	1	17
4	794	0.10	2499.99	1	28
1	795	0.05	299.99	2	95
2	795	0.05	299.99	2	99
1	796	0.20	469.99	2	6
1	797	0.07	1680.99	1	11
2	797	0.05	416.99	1	69
3	797	0.10	439.99	1	74
4	797	0.05	3199.99	2	54
5	797	0.10	3499.99	2	62
1	798	0.10	299.99	1	23
2	798	0.05	209.99	1	90
3	798	0.07	349.99	2	91
4	798	0.20	2299.99	1	42
5	798	0.05	599.99	2	26
1	799	0.10	1320.99	2	5
2	799	0.05	469.99	2	34
3	799	0.07	999.99	2	29
4	799	0.10	3499.99	1	63
5	799	0.07	4999.99	2	58
1	800	0.10	346.99	2	65
2	800	0.07	3199.99	1	54
3	800	0.05	469.99	2	6
4	800	0.10	875.99	1	52
5	800	0.05	299.99	2	95
1	801	0.07	339.99	1	101
1	802	0.05	999.99	1	30
2	802	0.20	832.99	2	36
3	802	0.10	4999.99	1	40
4	802	0.05	2499.99	1	28
1	803	0.07	470.99	1	111
2	803	0.05	875.99	2	52
3	803	0.07	489.99	1	102
4	803	0.05	149.99	2	83
1	804	0.20	209.99	2	89
2	804	0.07	749.99	1	53
3	804	0.05	5999.99	2	50
1	805	0.05	549.99	1	24
2	805	0.20	469.99	2	33
3	805	0.20	3499.99	2	62
4	805	0.07	469.99	1	32
5	805	0.05	469.99	2	6
1	806	0.10	209.99	2	93
2	806	0.20	349.99	1	97
3	806	0.10	799.99	2	77
4	806	0.20	659.99	2	82
5	806	0.07	349.99	2	91
1	807	0.20	269.99	2	21
2	807	0.07	469.99	1	6
3	807	0.07	999.99	2	3
4	807	0.20	2999.99	2	9
5	807	0.20	599.99	1	16
1	808	0.05	349.99	2	96
2	808	0.05	449.00	1	18
3	808	0.05	329.99	1	85
4	808	0.05	449.00	2	19
1	809	0.10	647.99	1	78
2	809	0.20	599.99	1	26
3	809	0.10	209.99	2	92
1	810	0.05	551.99	2	103
2	810	0.20	489.99	1	100
3	810	0.05	5499.99	1	56
4	810	0.20	269.99	1	22
1	811	0.07	869.99	2	45
2	811	0.20	3199.99	1	54
3	811	0.07	659.99	1	70
4	811	0.10	250.99	1	66
1	812	0.10	299.99	2	76
2	812	0.20	4999.99	1	40
1	813	0.10	349.99	2	96
2	813	0.20	329.99	2	85
3	813	0.20	469.99	2	33
4	813	0.07	599.99	2	26
5	813	0.05	416.99	2	71
1	814	0.10	416.99	2	69
2	814	0.10	489.99	1	100
3	814	0.20	346.99	1	65
4	814	0.05	149.99	2	83
1	815	0.20	533.99	2	105
2	815	0.20	489.99	2	102
3	815	0.10	189.99	2	87
4	815	0.07	299.99	1	23
1	816	0.10	599.99	2	75
2	816	0.20	489.99	2	64
1	817	0.05	329.99	1	85
2	817	0.07	533.99	2	105
3	817	0.05	1499.99	2	48
1	818	0.05	551.99	1	103
2	818	0.07	539.99	2	44
3	818	0.05	449.00	2	19
4	818	0.05	1499.99	2	48
1	819	0.20	249.99	1	94
1	820	0.05	416.99	1	107
1	821	0.07	489.99	1	102
2	821	0.20	659.99	2	70
3	821	0.20	469.99	1	6
4	821	0.05	416.99	1	107
1	822	0.05	749.99	1	53
2	822	0.20	619.99	1	72
1	823	0.07	5499.99	2	56
2	823	0.20	149.99	2	86
3	823	0.20	1099.99	1	81
1	824	0.10	209.99	2	92
1	825	0.10	449.00	1	19
2	825	0.20	999.99	2	30
1	826	0.20	869.99	2	45
2	826	0.10	832.99	1	36
1	827	0.05	5299.99	1	43
2	827	0.20	1469.99	1	41
3	827	0.20	2499.99	1	28
4	827	0.20	449.99	1	108
1	828	0.20	499.99	2	25
2	828	0.20	549.99	1	24
3	828	0.07	2699.99	2	55
1	829	0.20	551.99	1	103
2	829	0.10	533.99	2	105
1	830	0.20	329.99	2	85
2	830	0.07	489.99	2	100
3	830	0.20	349.99	2	96
1	831	0.20	250.99	1	67
2	831	0.20	1680.99	1	11
3	831	0.10	449.99	1	68
1	832	0.05	3199.99	1	54
2	832	0.20	869.99	1	45
3	832	0.07	999.99	1	27
4	832	0.10	599.99	2	16
1	833	0.05	599.99	2	20
1	834	0.07	3199.99	1	54
2	834	0.05	269.99	1	21
3	834	0.20	647.99	1	78
1	835	0.07	346.99	2	65
2	835	0.20	659.99	1	82
3	835	0.05	749.99	1	2
1	836	0.20	449.99	2	108
1	837	0.05	6499.99	1	51
2	837	0.10	349.99	1	97
3	837	0.20	189.99	2	87
1	838	0.10	2499.99	1	28
2	838	0.10	1549.00	1	10
3	838	0.05	489.99	2	100
4	838	0.07	346.99	2	65
1	839	0.07	2699.99	1	55
2	839	0.10	329.99	1	85
3	839	0.05	4999.99	2	58
1	840	0.07	999.99	1	27
2	840	0.07	5299.99	1	43
3	840	0.20	449.99	2	106
1	841	0.10	269.99	2	22
2	841	0.20	2999.99	1	9
3	841	0.20	1680.99	1	11
4	841	0.07	209.99	2	90
5	841	0.10	489.99	1	100
1	842	0.07	1099.99	2	81
2	842	0.10	2299.99	1	42
1	843	0.10	619.99	1	72
2	843	0.10	599.99	2	75
3	843	0.10	1099.99	1	81
4	843	0.07	299.99	2	23
1	844	0.07	402.99	2	79
2	844	0.10	549.99	1	12
3	844	0.20	149.99	2	83
4	844	0.20	1499.99	1	48
5	844	0.05	3499.99	2	63
1	845	0.20	599.99	2	16
2	845	0.20	599.99	1	75
3	845	0.05	599.99	2	26
4	845	0.20	749.99	2	73
5	845	0.05	189.99	1	88
1	846	0.05	1409.99	2	46
2	846	0.07	5299.99	1	47
3	846	0.10	416.99	1	71
4	846	0.05	619.99	2	72
5	846	0.07	551.99	2	103
1	847	0.05	4999.99	2	61
1	848	0.07	209.99	1	93
2	848	0.20	489.99	2	100
3	848	0.20	189.99	2	88
4	848	0.07	1469.99	2	41
1	849	0.20	416.99	1	109
1	850	0.07	339.99	2	101
2	850	0.07	1320.99	2	5
3	850	0.07	379.99	1	37
1	851	0.20	999.99	1	30
2	851	0.05	209.99	1	93
1	852	0.07	1409.99	2	46
1	853	0.05	299.99	1	99
2	853	0.20	4999.99	2	58
3	853	0.20	2299.99	2	42
4	853	0.20	869.99	1	45
5	853	0.05	469.99	1	6
1	854	0.10	189.99	1	87
1	855	0.10	449.00	1	18
2	855	0.20	209.99	2	93
3	855	0.20	209.99	1	89
1	856	0.05	549.99	2	38
1	857	0.20	999.99	1	29
1	858	0.20	869.99	2	45
2	858	0.20	1320.99	1	5
3	858	0.07	269.99	1	14
4	858	0.07	749.99	2	73
1	859	0.07	549.99	2	38
2	859	0.10	269.99	1	13
3	859	0.10	269.99	2	14
4	859	0.10	416.99	2	71
5	859	0.10	832.99	2	36
1	860	0.05	469.99	1	6
2	860	0.20	549.99	2	24
3	860	0.20	499.99	1	25
4	860	0.07	4999.99	2	58
5	860	0.05	299.99	2	95
1	861	0.07	269.99	2	14
2	861	0.20	3499.99	1	62
1	862	0.05	329.99	1	85
2	862	0.20	299.99	1	99
3	862	0.07	3499.99	2	49
1	863	0.10	209.99	2	93
1	864	0.10	379.99	1	37
2	864	0.05	346.99	2	65
3	864	0.20	269.99	1	13
1	865	0.10	416.99	2	109
2	865	0.05	469.99	1	34
1	866	0.20	189.99	1	88
2	866	0.07	250.99	2	67
3	866	0.07	761.99	1	80
4	866	0.07	269.99	2	13
1	867	0.05	339.99	1	101
1	868	0.07	1409.99	1	46
1	869	0.20	3999.99	1	7
2	869	0.05	449.99	2	106
3	869	0.05	469.99	1	33
4	869	0.05	2699.99	2	55
5	869	0.20	346.99	2	65
1	870	0.07	3499.99	1	63
1	871	0.20	449.99	1	106
2	871	0.10	549.99	1	38
3	871	0.20	999.99	2	30
4	871	0.05	416.99	2	107
1	872	0.07	3499.99	2	62
2	872	0.10	749.99	1	53
1	873	0.10	469.99	2	32
1	874	0.05	5499.99	1	56
2	874	0.05	999.99	2	27
3	874	0.10	749.99	1	73
4	874	0.07	799.99	2	77
1	875	0.10	1320.99	2	5
2	875	0.05	529.99	2	15
3	875	0.07	269.99	1	14
4	875	0.20	470.99	1	111
1	876	0.20	429.00	2	17
2	876	0.20	250.99	2	66
3	876	0.07	349.99	1	96
4	876	0.05	416.99	2	107
1	877	0.07	749.99	1	73
2	877	0.10	551.99	1	103
1	878	0.20	551.99	1	103
2	878	0.10	269.99	1	13
3	878	0.20	469.99	2	6
4	878	0.05	449.00	2	18
1	879	0.20	489.99	2	100
2	879	0.07	749.99	2	2
3	879	0.20	149.99	2	83
4	879	0.07	659.99	1	82
1	880	0.20	2499.99	2	28
2	880	0.10	299.99	1	95
3	880	0.07	1320.99	1	5
4	880	0.10	599.99	1	26
5	880	0.20	250.99	1	66
1	881	0.07	489.99	1	98
2	881	0.20	5999.99	1	50
3	881	0.05	489.99	2	64
4	881	0.10	250.99	1	67
1	882	0.07	3499.99	2	63
2	882	0.20	449.99	2	108
3	882	0.07	1999.99	2	57
1	883	0.05	539.99	1	44
2	883	0.05	1320.99	2	5
1	884	0.05	3499.99	2	49
2	884	0.07	416.99	2	69
3	884	0.20	1409.99	2	46
4	884	0.10	1549.00	1	10
5	884	0.05	269.99	2	21
1	885	0.07	449.99	1	106
2	885	0.10	5299.99	1	43
1	886	0.05	5299.99	1	47
2	886	0.05	999.99	1	30
1	887	0.05	5999.99	2	50
2	887	0.10	659.99	1	70
1	888	0.10	469.99	2	33
2	888	0.20	599.99	2	26
1	889	0.10	549.99	2	12
1	890	0.10	599.99	2	16
2	890	0.10	533.99	2	105
3	890	0.05	875.99	1	52
4	890	0.10	250.99	1	67
5	890	0.10	346.99	2	65
1	891	0.10	416.99	2	107
2	891	0.05	469.99	1	32
3	891	0.10	832.99	2	35
4	891	0.10	5999.99	1	50
1	892	0.10	832.99	1	36
2	892	0.20	2999.99	2	9
3	892	0.07	5999.99	2	50
4	892	0.05	189.99	1	88
1	893	0.05	250.99	2	67
2	893	0.07	869.99	1	45
1	894	0.20	339.99	2	101
1	895	0.07	449.99	1	106
1	896	0.05	349.99	2	91
2	896	0.05	1549.00	1	10
1	897	0.05	533.99	1	105
2	897	0.05	349.99	1	96
1	898	0.20	869.99	2	45
2	898	0.07	599.99	1	16
3	898	0.20	1999.99	2	57
4	898	0.07	416.99	2	69
1	899	0.10	2599.99	2	59
2	899	0.10	429.00	1	17
3	899	0.20	469.99	1	6
1	900	0.05	599.99	2	26
2	900	0.07	449.99	1	108
3	900	0.20	209.99	1	89
4	900	0.05	4999.99	2	61
5	900	0.07	2499.99	2	28
1	901	0.20	5999.99	1	50
2	901	0.07	5299.99	1	43
1	902	0.07	549.99	2	38
2	902	0.07	209.99	1	92
3	902	0.20	549.99	1	12
4	902	0.05	299.99	2	76
1	903	0.07	1632.99	2	31
2	903	0.05	1499.99	2	48
1	904	0.10	832.99	2	36
2	904	0.07	6499.99	2	51
3	904	0.20	209.99	2	92
4	904	0.20	269.99	1	13
1	905	0.10	250.99	1	67
2	905	0.05	3499.99	2	62
3	905	0.20	2299.99	2	42
4	905	0.20	599.99	1	20
1	906	0.20	299.99	2	23
2	906	0.07	2499.99	2	28
3	906	0.05	1409.99	1	46
4	906	0.10	489.99	2	102
5	906	0.20	269.99	2	22
1	907	0.07	109.99	2	84
2	907	0.07	346.99	1	65
1	908	0.20	1469.99	1	41
2	908	0.10	249.99	1	94
3	908	0.10	489.99	2	102
1	909	0.20	1320.99	1	5
1	910	0.10	299.99	1	23
1	911	0.05	250.99	2	66
2	911	0.05	449.99	1	106
3	911	0.05	349.99	2	91
4	911	0.20	3499.99	1	49
1	912	0.20	269.99	2	22
2	912	0.05	416.99	2	71
3	912	0.05	339.99	1	101
4	912	0.20	749.99	2	2
1	913	0.10	209.99	2	90
2	913	0.05	549.99	2	24
1	914	0.07	549.99	1	38
2	914	0.20	599.99	2	20
3	914	0.05	449.99	1	106
4	914	0.10	1409.99	1	46
1	915	0.05	489.99	1	64
2	915	0.07	1499.99	1	48
3	915	0.20	2299.99	1	42
4	915	0.07	749.99	1	2
1	916	0.20	209.99	1	92
1	917	0.07	1469.99	1	41
1	918	0.20	349.99	1	91
2	918	0.10	1632.99	1	31
3	918	0.07	2899.99	2	4
1	919	0.07	3999.99	1	7
2	919	0.10	539.99	1	44
1	920	0.05	299.99	1	76
2	920	0.07	1499.99	2	39
3	920	0.05	647.99	1	78
4	920	0.07	761.99	2	80
1	921	0.20	799.99	1	77
2	921	0.07	599.99	2	75
3	921	0.10	1499.99	1	48
1	922	0.20	449.99	1	68
2	922	0.20	749.99	1	73
3	922	0.10	149.99	1	86
1	923	0.05	439.99	2	74
2	923	0.10	469.99	1	6
1	924	0.20	349.99	2	97
2	924	0.20	832.99	1	36
1	925	0.07	349.99	1	97
2	925	0.20	3499.99	2	62
1	926	0.20	379.99	2	37
1	927	0.10	439.99	2	74
2	927	0.20	599.99	2	16
3	927	0.10	5999.99	1	50
4	927	0.10	999.99	1	3
5	927	0.07	5299.99	1	43
1	928	0.05	416.99	2	71
2	928	0.20	149.99	1	83
1	929	0.20	659.99	1	82
2	929	0.10	3499.99	2	63
3	929	0.05	549.99	1	24
1	930	0.07	5499.99	2	56
2	930	0.07	659.99	1	82
3	930	0.10	1559.99	1	60
4	930	0.05	346.99	2	65
5	930	0.10	6499.99	2	51
1	931	0.07	3499.99	2	49
2	931	0.20	299.99	1	76
1	932	0.05	439.99	1	74
1	933	0.07	799.99	1	77
2	933	0.20	269.99	1	21
3	933	0.05	599.99	2	75
1	934	0.05	832.99	2	35
2	934	0.05	1499.99	1	48
3	934	0.10	449.00	1	18
4	934	0.07	4999.99	1	61
5	934	0.20	5499.99	2	56
1	935	0.20	346.99	2	65
2	935	0.07	299.99	2	76
3	935	0.07	469.99	1	6
4	935	0.07	549.99	1	38
1	936	0.10	659.99	1	70
2	936	0.07	539.99	1	44
1	937	0.10	449.99	2	108
2	937	0.07	6499.99	2	51
3	937	0.07	4999.99	2	58
4	937	0.07	2499.99	2	28
5	937	0.20	250.99	1	66
1	938	0.05	2899.99	1	4
2	938	0.05	269.99	1	13
1	939	0.10	1320.99	1	5
2	939	0.20	416.99	2	107
1	940	0.20	599.99	2	75
1	941	0.10	499.99	1	25
2	941	0.05	489.99	2	102
3	941	0.07	1680.99	2	11
1	942	0.05	489.99	2	98
2	942	0.10	470.99	2	110
3	942	0.07	832.99	2	35
4	942	0.05	551.99	1	103
5	942	0.05	489.99	1	100
1	943	0.20	499.99	1	25
2	943	0.20	659.99	1	82
1	944	0.07	999.99	2	29
2	944	0.10	599.99	2	16
3	944	0.20	659.99	2	70
4	944	0.20	329.99	2	85
5	944	0.07	416.99	2	69
1	945	0.05	533.99	1	105
2	945	0.20	249.99	2	94
3	945	0.05	469.99	2	34
4	945	0.10	539.99	2	44
5	945	0.05	5999.99	2	50
1	946	0.10	3999.99	1	7
2	946	0.20	329.99	2	85
3	946	0.05	3499.99	1	62
4	946	0.20	269.99	2	22
5	946	0.07	5499.99	2	56
1	947	0.05	469.99	1	32
2	947	0.07	2299.99	2	42
3	947	0.07	539.99	1	44
1	948	0.20	299.99	2	23
2	948	0.10	599.99	2	20
3	948	0.20	339.99	1	101
4	948	0.20	209.99	2	92
5	948	0.20	619.99	2	72
1	949	0.10	2999.99	2	9
2	949	0.05	2699.99	2	55
1	950	0.05	5499.99	1	56
1	951	0.10	2599.99	1	59
2	951	0.10	5299.99	2	43
3	951	0.20	3499.99	2	62
1	952	0.07	599.99	2	20
2	952	0.05	1999.99	1	57
1	953	0.07	299.99	2	23
1	954	0.10	2899.99	2	4
1	955	0.10	5299.99	1	43
2	955	0.07	1632.99	2	31
3	955	0.05	349.99	1	96
4	955	0.20	3499.99	1	63
5	955	0.05	189.99	1	88
1	956	0.10	299.99	2	76
2	956	0.20	299.99	1	23
3	956	0.10	749.99	2	73
4	956	0.20	269.99	2	13
5	956	0.10	402.99	2	79
1	957	0.05	449.99	2	108
2	957	0.07	269.99	2	14
3	957	0.05	659.99	2	70
4	957	0.07	250.99	1	66
5	957	0.05	470.99	1	111
1	958	0.10	6499.99	1	51
2	958	0.20	299.99	1	76
1	959	0.20	529.99	1	15
2	959	0.10	619.99	1	72
3	959	0.05	1469.99	1	41
4	959	0.07	346.99	1	65
1	960	0.05	749.99	2	73
2	960	0.10	875.99	1	52
3	960	0.05	1499.99	2	48
4	960	0.10	149.99	2	83
1	961	0.10	533.99	1	105
2	961	0.20	5299.99	2	47
3	961	0.07	346.99	2	65
1	962	0.07	346.99	2	65
2	962	0.07	489.99	2	64
1	963	0.07	2899.99	1	4
1	964	0.20	209.99	1	90
2	964	0.20	439.99	1	74
1	965	0.10	209.99	2	90
1	966	0.05	189.99	1	88
2	966	0.07	749.99	1	73
1	967	0.20	250.99	1	66
2	967	0.05	799.99	2	77
3	967	0.10	189.99	1	87
4	967	0.20	551.99	1	103
1	968	0.20	189.99	1	87
2	968	0.05	4999.99	2	61
3	968	0.05	1549.00	2	10
1	969	0.20	439.99	1	74
2	969	0.10	832.99	1	36
1	970	0.10	329.99	1	85
2	970	0.10	1499.99	2	48
3	970	0.10	3199.99	2	54
4	970	0.10	449.99	1	68
1	971	0.05	659.99	2	70
2	971	0.07	346.99	2	65
3	971	0.05	1799.99	2	8
4	971	0.07	549.99	2	12
5	971	0.20	549.99	1	38
1	972	0.20	489.99	1	100
2	972	0.07	3499.99	1	63
1	973	0.10	2899.99	2	4
2	973	0.10	2499.99	2	28
3	973	0.05	5299.99	2	47
4	973	0.07	416.99	1	71
1	974	0.10	469.99	2	33
2	974	0.20	269.99	2	22
1	975	0.20	470.99	2	110
1	976	0.10	599.99	2	26
2	976	0.07	1499.99	1	39
1	977	0.10	875.99	2	52
2	977	0.05	416.99	2	69
3	977	0.05	999.99	1	27
4	977	0.05	761.99	2	80
1	978	0.05	449.99	2	106
2	978	0.20	499.99	2	25
3	978	0.05	449.99	2	108
1	979	0.05	2699.99	1	55
2	979	0.20	416.99	2	71
3	979	0.10	549.99	2	12
4	979	0.20	875.99	1	52
1	980	0.20	3499.99	2	49
2	980	0.10	2999.99	1	9
3	980	0.10	489.99	1	64
1	981	0.10	832.99	1	35
2	981	0.05	299.99	2	95
3	981	0.07	269.99	2	21
4	981	0.10	832.99	2	36
5	981	0.07	4999.99	1	61
1	982	0.10	269.99	2	22
2	982	0.07	470.99	1	110
3	982	0.07	875.99	1	52
4	982	0.05	4999.99	2	40
1	983	0.10	3499.99	1	63
2	983	0.20	599.99	2	20
3	983	0.07	449.99	1	68
4	983	0.07	1099.99	2	81
5	983	0.05	189.99	1	88
1	984	0.20	449.99	1	68
2	984	0.20	1099.99	2	81
3	984	0.10	549.99	1	12
4	984	0.20	470.99	1	111
1	985	0.07	1320.99	2	5
2	985	0.20	2599.99	1	59
3	985	0.05	647.99	2	78
1	986	0.10	189.99	1	87
2	986	0.05	647.99	1	78
3	986	0.07	599.99	2	26
1	987	0.10	6499.99	2	51
2	987	0.20	1559.99	2	60
3	987	0.07	761.99	1	80
1	988	0.20	832.99	1	35
2	988	0.07	549.99	1	38
3	988	0.07	549.99	2	12
1	989	0.05	299.99	1	99
2	989	0.10	999.99	1	27
3	989	0.10	659.99	1	70
4	989	0.07	109.99	2	84
5	989	0.10	1320.99	1	5
1	990	0.20	469.99	2	6
2	990	0.10	999.99	1	29
3	990	0.10	349.99	1	91
4	990	0.10	269.99	2	14
1	991	0.20	2999.99	2	9
2	991	0.20	402.99	1	79
3	991	0.20	469.99	1	34
1	992	0.07	869.99	1	45
2	992	0.10	489.99	1	102
3	992	0.20	599.99	1	20
4	992	0.20	339.99	2	101
5	992	0.05	3999.99	1	7
1	993	0.20	4999.99	1	58
2	993	0.10	832.99	2	36
3	993	0.05	1549.00	2	10
4	993	0.07	299.99	2	99
5	993	0.10	402.99	2	79
1	994	0.10	379.99	2	37
2	994	0.20	869.99	1	45
3	994	0.07	250.99	1	66
1	995	0.10	599.99	2	16
2	995	0.20	209.99	1	90
3	995	0.10	339.99	1	101
1	996	0.05	449.99	2	68
2	996	0.05	469.99	1	32
1	997	0.07	149.99	2	86
2	997	0.20	533.99	2	105
3	997	0.07	269.99	2	14
1	998	0.05	599.99	2	26
2	998	0.20	533.99	1	105
1	999	0.07	659.99	2	70
2	999	0.05	449.99	1	106
1	1000	0.05	346.99	2	65
2	1000	0.10	470.99	1	111
3	1000	0.07	449.00	2	19
4	1000	0.05	999.99	2	29
1	1001	0.05	619.99	1	72
2	1001	0.05	869.99	2	45
3	1001	0.10	4999.99	1	58
4	1001	0.07	470.99	1	111
1	1002	0.05	489.99	1	100
2	1002	0.10	149.99	1	83
3	1002	0.10	1799.99	2	8
4	1002	0.20	402.99	1	79
1	1003	0.05	469.99	2	34
2	1003	0.05	6499.99	2	51
1	1004	0.10	832.99	2	36
1	1005	0.20	269.99	2	14
2	1005	0.10	1099.99	2	81
3	1005	0.10	299.99	1	99
1	1006	0.07	599.99	1	20
2	1006	0.10	449.99	1	68
3	1006	0.07	5499.99	2	56
4	1006	0.10	346.99	1	65
5	1006	0.10	1409.99	1	46
1	1007	0.20	599.99	1	26
2	1007	0.05	1680.99	1	11
3	1007	0.10	329.99	2	85
4	1007	0.20	299.99	1	76
5	1007	0.10	449.99	2	106
1	1008	0.20	416.99	1	71
2	1008	0.10	749.99	1	2
3	1008	0.07	299.99	1	95
1	1009	0.07	299.99	2	95
2	1009	0.07	539.99	1	44
1	1010	0.10	416.99	2	109
1	1011	0.20	189.99	1	88
2	1011	0.20	299.99	2	99
3	1011	0.20	599.99	2	16
4	1011	0.05	449.99	2	68
1	1012	0.07	1799.99	1	8
2	1012	0.20	489.99	1	64
1	1013	0.05	1559.99	2	60
1	1014	0.20	349.99	1	97
2	1014	0.05	869.99	2	45
3	1014	0.10	1099.99	2	81
4	1014	0.05	2599.99	1	59
1	1015	0.10	469.99	2	6
2	1015	0.20	749.99	2	73
3	1015	0.10	339.99	2	101
4	1015	0.20	269.99	1	13
1	1016	0.07	299.99	2	76
1	1017	0.07	209.99	1	89
2	1017	0.20	659.99	2	82
3	1017	0.20	489.99	1	100
4	1017	0.20	449.00	2	18
5	1017	0.10	799.99	2	77
1	1018	0.07	299.99	2	76
2	1018	0.10	349.99	2	97
3	1018	0.20	349.99	1	91
1	1019	0.10	999.99	1	30
2	1019	0.20	875.99	1	52
3	1019	0.05	379.99	1	37
4	1019	0.20	209.99	2	93
1	1020	0.05	599.99	2	20
2	1020	0.05	416.99	2	69
3	1020	0.07	529.99	1	15
4	1020	0.10	1999.99	2	57
5	1020	0.05	4999.99	2	40
1	1021	0.07	3499.99	2	49
2	1021	0.07	299.99	2	23
1	1022	0.20	469.99	1	33
2	1022	0.10	1409.99	1	46
3	1022	0.07	346.99	1	65
4	1022	0.07	1320.99	1	5
1	1023	0.07	349.99	1	91
2	1023	0.10	5299.99	2	43
1	1024	0.20	481.99	1	104
2	1024	0.05	2499.99	2	28
3	1024	0.20	489.99	2	98
4	1024	0.10	349.99	2	96
5	1024	0.20	349.99	1	91
1	1025	0.07	209.99	1	89
2	1025	0.10	489.99	1	102
3	1025	0.10	1499.99	1	39
4	1025	0.05	529.99	1	15
5	1025	0.05	250.99	2	66
1	1026	0.07	3999.99	2	7
1	1027	0.10	299.99	2	95
2	1027	0.05	269.99	2	14
1	1028	0.10	470.99	2	111
2	1028	0.20	1549.00	1	10
3	1028	0.20	1469.99	1	41
4	1028	0.10	832.99	2	35
5	1028	0.20	449.99	1	108
1	1029	0.20	599.99	1	20
2	1029	0.10	2699.99	1	55
3	1029	0.20	4999.99	1	40
4	1029	0.10	449.99	2	68
1	1030	0.05	999.99	1	27
2	1030	0.10	1549.00	2	10
3	1030	0.10	619.99	1	72
1	1031	0.20	999.99	2	27
2	1031	0.20	449.99	2	108
1	1032	0.10	1559.99	2	60
2	1032	0.10	429.00	1	17
1	1033	0.07	599.99	1	26
2	1033	0.10	416.99	2	109
3	1033	0.07	999.99	2	27
1	1034	0.10	339.99	1	101
2	1034	0.10	1799.99	2	8
3	1034	0.07	1680.99	2	11
4	1034	0.05	269.99	1	21
1	1035	0.20	349.99	1	96
1	1036	0.10	2699.99	2	55
2	1036	0.07	299.99	1	76
3	1036	0.05	449.00	2	18
4	1036	0.20	346.99	2	65
5	1036	0.20	549.99	1	12
1	1037	0.07	439.99	2	74
2	1037	0.07	999.99	1	3
3	1037	0.20	346.99	2	65
4	1037	0.07	209.99	1	92
5	1037	0.05	109.99	2	84
1	1038	0.05	149.99	1	83
2	1038	0.07	2999.99	1	9
1	1039	0.20	449.00	2	18
1	1040	0.10	349.99	1	97
2	1040	0.20	2499.99	2	28
3	1040	0.07	489.99	1	64
4	1040	0.07	999.99	2	27
5	1040	0.05	1799.99	2	8
1	1041	0.10	209.99	1	89
2	1041	0.07	4999.99	2	61
3	1041	0.10	249.99	2	94
1	1042	0.10	299.99	1	23
1	1043	0.10	2699.99	2	55
2	1043	0.07	599.99	1	20
1	1044	0.10	349.99	2	97
1	1045	0.05	2499.99	1	28
2	1045	0.05	481.99	2	104
1	1046	0.07	1559.99	1	60
2	1046	0.07	402.99	1	79
3	1046	0.07	469.99	1	32
4	1046	0.10	1469.99	2	41
5	1046	0.05	429.00	2	17
1	1047	0.10	2499.99	2	28
2	1047	0.20	647.99	1	78
3	1047	0.05	832.99	1	35
4	1047	0.05	3499.99	1	49
1	1048	0.10	999.99	2	3
2	1048	0.10	379.99	1	37
3	1048	0.05	249.99	1	94
1	1049	0.10	2999.99	1	9
2	1049	0.05	832.99	2	36
3	1049	0.10	999.99	1	3
4	1049	0.07	599.99	1	26
5	1049	0.05	1549.00	2	10
1	1050	0.07	349.99	2	96
2	1050	0.10	299.99	2	99
3	1050	0.20	869.99	2	45
4	1050	0.20	269.99	2	14
1	1051	0.20	1409.99	1	46
1	1052	0.05	3999.99	1	7
2	1052	0.05	551.99	1	103
3	1052	0.07	599.99	2	26
1	1053	0.05	3499.99	2	49
2	1053	0.20	599.99	2	26
3	1053	0.20	299.99	2	23
4	1053	0.10	449.99	1	68
5	1053	0.05	749.99	2	73
1	1054	0.10	832.99	2	36
2	1054	0.05	599.99	1	16
1	1055	0.07	5299.99	2	43
2	1055	0.20	339.99	2	101
3	1055	0.10	549.99	2	12
4	1055	0.10	149.99	2	83
5	1055	0.20	1559.99	1	60
1	1056	0.05	999.99	1	3
1	1057	0.20	533.99	1	105
2	1057	0.05	349.99	1	97
3	1057	0.05	489.99	2	98
1	1058	0.10	5299.99	1	43
2	1058	0.05	999.99	2	29
3	1058	0.07	551.99	1	103
1	1059	0.05	1409.99	2	46
2	1059	0.10	3999.99	1	7
3	1059	0.07	269.99	1	13
1	1060	0.07	3999.99	1	7
2	1060	0.07	1680.99	2	11
3	1060	0.10	4999.99	2	61
4	1060	0.05	999.99	2	30
1	1061	0.07	269.99	1	14
2	1061	0.10	449.00	1	19
1	1062	0.05	269.99	1	13
2	1062	0.20	470.99	2	111
3	1062	0.05	1320.99	1	5
4	1062	0.20	549.99	1	12
1	1063	0.10	469.99	2	33
2	1063	0.07	489.99	2	100
3	1063	0.20	619.99	2	72
1	1064	0.07	449.00	1	18
2	1064	0.10	3499.99	1	49
1	1065	0.07	1499.99	2	48
2	1065	0.05	551.99	2	103
3	1065	0.07	3499.99	1	63
1	1066	0.05	529.99	2	15
2	1066	0.10	1409.99	1	46
3	1066	0.10	549.99	1	12
1	1067	0.07	439.99	2	74
2	1067	0.20	2999.99	2	9
3	1067	0.10	619.99	2	72
4	1067	0.20	469.99	2	6
1	1068	0.20	189.99	2	87
2	1068	0.20	659.99	1	82
3	1068	0.20	3499.99	2	49
4	1068	0.20	869.99	2	45
1	1069	0.07	416.99	1	109
2	1069	0.10	209.99	1	93
1	1070	0.20	470.99	1	110
2	1070	0.10	449.00	2	18
3	1070	0.05	249.99	1	94
1	1071	0.20	499.99	2	25
1	1072	0.20	149.99	1	83
2	1072	0.07	209.99	2	89
3	1072	0.07	832.99	2	36
1	1073	0.20	1099.99	1	81
2	1073	0.07	269.99	1	13
3	1073	0.20	599.99	1	20
1	1074	0.10	2599.99	1	59
2	1074	0.07	189.99	1	87
3	1074	0.10	209.99	2	89
1	1075	0.10	1499.99	2	48
2	1075	0.05	470.99	2	111
1	1076	0.10	299.99	1	95
2	1076	0.07	489.99	1	102
3	1076	0.07	749.99	2	73
1	1077	0.05	1559.99	2	60
1	1078	0.07	299.99	2	76
2	1078	0.20	1559.99	2	60
3	1078	0.07	529.99	1	15
4	1078	0.10	1549.00	2	10
5	1078	0.20	619.99	2	72
1	1079	0.07	659.99	2	70
1	1080	0.20	1632.99	1	31
2	1080	0.10	4999.99	1	40
3	1080	0.05	5999.99	1	50
4	1080	0.20	469.99	2	32
5	1080	0.05	149.99	1	86
1	1081	0.10	875.99	2	52
1	1082	0.20	999.99	2	29
1	1083	0.20	346.99	2	65
2	1083	0.10	799.99	2	77
3	1083	0.07	4999.99	1	61
4	1083	0.20	469.99	1	33
1	1084	0.05	999.99	1	30
2	1084	0.05	659.99	1	70
3	1084	0.20	489.99	2	98
4	1084	0.07	346.99	2	65
5	1084	0.10	1559.99	1	60
1	1085	0.20	250.99	2	66
2	1085	0.10	489.99	1	64
3	1085	0.10	439.99	1	74
1	1086	0.07	449.99	1	108
2	1086	0.10	250.99	1	67
3	1086	0.05	1099.99	2	81
4	1086	0.07	1549.00	2	10
5	1086	0.20	1320.99	1	5
1	1087	0.07	529.99	1	15
2	1087	0.07	489.99	2	102
3	1087	0.10	2599.99	2	59
4	1087	0.07	269.99	2	13
5	1087	0.20	416.99	2	109
1	1088	0.10	489.99	1	64
2	1088	0.10	999.99	1	30
3	1088	0.07	469.99	1	33
4	1088	0.20	832.99	2	36
1	1089	0.07	659.99	2	70
2	1089	0.05	999.99	2	30
1	1090	0.20	439.99	1	74
1	1091	0.05	349.99	1	97
2	1091	0.10	5499.99	1	56
3	1091	0.10	449.00	1	19
1	1092	0.05	469.99	1	34
2	1092	0.07	999.99	2	30
3	1092	0.10	749.99	2	2
4	1092	0.20	449.00	1	18
1	1093	0.07	869.99	2	45
2	1093	0.10	429.00	2	17
3	1093	0.10	209.99	2	90
1	1094	0.10	416.99	1	71
2	1094	0.10	1680.99	1	11
3	1094	0.10	549.99	1	24
4	1094	0.20	416.99	1	107
1	1095	0.05	647.99	2	78
2	1095	0.20	999.99	2	3
3	1095	0.10	529.99	2	15
4	1095	0.20	1632.99	1	31
5	1095	0.05	5999.99	2	50
1	1096	0.10	1680.99	1	11
1	1097	0.05	299.99	1	99
2	1097	0.07	449.99	2	106
3	1097	0.07	489.99	2	98
4	1097	0.20	449.00	1	19
5	1097	0.05	832.99	2	35
1	1098	0.10	189.99	1	88
1	1099	0.10	489.99	1	64
2	1099	0.05	269.99	2	13
3	1099	0.07	1409.99	1	46
4	1099	0.10	209.99	2	89
1	1100	0.05	549.99	1	12
2	1100	0.10	2999.99	2	9
1	1101	0.07	533.99	1	105
2	1101	0.05	6499.99	1	51
1	1102	0.07	349.99	1	91
1	1103	0.20	449.99	1	106
2	1103	0.20	1409.99	2	46
1	1104	0.10	429.00	1	17
2	1104	0.10	659.99	2	70
3	1104	0.07	5299.99	1	43
4	1104	0.07	761.99	1	80
1	1105	0.05	1559.99	1	60
2	1105	0.20	5499.99	2	56
3	1105	0.07	832.99	2	35
1	1106	0.10	349.99	1	96
1	1107	0.20	5299.99	1	43
2	1107	0.20	1469.99	2	41
1	1108	0.05	869.99	2	45
2	1108	0.07	489.99	1	100
3	1108	0.07	533.99	1	105
1	1109	0.10	619.99	2	72
1	1110	0.10	5499.99	1	56
1	1111	0.05	299.99	1	95
2	1111	0.10	250.99	2	66
3	1111	0.20	269.99	1	14
4	1111	0.07	549.99	1	24
1	1112	0.05	416.99	2	71
2	1112	0.07	2299.99	1	42
3	1112	0.10	1320.99	2	5
4	1112	0.07	189.99	2	87
5	1112	0.10	2999.99	2	9
1	1113	0.07	449.99	1	106
1	1114	0.20	875.99	1	52
1	1115	0.20	349.99	2	97
2	1115	0.07	5999.99	2	50
3	1115	0.07	349.99	2	91
4	1115	0.10	3499.99	2	49
1	1116	0.07	1680.99	2	11
1	1117	0.10	379.99	2	37
2	1117	0.20	349.99	1	91
3	1117	0.10	6499.99	2	51
1	1118	0.20	2699.99	2	55
2	1118	0.07	5999.99	1	50
3	1118	0.05	999.99	1	29
4	1118	0.20	5299.99	2	47
1	1119	0.10	209.99	2	93
2	1119	0.05	2699.99	2	55
3	1119	0.20	481.99	1	104
1	1120	0.07	209.99	2	92
2	1120	0.07	1632.99	1	31
3	1120	0.05	999.99	2	30
4	1120	0.07	209.99	1	93
5	1120	0.20	249.99	1	94
1	1121	0.10	1680.99	2	11
2	1121	0.05	470.99	2	110
1	1122	0.07	2999.99	2	9
2	1122	0.10	749.99	1	53
3	1122	0.20	3499.99	2	49
4	1122	0.05	1469.99	2	41
5	1122	0.10	619.99	1	72
1	1123	0.07	346.99	2	65
2	1123	0.10	4999.99	2	61
1	1124	0.10	3999.99	2	7
2	1124	0.10	469.99	1	6
3	1124	0.07	416.99	2	109
4	1124	0.05	869.99	2	45
5	1124	0.05	749.99	2	2
1	1125	0.05	599.99	2	16
2	1125	0.10	269.99	1	21
3	1125	0.07	1099.99	2	81
4	1125	0.07	549.99	1	24
5	1125	0.07	469.99	2	32
1	1126	0.10	469.99	2	33
2	1126	0.20	4999.99	1	58
3	1126	0.05	209.99	2	89
1	1127	0.10	299.99	2	23
2	1127	0.07	349.99	2	96
3	1127	0.20	379.99	1	37
1	1128	0.05	539.99	1	44
2	1128	0.20	1549.00	1	10
3	1128	0.05	346.99	2	65
1	1129	0.20	416.99	2	71
2	1129	0.20	5499.99	1	56
3	1129	0.05	4999.99	2	61
1	1130	0.20	3199.99	2	54
1	1131	0.07	1559.99	2	60
2	1131	0.05	551.99	2	103
1	1132	0.05	5299.99	1	43
2	1132	0.10	1549.00	1	10
3	1132	0.10	832.99	2	36
4	1132	0.05	599.99	1	16
1	1133	0.05	2899.99	2	4
2	1133	0.07	429.00	1	17
3	1133	0.20	209.99	2	90
4	1133	0.20	3499.99	1	62
1	1134	0.10	349.99	1	97
2	1134	0.10	832.99	1	36
1	1135	0.05	339.99	2	101
2	1135	0.10	6499.99	1	51
1	1136	0.10	533.99	1	105
1	1137	0.20	2499.99	1	28
2	1137	0.20	4999.99	2	58
3	1137	0.20	109.99	2	84
4	1137	0.07	416.99	2	69
1	1138	0.05	269.99	2	13
2	1138	0.05	533.99	2	105
3	1138	0.10	209.99	1	93
1	1139	0.05	449.99	2	106
2	1139	0.10	539.99	2	44
3	1139	0.05	416.99	1	69
4	1139	0.10	499.99	2	25
5	1139	0.10	3999.99	1	7
1	1140	0.10	1499.99	2	39
2	1140	0.07	416.99	2	71
3	1140	0.10	549.99	2	38
4	1140	0.07	4999.99	2	40
1	1141	0.10	1799.99	1	8
1	1142	0.07	599.99	2	20
2	1142	0.10	999.99	1	30
3	1142	0.05	416.99	2	109
4	1142	0.20	449.99	2	108
5	1142	0.05	489.99	2	100
1	1143	0.20	299.99	1	99
2	1143	0.20	1499.99	1	48
3	1143	0.10	416.99	2	69
1	1144	0.07	189.99	1	88
1	1145	0.07	533.99	2	105
1	1146	0.07	832.99	1	36
2	1146	0.20	489.99	1	64
3	1146	0.20	1680.99	1	11
1	1147	0.20	659.99	1	82
2	1147	0.05	1499.99	2	39
1	1148	0.07	659.99	1	82
2	1148	0.07	269.99	1	22
3	1148	0.05	799.99	2	77
4	1148	0.10	249.99	2	94
1	1149	0.07	489.99	2	98
2	1149	0.05	1499.99	1	48
3	1149	0.05	4999.99	1	58
4	1149	0.20	329.99	1	85
5	1149	0.10	249.99	1	94
1	1150	0.05	999.99	1	29
2	1150	0.05	349.99	1	91
3	1150	0.07	481.99	2	104
4	1150	0.10	269.99	2	21
1	1151	0.05	999.99	2	30
1	1152	0.07	4999.99	1	58
2	1152	0.20	349.99	2	91
3	1152	0.05	549.99	1	24
1	1153	0.10	551.99	1	103
2	1153	0.05	469.99	2	6
1	1154	0.20	429.00	1	17
2	1154	0.07	1559.99	1	60
3	1154	0.20	250.99	2	67
1	1155	0.05	449.99	2	68
2	1155	0.10	469.99	2	6
3	1155	0.07	832.99	1	35
4	1155	0.05	799.99	2	77
1	1156	0.05	470.99	2	111
2	1156	0.05	149.99	1	86
1	1157	0.10	599.99	1	20
2	1157	0.10	1632.99	2	31
3	1157	0.20	379.99	2	37
4	1157	0.07	1469.99	1	41
1	1158	0.10	299.99	2	95
2	1158	0.07	439.99	1	74
1	1159	0.10	549.99	2	12
1	1160	0.10	1469.99	1	41
2	1160	0.20	2999.99	1	9
1	1161	0.10	416.99	2	71
2	1161	0.07	549.99	1	38
3	1161	0.20	269.99	1	22
4	1161	0.10	999.99	2	29
1	1162	0.20	189.99	1	88
2	1162	0.20	4999.99	2	40
3	1162	0.10	149.99	1	86
4	1162	0.05	1469.99	1	41
5	1162	0.05	549.99	2	12
1	1163	0.05	3499.99	2	63
2	1163	0.10	749.99	2	53
1	1164	0.20	1799.99	1	8
2	1164	0.05	647.99	1	78
3	1164	0.05	551.99	2	103
4	1164	0.05	539.99	2	44
1	1165	0.07	346.99	2	65
2	1165	0.07	449.99	1	68
1	1166	0.07	551.99	2	103
1	1167	0.05	999.99	2	29
2	1167	0.10	1099.99	2	81
3	1167	0.07	449.99	1	68
1	1168	0.10	299.99	2	23
2	1168	0.20	659.99	1	82
3	1168	0.07	6499.99	1	51
4	1168	0.20	416.99	2	107
5	1168	0.05	529.99	2	15
1	1169	0.20	349.99	2	91
2	1169	0.05	6499.99	1	51
3	1169	0.10	4999.99	2	58
4	1169	0.20	1099.99	2	81
1	1170	0.10	529.99	1	15
2	1170	0.05	5299.99	2	47
3	1170	0.10	3499.99	2	62
1	1171	0.20	249.99	2	94
2	1171	0.07	209.99	2	92
3	1171	0.07	1549.00	2	10
1	1172	0.07	647.99	2	78
2	1172	0.20	481.99	1	104
1	1173	0.20	299.99	1	95
2	1173	0.07	429.00	1	17
3	1173	0.05	449.99	1	68
4	1173	0.20	551.99	2	103
1	1174	0.20	470.99	2	110
2	1174	0.07	469.99	1	6
3	1174	0.10	449.99	1	106
1	1175	0.07	4999.99	2	58
2	1175	0.20	346.99	1	65
3	1175	0.05	599.99	1	20
4	1175	0.05	999.99	1	3
5	1175	0.05	2999.99	1	9
1	1176	0.10	189.99	1	87
1	1177	0.07	3499.99	2	62
2	1177	0.10	439.99	1	74
1	1178	0.07	1409.99	1	46
2	1178	0.20	799.99	1	77
3	1178	0.05	449.99	1	108
4	1178	0.05	269.99	2	13
1	1179	0.05	209.99	2	93
2	1179	0.05	189.99	2	88
3	1179	0.20	469.99	2	33
4	1179	0.07	5999.99	1	50
1	1180	0.07	250.99	2	66
1	1181	0.10	489.99	1	98
1	1182	0.10	832.99	1	35
2	1182	0.10	3499.99	2	49
1	1183	0.20	3499.99	1	63
2	1183	0.20	761.99	2	80
3	1183	0.05	469.99	2	6
1	1184	0.05	599.99	2	16
2	1184	0.05	416.99	1	71
1	1185	0.07	449.00	2	19
2	1185	0.07	269.99	1	21
3	1185	0.10	3499.99	2	63
4	1185	0.20	761.99	1	80
1	1186	0.10	1499.99	2	48
2	1186	0.07	3499.99	1	49
3	1186	0.10	449.99	1	106
4	1186	0.20	999.99	1	27
1	1187	0.10	832.99	2	36
2	1187	0.07	402.99	1	79
3	1187	0.10	2899.99	1	4
4	1187	0.10	749.99	2	53
1	1188	0.10	250.99	2	66
2	1188	0.20	349.99	2	91
3	1188	0.10	189.99	2	87
1	1189	0.07	2699.99	1	55
2	1189	0.10	489.99	2	102
3	1189	0.10	4999.99	2	40
1	1190	0.07	416.99	1	71
1	1191	0.10	4999.99	2	40
2	1191	0.10	209.99	2	89
3	1191	0.07	489.99	1	100
1	1192	0.10	549.99	2	24
2	1192	0.07	189.99	2	88
3	1192	0.20	379.99	2	37
1	1193	0.05	149.99	2	83
2	1193	0.05	999.99	1	27
1	1194	0.05	416.99	1	71
2	1194	0.07	3999.99	2	7
3	1194	0.10	533.99	2	105
4	1194	0.05	109.99	1	84
1	1195	0.07	875.99	1	52
1	1196	0.07	749.99	1	53
1	1197	0.07	269.99	1	13
2	1197	0.05	449.99	2	108
3	1197	0.05	2999.99	2	9
4	1197	0.20	449.99	2	106
1	1198	0.05	533.99	1	105
1	1199	0.05	469.99	1	32
2	1199	0.07	249.99	2	94
3	1199	0.10	416.99	2	109
1	1200	0.20	2299.99	2	42
1	1201	0.07	299.99	1	95
2	1201	0.05	269.99	1	13
3	1201	0.20	599.99	1	26
4	1201	0.05	429.00	2	17
5	1201	0.20	449.00	2	19
1	1202	0.05	109.99	2	84
1	1203	0.07	469.99	2	6
2	1203	0.05	2699.99	1	55
1	1204	0.07	379.99	2	37
1	1205	0.20	533.99	2	105
2	1205	0.20	1409.99	2	46
3	1205	0.05	416.99	1	71
4	1205	0.07	402.99	2	79
5	1205	0.10	209.99	1	92
1	1206	0.07	749.99	1	73
2	1206	0.20	999.99	1	29
1	1207	0.05	481.99	1	104
2	1207	0.10	551.99	1	103
3	1207	0.07	299.99	1	23
1	1208	0.20	549.99	1	12
2	1208	0.07	346.99	2	65
3	1208	0.20	149.99	2	86
4	1208	0.10	269.99	2	13
5	1208	0.07	189.99	1	87
1	1209	0.07	209.99	1	89
2	1209	0.05	349.99	1	97
1	1210	0.10	599.99	1	26
2	1210	0.07	469.99	2	6
3	1210	0.05	647.99	2	78
4	1210	0.10	109.99	1	84
5	1210	0.05	832.99	2	35
1	1211	0.20	529.99	2	15
2	1211	0.05	2599.99	1	59
3	1211	0.20	209.99	1	92
4	1211	0.10	209.99	1	93
5	1211	0.20	449.99	2	108
1	1212	0.10	439.99	1	74
2	1212	0.07	379.99	2	37
3	1212	0.05	1499.99	2	39
4	1212	0.07	449.99	2	68
1	1213	0.07	489.99	2	64
2	1213	0.07	647.99	1	78
3	1213	0.10	489.99	2	102
4	1213	0.05	529.99	1	15
1	1214	0.05	2999.99	2	9
2	1214	0.20	3999.99	1	7
3	1214	0.05	269.99	1	22
4	1214	0.10	799.99	2	77
5	1214	0.20	250.99	2	67
1	1215	0.10	749.99	2	73
2	1215	0.07	1549.00	2	10
1	1216	0.10	489.99	2	64
2	1216	0.05	3199.99	1	54
3	1216	0.20	449.00	1	19
4	1216	0.07	470.99	2	110
5	1216	0.10	5299.99	1	43
1	1217	0.05	749.99	1	73
2	1217	0.05	449.99	2	106
1	1218	0.07	469.99	1	32
2	1218	0.05	489.99	2	102
1	1219	0.07	429.00	2	17
2	1219	0.10	3499.99	2	62
3	1219	0.20	4999.99	2	40
1	1220	0.10	5299.99	2	47
2	1220	0.20	3499.99	1	49
3	1220	0.20	329.99	2	85
1	1221	0.05	489.99	1	100
2	1221	0.05	1099.99	2	81
3	1221	0.10	2299.99	2	42
4	1221	0.10	549.99	2	38
5	1221	0.07	349.99	2	97
1	1222	0.20	349.99	1	97
1	1223	0.05	551.99	1	103
1	1224	0.07	3499.99	1	62
2	1224	0.10	6499.99	1	51
3	1224	0.05	449.99	1	108
4	1224	0.20	469.99	1	32
1	1225	0.10	1099.99	1	81
2	1225	0.10	2599.99	2	59
3	1225	0.10	469.99	2	6
1	1226	0.05	799.99	2	77
2	1226	0.20	339.99	1	101
3	1226	0.07	1680.99	2	11
4	1226	0.07	6499.99	1	51
5	1226	0.10	2299.99	1	42
1	1227	0.20	209.99	2	90
2	1227	0.07	539.99	1	44
3	1227	0.05	599.99	1	26
4	1227	0.07	1799.99	1	8
5	1227	0.20	2299.99	2	42
1	1228	0.20	209.99	1	92
2	1228	0.20	2699.99	2	55
3	1228	0.05	599.99	2	20
1	1229	0.07	832.99	2	36
2	1229	0.10	4999.99	2	61
1	1230	0.10	469.99	2	32
2	1230	0.07	549.99	2	38
1	1231	0.05	599.99	2	75
2	1231	0.07	659.99	1	70
1	1232	0.07	2899.99	2	4
2	1232	0.05	470.99	2	110
3	1232	0.20	469.99	2	6
1	1233	0.20	189.99	2	87
2	1233	0.10	4999.99	2	61
3	1233	0.20	2699.99	1	55
1	1234	0.07	5499.99	2	56
2	1234	0.07	416.99	2	71
1	1235	0.10	3999.99	1	7
1	1236	0.07	1559.99	1	60
2	1236	0.05	469.99	2	32
3	1236	0.10	349.99	1	91
1	1237	0.10	299.99	1	23
2	1237	0.10	189.99	2	87
3	1237	0.20	299.99	2	95
4	1237	0.07	2699.99	2	55
5	1237	0.07	499.99	1	25
1	1238	0.10	4999.99	1	40
2	1238	0.10	269.99	1	14
3	1238	0.20	299.99	2	99
4	1238	0.10	339.99	1	101
1	1239	0.20	529.99	2	15
2	1239	0.10	349.99	1	91
3	1239	0.10	469.99	2	34
4	1239	0.05	832.99	1	36
1	1240	0.10	416.99	2	107
2	1240	0.05	299.99	2	23
3	1240	0.20	529.99	2	15
4	1240	0.05	799.99	2	77
5	1240	0.05	1999.99	1	57
1	1241	0.05	439.99	1	74
2	1241	0.05	416.99	2	71
1	1242	0.05	249.99	1	94
2	1242	0.07	999.99	1	27
3	1242	0.07	1549.00	1	10
4	1242	0.20	659.99	1	70
1	1243	0.07	539.99	1	44
1	1244	0.20	869.99	1	45
2	1244	0.07	549.99	2	38
3	1244	0.07	469.99	1	33
4	1244	0.10	379.99	2	37
1	1245	0.10	269.99	1	13
1	1246	0.20	647.99	2	78
2	1246	0.05	1409.99	1	46
3	1246	0.07	869.99	2	45
1	1247	0.10	529.99	2	15
2	1247	0.10	2499.99	2	28
3	1247	0.05	599.99	1	26
1	1248	0.05	249.99	2	94
2	1248	0.10	469.99	2	33
3	1248	0.10	209.99	1	92
4	1248	0.05	549.99	1	12
1	1249	0.05	3499.99	1	62
2	1249	0.05	481.99	1	104
3	1249	0.20	4999.99	1	61
1	1250	0.05	647.99	2	78
2	1250	0.10	250.99	2	66
3	1250	0.05	599.99	2	20
4	1250	0.10	469.99	2	6
1	1251	0.10	4999.99	2	40
2	1251	0.07	5499.99	1	56
3	1251	0.07	3999.99	1	7
1	1252	0.20	402.99	1	79
2	1252	0.20	109.99	1	84
3	1252	0.05	1999.99	2	57
1	1253	0.10	499.99	2	25
2	1253	0.07	269.99	1	21
3	1253	0.20	189.99	1	88
1	1254	0.20	761.99	1	80
2	1254	0.20	349.99	1	91
1	1255	0.20	5299.99	2	43
2	1255	0.05	749.99	1	53
3	1255	0.20	269.99	2	14
4	1255	0.05	599.99	2	26
5	1255	0.05	659.99	1	82
1	1256	0.20	539.99	2	44
2	1256	0.10	489.99	1	100
1	1257	0.05	999.99	2	30
2	1257	0.05	4999.99	1	61
3	1257	0.10	429.00	2	17
4	1257	0.05	1469.99	1	41
5	1257	0.10	2899.99	1	4
1	1258	0.10	249.99	2	94
2	1258	0.05	299.99	2	99
1	1259	0.10	1559.99	1	60
2	1259	0.20	449.00	1	19
1	1260	0.10	1799.99	1	8
2	1260	0.10	250.99	1	66
1	1261	0.20	749.99	1	73
2	1261	0.20	189.99	2	88
3	1261	0.05	489.99	1	100
4	1261	0.10	2299.99	1	42
1	1262	0.07	379.99	1	37
2	1262	0.05	875.99	1	52
3	1262	0.07	5299.99	2	43
4	1262	0.07	799.99	1	77
1	1263	0.20	869.99	1	45
2	1263	0.05	3499.99	1	62
3	1263	0.10	449.00	2	19
1	1264	0.07	339.99	1	101
2	1264	0.07	799.99	2	77
3	1264	0.20	999.99	2	29
4	1264	0.05	875.99	1	52
1	1265	0.10	1469.99	2	41
2	1265	0.07	619.99	2	72
1	1266	0.20	209.99	1	90
2	1266	0.20	1499.99	1	48
1	1267	0.10	869.99	1	45
2	1267	0.07	999.99	1	27
3	1267	0.20	449.99	1	108
4	1267	0.05	299.99	1	95
1	1268	0.07	449.99	2	68
2	1268	0.07	189.99	2	87
3	1268	0.20	2599.99	2	59
4	1268	0.07	489.99	1	100
1	1269	0.20	2899.99	2	4
2	1269	0.20	3999.99	1	7
3	1269	0.10	470.99	1	111
1	1270	0.20	3199.99	1	54
1	1271	0.10	499.99	2	25
2	1271	0.07	5999.99	2	50
3	1271	0.07	189.99	2	87
4	1271	0.07	469.99	2	32
1	1272	0.20	599.99	2	16
2	1272	0.10	416.99	2	71
3	1272	0.07	149.99	1	86
1	1273	0.07	299.99	2	95
2	1273	0.07	599.99	1	20
3	1273	0.20	4999.99	1	58
1	1274	0.10	1099.99	1	81
1	1275	0.07	4999.99	1	58
2	1275	0.10	999.99	1	30
1	1276	0.20	449.00	2	18
2	1276	0.20	4999.99	1	58
3	1276	0.05	2299.99	1	42
4	1276	0.20	549.99	2	24
5	1276	0.20	647.99	2	78
1	1277	0.20	5499.99	2	56
2	1277	0.05	209.99	2	93
3	1277	0.10	2999.99	2	9
4	1277	0.10	2899.99	1	4
5	1277	0.20	1680.99	1	11
1	1278	0.10	551.99	2	103
2	1278	0.10	469.99	1	32
1	1279	0.05	2999.99	2	9
1	1280	0.07	619.99	2	72
2	1280	0.05	439.99	1	74
3	1280	0.07	875.99	1	52
4	1280	0.20	3499.99	1	63
1	1281	0.05	832.99	1	36
2	1281	0.05	3499.99	2	49
3	1281	0.05	599.99	1	75
1	1282	0.05	470.99	1	111
2	1282	0.20	5999.99	2	50
1	1283	0.05	4999.99	2	61
2	1283	0.20	1099.99	1	81
3	1283	0.10	3999.99	1	7
4	1283	0.10	469.99	1	32
5	1283	0.20	1680.99	1	11
1	1284	0.07	339.99	1	101
2	1284	0.05	1799.99	1	8
3	1284	0.05	2899.99	2	4
1	1285	0.07	647.99	2	78
2	1285	0.10	209.99	1	93
3	1285	0.20	416.99	2	69
4	1285	0.10	469.99	1	6
1	1286	0.20	416.99	2	109
2	1286	0.07	1099.99	2	81
3	1286	0.07	189.99	1	87
1	1287	0.20	999.99	2	27
2	1287	0.10	3499.99	2	62
3	1287	0.10	551.99	1	103
4	1287	0.05	489.99	2	100
1	1288	0.20	749.99	1	73
2	1288	0.20	489.99	2	64
3	1288	0.10	3499.99	2	62
4	1288	0.07	429.00	2	17
1	1289	0.05	209.99	1	89
2	1289	0.10	999.99	1	3
1	1290	0.05	599.99	2	75
2	1290	0.05	832.99	1	36
3	1290	0.10	209.99	2	92
1	1291	0.10	1999.99	1	57
2	1291	0.05	4999.99	2	58
1	1292	0.07	659.99	1	70
1	1293	0.10	189.99	2	88
2	1293	0.05	439.99	2	74
3	1293	0.07	549.99	2	38
1	1294	0.05	299.99	2	95
2	1294	0.05	539.99	1	44
1	1295	0.20	1320.99	2	5
2	1295	0.20	4999.99	1	61
3	1295	0.05	875.99	1	52
1	1296	0.05	499.99	2	25
2	1296	0.10	209.99	1	90
3	1296	0.05	599.99	1	16
4	1296	0.10	749.99	2	2
1	1297	0.07	481.99	2	104
2	1297	0.05	5299.99	1	43
3	1297	0.05	6499.99	2	51
1	1298	0.05	2599.99	1	59
2	1298	0.07	470.99	2	110
1	1299	0.10	269.99	2	14
2	1299	0.05	339.99	1	101
3	1299	0.05	599.99	1	75
4	1299	0.20	875.99	2	52
1	1300	0.07	339.99	2	101
2	1300	0.05	4999.99	2	58
1	1301	0.20	869.99	2	45
2	1301	0.10	533.99	2	105
3	1301	0.20	1799.99	1	8
1	1302	0.05	549.99	1	38
2	1302	0.10	599.99	2	20
3	1302	0.07	5499.99	2	56
1	1303	0.10	349.99	1	96
2	1303	0.20	3499.99	2	63
3	1303	0.10	449.99	1	108
4	1303	0.10	749.99	1	73
5	1303	0.10	549.99	2	24
1	1304	0.05	761.99	1	80
2	1304	0.05	299.99	2	99
3	1304	0.20	489.99	1	102
4	1304	0.05	429.00	1	17
1	1305	0.20	329.99	1	85
2	1305	0.07	2999.99	1	9
3	1305	0.05	1680.99	1	11
4	1305	0.05	349.99	2	91
1	1306	0.05	551.99	2	103
2	1306	0.07	1099.99	2	81
3	1306	0.20	869.99	1	45
4	1306	0.20	2299.99	1	42
5	1306	0.07	2999.99	2	9
1	1307	0.07	349.99	2	96
2	1307	0.20	749.99	2	53
3	1307	0.20	416.99	2	69
1	1308	0.05	3199.99	1	54
2	1308	0.20	416.99	1	69
3	1308	0.07	269.99	2	14
4	1308	0.20	5499.99	1	56
5	1308	0.07	469.99	1	32
1	1309	0.05	346.99	1	65
2	1309	0.20	189.99	2	87
1	1310	0.20	2599.99	1	59
2	1310	0.20	799.99	2	77
3	1310	0.10	1680.99	2	11
4	1310	0.20	3199.99	1	54
1	1311	0.10	416.99	1	69
2	1311	0.07	869.99	2	45
3	1311	0.10	999.99	2	27
4	1311	0.10	2299.99	1	42
1	1312	0.05	250.99	2	67
2	1312	0.20	269.99	1	14
3	1312	0.07	599.99	1	20
1	1313	0.20	599.99	1	75
2	1313	0.20	469.99	1	33
3	1313	0.07	416.99	1	69
1	1314	0.07	875.99	1	52
2	1314	0.05	619.99	2	72
3	1314	0.10	249.99	1	94
1	1315	0.07	481.99	2	104
2	1315	0.05	1469.99	1	41
3	1315	0.10	549.99	1	24
4	1315	0.07	599.99	1	26
5	1315	0.20	599.99	2	16
1	1316	0.10	299.99	2	76
2	1316	0.10	209.99	1	90
1	1317	0.10	659.99	1	82
1	1318	0.20	659.99	2	82
2	1318	0.20	3499.99	2	62
3	1318	0.20	470.99	1	111
4	1318	0.07	209.99	1	92
1	1319	0.07	599.99	1	75
2	1319	0.20	349.99	1	91
1	1320	0.10	481.99	1	104
2	1320	0.05	209.99	1	93
3	1320	0.20	299.99	2	99
1	1321	0.10	469.99	1	34
2	1321	0.10	416.99	1	107
3	1321	0.10	1680.99	2	11
1	1322	0.05	2499.99	2	28
2	1322	0.05	481.99	2	104
1	1323	0.07	999.99	2	27
2	1323	0.05	599.99	1	20
3	1323	0.05	659.99	1	70
1	1324	0.10	250.99	1	66
2	1324	0.20	2499.99	2	120
3	1324	0.10	899.99	1	235
4	1324	0.20	999.99	1	3
1	1325	0.05	2999.99	1	139
2	1325	0.05	899.99	1	257
3	1325	0.10	2999.99	1	209
4	1325	0.07	2499.99	1	28
1	1326	0.07	2799.99	2	190
2	1326	0.07	199.99	2	269
1	1327	0.07	1549.99	2	151
2	1327	0.10	899.99	2	235
3	1327	0.10	1499.99	2	48
4	1327	0.20	919.99	1	180
1	1328	0.07	749.99	1	241
2	1328	0.10	919.99	2	129
3	1328	0.07	319.99	1	228
4	1328	0.10	749.99	1	311
5	1328	0.10	599.99	1	247
1	1329	0.07	1099.99	1	143
2	1329	0.05	416.99	1	107
3	1329	0.07	2699.99	1	55
4	1329	0.20	319.99	2	283
5	1329	0.10	269.99	1	13
1	1330	0.20	479.99	1	232
2	1330	0.05	679.99	2	243
3	1330	0.20	429.99	2	230
4	1330	0.05	489.99	2	102
5	1330	0.10	279.99	1	282
1	1331	0.05	2599.99	1	253
2	1331	0.05	369.99	1	290
3	1331	0.10	1799.99	2	145
4	1331	0.20	799.99	1	300
1	1332	0.20	369.99	1	296
2	1332	0.05	209.99	2	93
3	1332	0.07	919.99	2	179
4	1332	0.10	279.99	1	298
1	1333	0.05	4999.99	2	205
2	1333	0.10	679.99	2	304
3	1333	0.10	299.99	2	99
4	1333	0.05	549.99	1	12
5	1333	0.10	647.99	1	78
1	1334	0.05	4999.99	2	203
2	1334	0.07	4499.99	2	160
3	1334	0.10	109.99	2	84
4	1334	0.05	269.99	1	13
5	1334	0.05	2299.99	1	42
1	1335	0.05	2249.99	2	138
1	1336	0.20	999.99	2	29
2	1336	0.05	6499.99	1	157
3	1336	0.07	269.99	2	21
4	1336	0.10	3999.99	1	207
5	1336	0.10	2799.99	1	185
1	1337	0.10	4999.99	1	153
1	1338	0.07	6499.99	2	169
1	1339	0.07	3199.99	1	175
1	1340	0.20	2599.99	1	253
2	1340	0.20	209.99	2	92
3	1340	0.05	849.99	2	237
1	1341	0.07	749.99	2	215
2	1341	0.20	5499.99	2	56
3	1341	0.05	899.99	2	234
4	1341	0.05	250.99	2	66
1	1342	0.05	1559.99	1	60
2	1342	0.05	209.99	1	270
1	1343	0.05	559.99	1	244
2	1343	0.05	299.99	1	99
3	1343	0.20	3499.99	2	184
4	1343	0.20	346.99	2	65
5	1343	0.10	3299.99	1	206
1	1344	0.07	799.99	2	77
2	1344	0.20	551.99	2	103
3	1344	0.07	999.99	1	3
4	1344	0.07	4999.99	1	61
1	1345	0.20	4999.99	2	40
2	1345	0.05	3199.99	2	172
3	1345	0.20	1549.00	2	164
4	1345	0.20	749.99	2	2
1	1346	0.05	1499.99	2	134
2	1346	0.05	4499.99	1	150
3	1346	0.05	449.00	2	18
4	1346	0.10	749.99	1	249
5	1346	0.20	89.99	2	263
1	1347	0.07	5299.99	2	43
2	1347	0.05	749.99	1	53
1	1348	0.05	4999.99	1	203
2	1348	0.05	5499.99	1	148
3	1348	0.10	4999.99	2	58
4	1348	0.07	1799.99	1	147
1	1349	0.05	2249.99	2	138
2	1349	0.07	4999.99	2	205
3	1349	0.20	1549.00	2	168
4	1349	0.20	3499.99	1	184
1	1350	0.10	749.99	1	305
2	1350	0.07	2599.99	1	250
3	1350	0.07	2599.99	1	253
4	1350	0.05	2299.99	1	159
5	1350	0.20	269.99	2	13
1	1351	0.20	279.99	2	297
2	1351	0.10	1499.99	1	133
1	1352	0.20	1799.99	1	136
2	1352	0.10	875.99	2	52
3	1352	0.10	279.99	2	282
4	1352	0.20	149.99	2	86
5	1352	0.05	489.99	1	100
1	1353	0.05	416.99	2	107
2	1353	0.07	639.99	1	233
3	1353	0.20	799.99	1	300
4	1353	0.05	149.99	2	86
1	1354	0.07	749.99	2	166
1	1355	0.10	279.99	1	297
2	1355	0.07	2599.99	1	253
3	1355	0.20	7499.99	1	149
4	1355	0.10	449.99	2	313
1	1356	0.05	2599.99	1	192
2	1356	0.10	2999.99	2	199
3	1356	0.10	319.99	2	276
1	1357	0.20	1799.99	2	145
2	1357	0.20	1559.99	1	60
3	1357	0.20	919.99	1	130
1	1358	0.20	899.99	2	257
1	1359	0.05	279.99	1	282
2	1359	0.05	659.99	1	82
1	1360	0.05	1632.99	1	31
1	1361	0.07	749.99	2	307
2	1361	0.05	4999.99	1	153
3	1361	0.20	1349.00	2	163
1	1362	0.20	999.99	2	27
2	1362	0.07	3599.99	2	204
3	1362	0.20	2899.99	2	4
1	1363	0.10	250.99	2	66
1	1364	0.07	647.99	1	78
2	1364	0.10	11999.99	2	155
3	1364	0.10	2499.99	1	152
4	1364	0.07	470.99	1	110
1	1365	0.07	1549.99	1	144
2	1365	0.07	4999.99	1	58
3	1365	0.05	749.99	1	236
1	1366	0.10	3199.99	1	115
2	1366	0.20	1899.00	2	128
3	1366	0.07	3499.99	1	200
1	1367	0.10	1499.99	1	132
2	1367	0.20	2599.00	2	131
3	1367	0.07	1499.00	1	124
4	1367	0.05	549.99	2	24
1	1368	0.10	250.99	1	66
2	1368	0.07	489.99	2	113
3	1368	0.20	4499.99	1	186
1	1369	0.05	269.99	2	213
1	1370	0.07	3999.99	1	7
2	1370	0.10	209.99	2	89
3	1370	0.20	1799.99	2	208
4	1370	0.10	1499.99	1	134
1	1371	0.07	529.99	2	223
2	1371	0.20	1799.99	2	8
1	1372	0.07	749.99	1	307
2	1372	0.20	319.99	2	283
1	1373	0.10	3499.99	1	63
1	1374	0.05	2199.99	2	181
2	1374	0.07	919.99	2	130
1	1375	0.05	1799.99	2	147
2	1375	0.20	2499.99	1	182
1	1376	0.07	1320.99	1	5
1	1377	0.05	4999.99	2	153
2	1377	0.05	919.99	1	130
3	1377	0.07	1499.99	1	48
4	1377	0.07	3499.99	2	188
1	1378	0.07	349.99	2	96
2	1378	0.07	3199.99	2	142
3	1378	0.20	749.99	2	2
4	1378	0.07	470.99	1	110
5	1378	0.20	919.99	2	129
1	1379	0.10	529.99	1	15
2	1379	0.10	999.99	1	118
3	1379	0.10	89.99	2	263
1	1380	0.10	899.99	2	255
2	1380	0.07	429.99	2	229
1	1381	0.20	229.99	2	274
2	1381	0.10	899.99	2	214
1	1382	0.20	479.99	1	232
2	1382	0.05	1099.99	2	81
3	1382	0.10	959.99	1	225
4	1382	0.07	1499.99	1	135
5	1382	0.20	749.99	1	238
1	1383	0.20	3499.99	2	188
2	1383	0.05	346.99	2	65
1	1384	0.07	469.99	1	32
2	1384	0.10	3199.99	2	142
3	1384	0.10	209.99	1	89
4	1384	0.05	349.99	1	97
1	1385	0.05	549.99	2	24
2	1385	0.07	1799.99	1	145
3	1385	0.10	1499.99	2	39
4	1385	0.05	1499.99	1	135
1	1386	0.20	369.99	1	292
2	1386	0.10	249.99	1	262
3	1386	0.10	899.99	1	306
4	1386	0.07	4499.99	1	150
1	1387	0.10	449.99	1	106
1	1388	0.10	2999.99	1	251
1	1389	0.10	329.99	2	85
2	1389	0.05	3199.99	2	171
3	1389	0.07	319.99	1	227
1	1390	0.05	1469.99	2	41
2	1390	0.05	999.99	2	27
3	1390	0.10	899.99	1	306
4	1390	0.05	481.99	1	104
5	1390	0.10	1799.99	2	147
1	1391	0.07	529.99	2	223
2	1391	0.20	319.99	2	295
3	1391	0.20	369.99	1	277
1	1392	0.20	189.99	2	87
2	1392	0.05	899.99	2	240
1	1393	0.07	209.99	1	92
2	1393	0.07	659.99	1	82
3	1393	0.05	5299.99	2	47
4	1393	0.05	159.99	2	268
1	1394	0.05	2499.99	2	165
1	1395	0.20	3599.99	1	204
2	1395	0.10	1499.99	2	48
3	1395	0.20	919.99	2	180
4	1395	0.10	679.99	1	226
1	1396	0.05	1999.99	1	57
2	1396	0.20	2199.99	1	181
1	1397	0.10	469.99	2	127
2	1397	0.07	2999.99	1	139
3	1397	0.05	3999.99	1	7
4	1397	0.05	749.99	1	249
5	1397	0.10	647.99	2	78
1	1398	0.05	416.99	2	69
2	1398	0.20	749.99	1	53
1	1399	0.20	1549.00	2	210
2	1399	0.05	479.99	1	224
3	1399	0.07	469.99	2	127
4	1399	0.05	2499.99	1	28
1	1400	0.20	549.99	2	24
2	1400	0.20	909.99	2	217
3	1400	0.10	229.99	1	275
4	1400	0.07	209.99	1	90
1	1401	0.07	379.99	1	112
2	1401	0.05	429.99	1	230
3	1401	0.20	749.99	2	254
1	1402	0.20	2799.99	2	189
2	1402	0.05	2499.99	2	28
3	1402	0.05	4999.99	1	203
4	1402	0.07	289.99	1	273
1	1403	0.10	209.99	2	93
1	1404	0.05	379.99	2	112
2	1404	0.10	269.99	1	220
3	1404	0.20	2799.99	2	193
1	1405	0.10	2999.99	2	162
1	1406	0.05	429.99	2	230
2	1406	0.10	489.99	1	113
1	1407	0.05	799.99	1	300
2	1407	0.10	832.99	2	36
3	1407	0.10	399.99	1	266
4	1407	0.20	832.99	1	35
1	1408	0.20	299.99	2	23
2	1408	0.20	749.99	1	166
3	1408	0.07	579.99	1	114
4	1408	0.20	2599.00	2	137
1	1409	0.07	899.99	2	301
2	1409	0.07	1299.99	1	170
3	1409	0.05	3199.99	2	171
4	1409	0.05	289.99	1	265
5	1409	0.10	269.99	1	222
1	1410	0.10	4999.99	2	205
2	1410	0.20	4999.99	2	203
3	1410	0.10	679.99	1	304
1	1411	0.10	2999.99	1	9
2	1411	0.20	749.99	2	308
1	1412	0.07	919.99	2	180
2	1412	0.10	5299.99	1	43
3	1412	0.07	416.99	2	109
1	1413	0.05	279.99	2	297
1	1414	0.10	2999.99	2	162
2	1414	0.05	369.99	2	292
1	1415	0.07	1632.99	2	31
2	1415	0.05	429.00	1	17
3	1415	0.10	249.99	2	264
4	1415	0.05	659.99	1	245
1	1416	0.20	3499.99	1	194
2	1416	0.10	699.99	2	242
3	1416	0.05	209.99	2	92
1	1417	0.20	639.99	2	219
1	1418	0.20	2499.99	2	120
2	1418	0.05	679.99	2	243
1	1419	0.07	1499.00	1	124
2	1419	0.20	899.99	2	235
3	1419	0.10	899.99	1	234
1	1420	0.20	2299.99	1	197
2	1420	0.10	3499.99	2	194
3	1420	0.10	1899.00	1	128
1	1421	0.05	279.99	2	298
1	1422	0.07	761.99	2	80
2	1422	0.20	919.99	2	180
3	1422	0.05	679.99	1	243
1	1423	0.20	749.99	1	249
2	1423	0.10	416.99	1	71
3	1423	0.20	449.99	1	302
4	1423	0.20	489.99	2	113
1	1424	0.20	4999.99	2	140
1	1425	0.05	319.99	2	227
2	1425	0.07	89.99	1	263
3	1425	0.07	209.99	1	93
4	1425	0.05	3199.99	2	54
5	1425	0.07	1799.99	2	145
1	1426	0.07	749.99	1	215
2	1426	0.05	599.99	2	20
3	1426	0.07	319.99	1	281
1	1427	0.07	429.99	2	230
2	1427	0.05	2999.99	1	139
3	1427	0.07	1549.00	2	164
1	1428	0.20	899.99	2	216
2	1428	0.07	469.99	1	126
3	1428	0.07	2799.99	2	187
4	1428	0.10	2499.99	1	28
5	1428	0.20	3499.99	2	194
1	1429	0.20	659.99	2	70
1	1430	0.05	319.99	1	221
2	1430	0.07	319.99	1	281
1	1431	0.10	3999.99	1	207
2	1431	0.07	749.99	1	53
3	1431	0.20	2999.99	1	252
4	1431	0.07	749.99	1	254
1	1432	0.20	1899.00	1	161
1	1433	0.07	249.99	1	264
1	1434	0.20	429.99	2	229
2	1434	0.10	2999.99	1	198
3	1434	0.10	279.99	2	286
4	1434	0.07	4999.99	2	61
1	1435	0.07	1599.99	2	141
2	1435	0.20	999.99	1	29
3	1435	0.10	1559.99	1	60
4	1435	0.07	799.99	1	260
1	1436	0.07	559.99	2	244
1	1437	0.05	1599.99	2	141
1	1438	0.20	959.99	1	225
2	1438	0.20	4999.99	1	140
3	1438	0.05	1099.99	2	81
4	1438	0.10	2599.00	1	137
5	1438	0.07	2799.99	2	190
1	1439	0.07	2299.99	1	42
2	1439	0.20	89.99	1	263
3	1439	0.05	489.99	2	102
4	1439	0.05	7499.99	1	149
1	1440	0.07	749.99	2	116
2	1440	0.07	416.99	1	109
3	1440	0.10	4499.99	1	186
4	1440	0.05	749.99	2	178
5	1440	0.20	250.99	2	67
1	1441	0.05	469.99	1	6
2	1441	0.20	699.99	2	242
3	1441	0.07	1409.99	1	46
1	1442	0.10	4499.99	1	160
2	1442	0.07	269.99	1	220
3	1442	0.05	209.99	2	271
1	1443	0.07	4499.99	1	160
2	1443	0.20	1999.99	1	57
3	1443	0.10	339.99	2	101
1	1444	0.10	209.99	1	90
2	1444	0.20	1899.00	2	128
1	1445	0.10	639.99	2	219
2	1445	0.07	875.99	1	52
3	1445	0.10	999.99	2	123
1	1446	0.05	319.99	1	227
2	1446	0.05	639.99	2	233
3	1446	0.05	899.99	2	234
1	1447	0.20	5499.99	1	148
1	1448	0.10	749.99	1	239
1	1449	0.07	2299.99	1	159
2	1449	0.20	2699.99	1	55
3	1449	0.07	799.99	2	260
4	1449	0.05	2999.99	2	252
5	1449	0.10	269.99	2	14
1	1450	0.07	489.99	1	98
2	1450	0.10	3199.99	2	173
3	1450	0.20	559.99	1	299
4	1450	0.10	2999.99	2	209
5	1450	0.05	899.99	2	235
1	1451	0.05	1469.99	1	117
1	1452	0.10	299.99	2	99
2	1452	0.20	899.99	1	234
3	1452	0.05	149.99	2	86
4	1452	0.07	416.99	2	109
1	1453	0.10	209.99	2	89
1	1454	0.07	319.99	1	283
2	1454	0.10	832.99	2	35
3	1454	0.20	1499.00	1	124
4	1454	0.05	549.99	2	38
1	1455	0.05	339.99	2	101
2	1455	0.20	749.99	1	254
1	1456	0.05	2799.99	2	193
2	1456	0.07	639.99	1	246
3	1456	0.10	159.99	2	268
4	1456	0.10	289.99	1	272
5	1456	0.10	469.99	1	126
1	1457	0.07	489.99	1	113
2	1457	0.20	470.99	1	111
3	1457	0.20	159.99	1	268
4	1457	0.20	2499.99	2	152
1	1458	0.05	319.99	2	295
2	1458	0.05	533.99	1	105
3	1458	0.05	549.99	1	12
4	1458	0.10	647.99	2	78
1	1459	0.10	1259.90	1	258
1	1460	0.05	4499.99	1	201
2	1460	0.07	299.99	1	76
3	1460	0.05	749.99	1	167
4	1460	0.07	3999.99	2	7
5	1460	0.07	999.99	2	123
1	1461	0.20	1499.99	1	48
2	1461	0.20	699.99	2	242
1	1462	0.20	89.99	1	263
2	1462	0.07	499.99	1	25
3	1462	0.10	529.99	1	223
4	1462	0.10	369.99	1	294
5	1462	0.05	2999.99	1	251
1	1463	0.05	6499.99	2	51
2	1463	0.05	1549.00	1	168
1	1464	0.05	416.99	2	109
2	1464	0.20	1499.00	1	124
3	1464	0.20	2499.99	2	165
4	1464	0.05	1549.99	2	151
1	1465	0.05	659.99	2	70
1	1466	0.07	899.99	2	310
2	1466	0.05	2999.99	1	251
3	1466	0.20	1349.00	2	163
4	1466	0.05	1499.99	2	39
1	1467	0.07	449.00	1	18
2	1467	0.20	3199.99	1	115
3	1467	0.10	369.99	2	278
1	1468	0.05	199.99	1	269
2	1468	0.07	4999.99	1	58
3	1468	0.07	5999.99	2	50
1	1469	0.20	799.99	2	77
2	1469	0.05	849.99	2	237
3	1469	0.07	2499.99	1	182
4	1469	0.05	489.99	2	100
1	1470	0.10	470.99	2	110
2	1470	0.05	279.99	1	287
3	1470	0.05	2999.99	2	252
1	1471	0.20	2599.99	2	59
2	1471	0.07	1799.99	1	136
1	1472	0.20	109.99	1	84
2	1472	0.20	799.99	1	300
1	1473	0.20	109.99	2	84
2	1473	0.07	489.99	1	102
1	1474	0.20	899.99	1	301
2	1474	0.05	999.99	1	123
1	1475	0.05	899.99	2	306
2	1475	0.07	899.99	2	261
3	1475	0.05	1899.00	2	161
4	1475	0.20	599.99	2	248
1	1476	0.07	3199.99	2	142
2	1476	0.07	349.99	2	91
3	1476	0.07	5299.99	1	43
4	1476	0.10	2799.99	1	191
5	1476	0.10	289.99	2	265
1	1477	0.20	1549.00	2	210
1	1478	0.10	489.99	2	100
2	1478	0.20	999.99	1	123
1	1479	0.05	2999.99	1	252
2	1479	0.10	899.99	1	256
1	1480	0.10	749.99	2	308
2	1480	0.10	659.99	2	82
3	1480	0.07	209.99	2	92
4	1480	0.07	959.99	2	225
1	1481	0.07	749.99	2	53
2	1481	0.10	919.99	1	130
1	1482	0.10	1499.99	1	48
2	1482	0.05	489.99	1	113
3	1482	0.07	4999.99	2	58
4	1482	0.05	4999.99	1	40
5	1482	0.05	4999.99	2	205
1	1483	0.05	489.99	1	280
2	1483	0.07	679.99	2	226
1	1484	0.07	319.99	2	295
2	1484	0.20	3499.99	2	49
3	1484	0.05	679.99	2	304
1	1485	0.20	2499.99	2	122
2	1485	0.20	319.99	1	276
1	1486	0.05	1559.99	2	60
2	1486	0.05	489.99	1	98
3	1486	0.10	489.99	1	113
4	1486	0.10	199.99	1	269
1	1487	0.07	4499.99	1	160
2	1487	0.20	1549.99	2	151
3	1487	0.05	2999.99	1	198
4	1487	0.05	2299.99	1	196
5	1487	0.20	349.99	2	96
1	1488	0.07	2299.99	1	42
2	1488	0.07	2499.99	1	122
1	1489	0.20	2999.99	1	198
2	1489	0.20	279.99	2	282
3	1489	0.10	875.99	1	52
1	1490	0.10	299.99	1	99
2	1490	0.10	749.99	1	254
3	1490	0.05	319.99	1	218
1	1491	0.20	299.99	2	95
2	1491	0.05	449.99	1	302
3	1491	0.07	1559.99	2	60
4	1491	0.07	2999.99	2	139
1	1492	0.10	379.99	2	37
1	1493	0.10	429.99	1	230
1	1494	0.10	429.99	2	230
2	1494	0.20	749.99	2	178
3	1494	0.05	249.99	2	264
1	1495	0.05	369.99	2	292
2	1495	0.20	749.99	2	308
3	1495	0.10	2599.00	1	137
1	1496	0.07	599.99	1	248
2	1496	0.07	899.99	1	214
3	1496	0.05	479.99	2	224
4	1496	0.05	449.99	1	302
5	1496	0.20	959.99	2	225
1	1497	0.20	1599.99	2	141
2	1497	0.10	2999.99	2	198
3	1497	0.07	3599.99	2	204
1	1498	0.05	3199.99	1	172
2	1498	0.07	799.99	2	260
1	1499	0.05	470.99	1	110
2	1499	0.07	1799.99	1	208
3	1499	0.05	159.99	2	268
4	1499	0.05	749.99	1	2
5	1499	0.10	3199.99	2	171
1	1500	0.07	1469.99	2	41
2	1500	0.07	319.99	1	293
1	1501	0.05	599.99	1	248
2	1501	0.07	639.99	1	219
3	1501	0.05	529.99	1	15
4	1501	0.20	250.99	1	67
5	1501	0.05	1549.00	1	210
1	1502	0.20	529.99	2	231
2	1502	0.07	449.00	2	19
3	1502	0.07	599.99	2	26
4	1502	0.20	159.99	1	268
5	1502	0.07	899.99	1	255
1	1503	0.10	909.99	1	217
2	1503	0.05	449.99	2	302
1	1504	0.07	319.99	1	276
1	1505	0.05	529.99	2	223
2	1505	0.07	549.99	2	24
3	1505	0.05	5299.99	2	43
1	1506	0.05	3499.99	1	184
2	1506	0.20	4999.99	2	153
3	1506	0.05	7499.99	2	149
1	1507	0.20	1499.99	2	39
2	1507	0.10	1680.99	2	11
3	1507	0.07	1199.99	1	259
4	1507	0.07	319.99	1	281
5	1507	0.05	319.99	2	293
1	1508	0.20	379.99	1	37
2	1508	0.10	416.99	1	109
3	1508	0.05	875.99	2	52
4	1508	0.05	189.99	1	88
1	1509	0.07	749.99	2	215
1	1510	0.05	3199.99	2	142
2	1510	0.10	449.99	1	68
3	1510	0.10	2999.99	2	251
4	1510	0.10	269.99	2	220
5	1510	0.05	2599.00	1	137
1	1511	0.20	1549.99	2	144
2	1511	0.07	389.99	1	288
3	1511	0.07	429.00	2	17
4	1511	0.05	1469.99	1	41
5	1511	0.20	1499.00	2	124
1	1512	0.07	909.99	1	217
1	1513	0.10	749.99	1	166
2	1513	0.05	4999.99	2	61
3	1513	0.05	2299.99	2	159
1	1514	0.10	899.99	2	240
2	1514	0.05	4999.99	2	203
1	1515	0.20	999.99	2	27
2	1515	0.10	3499.99	2	202
3	1515	0.05	899.99	2	310
4	1515	0.10	4999.99	1	40
5	1515	0.20	959.99	2	158
1	1516	0.10	3199.99	2	172
2	1516	0.10	2599.99	1	253
3	1516	0.20	2299.99	2	196
4	1516	0.20	1199.99	2	259
5	1516	0.20	209.99	2	271
1	1517	0.07	2599.99	2	303
2	1517	0.05	679.99	2	226
1	1518	0.10	679.99	2	304
2	1518	0.05	2499.99	2	182
3	1518	0.05	2999.99	2	252
1	1519	0.20	4499.99	1	150
2	1519	0.20	329.99	2	85
3	1519	0.07	1499.00	2	124
4	1519	0.20	346.99	1	65
5	1519	0.05	289.99	2	265
1	1520	0.05	4499.99	1	186
2	1520	0.20	3499.99	2	188
3	1520	0.07	899.99	2	310
4	1520	0.10	89.99	2	263
1	1521	0.20	489.99	1	100
2	1521	0.20	679.99	2	314
3	1521	0.10	999.99	1	123
4	1521	0.20	1499.99	2	135
1	1522	0.10	299.99	1	95
2	1522	0.07	1599.99	1	141
3	1522	0.07	1469.99	1	117
1	1523	0.20	749.99	2	311
1	1524	0.10	1549.00	1	168
2	1524	0.20	319.99	2	295
3	1524	0.20	449.99	1	313
4	1524	0.20	2999.99	2	252
1	1525	0.10	6499.99	1	156
2	1525	0.07	1349.00	2	163
3	1525	0.07	2799.99	1	193
1	1526	0.07	1549.99	1	151
2	1526	0.10	5499.99	1	56
3	1526	0.10	749.99	1	238
4	1526	0.05	679.99	1	243
1	1527	0.10	469.99	1	33
2	1527	0.05	551.99	1	103
3	1527	0.05	1999.99	2	57
1	1528	0.20	429.99	2	229
1	1529	0.05	299.99	1	23
2	1529	0.10	5999.99	2	50
1	1530	0.10	269.99	2	213
2	1530	0.10	749.99	1	116
1	1531	0.10	1899.00	1	128
1	1532	0.07	2999.99	2	209
1	1533	0.10	229.99	2	274
2	1533	0.10	647.99	1	78
3	1533	0.10	349.99	1	96
4	1533	0.10	899.99	2	235
5	1533	0.10	6499.99	1	51
1	1534	0.10	3499.99	1	194
2	1534	0.05	1469.99	1	117
3	1534	0.20	199.99	2	269
4	1534	0.20	3199.99	2	172
1	1535	0.05	209.99	1	92
2	1535	0.05	599.99	2	75
1	1536	0.20	2199.99	1	183
2	1536	0.07	2799.99	2	185
3	1536	0.20	2299.99	2	196
1	1537	0.05	849.99	2	237
1	1538	0.07	3299.99	1	206
2	1538	0.07	1409.99	2	46
3	1538	0.07	1469.99	1	117
4	1538	0.20	2299.99	1	197
5	1538	0.05	899.99	2	306
1	1539	0.05	469.99	2	6
2	1539	0.05	549.99	2	12
1	1540	0.05	416.99	2	71
2	1540	0.07	749.99	1	236
3	1540	0.05	479.99	1	224
4	1540	0.05	5499.99	2	177
5	1540	0.20	647.99	1	78
1	1541	0.10	11999.99	2	155
2	1541	0.07	599.99	2	248
3	1541	0.10	3199.99	2	142
4	1541	0.10	429.00	1	17
5	1541	0.05	149.99	2	86
1	1542	0.20	402.99	1	79
2	1542	0.05	2499.99	2	122
3	1542	0.20	3499.99	2	184
4	1542	0.10	379.99	2	37
5	1542	0.20	279.99	1	297
1	1543	0.10	449.99	2	108
2	1543	0.20	209.99	1	93
3	1543	0.07	959.99	2	158
4	1543	0.05	349.99	2	97
5	1543	0.20	1799.99	1	136
1	1544	0.10	3499.99	2	194
2	1544	0.20	416.99	2	107
1	1545	0.10	869.99	1	45
1	1546	0.10	6499.99	1	156
2	1546	0.10	2799.99	2	185
3	1546	0.10	749.99	1	215
4	1546	0.05	499.99	1	25
1	1547	0.20	449.99	2	106
2	1547	0.20	3599.99	1	204
1	1548	0.10	469.99	1	32
2	1548	0.07	3499.99	1	202
3	1548	0.20	3499.99	2	62
1	1549	0.20	959.99	1	158
2	1549	0.05	469.99	1	119
3	1549	0.05	749.99	2	249
4	1549	0.10	699.99	2	242
1	1550	0.05	559.99	2	315
2	1550	0.07	659.99	1	245
3	1550	0.10	2799.99	2	185
4	1550	0.07	5499.99	1	148
5	1550	0.05	149.99	2	86
1	1551	0.20	3999.99	2	207
1	1552	0.10	2299.99	1	197
2	1552	0.05	1469.99	2	41
1	1553	0.07	489.99	1	102
2	1553	0.10	549.99	1	12
3	1553	0.05	2999.99	1	251
4	1553	0.05	209.99	1	89
1	1554	0.05	749.99	1	166
2	1554	0.20	279.99	1	285
1	1555	0.10	549.99	2	24
2	1555	0.10	6499.99	1	156
3	1555	0.10	469.99	1	126
4	1555	0.05	1899.00	2	128
5	1555	0.20	3199.99	1	174
1	1556	0.20	3499.99	2	49
2	1556	0.07	659.99	1	82
3	1556	0.10	289.99	1	265
4	1556	0.05	469.99	2	119
5	1556	0.10	899.99	2	235
1	1557	0.07	1349.00	2	163
1	1558	0.07	1409.99	2	46
2	1558	0.07	999.99	1	123
3	1558	0.05	2899.99	1	4
4	1558	0.20	2699.99	1	55
5	1558	0.07	2599.99	1	253
1	1559	0.07	339.99	2	101
2	1559	0.10	449.00	1	18
3	1559	0.10	3199.99	2	54
4	1559	0.10	319.99	1	221
1	1560	0.20	999.99	2	118
2	1560	0.20	1469.99	1	41
1	1561	0.07	2199.99	2	181
2	1561	0.05	279.99	2	297
1	1562	0.20	3199.99	1	54
2	1562	0.20	250.99	1	66
3	1562	0.07	3199.99	2	115
1	1563	0.07	3499.99	1	188
1	1564	0.07	899.99	1	309
2	1564	0.10	269.99	1	14
1	1565	0.07	379.99	1	37
2	1565	0.10	209.99	1	92
3	1565	0.10	899.99	1	261
4	1565	0.07	299.99	1	95
5	1565	0.20	679.99	2	226
1	1566	0.05	919.99	1	179
2	1566	0.05	4999.99	2	61
1	1567	0.20	319.99	1	279
1	1568	0.20	4999.99	1	146
2	1568	0.07	533.99	1	105
3	1568	0.10	899.99	1	301
1	1569	0.10	2999.99	1	252
1	1570	0.07	11999.99	1	155
1	1571	0.10	699.99	2	312
2	1571	0.07	559.99	1	212
3	1571	0.20	599.99	2	20
1	1572	0.05	899.99	2	216
2	1572	0.20	2999.99	1	198
3	1572	0.05	3199.99	1	115
4	1572	0.20	679.99	2	304
1	1573	0.05	2999.99	1	9
2	1573	0.07	919.99	1	129
3	1573	0.10	529.99	2	15
4	1573	0.07	899.99	2	216
5	1573	0.10	89.99	2	263
1	1574	0.10	469.99	1	127
1	1575	0.07	539.99	1	44
2	1575	0.10	3999.99	2	207
3	1575	0.07	269.99	1	213
4	1575	0.05	469.99	2	126
5	1575	0.20	209.99	2	92
1	1576	0.05	416.99	1	69
2	1576	0.05	319.99	1	293
3	1576	0.05	3499.99	2	202
1	1577	0.05	279.99	2	298
2	1577	0.10	470.99	2	111
3	1577	0.20	799.99	2	300
4	1577	0.07	2599.00	2	131
5	1577	0.05	279.99	2	282
1	1578	0.07	3599.99	2	204
2	1578	0.05	899.99	1	310
3	1578	0.20	749.99	2	241
1	1579	0.05	3499.99	1	49
2	1579	0.10	899.99	1	214
3	1579	0.07	279.99	1	286
4	1579	0.10	346.99	2	65
1	1580	0.07	469.99	2	119
2	1580	0.20	149.99	2	86
1	1581	0.10	489.99	1	64
2	1581	0.20	289.99	1	272
1	1582	0.07	599.99	1	75
2	1582	0.07	1499.99	2	133
1	1583	0.05	529.99	1	15
2	1583	0.20	289.99	2	265
1	1584	0.10	869.99	2	45
2	1584	0.10	899.99	2	216
3	1584	0.20	5299.99	1	43
4	1584	0.10	2799.99	1	187
5	1584	0.07	1799.99	2	147
1	1585	0.10	449.99	1	313
2	1585	0.10	449.99	2	106
3	1585	0.07	3999.99	2	207
4	1585	0.10	299.99	1	95
5	1585	0.10	2799.99	1	191
1	1586	0.10	269.99	2	22
2	1586	0.07	369.99	1	277
3	1586	0.05	319.99	1	295
4	1586	0.20	3199.99	1	173
5	1586	0.10	832.99	1	36
1	1587	0.10	481.99	1	104
2	1587	0.05	3499.99	2	63
3	1587	0.05	647.99	2	78
4	1587	0.07	799.99	2	300
1	1588	0.07	209.99	2	93
1	1589	0.05	639.99	2	246
2	1589	0.20	799.99	1	260
3	1589	0.10	2499.99	2	28
1	1590	0.07	3199.99	2	175
2	1590	0.20	599.99	1	248
3	1590	0.07	299.99	1	23
1	1591	0.20	279.99	2	286
2	1591	0.20	469.99	2	126
3	1591	0.07	349.99	2	97
4	1591	0.05	2249.99	2	138
5	1591	0.20	289.99	1	265
1	1592	0.05	1549.00	2	211
2	1592	0.07	2299.99	1	159
3	1592	0.07	4999.99	2	40
4	1592	0.20	2999.99	1	9
5	1592	0.05	209.99	2	271
1	1593	0.20	349.99	2	97
2	1593	0.07	469.99	1	34
3	1593	0.10	2799.99	2	190
4	1593	0.05	416.99	1	107
5	1593	0.07	6499.99	2	169
1	1594	0.10	402.99	2	79
2	1594	0.10	533.99	1	105
1	1595	0.20	379.99	1	112
1	1596	0.05	349.99	1	91
2	1596	0.10	449.00	1	18
1	1597	0.07	3199.99	1	176
2	1597	0.07	2599.99	1	59
1	1598	0.20	599.99	1	247
2	1598	0.07	3499.99	2	49
3	1598	0.20	189.99	1	88
1	1599	0.20	481.99	2	104
1	1600	0.10	4999.99	1	146
2	1600	0.05	319.99	1	295
3	1600	0.20	832.99	1	36
1	1601	0.20	579.99	2	114
2	1601	0.20	1549.00	1	10
3	1601	0.07	269.99	2	220
4	1601	0.07	3999.99	2	7
5	1601	0.10	919.99	1	180
1	1602	0.05	416.99	2	71
2	1602	0.07	379.99	1	37
3	1602	0.20	229.99	2	275
4	1602	0.05	899.99	2	257
1	1603	0.05	229.99	2	275
1	1604	0.10	209.99	1	271
1	1605	0.10	619.99	1	72
2	1605	0.20	4499.99	1	186
3	1605	0.10	1499.99	2	132
4	1605	0.10	899.99	1	301
5	1605	0.07	999.99	1	29
1	1606	0.10	659.99	1	245
2	1606	0.10	209.99	1	271
1	1607	0.05	999.99	1	29
1	1608	0.05	529.99	2	231
1	1609	0.20	349.99	1	96
2	1609	0.20	749.99	2	238
3	1609	0.10	319.99	2	228
4	1609	0.20	533.99	1	105
1	1610	0.07	832.99	1	36
2	1610	0.20	3199.99	2	173
1	1611	0.07	2799.99	1	191
2	1611	0.10	3199.99	2	171
3	1611	0.20	749.99	1	236
1	1612	0.10	699.99	1	242
2	1612	0.05	319.99	2	289
3	1612	0.20	339.99	2	101
4	1612	0.07	319.99	2	293
5	1612	0.10	1559.99	1	60
1	1613	0.07	4999.99	1	153
2	1613	0.05	319.99	2	283
1	1614	0.07	1499.00	1	124
2	1614	0.07	2299.99	2	159
3	1614	0.20	269.99	2	213
1	1615	0.20	2299.99	2	197
2	1615	0.07	899.99	1	214
3	1615	0.20	2499.99	1	182
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, order_date, order_status, required_date, shipped_date, customer_id, staff_id, store_id) FROM stdin;
1	2016-01-01	4	2016-01-03	2016-01-03	259	2	1
2	2016-01-01	4	2016-01-04	2016-01-03	1212	6	2
3	2016-01-02	4	2016-01-05	2016-01-03	523	7	2
4	2016-01-03	4	2016-01-04	2016-01-05	175	3	1
5	2016-01-03	4	2016-01-06	2016-01-06	1324	6	2
6	2016-01-04	4	2016-01-07	2016-01-05	94	6	2
7	2016-01-04	4	2016-01-07	2016-01-05	324	6	2
8	2016-01-04	4	2016-01-05	2016-01-05	1204	7	2
9	2016-01-05	4	2016-01-08	2016-01-08	60	2	1
10	2016-01-05	4	2016-01-06	2016-01-06	442	6	2
11	2016-01-05	4	2016-01-08	2016-01-07	1326	7	2
12	2016-01-06	4	2016-01-08	2016-01-09	91	2	1
13	2016-01-08	4	2016-01-11	2016-01-11	873	6	2
14	2016-01-09	4	2016-01-11	2016-01-12	258	3	1
15	2016-01-09	4	2016-01-10	2016-01-12	450	7	2
16	2016-01-12	4	2016-01-15	2016-01-15	552	3	1
17	2016-01-12	4	2016-01-14	2016-01-14	1175	3	1
18	2016-01-14	4	2016-01-17	2016-01-15	541	3	1
19	2016-01-14	4	2016-01-17	2016-01-16	696	2	1
20	2016-01-14	4	2016-01-16	2016-01-17	923	2	1
21	2016-01-15	4	2016-01-16	2016-01-18	1250	6	2
22	2016-01-16	4	2016-01-18	2016-01-17	1035	2	1
23	2016-01-16	4	2016-01-19	2016-01-19	1149	2	1
24	2016-01-18	4	2016-01-20	2016-01-19	636	7	2
25	2016-01-18	4	2016-01-21	2016-01-21	657	6	2
26	2016-01-18	4	2016-01-21	2016-01-19	1280	7	2
27	2016-01-19	4	2016-01-21	2016-01-20	57	7	2
28	2016-01-19	4	2016-01-20	2016-01-21	252	6	2
29	2016-01-20	4	2016-01-22	2016-01-21	437	6	2
30	2016-01-20	4	2016-01-21	2016-01-21	1348	6	2
31	2016-01-20	4	2016-01-22	2016-01-22	1238	8	3
32	2016-01-21	4	2016-01-24	2016-01-22	1259	3	1
33	2016-01-21	4	2016-01-22	2016-01-22	236	6	2
34	2016-01-22	4	2016-01-25	2016-01-23	80	6	2
35	2016-01-22	4	2016-01-25	2016-01-24	813	7	2
36	2016-01-23	4	2016-01-24	2016-01-24	1321	6	2
37	2016-01-25	4	2016-01-28	2016-01-26	164	6	2
38	2016-01-25	4	2016-01-27	2016-01-26	583	7	2
39	2016-01-25	4	2016-01-26	2016-01-26	1296	7	2
40	2016-01-27	4	2016-01-28	2016-01-29	348	3	1
41	2016-01-27	4	2016-01-30	2016-01-29	979	6	2
42	2016-01-27	4	2016-01-28	2016-01-30	1095	7	2
43	2016-01-27	4	2016-01-28	2016-01-30	1434	7	2
44	2016-01-28	4	2016-01-31	2016-01-30	861	7	2
45	2016-01-28	4	2016-01-31	2016-01-31	1220	7	2
46	2016-01-29	4	2016-01-31	2016-01-31	746	7	2
47	2016-01-29	4	2016-01-30	2016-01-31	1234	7	2
48	2016-01-30	4	2016-02-01	2016-02-02	1012	7	2
49	2016-01-31	4	2016-02-01	2016-02-02	608	6	2
50	2016-01-31	4	2016-02-03	2016-02-02	872	8	3
51	2016-02-01	4	2016-02-02	2016-02-03	1047	7	2
52	2016-02-03	4	2016-02-04	2016-02-05	767	2	1
53	2016-02-03	4	2016-02-04	2016-02-05	965	6	2
54	2016-02-04	4	2016-02-07	2016-02-07	535	7	2
55	2016-02-04	4	2016-02-07	2016-02-06	1173	6	2
56	2016-02-04	4	2016-02-06	2016-02-07	1241	6	2
57	2016-02-04	4	2016-02-06	2016-02-06	1305	7	2
58	2016-02-05	4	2016-02-07	2016-02-07	504	6	2
59	2016-02-05	4	2016-02-07	2016-02-06	563	7	2
60	2016-02-06	4	2016-02-08	2016-02-07	151	3	1
61	2016-02-06	4	2016-02-09	2016-02-09	277	7	2
62	2016-02-07	4	2016-02-10	2016-02-10	208	2	1
63	2016-02-07	4	2016-02-09	2016-02-09	1075	7	2
64	2016-02-07	4	2016-02-08	2016-02-09	1185	6	2
65	2016-02-08	4	2016-02-09	2016-02-11	996	6	2
66	2016-02-09	4	2016-02-12	2016-02-12	1253	7	2
67	2016-02-09	4	2016-02-11	2016-02-10	526	8	3
68	2016-02-10	4	2016-02-11	2016-02-13	381	6	2
69	2016-02-10	4	2016-02-12	2016-02-11	1413	7	2
70	2016-02-11	3	2016-02-11	\N	50	9	3
71	2016-02-11	4	2016-02-14	2016-02-12	797	7	2
72	2016-02-12	4	2016-02-15	2016-02-13	1386	2	1
73	2016-02-12	4	2016-02-15	2016-02-14	612	7	2
74	2016-02-13	4	2016-02-15	2016-02-15	264	7	2
75	2016-02-14	4	2016-02-15	2016-02-17	587	6	2
76	2016-02-16	3	2016-02-16	\N	9	6	2
77	2016-02-16	4	2016-02-19	2016-02-19	385	2	1
78	2016-02-16	4	2016-02-18	2016-02-19	1182	7	2
79	2016-02-17	4	2016-02-20	2016-02-20	529	3	1
80	2016-02-17	4	2016-02-20	2016-02-19	397	6	2
81	2016-02-17	4	2016-02-19	2016-02-18	521	6	2
82	2016-02-18	4	2016-02-21	2016-02-20	1223	6	2
83	2016-02-19	4	2016-02-20	2016-02-20	393	3	1
84	2016-02-20	4	2016-02-22	2016-02-21	317	7	2
85	2016-02-20	4	2016-02-23	2016-02-21	1174	7	2
86	2016-02-21	4	2016-02-22	2016-02-23	276	7	2
87	2016-02-21	4	2016-02-22	2016-02-23	516	6	2
88	2016-02-21	4	2016-02-22	2016-02-23	1069	6	2
89	2016-02-21	4	2016-02-24	2016-02-24	668	8	3
90	2016-02-23	4	2016-02-25	2016-02-24	414	7	2
91	2016-02-25	4	2016-02-27	2016-02-28	648	2	1
92	2016-02-25	4	2016-02-28	2016-02-28	1309	7	2
93	2016-02-26	4	2016-02-28	2016-02-27	1328	3	1
94	2016-02-27	4	2016-02-28	2016-02-29	929	2	1
95	2016-02-27	4	2016-02-29	2016-02-28	218	7	2
96	2016-02-27	4	2016-02-29	2016-02-28	1094	7	2
97	2016-02-28	4	2016-02-29	2016-03-01	204	7	2
98	2016-02-28	4	2016-02-29	2016-02-29	1194	6	2
99	2016-02-29	4	2016-03-01	2016-03-03	1165	9	3
100	2016-03-01	4	2016-03-04	2016-03-03	1237	7	2
101	2016-03-01	4	2016-03-04	2016-03-04	271	8	3
102	2016-03-02	4	2016-03-05	2016-03-03	336	7	2
103	2016-03-03	4	2016-03-06	2016-03-05	991	2	1
104	2016-03-03	4	2016-03-05	2016-03-05	7	7	2
105	2016-03-03	4	2016-03-05	2016-03-04	306	7	2
106	2016-03-04	4	2016-03-05	2016-03-05	422	9	3
107	2016-03-06	4	2016-03-09	2016-03-09	633	2	1
108	2016-03-06	4	2016-03-09	2016-03-07	12	6	2
109	2016-03-06	4	2016-03-09	2016-03-09	1255	6	2
110	2016-03-06	4	2016-03-08	2016-03-09	677	9	3
111	2016-03-07	4	2016-03-10	2016-03-10	630	6	2
112	2016-03-08	4	2016-03-11	2016-03-10	469	6	2
113	2016-03-08	4	2016-03-11	2016-03-11	1078	6	2
114	2016-03-08	4	2016-03-10	2016-03-11	1431	7	2
115	2016-03-09	4	2016-03-11	2016-03-11	1369	7	2
116	2016-03-10	4	2016-03-11	2016-03-11	471	7	2
117	2016-03-10	4	2016-03-13	2016-03-11	740	6	2
118	2016-03-12	4	2016-03-14	2016-03-13	577	2	1
119	2016-03-12	4	2016-03-14	2016-03-14	925	7	2
120	2016-03-14	4	2016-03-15	2016-03-17	327	7	2
121	2016-03-14	4	2016-03-15	2016-03-16	755	6	2
122	2016-03-14	4	2016-03-16	2016-03-15	786	6	2
123	2016-03-15	4	2016-03-18	2016-03-17	766	6	2
124	2016-03-16	4	2016-03-18	2016-03-17	403	3	1
125	2016-03-16	4	2016-03-19	2016-03-17	685	6	2
126	2016-03-16	4	2016-03-18	2016-03-18	1365	7	2
127	2016-03-17	4	2016-03-18	2016-03-19	484	8	3
128	2016-03-18	4	2016-03-20	2016-03-21	86	6	2
129	2016-03-19	4	2016-03-21	2016-03-21	84	7	2
130	2016-03-19	4	2016-03-22	2016-03-20	1049	6	2
131	2016-03-19	4	2016-03-22	2016-03-20	316	8	3
132	2016-03-20	4	2016-03-22	2016-03-23	46	3	1
133	2016-03-20	4	2016-03-22	2016-03-21	409	7	2
134	2016-03-20	4	2016-03-21	2016-03-21	679	7	2
135	2016-03-21	4	2016-03-23	2016-03-23	1354	7	2
136	2016-03-21	4	2016-03-24	2016-03-23	1192	8	3
137	2016-03-23	4	2016-03-26	2016-03-25	370	7	2
138	2016-03-23	4	2016-03-24	2016-03-25	438	7	2
139	2016-03-23	4	2016-03-24	2016-03-26	710	7	2
140	2016-03-23	4	2016-03-26	2016-03-26	1264	7	2
141	2016-03-25	4	2016-03-27	2016-03-26	557	7	2
142	2016-03-26	4	2016-03-27	2016-03-27	170	3	1
143	2016-03-26	4	2016-03-28	2016-03-28	693	7	2
144	2016-03-26	4	2016-03-29	2016-03-29	1124	7	2
145	2016-03-27	4	2016-03-29	2016-03-30	366	6	2
146	2016-03-28	4	2016-03-30	2016-03-30	288	3	1
147	2016-03-28	4	2016-03-31	2016-03-31	55	7	2
148	2016-03-28	4	2016-03-30	2016-03-30	714	6	2
149	2016-03-28	4	2016-03-30	2016-03-29	763	6	2
150	2016-03-29	4	2016-03-31	2016-04-01	332	2	1
151	2016-03-29	4	2016-04-01	2016-03-31	926	2	1
152	2016-03-29	4	2016-03-30	2016-03-30	76	6	2
153	2016-03-30	4	2016-04-02	2016-04-01	498	6	2
154	2016-03-31	4	2016-04-01	2016-04-01	1286	2	1
155	2016-04-02	4	2016-04-03	2016-04-04	371	6	2
156	2016-04-03	4	2016-04-06	2016-04-05	357	3	1
157	2016-04-03	4	2016-04-06	2016-04-06	43	8	3
158	2016-04-04	3	2016-04-04	\N	117	9	3
159	2016-04-04	4	2016-04-06	2016-04-06	32	2	1
160	2016-04-04	4	2016-04-06	2016-04-06	205	7	2
161	2016-04-04	4	2016-04-07	2016-04-05	251	7	2
162	2016-04-06	4	2016-04-08	2016-04-07	31	3	1
163	2016-04-06	4	2016-04-07	2016-04-07	1325	7	2
164	2016-04-07	4	2016-04-08	2016-04-09	610	7	2
165	2016-04-08	4	2016-04-10	2016-04-10	574	3	1
166	2016-04-08	4	2016-04-11	2016-04-11	338	6	2
167	2016-04-08	4	2016-04-09	2016-04-11	1034	7	2
168	2016-04-09	4	2016-04-12	2016-04-11	1147	3	1
169	2016-04-10	4	2016-04-11	2016-04-11	99	7	2
170	2016-04-10	4	2016-04-11	2016-04-13	1200	7	2
171	2016-04-11	4	2016-04-14	2016-04-14	237	3	1
172	2016-04-11	4	2016-04-12	2016-04-14	1079	7	2
173	2016-04-11	4	2016-04-14	2016-04-13	117	8	3
174	2016-04-12	4	2016-04-13	2016-04-15	1361	7	2
175	2016-04-13	4	2016-04-14	2016-04-14	951	6	2
176	2016-04-15	4	2016-04-16	2016-04-17	643	7	2
177	2016-04-16	4	2016-04-19	2016-04-19	121	2	1
178	2016-04-16	4	2016-04-17	2016-04-18	756	6	2
179	2016-04-17	4	2016-04-19	2016-04-19	616	6	2
180	2016-04-17	4	2016-04-20	2016-04-19	918	7	2
181	2016-04-18	4	2016-04-20	2016-04-20	459	3	1
182	2016-04-18	4	2016-04-19	2016-04-20	854	6	2
183	2016-04-19	4	2016-04-20	2016-04-20	22	7	2
184	2016-04-19	4	2016-04-21	2016-04-22	134	7	2
185	2016-04-20	3	2016-04-20	\N	24	2	1
186	2016-04-21	4	2016-04-22	2016-04-24	1127	6	2
187	2016-04-22	4	2016-04-23	2016-04-24	183	6	2
188	2016-04-22	4	2016-04-23	2016-04-25	390	6	2
189	2016-04-23	4	2016-04-24	2016-04-26	1288	2	1
190	2016-04-23	4	2016-04-25	2016-04-25	98	6	2
191	2016-04-27	4	2016-04-28	2016-04-28	919	2	1
192	2016-04-27	4	2016-04-28	2016-04-29	728	7	2
193	2016-04-28	4	2016-04-30	2016-04-30	1366	3	1
194	2016-04-28	4	2016-04-30	2016-05-01	558	7	2
195	2016-04-28	4	2016-05-01	2016-05-01	727	7	2
196	2016-04-28	4	2016-04-30	2016-05-01	1247	6	2
197	2016-04-30	4	2016-05-03	2016-05-03	127	7	2
198	2016-05-01	4	2016-05-04	2016-05-03	640	6	2
199	2016-05-01	4	2016-05-04	2016-05-04	760	7	2
200	2016-05-01	4	2016-05-03	2016-05-03	1074	6	2
201	2016-05-01	4	2016-05-04	2016-05-02	280	9	3
202	2016-05-03	4	2016-05-05	2016-05-04	600	2	1
203	2016-05-03	4	2016-05-05	2016-05-06	1102	9	3
204	2016-05-04	4	2016-05-07	2016-05-06	591	7	2
205	2016-05-04	4	2016-05-05	2016-05-06	635	6	2
206	2016-05-04	4	2016-05-06	2016-05-05	743	9	3
207	2016-05-05	4	2016-05-07	2016-05-07	105	7	2
208	2016-05-06	4	2016-05-07	2016-05-09	815	7	2
209	2016-05-07	4	2016-05-08	2016-05-08	514	6	2
210	2016-05-07	4	2016-05-08	2016-05-09	943	6	2
211	2016-05-07	4	2016-05-09	2016-05-08	1140	6	2
212	2016-05-08	4	2016-05-09	2016-05-11	1373	6	2
213	2016-05-08	4	2016-05-09	2016-05-09	788	8	3
214	2016-05-10	4	2016-05-12	2016-05-11	363	6	2
215	2016-05-10	4	2016-05-13	2016-05-12	1420	7	2
216	2016-05-11	4	2016-05-14	2016-05-13	267	3	1
217	2016-05-11	4	2016-05-12	2016-05-14	716	7	2
218	2016-05-12	4	2016-05-14	2016-05-14	1179	7	2
219	2016-05-12	4	2016-05-15	2016-05-15	1338	6	2
220	2016-05-12	4	2016-05-14	2016-05-15	1358	6	2
221	2016-05-13	4	2016-05-16	2016-05-14	1218	2	1
222	2016-05-13	4	2016-05-16	2016-05-14	51	6	2
223	2016-05-15	4	2016-05-16	2016-05-17	1368	7	2
224	2016-05-17	4	2016-05-18	2016-05-19	157	3	1
225	2016-05-17	4	2016-05-20	2016-05-19	307	3	1
226	2016-05-17	4	2016-05-19	2016-05-20	501	2	1
227	2016-05-17	4	2016-05-18	2016-05-20	489	7	2
228	2016-05-17	4	2016-05-20	2016-05-20	615	7	2
229	2016-05-19	4	2016-05-21	2016-05-20	742	6	2
230	2016-05-19	4	2016-05-20	2016-05-21	1167	6	2
231	2016-05-19	4	2016-05-22	2016-05-21	1257	6	2
232	2016-05-20	4	2016-05-23	2016-05-23	1360	3	1
233	2016-05-21	4	2016-05-22	2016-05-24	737	6	2
234	2016-05-22	4	2016-05-24	2016-05-24	1435	6	2
235	2016-05-24	4	2016-05-25	2016-05-25	649	6	2
236	2016-05-25	4	2016-05-27	2016-05-26	206	6	2
237	2016-05-25	4	2016-05-26	2016-05-27	1351	7	2
238	2016-05-26	4	2016-05-29	2016-05-29	1350	6	2
239	2016-05-27	3	2016-05-27	\N	13	9	3
240	2016-05-27	4	2016-05-29	2016-05-30	65	6	2
241	2016-05-27	4	2016-05-29	2016-05-29	1082	7	2
242	2016-05-27	4	2016-05-30	2016-05-30	1168	7	2
243	2016-05-27	4	2016-05-30	2016-05-28	802	8	3
244	2016-05-28	4	2016-05-29	2016-05-29	956	6	2
245	2016-05-29	4	2016-05-31	2016-05-30	223	7	2
246	2016-05-30	3	2016-05-30	\N	17	6	2
247	2016-05-30	4	2016-06-01	2016-06-01	928	3	1
248	2016-05-30	4	2016-06-01	2016-05-31	1376	7	2
249	2016-06-01	4	2016-06-04	2016-06-04	145	6	2
250	2016-06-01	4	2016-06-02	2016-06-04	150	7	2
251	2016-06-01	4	2016-06-04	2016-06-04	851	7	2
252	2016-06-01	4	2016-06-04	2016-06-02	66	8	3
253	2016-06-02	4	2016-06-05	2016-06-05	1267	6	2
254	2016-06-03	4	2016-06-06	2016-06-05	510	7	2
255	2016-06-03	4	2016-06-06	2016-06-05	801	7	2
256	2016-06-04	4	2016-06-05	2016-06-07	26	7	2
257	2016-06-05	4	2016-06-06	2016-06-08	1314	3	1
258	2016-06-06	4	2016-06-07	2016-06-07	107	7	2
259	2016-06-06	4	2016-06-09	2016-06-09	413	7	2
260	2016-06-06	4	2016-06-08	2016-06-08	632	6	2
261	2016-06-08	4	2016-06-10	2016-06-09	1045	2	1
262	2016-06-08	4	2016-06-11	2016-06-10	579	9	3
263	2016-06-09	4	2016-06-10	2016-06-12	1322	6	2
264	2016-06-10	3	2016-06-10	\N	5	3	1
265	2016-06-10	4	2016-06-12	2016-06-11	682	7	2
266	2016-06-10	4	2016-06-13	2016-06-13	933	7	2
267	2016-06-11	4	2016-06-14	2016-06-14	282	3	1
268	2016-06-11	4	2016-06-14	2016-06-12	540	3	1
269	2016-06-12	4	2016-06-13	2016-06-15	764	6	2
270	2016-06-12	4	2016-06-15	2016-06-13	879	7	2
271	2016-06-13	4	2016-06-16	2016-06-14	350	7	2
272	2016-06-15	4	2016-06-18	2016-06-16	497	7	2
273	2016-06-16	4	2016-06-19	2016-06-17	1340	7	2
274	2016-06-17	4	2016-06-20	2016-06-18	411	7	2
275	2016-06-17	4	2016-06-19	2016-06-18	1341	7	2
276	2016-06-18	4	2016-06-19	2016-06-19	1227	6	2
277	2016-06-19	4	2016-06-20	2016-06-20	546	7	2
278	2016-06-20	4	2016-06-23	2016-06-21	1301	3	1
279	2016-06-21	4	2016-06-22	2016-06-22	378	6	2
280	2016-06-21	4	2016-06-22	2016-06-23	638	7	2
281	2016-06-21	4	2016-06-22	2016-06-23	800	7	2
282	2016-06-22	4	2016-06-25	2016-06-25	159	9	3
283	2016-06-23	4	2016-06-26	2016-06-26	181	2	1
284	2016-06-23	4	2016-06-25	2016-06-25	1356	7	2
285	2016-06-25	4	2016-06-26	2016-06-27	319	2	1
286	2016-06-25	4	2016-06-26	2016-06-26	59	6	2
287	2016-06-25	4	2016-06-26	2016-06-27	133	6	2
288	2016-06-25	4	2016-06-28	2016-06-28	780	6	2
289	2016-06-27	4	2016-06-28	2016-06-30	849	6	2
290	2016-06-28	4	2016-06-29	2016-06-30	202	6	2
291	2016-06-29	4	2016-06-30	2016-07-01	158	6	2
292	2016-06-29	4	2016-06-30	2016-07-02	360	9	3
293	2016-06-30	4	2016-07-03	2016-07-02	573	7	2
294	2016-07-01	4	2016-07-02	2016-07-02	732	7	2
295	2016-07-01	4	2016-07-04	2016-07-04	1130	7	2
296	2016-07-04	4	2016-07-07	2016-07-06	1245	6	2
297	2016-07-04	4	2016-07-05	2016-07-06	1425	7	2
298	2016-07-04	4	2016-07-07	2016-07-07	885	9	3
299	2016-07-05	4	2016-07-06	2016-07-07	281	6	2
300	2016-07-05	4	2016-07-08	2016-07-08	1205	6	2
301	2016-07-06	4	2016-07-09	2016-07-08	17	6	2
302	2016-07-06	4	2016-07-07	2016-07-09	1375	6	2
303	2016-07-07	4	2016-07-08	2016-07-09	36	7	2
304	2016-07-07	4	2016-07-08	2016-07-08	230	6	2
305	2016-07-07	4	2016-07-08	2016-07-08	705	7	2
306	2016-07-09	4	2016-07-10	2016-07-12	424	7	2
307	2016-07-09	4	2016-07-11	2016-07-11	695	6	2
308	2016-07-11	4	2016-07-12	2016-07-14	156	6	2
309	2016-07-11	4	2016-07-13	2016-07-13	211	6	2
310	2016-07-12	4	2016-07-13	2016-07-13	627	2	1
311	2016-07-12	4	2016-07-14	2016-07-13	1400	6	2
312	2016-07-13	4	2016-07-15	2016-07-16	299	6	2
313	2016-07-14	4	2016-07-15	2016-07-15	565	9	3
314	2016-07-15	4	2016-07-17	2016-07-17	1019	7	2
315	2016-07-16	4	2016-07-19	2016-07-17	1263	6	2
316	2016-07-17	4	2016-07-20	2016-07-19	670	7	2
317	2016-07-17	4	2016-07-20	2016-07-19	795	7	2
318	2016-07-17	4	2016-07-19	2016-07-20	1141	7	2
319	2016-07-18	4	2016-07-21	2016-07-21	941	6	2
320	2016-07-19	4	2016-07-20	2016-07-21	1428	2	1
321	2016-07-19	4	2016-07-22	2016-07-21	568	6	2
322	2016-07-19	4	2016-07-22	2016-07-20	924	6	2
323	2016-07-19	4	2016-07-22	2016-07-21	1243	6	2
324	2016-07-20	4	2016-07-22	2016-07-23	480	6	2
325	2016-07-20	4	2016-07-21	2016-07-21	848	6	2
326	2016-07-20	4	2016-07-21	2016-07-22	1337	9	3
327	2016-07-21	4	2016-07-24	2016-07-22	83	6	2
328	2016-07-23	4	2016-07-26	2016-07-25	528	6	2
329	2016-07-24	4	2016-07-27	2016-07-26	274	6	2
330	2016-07-24	4	2016-07-27	2016-07-27	622	6	2
331	2016-07-24	4	2016-07-26	2016-07-25	642	6	2
332	2016-07-24	4	2016-07-26	2016-07-26	659	7	2
333	2016-07-25	4	2016-07-27	2016-07-26	779	6	2
334	2016-07-25	4	2016-07-28	2016-07-27	1112	7	2
335	2016-07-25	4	2016-07-27	2016-07-26	1193	6	2
336	2016-07-26	4	2016-07-29	2016-07-27	1030	7	2
337	2016-07-26	4	2016-07-27	2016-07-28	1252	7	2
338	2016-07-28	4	2016-07-29	2016-07-30	1333	3	1
339	2016-07-28	4	2016-07-31	2016-07-29	1110	7	2
340	2016-07-29	4	2016-07-30	2016-07-31	963	7	2
341	2016-07-31	4	2016-08-03	2016-08-01	1357	3	1
342	2016-07-31	4	2016-08-01	2016-08-03	806	7	2
343	2016-07-31	4	2016-08-02	2016-08-01	961	7	2
344	2016-08-01	4	2016-08-03	2016-08-02	750	6	2
345	2016-08-01	4	2016-08-04	2016-08-03	1299	6	2
346	2016-08-01	4	2016-08-03	2016-08-02	584	9	3
347	2016-08-02	4	2016-08-03	2016-08-05	1004	6	2
348	2016-08-02	4	2016-08-05	2016-08-04	907	9	3
349	2016-08-03	3	2016-08-03	\N	30	3	1
350	2016-08-03	3	2016-08-03	\N	31	3	1
351	2016-08-03	4	2016-08-06	2016-08-04	1307	2	1
352	2016-08-03	4	2016-08-04	2016-08-06	16	7	2
353	2016-08-03	4	2016-08-06	2016-08-06	1387	7	2
354	2016-08-03	4	2016-08-05	2016-08-06	551	8	3
355	2016-08-03	4	2016-08-05	2016-08-05	1011	8	3
356	2016-08-04	4	2016-08-07	2016-08-06	1189	6	2
357	2016-08-05	3	2016-08-05	\N	14	8	3
358	2016-08-05	4	2016-08-07	2016-08-07	1042	7	2
359	2016-08-07	4	2016-08-10	2016-08-10	441	7	2
360	2016-08-07	4	2016-08-09	2016-08-10	1300	6	2
361	2016-08-08	4	2016-08-09	2016-08-11	994	6	2
362	2016-08-09	4	2016-08-11	2016-08-11	187	2	1
363	2016-08-11	4	2016-08-12	2016-08-13	834	8	3
364	2016-08-12	4	2016-08-14	2016-08-13	373	6	2
365	2016-08-13	4	2016-08-14	2016-08-15	981	6	2
366	2016-08-13	4	2016-08-14	2016-08-14	1054	9	3
367	2016-08-14	4	2016-08-15	2016-08-15	527	7	2
368	2016-08-14	4	2016-08-15	2016-08-17	995	7	2
369	2016-08-15	4	2016-08-18	2016-08-18	1285	3	1
370	2016-08-15	4	2016-08-18	2016-08-18	758	7	2
371	2016-08-15	4	2016-08-16	2016-08-18	891	7	2
372	2016-08-16	4	2016-08-18	2016-08-18	132	6	2
373	2016-08-16	4	2016-08-19	2016-08-17	337	7	2
374	2016-08-17	4	2016-08-19	2016-08-18	1313	2	1
375	2016-08-17	4	2016-08-20	2016-08-20	536	7	2
376	2016-08-17	4	2016-08-19	2016-08-18	825	6	2
377	2016-08-17	4	2016-08-19	2016-08-20	1355	6	2
378	2016-08-17	4	2016-08-20	2016-08-20	475	9	3
379	2016-08-18	4	2016-08-21	2016-08-21	954	7	2
380	2016-08-19	4	2016-08-20	2016-08-21	1156	7	2
381	2016-08-19	4	2016-08-21	2016-08-21	1297	7	2
382	2016-08-20	4	2016-08-23	2016-08-23	199	6	2
383	2016-08-20	4	2016-08-23	2016-08-22	331	7	2
384	2016-08-20	4	2016-08-22	2016-08-23	410	7	2
385	2016-08-20	4	2016-08-23	2016-08-22	1274	7	2
386	2016-08-20	4	2016-08-23	2016-08-23	1362	6	2
387	2016-08-20	4	2016-08-21	2016-08-21	451	8	3
388	2016-08-21	4	2016-08-24	2016-08-23	1080	8	3
389	2016-08-22	4	2016-08-24	2016-08-25	53	3	1
390	2016-08-22	4	2016-08-24	2016-08-25	576	9	3
391	2016-08-23	3	2016-08-23	\N	61	9	3
392	2016-08-23	4	2016-08-26	2016-08-24	176	3	1
393	2016-08-25	4	2016-08-26	2016-08-27	368	6	2
394	2016-08-26	4	2016-08-28	2016-08-29	522	3	1
395	2016-08-26	4	2016-08-27	2016-08-29	144	6	2
396	2016-08-27	4	2016-08-30	2016-08-29	542	6	2
397	2016-08-28	4	2016-08-31	2016-08-29	1437	7	2
398	2016-08-29	4	2016-08-30	2016-09-01	447	2	1
399	2016-08-29	4	2016-09-01	2016-09-01	1001	7	2
400	2016-08-29	4	2016-08-30	2016-08-31	1295	6	2
401	2016-08-30	4	2016-09-02	2016-09-01	103	6	2
402	2016-08-30	4	2016-09-01	2016-08-31	1335	6	2
403	2016-08-31	4	2016-09-01	2016-09-02	578	3	1
404	2016-08-31	4	2016-09-03	2016-09-01	396	7	2
405	2016-08-31	4	2016-09-01	2016-09-01	603	6	2
406	2016-08-31	4	2016-09-02	2016-09-01	1380	7	2
407	2016-09-01	3	2016-09-01	\N	77	8	3
408	2016-09-01	4	2016-09-02	2016-09-02	1071	2	1
409	2016-09-01	4	2016-09-04	2016-09-04	416	7	2
410	2016-09-01	4	2016-09-03	2016-09-02	1151	6	2
411	2016-09-02	4	2016-09-04	2016-09-04	261	3	1
412	2016-09-02	4	2016-09-04	2016-09-04	1202	3	1
413	2016-09-02	4	2016-09-05	2016-09-03	717	6	2
414	2016-09-03	4	2016-09-06	2016-09-06	917	7	2
415	2016-09-03	4	2016-09-06	2016-09-06	1265	7	2
416	2016-09-03	4	2016-09-04	2016-09-06	1377	7	2
417	2016-09-04	4	2016-09-05	2016-09-06	359	3	1
418	2016-09-04	4	2016-09-05	2016-09-05	88	6	2
419	2016-09-04	4	2016-09-07	2016-09-06	14	8	3
420	2016-09-05	4	2016-09-06	2016-09-07	72	3	1
421	2016-09-05	4	2016-09-06	2016-09-08	240	3	1
422	2016-09-06	4	2016-09-07	2016-09-09	398	6	2
423	2016-09-06	4	2016-09-09	2016-09-09	1397	7	2
424	2016-09-08	4	2016-09-11	2016-09-11	67	3	1
425	2016-09-08	4	2016-09-11	2016-09-11	843	6	2
426	2016-09-08	4	2016-09-10	2016-09-10	944	6	2
427	2016-09-09	4	2016-09-10	2016-09-11	434	2	1
428	2016-09-09	4	2016-09-12	2016-09-10	1039	6	2
429	2016-09-10	4	2016-09-12	2016-09-12	153	8	3
430	2016-09-11	4	2016-09-13	2016-09-12	272	6	2
431	2016-09-11	4	2016-09-12	2016-09-12	1217	6	2
432	2016-09-12	4	2016-09-15	2016-09-14	169	2	1
433	2016-09-12	4	2016-09-15	2016-09-13	1062	6	2
434	2016-09-13	4	2016-09-15	2016-09-14	726	6	2
435	2016-09-14	4	2016-09-15	2016-09-16	77	9	3
436	2016-09-16	4	2016-09-19	2016-09-19	791	7	2
437	2016-09-16	4	2016-09-18	2016-09-18	1085	7	2
438	2016-09-16	4	2016-09-19	2016-09-18	314	8	3
439	2016-09-17	4	2016-09-20	2016-09-18	149	6	2
440	2016-09-17	4	2016-09-18	2016-09-19	882	7	2
441	2016-09-18	4	2016-09-19	2016-09-19	704	2	1
442	2016-09-18	4	2016-09-21	2016-09-21	667	7	2
443	2016-09-18	4	2016-09-19	2016-09-20	1371	6	2
444	2016-09-19	4	2016-09-20	2016-09-21	30	2	1
445	2016-09-19	4	2016-09-22	2016-09-22	362	6	2
446	2016-09-19	4	2016-09-21	2016-09-20	399	7	2
447	2016-09-20	4	2016-09-23	2016-09-22	808	8	3
448	2016-09-21	4	2016-09-22	2016-09-24	101	6	2
449	2016-09-21	4	2016-09-24	2016-09-22	492	7	2
450	2016-09-21	4	2016-09-24	2016-09-23	575	7	2
451	2016-09-21	4	2016-09-23	2016-09-22	1146	7	2
452	2016-09-22	4	2016-09-23	2016-09-24	997	7	2
453	2016-09-22	4	2016-09-24	2016-09-25	1028	7	2
454	2016-09-23	4	2016-09-25	2016-09-26	988	6	2
455	2016-09-23	4	2016-09-24	2016-09-24	1055	7	2
456	2016-09-23	4	2016-09-26	2016-09-25	1061	9	3
457	2016-09-24	4	2016-09-27	2016-09-27	1349	3	1
458	2016-09-25	4	2016-09-28	2016-09-26	197	6	2
459	2016-09-25	4	2016-09-28	2016-09-26	874	6	2
460	2016-09-25	4	2016-09-27	2016-09-26	691	8	3
461	2016-09-26	4	2016-09-27	2016-09-27	853	7	2
462	2016-09-27	4	2016-09-28	2016-09-29	852	6	2
463	2016-09-27	4	2016-09-28	2016-09-28	964	8	3
464	2016-09-28	4	2016-09-30	2016-09-29	74	7	2
465	2016-09-28	4	2016-10-01	2016-10-01	1198	6	2
466	2016-09-28	4	2016-09-29	2016-10-01	1440	7	2
467	2016-09-28	4	2016-09-30	2016-09-30	555	8	3
468	2016-09-29	4	2016-10-02	2016-09-30	1261	3	1
469	2016-09-29	4	2016-10-02	2016-10-02	1089	7	2
470	2016-09-30	4	2016-10-02	2016-10-02	641	3	1
471	2016-09-30	4	2016-10-02	2016-10-01	697	3	1
472	2016-09-30	4	2016-10-01	2016-10-01	468	7	2
473	2016-09-30	4	2016-10-02	2016-10-03	549	7	2
474	2016-10-01	4	2016-10-04	2016-10-04	553	3	1
475	2016-10-01	4	2016-10-04	2016-10-03	241	7	2
476	2016-10-01	4	2016-10-04	2016-10-02	559	6	2
477	2016-10-02	4	2016-10-05	2016-10-04	449	2	1
478	2016-10-02	4	2016-10-05	2016-10-03	304	7	2
479	2016-10-03	4	2016-10-04	2016-10-04	984	6	2
480	2016-10-04	4	2016-10-07	2016-10-05	686	3	1
481	2016-10-04	4	2016-10-07	2016-10-06	481	9	3
482	2016-10-05	4	2016-10-06	2016-10-06	513	6	2
483	2016-10-06	4	2016-10-07	2016-10-09	703	2	1
484	2016-10-06	4	2016-10-09	2016-10-07	421	7	2
485	2016-10-06	4	2016-10-08	2016-10-07	465	7	2
486	2016-10-06	4	2016-10-08	2016-10-09	709	7	2
487	2016-10-06	4	2016-10-09	2016-10-09	827	6	2
488	2016-10-06	4	2016-10-09	2016-10-08	921	6	2
489	2016-10-06	4	2016-10-08	2016-10-08	899	8	3
490	2016-10-07	4	2016-10-10	2016-10-09	876	6	2
491	2016-10-08	4	2016-10-10	2016-10-11	1048	2	1
492	2016-10-09	4	2016-10-10	2016-10-12	191	2	1
493	2016-10-09	4	2016-10-12	2016-10-11	796	3	1
494	2016-10-09	4	2016-10-10	2016-10-11	875	6	2
495	2016-10-10	4	2016-10-12	2016-10-13	712	3	1
496	2016-10-10	4	2016-10-12	2016-10-11	193	6	2
497	2016-10-10	4	2016-10-11	2016-10-11	785	6	2
498	2016-10-10	4	2016-10-12	2016-10-11	1331	6	2
499	2016-10-11	4	2016-10-14	2016-10-13	260	2	1
500	2016-10-11	4	2016-10-12	2016-10-13	148	6	2
501	2016-10-11	4	2016-10-12	2016-10-13	977	7	2
502	2016-10-12	4	2016-10-13	2016-10-13	401	9	3
503	2016-10-13	4	2016-10-16	2016-10-14	932	6	2
504	2016-10-14	4	2016-10-15	2016-10-15	1381	2	1
505	2016-10-14	4	2016-10-16	2016-10-17	721	6	2
506	2016-10-14	4	2016-10-16	2016-10-16	831	6	2
507	2016-10-15	4	2016-10-17	2016-10-17	1378	3	1
508	2016-10-15	4	2016-10-18	2016-10-18	1359	6	2
509	2016-10-16	4	2016-10-17	2016-10-17	235	7	2
510	2016-10-17	4	2016-10-18	2016-10-18	586	7	2
511	2016-10-18	4	2016-10-20	2016-10-19	377	7	2
512	2016-10-19	4	2016-10-22	2016-10-20	8	7	2
513	2016-10-19	4	2016-10-21	2016-10-21	155	6	2
514	2016-10-19	4	2016-10-21	2016-10-20	927	7	2
515	2016-10-19	4	2016-10-20	2016-10-22	986	6	2
516	2016-10-21	4	2016-10-23	2016-10-24	111	6	2
517	2016-10-21	4	2016-10-22	2016-10-24	613	6	2
518	2016-10-22	4	2016-10-24	2016-10-25	1374	2	1
519	2016-10-22	4	2016-10-23	2016-10-24	54	7	2
520	2016-10-23	4	2016-10-26	2016-10-24	639	7	2
521	2016-10-23	4	2016-10-25	2016-10-25	664	6	2
522	2016-10-23	4	2016-10-24	2016-10-24	724	7	2
523	2016-10-24	4	2016-10-26	2016-10-27	1056	6	2
524	2016-10-25	4	2016-10-26	2016-10-27	569	2	1
525	2016-10-26	4	2016-10-28	2016-10-29	1315	3	1
526	2016-10-26	4	2016-10-28	2016-10-28	1096	6	2
527	2016-10-27	4	2016-10-29	2016-10-28	506	2	1
528	2016-10-28	4	2016-10-31	2016-10-31	676	7	2
529	2016-10-28	4	2016-10-30	2016-10-31	753	7	2
530	2016-10-28	4	2016-10-31	2016-10-31	773	6	2
531	2016-10-28	4	2016-10-29	2016-10-30	116	8	3
532	2016-10-29	4	2016-10-31	2016-10-30	817	7	2
533	2016-10-29	4	2016-11-01	2016-11-01	1334	6	2
534	2016-10-29	4	2016-10-30	2016-10-31	1406	7	2
535	2016-10-29	4	2016-10-31	2016-11-01	835	9	3
536	2016-10-31	4	2016-11-02	2016-11-01	759	3	1
537	2016-10-31	4	2016-11-01	2016-11-03	1353	2	1
538	2016-11-02	4	2016-11-05	2016-11-05	341	6	2
539	2016-11-02	4	2016-11-04	2016-11-03	1144	7	2
540	2016-11-03	4	2016-11-05	2016-11-06	1429	3	1
541	2016-11-04	4	2016-11-07	2016-11-07	1228	3	1
542	2016-11-04	4	2016-11-06	2016-11-05	313	7	2
543	2016-11-06	4	2016-11-09	2016-11-08	62	6	2
544	2016-11-06	4	2016-11-07	2016-11-08	321	7	2
545	2016-11-08	4	2016-11-10	2016-11-09	1108	9	3
546	2016-11-09	4	2016-11-12	2016-11-10	470	7	2
547	2016-11-09	4	2016-11-11	2016-11-10	20	8	3
548	2016-11-11	4	2016-11-13	2016-11-13	739	7	2
549	2016-11-12	3	2016-11-12	\N	64	9	3
550	2016-11-12	4	2016-11-14	2016-11-15	892	7	2
551	2016-11-12	4	2016-11-13	2016-11-13	1169	6	2
552	2016-11-12	4	2016-11-15	2016-11-13	1282	7	2
553	2016-11-12	4	2016-11-13	2016-11-15	913	9	3
554	2016-11-13	4	2016-11-14	2016-11-16	104	3	1
555	2016-11-13	4	2016-11-14	2016-11-16	212	7	2
556	2016-11-13	4	2016-11-14	2016-11-15	61	9	3
557	2016-11-14	4	2016-11-17	2016-11-15	1248	6	2
558	2016-11-15	4	2016-11-16	2016-11-17	1443	7	2
559	2016-11-16	4	2016-11-17	2016-11-17	959	2	1
560	2016-11-18	4	2016-11-19	2016-11-21	1405	6	2
561	2016-11-19	4	2016-11-22	2016-11-22	90	6	2
562	2016-11-19	4	2016-11-20	2016-11-22	942	7	2
563	2016-11-20	4	2016-11-22	2016-11-21	365	6	2
564	2016-11-20	4	2016-11-23	2016-11-22	1058	7	2
565	2016-11-21	4	2016-11-22	2016-11-22	894	7	2
566	2016-11-22	4	2016-11-25	2016-11-23	298	3	1
567	2016-11-22	4	2016-11-23	2016-11-23	1430	2	1
568	2016-11-23	4	2016-11-25	2016-11-24	1275	3	1
569	2016-11-23	4	2016-11-24	2016-11-25	707	6	2
570	2016-11-23	4	2016-11-24	2016-11-25	989	6	2
571	2016-11-24	4	2016-11-25	2016-11-27	5	2	1
572	2016-11-24	4	2016-11-26	2016-11-26	178	6	2
573	2016-11-24	4	2016-11-26	2016-11-27	423	6	2
574	2016-11-26	4	2016-11-27	2016-11-29	833	7	2
575	2016-11-27	4	2016-11-28	2016-11-30	33	3	1
576	2016-11-27	4	2016-11-30	2016-11-28	1272	3	1
577	2016-11-27	4	2016-11-30	2016-11-29	445	6	2
578	2016-11-27	4	2016-11-28	2016-11-29	819	7	2
579	2016-11-27	4	2016-11-30	2016-11-29	160	8	3
580	2016-11-30	4	2016-12-02	2016-12-02	581	3	1
581	2016-12-03	4	2016-12-05	2016-12-06	688	3	1
582	2016-12-04	3	2016-12-04	\N	32	2	1
583	2016-12-04	4	2016-12-05	2016-12-07	792	7	2
584	2016-12-04	4	2016-12-05	2016-12-05	1209	7	2
585	2016-12-04	4	2016-12-05	2016-12-05	1219	7	2
586	2016-12-04	4	2016-12-06	2016-12-05	1306	6	2
587	2016-12-06	4	2016-12-08	2016-12-08	487	2	1
588	2016-12-06	4	2016-12-07	2016-12-07	102	7	2
589	2016-12-06	4	2016-12-07	2016-12-07	719	7	2
590	2016-12-06	4	2016-12-09	2016-12-07	990	7	2
591	2016-12-06	4	2016-12-09	2016-12-09	1211	7	2
592	2016-12-06	4	2016-12-08	2016-12-08	1232	7	2
593	2016-12-07	4	2016-12-10	2016-12-08	50	8	3
594	2016-12-07	4	2016-12-08	2016-12-08	1318	8	3
595	2016-12-08	4	2016-12-09	2016-12-11	538	2	1
596	2016-12-08	4	2016-12-09	2016-12-09	952	3	1
597	2016-12-08	4	2016-12-09	2016-12-10	1121	6	2
598	2016-12-09	3	2016-12-09	\N	40	3	1
599	2016-12-09	4	2016-12-10	2016-12-12	1	6	2
600	2016-12-09	4	2016-12-12	2016-12-11	624	7	2
601	2016-12-09	4	2016-12-10	2016-12-10	683	6	2
602	2016-12-09	4	2016-12-10	2016-12-11	823	6	2
603	2016-12-09	4	2016-12-10	2016-12-10	1032	7	2
604	2016-12-10	4	2016-12-13	2016-12-12	96	7	2
605	2016-12-10	4	2016-12-11	2016-12-12	1208	6	2
606	2016-12-11	4	2016-12-12	2016-12-13	18	7	2
607	2016-12-11	4	2016-12-14	2016-12-13	309	6	2
608	2016-12-12	4	2016-12-15	2016-12-14	1103	3	1
609	2016-12-12	4	2016-12-13	2016-12-14	896	7	2
610	2016-12-13	4	2016-12-15	2016-12-14	711	6	2
611	2016-12-15	4	2016-12-17	2016-12-18	1073	7	2
612	2016-12-16	4	2016-12-17	2016-12-17	634	7	2
613	2016-12-17	4	2016-12-19	2016-12-19	1159	7	2
614	2016-12-18	4	2016-12-21	2016-12-21	654	2	1
615	2016-12-19	4	2016-12-22	2016-12-21	560	9	3
616	2016-12-20	4	2016-12-23	2016-12-23	1444	6	2
617	2016-12-21	4	2016-12-23	2016-12-23	118	7	2
618	2016-12-21	4	2016-12-22	2016-12-22	131	6	2
619	2016-12-22	4	2016-12-25	2016-12-25	454	7	2
620	2016-12-22	4	2016-12-24	2016-12-24	466	6	2
621	2016-12-23	4	2016-12-25	2016-12-24	1157	6	2
622	2016-12-23	4	2016-12-26	2016-12-25	1398	7	2
623	2016-12-24	4	2016-12-26	2016-12-27	678	6	2
624	2016-12-24	4	2016-12-25	2016-12-27	814	6	2
625	2016-12-25	4	2016-12-28	2016-12-26	1163	2	1
626	2016-12-25	4	2016-12-28	2016-12-27	130	7	2
627	2016-12-25	4	2016-12-26	2016-12-28	1119	6	2
628	2016-12-26	4	2016-12-29	2016-12-27	561	3	1
629	2016-12-26	4	2016-12-27	2016-12-29	973	2	1
630	2016-12-26	4	2016-12-27	2016-12-28	1404	6	2
631	2016-12-27	4	2016-12-29	2016-12-29	855	3	1
632	2016-12-27	4	2016-12-29	2016-12-29	163	7	2
633	2016-12-28	4	2016-12-31	2016-12-30	1040	8	3
634	2016-12-29	4	2017-01-01	2016-12-30	27	6	2
635	2016-12-30	4	2017-01-02	2016-12-31	520	6	2
636	2017-01-03	4	2017-01-04	2017-01-05	532	2	1
637	2017-01-03	4	2017-01-05	2017-01-05	512	6	2
638	2017-01-04	4	2017-01-05	2017-01-06	1302	7	2
639	2017-01-06	4	2017-01-07	2017-01-07	550	6	2
640	2017-01-06	4	2017-01-08	2017-01-07	1093	6	2
641	2017-01-07	4	2017-01-10	2017-01-08	673	3	1
642	2017-01-07	4	2017-01-09	2017-01-10	847	7	2
643	2017-01-08	4	2017-01-09	2017-01-11	901	3	1
644	2017-01-08	4	2017-01-11	2017-01-10	439	6	2
645	2017-01-08	4	2017-01-11	2017-01-10	1199	6	2
646	2017-01-09	4	2017-01-12	2017-01-11	975	2	1
647	2017-01-09	4	2017-01-10	2017-01-11	283	7	2
648	2017-01-09	4	2017-01-11	2017-01-11	684	6	2
649	2017-01-10	4	2017-01-11	2017-01-13	1153	3	1
650	2017-01-11	4	2017-01-14	2017-01-12	729	2	1
651	2017-01-11	4	2017-01-13	2017-01-13	190	7	2
652	2017-01-12	4	2017-01-15	2017-01-13	985	9	3
653	2017-01-14	4	2017-01-17	2017-01-15	1249	2	1
654	2017-01-14	4	2017-01-15	2017-01-17	1129	7	2
655	2017-01-16	4	2017-01-17	2017-01-18	347	3	1
656	2017-01-16	4	2017-01-17	2017-01-18	949	7	2
657	2017-01-17	4	2017-01-19	2017-01-20	349	2	1
658	2017-01-17	4	2017-01-18	2017-01-18	1051	7	2
659	2017-01-17	4	2017-01-19	2017-01-18	1391	7	2
660	2017-01-18	4	2017-01-19	2017-01-19	383	7	2
661	2017-01-18	4	2017-01-19	2017-01-20	626	6	2
662	2017-01-19	4	2017-01-20	2017-01-20	1125	3	1
663	2017-01-20	4	2017-01-22	2017-01-23	344	3	1
664	2017-01-20	4	2017-01-23	2017-01-22	681	7	2
665	2017-01-21	4	2017-01-22	2017-01-23	29	6	2
666	2017-01-21	4	2017-01-22	2017-01-24	770	7	2
667	2017-01-22	4	2017-01-24	2017-01-25	858	7	2
668	2017-01-22	4	2017-01-23	2017-01-24	297	8	3
669	2017-01-23	4	2017-01-24	2017-01-26	745	7	2
670	2017-01-24	4	2017-01-25	2017-01-25	361	6	2
671	2017-01-25	4	2017-01-28	2017-01-26	922	7	2
672	2017-01-26	4	2017-01-29	2017-01-29	908	6	2
673	2017-01-26	4	2017-01-28	2017-01-27	64	9	3
674	2017-01-27	4	2017-01-28	2017-01-29	733	6	2
675	2017-01-28	4	2017-01-31	2017-01-30	291	7	2
676	2017-01-28	4	2017-01-30	2017-01-31	790	7	2
677	2017-01-28	4	2017-01-31	2017-01-30	809	7	2
678	2017-01-28	4	2017-01-29	2017-01-31	250	9	3
679	2017-01-29	4	2017-01-30	2017-01-30	81	3	1
680	2017-01-29	4	2017-02-01	2017-01-30	245	3	1
681	2017-01-29	4	2017-02-01	2017-01-31	499	7	2
682	2017-01-29	4	2017-01-30	2017-01-30	614	6	2
683	2017-01-29	4	2017-01-31	2017-02-01	741	6	2
684	2017-01-31	4	2017-02-01	2017-02-02	762	6	2
685	2017-01-31	4	2017-02-03	2017-02-02	976	7	2
686	2017-02-01	4	2017-02-03	2017-02-04	380	7	2
687	2017-02-02	4	2017-02-05	2017-02-04	530	3	1
688	2017-02-02	4	2017-02-03	2017-02-05	343	7	2
689	2017-02-02	4	2017-02-03	2017-02-05	884	7	2
690	2017-02-03	4	2017-02-04	2017-02-06	1097	2	1
691	2017-02-04	4	2017-02-06	2017-02-06	1081	7	2
692	2017-02-05	3	2017-02-05	\N	2	3	1
693	2017-02-05	4	2017-02-07	2017-02-06	1233	3	1
694	2017-02-05	4	2017-02-06	2017-02-08	58	7	2
695	2017-02-05	4	2017-02-08	2017-02-07	606	7	2
696	2017-02-05	4	2017-02-08	2017-02-08	1242	7	2
697	2017-02-06	4	2017-02-08	2017-02-09	562	2	1
698	2017-02-06	4	2017-02-08	2017-02-09	543	8	3
699	2017-02-06	4	2017-02-08	2017-02-09	958	9	3
700	2017-02-07	4	2017-02-10	2017-02-08	4	6	2
701	2017-02-07	4	2017-02-08	2017-02-09	850	9	3
702	2017-02-08	4	2017-02-09	2017-02-11	1352	3	1
703	2017-02-08	4	2017-02-09	2017-02-09	417	7	2
704	2017-02-08	4	2017-02-09	2017-02-11	1137	6	2
705	2017-02-08	4	2017-02-11	2017-02-11	1196	7	2
706	2017-02-09	4	2017-02-12	2017-02-10	1271	2	1
707	2017-02-09	4	2017-02-11	2017-02-11	79	7	2
708	2017-02-10	4	2017-02-12	2017-02-11	660	2	1
709	2017-02-11	4	2017-02-13	2017-02-12	1162	6	2
710	2017-02-13	4	2017-02-15	2017-02-16	295	6	2
711	2017-02-13	4	2017-02-16	2017-02-14	1246	6	2
712	2017-02-13	4	2017-02-14	2017-02-16	173	9	3
713	2017-02-13	4	2017-02-14	2017-02-15	207	8	3
714	2017-02-14	4	2017-02-17	2017-02-15	805	7	2
715	2017-02-15	3	2017-02-15	\N	12	6	2
716	2017-02-15	4	2017-02-17	2017-02-18	672	6	2
717	2017-02-15	4	2017-02-18	2017-02-17	1312	6	2
718	2017-02-16	4	2017-02-17	2017-02-17	38	7	2
719	2017-02-16	4	2017-02-19	2017-02-18	200	6	2
720	2017-02-16	4	2017-02-19	2017-02-19	382	6	2
721	2017-02-16	4	2017-02-19	2017-02-17	625	7	2
722	2017-02-18	4	2017-02-20	2017-02-21	1399	7	2
723	2017-02-19	4	2017-02-21	2017-02-22	845	6	2
724	2017-02-19	4	2017-02-22	2017-02-21	864	6	2
725	2017-02-19	4	2017-02-22	2017-02-22	870	7	2
726	2017-02-19	4	2017-02-22	2017-02-20	969	6	2
727	2017-02-19	4	2017-02-22	2017-02-21	962	9	3
728	2017-02-20	4	2017-02-21	2017-02-23	1138	3	1
729	2017-02-20	4	2017-02-22	2017-02-21	897	7	2
730	2017-02-21	4	2017-02-24	2017-02-22	500	6	2
731	2017-02-25	4	2017-02-27	2017-02-27	910	9	3
732	2017-02-26	4	2017-02-27	2017-03-01	147	7	2
733	2017-02-26	4	2017-03-01	2017-02-27	832	7	2
734	2017-02-26	4	2017-02-28	2017-03-01	939	9	3
735	2017-02-27	3	2017-02-27	\N	20	9	3
736	2017-02-27	4	2017-02-28	2017-02-28	184	7	2
737	2017-02-27	4	2017-03-01	2017-02-28	694	6	2
738	2017-02-28	4	2017-03-01	2017-03-03	124	2	1
739	2017-02-28	4	2017-03-01	2017-03-02	49	6	2
740	2017-02-28	4	2017-03-01	2017-03-02	1113	6	2
741	2017-02-28	4	2017-03-01	2017-03-01	119	8	3
742	2017-02-28	4	2017-03-01	2017-03-01	433	9	3
743	2017-03-01	4	2017-03-04	2017-03-04	137	6	2
744	2017-03-01	4	2017-03-02	2017-03-02	166	7	2
745	2017-03-01	4	2017-03-03	2017-03-03	698	7	2
746	2017-03-02	4	2017-03-04	2017-03-05	391	3	1
747	2017-03-03	4	2017-03-04	2017-03-05	87	3	1
748	2017-03-03	4	2017-03-05	2017-03-04	1072	8	3
749	2017-03-04	4	2017-03-07	2017-03-05	255	7	2
750	2017-03-04	4	2017-03-07	2017-03-05	232	8	3
751	2017-03-05	4	2017-03-08	2017-03-07	731	3	1
752	2017-03-05	4	2017-03-06	2017-03-07	335	6	2
753	2017-03-05	4	2017-03-08	2017-03-08	1201	7	2
754	2017-03-06	4	2017-03-07	2017-03-08	646	2	1
755	2017-03-06	4	2017-03-07	2017-03-07	531	6	2
756	2017-03-06	4	2017-03-07	2017-03-09	1143	6	2
757	2017-03-06	4	2017-03-08	2017-03-09	1336	7	2
758	2017-03-06	4	2017-03-08	2017-03-07	953	9	3
759	2017-03-07	4	2017-03-09	2017-03-08	284	7	2
760	2017-03-07	4	2017-03-10	2017-03-10	1104	6	2
761	2017-03-07	4	2017-03-08	2017-03-10	1291	7	2
762	2017-03-08	4	2017-03-09	2017-03-09	572	6	2
763	2017-03-08	4	2017-03-10	2017-03-09	842	9	3
764	2017-03-09	4	2017-03-10	2017-03-12	701	2	1
765	2017-03-09	4	2017-03-11	2017-03-12	1152	2	1
766	2017-03-09	4	2017-03-11	2017-03-12	141	6	2
767	2017-03-09	4	2017-03-10	2017-03-11	564	7	2
768	2017-03-09	4	2017-03-12	2017-03-10	841	7	2
769	2017-03-09	4	2017-03-11	2017-03-11	946	6	2
770	2017-03-09	4	2017-03-11	2017-03-11	135	9	3
771	2017-03-11	4	2017-03-14	2017-03-12	671	3	1
772	2017-03-11	4	2017-03-12	2017-03-13	448	7	2
773	2017-03-11	4	2017-03-12	2017-03-12	1385	6	2
774	2017-03-12	4	2017-03-14	2017-03-14	690	6	2
775	2017-03-12	4	2017-03-13	2017-03-13	968	6	2
776	2017-03-13	4	2017-03-15	2017-03-16	490	6	2
777	2017-03-13	4	2017-03-16	2017-03-16	496	6	2
778	2017-03-15	3	2017-03-15	\N	56	9	3
779	2017-03-15	4	2017-03-16	2017-03-18	367	6	2
780	2017-03-15	4	2017-03-17	2017-03-17	592	6	2
781	2017-03-15	4	2017-03-16	2017-03-17	1018	6	2
782	2017-03-15	4	2017-03-16	2017-03-18	1298	7	2
783	2017-03-16	4	2017-03-19	2017-03-17	1343	2	1
784	2017-03-16	4	2017-03-19	2017-03-19	430	7	2
785	2017-03-18	4	2017-03-19	2017-03-20	794	2	1
786	2017-03-18	4	2017-03-20	2017-03-19	249	6	2
787	2017-03-18	4	2017-03-20	2017-03-19	700	9	3
788	2017-03-18	4	2017-03-20	2017-03-20	1363	9	3
789	2017-03-19	4	2017-03-20	2017-03-20	772	6	2
790	2017-03-19	4	2017-03-21	2017-03-22	1015	7	2
791	2017-03-20	4	2017-03-22	2017-03-23	432	6	2
792	2017-03-22	4	2017-03-23	2017-03-24	479	6	2
793	2017-03-23	4	2017-03-24	2017-03-24	653	6	2
794	2017-03-23	4	2017-03-25	2017-03-24	863	7	2
795	2017-03-23	4	2017-03-25	2017-03-26	992	7	2
796	2017-03-23	4	2017-03-26	2017-03-25	154	9	3
797	2017-03-24	4	2017-03-26	2017-03-26	374	7	2
798	2017-03-26	4	2017-03-28	2017-03-29	619	3	1
799	2017-03-27	4	2017-03-28	2017-03-29	607	3	1
800	2017-03-27	4	2017-03-29	2017-03-28	1057	6	2
801	2017-03-28	4	2017-03-29	2017-03-30	78	2	1
802	2017-03-28	4	2017-03-29	2017-03-30	340	6	2
803	2017-03-28	4	2017-03-31	2017-03-30	1105	8	3
804	2017-03-29	4	2017-03-31	2017-03-30	95	6	2
805	2017-03-29	4	2017-03-30	2017-04-01	420	6	2
806	2017-03-30	4	2017-03-31	2017-03-31	234	7	2
807	2017-03-30	4	2017-04-01	2017-04-02	1148	6	2
808	2017-03-31	4	2017-04-02	2017-04-02	315	6	2
809	2017-03-31	4	2017-04-03	2017-04-03	1222	7	2
810	2017-04-01	3	2017-04-01	\N	153	8	3
811	2017-04-01	4	2017-04-04	2017-04-04	524	7	2
812	2017-04-01	4	2017-04-02	2017-04-03	1164	7	2
813	2017-04-01	4	2017-04-03	2017-04-02	1203	9	3
814	2017-04-02	4	2017-04-05	2017-04-03	629	7	2
815	2017-04-03	4	2017-04-05	2017-04-04	1251	3	1
816	2017-04-03	4	2017-04-05	2017-04-05	811	6	2
817	2017-04-04	4	2017-04-05	2017-04-07	301	7	2
818	2017-04-04	4	2017-04-07	2017-04-07	1319	6	2
819	2017-04-04	4	2017-04-07	2017-04-05	221	9	3
820	2017-04-05	4	2017-04-08	2017-04-07	725	7	2
821	2017-04-05	4	2017-04-07	2017-04-08	1181	7	2
822	2017-04-06	4	2017-04-08	2017-04-09	294	7	2
823	2017-04-06	4	2017-04-07	2017-04-08	415	8	3
824	2017-04-07	4	2017-04-09	2017-04-10	993	2	1
825	2017-04-07	4	2017-04-08	2017-04-09	10	7	2
826	2017-04-07	4	2017-04-10	2017-04-10	45	6	2
827	2017-04-07	4	2017-04-10	2017-04-10	666	7	2
828	2017-04-09	4	2017-04-10	2017-04-12	246	6	2
829	2017-04-09	4	2017-04-10	2017-04-10	674	7	2
830	2017-04-11	4	2017-04-14	2017-04-12	431	6	2
831	2017-04-11	4	2017-04-12	2017-04-12	1000	7	2
832	2017-04-11	4	2017-04-12	2017-04-12	1215	7	2
833	2017-04-12	4	2017-04-14	2017-04-15	406	7	2
834	2017-04-12	4	2017-04-13	2017-04-15	890	6	2
835	2017-04-13	4	2017-04-15	2017-04-14	940	2	1
836	2017-04-13	4	2017-04-16	2017-04-14	455	6	2
837	2017-04-13	4	2017-04-16	2017-04-14	948	7	2
838	2017-04-14	4	2017-04-17	2017-04-15	1395	7	2
839	2017-04-15	4	2017-04-18	2017-04-16	1332	3	1
840	2017-04-15	4	2017-04-16	2017-04-16	372	6	2
841	2017-04-15	4	2017-04-18	2017-04-17	428	7	2
842	2017-04-15	4	2017-04-18	2017-04-16	1133	6	2
843	2017-04-16	4	2017-04-17	2017-04-19	1059	7	2
844	2017-04-16	4	2017-04-17	2017-04-18	1436	6	2
845	2017-04-17	4	2017-04-18	2017-04-18	662	7	2
846	2017-04-17	4	2017-04-19	2017-04-19	715	6	2
847	2017-04-18	4	2017-04-19	2017-04-19	329	7	2
848	2017-04-18	4	2017-04-20	2017-04-20	597	7	2
849	2017-04-19	4	2017-04-20	2017-04-21	776	2	1
850	2017-04-19	4	2017-04-22	2017-04-22	1346	3	1
851	2017-04-20	4	2017-04-21	2017-04-22	1139	6	2
852	2017-04-21	4	2017-04-23	2017-04-22	13	9	3
853	2017-04-21	4	2017-04-24	2017-04-24	883	8	3
854	2017-04-22	4	2017-04-25	2017-04-23	177	6	2
855	2017-04-22	4	2017-04-23	2017-04-25	775	6	2
856	2017-04-23	4	2017-04-25	2017-04-26	477	6	2
857	2017-04-24	4	2017-04-25	2017-04-26	1402	7	2
858	2017-04-25	4	2017-04-27	2017-04-28	162	6	2
859	2017-04-25	4	2017-04-26	2017-04-26	644	6	2
860	2017-04-27	4	2017-04-29	2017-04-28	473	7	2
861	2017-04-27	4	2017-04-29	2017-04-30	1177	7	2
862	2017-04-27	4	2017-04-30	2017-04-29	1230	8	3
863	2017-04-28	4	2017-04-30	2017-05-01	446	7	2
864	2017-04-28	4	2017-04-30	2017-04-29	902	6	2
865	2017-04-29	4	2017-05-02	2017-05-01	974	6	2
866	2017-04-29	4	2017-04-30	2017-05-01	1410	6	2
867	2017-05-01	4	2017-05-03	2017-05-02	97	3	1
868	2017-05-01	4	2017-05-04	2017-05-02	868	3	1
869	2017-05-01	4	2017-05-04	2017-05-02	844	7	2
870	2017-05-01	4	2017-05-04	2017-05-02	1416	6	2
871	2017-05-02	4	2017-05-04	2017-05-03	358	7	2
872	2017-05-03	4	2017-05-06	2017-05-06	394	3	1
873	2017-05-03	4	2017-05-05	2017-05-05	829	7	2
874	2017-05-04	4	2017-05-05	2017-05-06	661	7	2
875	2017-05-05	4	2017-05-06	2017-05-08	386	3	1
876	2017-05-05	4	2017-05-08	2017-05-06	1046	7	2
877	2017-05-06	4	2017-05-07	2017-05-08	784	6	2
878	2017-05-07	4	2017-05-10	2017-05-09	224	3	1
879	2017-05-08	4	2017-05-09	2017-05-09	214	7	2
880	2017-05-08	4	2017-05-11	2017-05-10	1206	6	2
881	2017-05-08	4	2017-05-11	2017-05-11	1024	9	3
882	2017-05-09	4	2017-05-12	2017-05-10	196	6	2
883	2017-05-11	4	2017-05-13	2017-05-14	507	6	2
884	2017-05-11	4	2017-05-13	2017-05-12	871	7	2
885	2017-05-13	3	2017-05-13	\N	66	8	3
886	2017-05-13	4	2017-05-14	2017-05-15	1396	2	1
887	2017-05-13	4	2017-05-15	2017-05-15	1195	6	2
888	2017-05-14	4	2017-05-16	2017-05-16	1038	7	2
889	2017-05-14	4	2017-05-17	2017-05-15	830	8	3
890	2017-05-15	4	2017-05-18	2017-05-18	171	6	2
891	2017-05-15	4	2017-05-18	2017-05-16	384	6	2
892	2017-05-15	4	2017-05-18	2017-05-17	651	7	2
893	2017-05-16	4	2017-05-19	2017-05-19	1293	7	2
894	2017-05-16	4	2017-05-19	2017-05-19	1320	6	2
895	2017-05-18	4	2017-05-21	2017-05-19	857	6	2
896	2017-05-19	4	2017-05-22	2017-05-21	376	9	3
897	2017-05-20	4	2017-05-21	2017-05-21	47	2	1
898	2017-05-20	4	2017-05-21	2017-05-22	352	6	2
899	2017-05-20	4	2017-05-21	2017-05-21	605	7	2
900	2017-05-20	4	2017-05-21	2017-05-22	971	6	2
901	2017-05-21	4	2017-05-22	2017-05-24	345	7	2
902	2017-05-21	4	2017-05-24	2017-05-22	1278	6	2
903	2017-05-22	4	2017-05-23	2017-05-24	179	7	2
904	2017-05-23	4	2017-05-26	2017-05-24	1020	2	1
905	2017-05-23	4	2017-05-26	2017-05-24	609	6	2
906	2017-05-23	4	2017-05-26	2017-05-26	877	7	2
907	2017-05-24	4	2017-05-26	2017-05-27	120	2	1
908	2017-05-25	4	2017-05-28	2017-05-27	402	7	2
909	2017-05-26	4	2017-05-27	2017-05-28	188	2	1
910	2017-05-26	4	2017-05-28	2017-05-28	342	7	2
911	2017-05-26	4	2017-05-29	2017-05-29	887	6	2
912	2017-05-27	4	2017-05-29	2017-05-29	519	2	1
913	2017-05-27	4	2017-05-29	2017-05-29	699	6	2
914	2017-05-28	4	2017-05-31	2017-05-31	1068	2	1
915	2017-05-28	4	2017-05-30	2017-05-30	215	6	2
916	2017-05-28	4	2017-05-29	2017-05-29	718	6	2
917	2017-05-29	4	2017-05-31	2017-06-01	881	2	1
918	2017-05-30	4	2017-05-31	2017-05-31	242	3	1
919	2017-05-30	4	2017-05-31	2017-05-31	781	7	2
920	2017-05-30	4	2017-06-01	2017-06-02	966	7	2
921	2017-05-31	4	2017-06-02	2017-06-02	628	6	2
922	2017-05-31	4	2017-06-01	2017-06-03	656	6	2
923	2017-05-31	4	2017-06-03	2017-06-02	769	7	2
924	2017-06-02	3	2017-06-02	\N	68	8	3
925	2017-06-02	4	2017-06-05	2017-06-03	1316	7	2
926	2017-06-03	4	2017-06-05	2017-06-06	233	2	1
927	2017-06-03	4	2017-06-05	2017-06-06	1438	2	1
928	2017-06-05	4	2017-06-06	2017-06-06	957	3	1
929	2017-06-05	4	2017-06-06	2017-06-08	472	6	2
930	2017-06-05	4	2017-06-06	2017-06-06	1224	9	3
931	2017-06-07	4	2017-06-08	2017-06-08	631	6	2
932	2017-06-07	4	2017-06-08	2017-06-09	804	6	2
933	2017-06-07	4	2017-06-10	2017-06-08	909	6	2
934	2017-06-09	4	2017-06-10	2017-06-12	93	7	2
935	2017-06-10	3	2017-06-10	\N	43	8	3
936	2017-06-10	4	2017-06-13	2017-06-12	265	6	2
937	2017-06-11	4	2017-06-14	2017-06-13	73	7	2
938	2017-06-11	4	2017-06-12	2017-06-12	129	6	2
939	2017-06-11	4	2017-06-12	2017-06-14	1407	6	2
940	2017-06-12	4	2017-06-14	2017-06-13	585	2	1
941	2017-06-12	4	2017-06-14	2017-06-14	736	2	1
942	2017-06-13	4	2017-06-16	2017-06-15	537	6	2
943	2017-06-13	4	2017-06-15	2017-06-15	1025	6	2
944	2017-06-14	4	2017-06-15	2017-06-17	138	3	1
945	2017-06-14	4	2017-06-15	2017-06-16	167	7	2
946	2017-06-14	4	2017-06-16	2017-06-15	525	6	2
947	2017-06-15	4	2017-06-18	2017-06-17	278	3	1
948	2017-06-15	4	2017-06-17	2017-06-17	618	6	2
949	2017-06-16	4	2017-06-18	2017-06-17	867	3	1
950	2017-06-16	4	2017-06-19	2017-06-18	142	6	2
951	2017-06-16	4	2017-06-19	2017-06-19	339	7	2
952	2017-06-16	4	2017-06-18	2017-06-18	355	7	2
953	2017-06-16	4	2017-06-18	2017-06-17	658	7	2
954	2017-06-17	4	2017-06-20	2017-06-20	611	6	2
955	2017-06-17	4	2017-06-19	2017-06-18	880	6	2
956	2017-06-17	4	2017-06-19	2017-06-20	1184	6	2
957	2017-06-17	4	2017-06-20	2017-06-20	722	9	3
958	2017-06-18	4	2017-06-20	2017-06-19	1276	2	1
959	2017-06-18	4	2017-06-21	2017-06-21	650	7	2
960	2017-06-18	4	2017-06-19	2017-06-19	1390	7	2
961	2017-06-19	4	2017-06-21	2017-06-22	82	2	1
962	2017-06-19	4	2017-06-22	2017-06-20	570	7	2
963	2017-06-19	4	2017-06-21	2017-06-21	1432	6	2
964	2017-06-20	4	2017-06-22	2017-06-22	404	7	2
965	2017-06-20	4	2017-06-22	2017-06-23	457	6	2
966	2017-06-20	4	2017-06-22	2017-06-22	389	8	3
967	2017-06-21	4	2017-06-24	2017-06-24	1323	6	2
968	2017-06-21	4	2017-06-23	2017-06-23	1403	6	2
969	2017-06-21	4	2017-06-24	2017-06-22	248	9	3
970	2017-06-22	4	2017-06-25	2017-06-23	836	7	2
971	2017-06-22	4	2017-06-23	2017-06-24	1426	8	3
972	2017-06-23	4	2017-06-24	2017-06-25	270	7	2
973	2017-06-24	4	2017-06-27	2017-06-27	238	6	2
974	2017-06-24	4	2017-06-27	2017-06-27	511	8	3
975	2017-06-25	4	2017-06-27	2017-06-28	1092	6	2
976	2017-06-25	4	2017-06-28	2017-06-27	1266	9	3
977	2017-06-26	4	2017-06-28	2017-06-27	400	7	2
978	2017-06-26	4	2017-06-28	2017-06-27	1123	6	2
979	2017-06-26	4	2017-06-29	2017-06-27	1190	6	2
980	2017-06-26	4	2017-06-28	2017-06-27	328	9	3
981	2017-06-26	4	2017-06-29	2017-06-28	687	8	3
982	2017-06-26	4	2017-06-29	2017-06-28	1423	9	3
983	2017-06-27	4	2017-06-28	2017-06-29	1158	6	2
984	2017-06-27	4	2017-06-28	2017-06-29	1287	7	2
985	2017-06-30	4	2017-07-02	2017-07-01	461	6	2
986	2017-06-30	4	2017-07-03	2017-07-01	556	7	2
987	2017-07-02	4	2017-07-04	2017-07-04	172	2	1
988	2017-07-02	4	2017-07-04	2017-07-05	436	6	2
989	2017-07-02	4	2017-07-04	2017-07-03	1145	6	2
990	2017-07-04	4	2017-07-07	2017-07-07	706	7	2
991	2017-07-06	4	2017-07-07	2017-07-09	751	2	1
992	2017-07-07	4	2017-07-10	2017-07-09	723	7	2
993	2017-07-09	4	2017-07-11	2017-07-11	1415	3	1
994	2017-07-09	4	2017-07-11	2017-07-11	419	7	2
995	2017-07-11	4	2017-07-13	2017-07-14	621	2	1
996	2017-07-11	4	2017-07-12	2017-07-12	915	2	1
997	2017-07-11	4	2017-07-13	2017-07-14	485	7	2
998	2017-07-12	4	2017-07-13	2017-07-14	219	7	2
999	2017-07-12	4	2017-07-13	2017-07-14	590	6	2
1000	2017-07-12	4	2017-07-14	2017-07-15	645	7	2
1001	2017-07-13	4	2017-07-16	2017-07-15	354	6	2
1002	2017-07-14	4	2017-07-16	2017-07-16	1418	3	1
1003	2017-07-14	4	2017-07-16	2017-07-16	503	7	2
1004	2017-07-14	4	2017-07-17	2017-07-16	1389	6	2
1005	2017-07-15	4	2017-07-17	2017-07-16	266	7	2
1006	2017-07-15	4	2017-07-18	2017-07-17	1070	7	2
1007	2017-07-16	4	2017-07-17	2017-07-17	1115	6	2
1008	2017-07-16	4	2017-07-18	2017-07-18	1345	6	2
1009	2017-07-16	4	2017-07-19	2017-07-19	1064	8	3
1010	2017-07-18	3	2017-07-18	\N	8	7	2
1011	2017-07-18	4	2017-07-21	2017-07-21	495	3	1
1012	2017-07-18	4	2017-07-20	2017-07-20	620	7	2
1013	2017-07-19	4	2017-07-22	2017-07-21	174	6	2
1014	2017-07-19	4	2017-07-21	2017-07-21	748	6	2
1015	2017-07-19	4	2017-07-22	2017-07-21	799	7	2
1016	2017-07-19	4	2017-07-20	2017-07-21	1417	9	3
1017	2017-07-20	4	2017-07-21	2017-07-23	168	6	2
1018	2017-07-22	4	2017-07-23	2017-07-23	290	6	2
1019	2017-07-22	4	2017-07-23	2017-07-24	408	7	2
1020	2017-07-23	3	2017-07-23	\N	16	6	2
1021	2017-07-23	4	2017-07-24	2017-07-26	125	6	2
1022	2017-07-23	4	2017-07-26	2017-07-24	353	7	2
1023	2017-07-23	4	2017-07-26	2017-07-25	356	6	2
1024	2017-07-23	4	2017-07-25	2017-07-26	837	7	2
1025	2017-07-23	4	2017-07-26	2017-07-26	1304	6	2
1026	2017-07-26	4	2017-07-28	2017-07-29	1370	2	1
1027	2017-07-26	4	2017-07-28	2017-07-28	588	6	2
1028	2017-07-27	4	2017-07-28	2017-07-30	1273	7	2
1029	2017-07-29	4	2017-07-30	2017-08-01	407	3	1
1030	2017-07-29	4	2017-07-30	2017-07-31	161	6	2
1031	2017-07-30	4	2017-08-01	2017-08-02	1308	2	1
1032	2017-07-30	4	2017-08-02	2017-08-01	429	6	2
1033	2017-07-30	4	2017-07-31	2017-08-02	582	7	2
1034	2017-07-30	4	2017-07-31	2017-07-31	895	7	2
1035	2017-07-30	4	2017-08-02	2017-08-02	1283	6	2
1036	2017-07-30	4	2017-08-01	2017-07-31	1442	6	2
1037	2017-07-31	4	2017-08-02	2017-08-03	1229	6	2
1038	2017-07-31	4	2017-08-01	2017-08-03	1281	7	2
1039	2017-08-02	4	2017-08-04	2017-08-03	1077	7	2
1040	2017-08-04	4	2017-08-07	2017-08-05	1225	2	1
1041	2017-08-04	4	2017-08-06	2017-08-05	70	7	2
1042	2017-08-06	4	2017-08-07	2017-08-07	539	7	2
1043	2017-08-06	4	2017-08-09	2017-08-08	1235	6	2
1044	2017-08-07	4	2017-08-10	2017-08-08	1270	7	2
1045	2017-08-07	4	2017-08-09	2017-08-10	185	9	3
1046	2017-08-07	4	2017-08-09	2017-08-08	1134	8	3
1047	2017-08-08	3	2017-08-08	\N	116	8	3
1048	2017-08-08	4	2017-08-10	2017-08-09	777	7	2
1049	2017-08-09	4	2017-08-11	2017-08-10	194	2	1
1050	2017-08-09	4	2017-08-12	2017-08-12	239	3	1
1051	2017-08-10	4	2017-08-11	2017-08-11	209	7	2
1052	2017-08-10	4	2017-08-12	2017-08-13	460	6	2
1053	2017-08-10	4	2017-08-11	2017-08-12	1439	6	2
1054	2017-08-11	4	2017-08-12	2017-08-12	189	7	2
1055	2017-08-12	4	2017-08-15	2017-08-15	140	6	2
1056	2017-08-12	4	2017-08-15	2017-08-13	325	7	2
1057	2017-08-12	4	2017-08-15	2017-08-13	456	7	2
1058	2017-08-13	4	2017-08-16	2017-08-14	782	6	2
1059	2017-08-14	4	2017-08-17	2017-08-17	6	7	2
1060	2017-08-15	4	2017-08-18	2017-08-17	182	6	2
1061	2017-08-15	4	2017-08-18	2017-08-18	655	7	2
1062	2017-08-15	4	2017-08-17	2017-08-18	1210	6	2
1063	2017-08-16	4	2017-08-19	2017-08-19	198	8	3
1064	2017-08-16	4	2017-08-18	2017-08-19	898	9	3
1065	2017-08-17	4	2017-08-19	2017-08-19	25	7	2
1066	2017-08-17	4	2017-08-20	2017-08-19	106	7	2
1067	2017-08-17	4	2017-08-19	2017-08-19	225	7	2
1068	2017-08-17	4	2017-08-20	2017-08-19	453	7	2
1069	2017-08-17	4	2017-08-19	2017-08-18	493	6	2
1070	2017-08-17	4	2017-08-20	2017-08-18	596	7	2
1071	2017-08-17	4	2017-08-20	2017-08-18	602	8	3
1072	2017-08-18	3	2017-08-18	\N	47	3	1
1073	2017-08-18	4	2017-08-19	2017-08-21	911	7	2
1074	2017-08-19	3	2017-08-19	\N	11	6	2
1075	2017-08-19	4	2017-08-21	2017-08-22	1003	3	1
1076	2017-08-19	4	2017-08-22	2017-08-22	42	6	2
1077	2017-08-19	4	2017-08-20	2017-08-21	412	6	2
1078	2017-08-19	4	2017-08-21	2017-08-20	793	6	2
1079	2017-08-19	4	2017-08-20	2017-08-20	812	7	2
1080	2017-08-19	4	2017-08-20	2017-08-20	1086	7	2
1081	2017-08-19	4	2017-08-22	2017-08-22	1106	6	2
1082	2017-08-20	4	2017-08-22	2017-08-21	1327	6	2
1083	2017-08-20	4	2017-08-23	2017-08-23	1372	6	2
1084	2017-08-21	4	2017-08-24	2017-08-23	2	2	1
1085	2017-08-21	4	2017-08-23	2017-08-23	305	3	1
1086	2017-08-21	4	2017-08-23	2017-08-24	220	7	2
1087	2017-08-22	4	2017-08-23	2017-08-25	675	8	3
1088	2017-08-22	4	2017-08-23	2017-08-23	1160	8	3
1089	2017-08-23	3	2017-08-23	\N	46	2	1
1090	2017-08-24	4	2017-08-26	2017-08-26	1427	2	1
1091	2017-08-24	4	2017-08-25	2017-08-25	1260	7	2
1092	2017-08-25	4	2017-08-28	2017-08-27	40	2	1
1093	2017-08-25	4	2017-08-28	2017-08-26	326	3	1
1094	2017-08-25	4	2017-08-27	2017-08-28	828	6	2
1095	2017-08-26	4	2017-08-28	2017-08-27	1382	9	3
1096	2017-08-27	4	2017-08-29	2017-08-29	589	2	1
1097	2017-08-27	4	2017-08-30	2017-08-28	1311	6	2
1098	2017-08-28	4	2017-08-30	2017-08-30	752	2	1
1099	2017-08-28	4	2017-08-29	2017-08-30	1128	6	2
1100	2017-08-28	4	2017-08-29	2017-08-29	1392	7	2
1101	2017-08-29	4	2017-08-30	2017-08-30	379	7	2
1102	2017-08-29	4	2017-08-31	2017-08-31	1317	6	2
1103	2017-08-31	4	2017-09-02	2017-09-02	1394	7	2
1104	2017-09-01	4	2017-09-04	2017-09-03	268	6	2
1105	2017-09-01	4	2017-09-04	2017-09-03	747	8	3
1106	2017-09-02	4	2017-09-04	2017-09-04	1009	6	2
1107	2017-09-02	4	2017-09-05	2017-09-05	1424	7	2
1108	2017-09-03	4	2017-09-05	2017-09-04	735	3	1
1109	2017-09-03	4	2017-09-04	2017-09-04	23	6	2
1110	2017-09-04	4	2017-09-07	2017-09-07	912	6	2
1111	2017-09-04	4	2017-09-06	2017-09-05	930	6	2
1112	2017-09-05	4	2017-09-08	2017-09-07	798	7	2
1113	2017-09-06	4	2017-09-08	2017-09-07	388	7	2
1114	2017-09-06	4	2017-09-08	2017-09-08	1036	6	2
1115	2017-09-07	4	2017-09-09	2017-09-09	1100	6	2
1116	2017-09-08	4	2017-09-10	2017-09-10	52	7	2
1117	2017-09-08	4	2017-09-10	2017-09-10	334	6	2
1118	2017-09-08	4	2017-09-11	2017-09-11	1023	6	2
1119	2017-09-10	4	2017-09-12	2017-09-13	749	2	1
1120	2017-09-10	4	2017-09-12	2017-09-13	1269	7	2
1121	2017-09-11	4	2017-09-13	2017-09-12	143	7	2
1122	2017-09-12	4	2017-09-14	2017-09-14	1132	6	2
1123	2017-09-13	4	2017-09-14	2017-09-14	598	7	2
1124	2017-09-13	4	2017-09-14	2017-09-16	275	9	3
1125	2017-09-14	4	2017-09-15	2017-09-15	945	7	2
1126	2017-09-14	4	2017-09-16	2017-09-15	1213	8	3
1127	2017-09-15	4	2017-09-16	2017-09-16	494	7	2
1128	2017-09-15	4	2017-09-17	2017-09-16	936	6	2
1129	2017-09-17	4	2017-09-18	2017-09-20	663	6	2
1130	2017-09-18	4	2017-09-20	2017-09-20	69	3	1
1131	2017-09-18	4	2017-09-20	2017-09-19	1178	3	1
1132	2017-09-19	4	2017-09-20	2017-09-20	351	6	2
1133	2017-09-19	4	2017-09-21	2017-09-21	517	7	2
1134	2017-09-19	4	2017-09-22	2017-09-20	978	6	2
1135	2017-09-19	4	2017-09-21	2017-09-20	1347	6	2
1136	2017-09-20	4	2017-09-21	2017-09-21	1050	6	2
1137	2017-09-20	4	2017-09-23	2017-09-23	810	8	3
1138	2017-09-21	4	2017-09-23	2017-09-22	254	2	1
1139	2017-09-21	4	2017-09-22	2017-09-23	1006	2	1
1140	2017-09-21	4	2017-09-22	2017-09-22	1063	8	3
1141	2017-09-22	4	2017-09-23	2017-09-24	1076	2	1
1142	2017-09-23	4	2017-09-26	2017-09-26	554	3	1
1143	2017-09-24	4	2017-09-26	2017-09-27	1087	2	1
1144	2017-09-24	4	2017-09-27	2017-09-27	1414	7	2
1145	2017-09-25	4	2017-09-27	2017-09-26	617	6	2
1146	2017-09-25	4	2017-09-26	2017-09-28	757	7	2
1147	2017-09-25	4	2017-09-26	2017-09-27	1344	6	2
1148	2017-09-25	4	2017-09-26	2017-09-27	1379	7	2
1149	2017-09-27	4	2017-09-30	2017-09-30	787	7	2
1150	2017-09-28	4	2017-10-01	2017-09-30	1183	7	2
1151	2017-09-29	4	2017-09-30	2017-09-30	708	3	1
1152	2017-09-29	4	2017-10-02	2017-10-01	1244	6	2
1153	2017-09-30	4	2017-10-03	2017-10-03	720	7	2
1154	2017-09-30	4	2017-10-03	2017-10-03	789	7	2
1155	2017-09-30	4	2017-10-01	2017-10-01	865	7	2
1156	2017-09-30	4	2017-10-03	2017-10-03	869	7	2
1157	2017-10-01	4	2017-10-03	2017-10-04	24	3	1
1158	2017-10-01	4	2017-10-03	2017-10-02	889	2	1
1159	2017-10-01	4	2017-10-02	2017-10-03	1221	3	1
1160	2017-10-01	4	2017-10-02	2017-10-04	1262	2	1
1161	2017-10-01	4	2017-10-04	2017-10-02	41	7	2
1162	2017-10-01	4	2017-10-03	2017-10-03	888	6	2
1163	2017-10-01	4	2017-10-02	2017-10-02	934	6	2
1164	2017-10-01	4	2017-10-02	2017-10-03	1067	6	2
1165	2017-10-02	4	2017-10-03	2017-10-05	652	7	2
1166	2017-10-03	4	2017-10-04	2017-10-04	286	7	2
1167	2017-10-04	4	2017-10-07	2017-10-06	900	2	1
1168	2017-10-04	4	2017-10-05	2017-10-06	1031	6	2
1169	2017-10-04	4	2017-10-06	2017-10-07	1421	7	2
1170	2017-10-05	4	2017-10-07	2017-10-06	534	6	2
1171	2017-10-05	4	2017-10-06	2017-10-08	826	6	2
1172	2017-10-07	4	2017-10-10	2017-10-09	1339	7	2
1173	2017-10-08	4	2017-10-10	2017-10-09	548	7	2
1174	2017-10-08	4	2017-10-10	2017-10-11	1109	6	2
1175	2017-10-09	4	2017-10-11	2017-10-12	292	6	2
1176	2017-10-10	4	2017-10-13	2017-10-11	1111	9	3
1177	2017-10-12	3	2017-10-12	\N	21	9	3
1178	2017-10-12	4	2017-10-15	2017-10-13	771	6	2
1179	2017-10-12	4	2017-10-15	2017-10-15	1150	9	3
1180	2017-10-13	4	2017-10-16	2017-10-16	1065	3	1
1181	2017-10-13	4	2017-10-16	2017-10-15	1022	7	2
1182	2017-10-13	4	2017-10-14	2017-10-16	1422	7	2
1183	2017-10-14	4	2017-10-17	2017-10-17	216	6	2
1184	2017-10-14	4	2017-10-15	2017-10-16	369	6	2
1185	2017-10-14	4	2017-10-16	2017-10-17	960	6	2
1186	2017-10-14	4	2017-10-16	2017-10-15	1120	6	2
1187	2017-10-15	4	2017-10-18	2017-10-16	486	6	2
1188	2017-10-15	4	2017-10-18	2017-10-17	647	7	2
1189	2017-10-15	4	2017-10-17	2017-10-18	1090	6	2
1190	2017-10-16	4	2017-10-19	2017-10-17	34	6	2
1191	2017-10-17	4	2017-10-18	2017-10-18	186	6	2
1192	2017-10-17	4	2017-10-19	2017-10-18	1114	6	2
1193	2017-10-17	4	2017-10-19	2017-10-19	1412	7	2
1194	2017-10-19	4	2017-10-22	2017-10-22	192	2	1
1195	2017-10-19	4	2017-10-21	2017-10-21	229	7	2
1196	2017-10-19	4	2017-10-21	2017-10-20	508	6	2
1197	2017-10-21	4	2017-10-23	2017-10-23	269	6	2
1198	2017-10-22	4	2017-10-24	2017-10-24	1289	7	2
1199	2017-10-23	4	2017-10-24	2017-10-26	318	2	1
1200	2017-10-23	4	2017-10-25	2017-10-26	48	6	2
1201	2017-10-23	4	2017-10-24	2017-10-24	201	6	2
1202	2017-10-24	4	2017-10-25	2017-10-25	593	6	2
1203	2017-10-25	4	2017-10-27	2017-10-26	1191	7	2
1204	2017-10-25	4	2017-10-28	2017-10-28	1277	6	2
1205	2017-10-26	4	2017-10-28	2017-10-28	1091	2	1
1206	2017-10-26	4	2017-10-29	2017-10-29	222	6	2
1207	2017-10-26	4	2017-10-28	2017-10-27	1002	6	2
1208	2017-10-26	4	2017-10-28	2017-10-27	1226	7	2
1209	2017-10-26	4	2017-10-27	2017-10-29	1342	7	2
1210	2017-10-26	4	2017-10-27	2017-10-29	730	8	3
1211	2017-10-27	4	2017-10-28	2017-10-29	19	7	2
1212	2017-10-27	4	2017-10-30	2017-10-29	213	6	2
1213	2017-10-27	4	2017-10-29	2017-10-29	669	9	3
1214	2017-10-28	4	2017-10-29	2017-10-29	783	6	2
1215	2017-10-28	4	2017-10-31	2017-10-30	807	7	2
1216	2017-10-28	4	2017-10-30	2017-10-29	886	7	2
1217	2017-10-28	4	2017-10-31	2017-10-30	1155	7	2
1218	2017-10-30	4	2017-11-01	2017-10-31	1017	2	1
1219	2017-10-30	4	2017-11-02	2017-11-02	840	7	2
1220	2017-10-31	4	2017-11-03	2017-11-03	803	6	2
1221	2017-10-31	4	2017-11-02	2017-11-01	1290	7	2
1222	2017-11-01	4	2017-11-04	2017-11-03	482	9	3
1223	2017-11-02	4	2017-11-03	2017-11-03	1207	6	2
1224	2017-11-03	4	2017-11-04	2017-11-04	544	6	2
1225	2017-11-04	4	2017-11-05	2017-11-07	768	2	1
1226	2017-11-04	4	2017-11-07	2017-11-06	226	7	2
1227	2017-11-04	4	2017-11-07	2017-11-06	702	6	2
1228	2017-11-04	4	2017-11-06	2017-11-06	1041	6	2
1229	2017-11-05	4	2017-11-08	2017-11-06	89	3	1
1230	2017-11-05	4	2017-11-06	2017-11-07	1107	6	2
1231	2017-11-05	4	2017-11-07	2017-11-06	1180	6	2
1232	2017-11-06	4	2017-11-07	2017-11-09	665	3	1
1233	2017-11-06	4	2017-11-07	2017-11-08	462	6	2
1234	2017-11-07	3	2017-11-07	\N	19	6	2
1235	2017-11-07	4	2017-11-08	2017-11-09	210	6	2
1236	2017-11-08	4	2017-11-11	2017-11-09	243	7	2
1237	2017-11-09	4	2017-11-12	2017-11-11	571	2	1
1238	2017-11-09	4	2017-11-10	2017-11-11	998	6	2
1239	2017-11-09	4	2017-11-10	2017-11-11	1197	7	2
1240	2017-11-10	4	2017-11-11	2017-11-11	903	7	2
1241	2017-11-10	4	2017-11-12	2017-11-11	1170	7	2
1242	2017-11-11	4	2017-11-12	2017-11-12	303	6	2
1243	2017-11-11	4	2017-11-13	2017-11-14	346	6	2
1244	2017-11-12	4	2017-11-14	2017-11-13	333	6	2
1245	2017-11-13	4	2017-11-16	2017-11-14	1166	7	2
1246	2017-11-13	4	2017-11-16	2017-11-16	1329	7	2
1247	2017-11-16	4	2017-11-18	2017-11-17	426	2	1
1248	2017-11-16	4	2017-11-17	2017-11-18	1367	3	1
1249	2017-11-17	4	2017-11-18	2017-11-20	545	6	2
1250	2017-11-17	4	2017-11-19	2017-11-18	1188	6	2
1251	2017-11-17	4	2017-11-19	2017-11-19	289	9	3
1252	2017-11-18	4	2017-11-20	2017-11-21	110	3	1
1253	2017-11-18	4	2017-11-21	2017-11-21	44	6	2
1254	2017-11-18	4	2017-11-19	2017-11-19	1098	7	2
1255	2017-11-19	4	2017-11-20	2017-11-21	375	6	2
1256	2017-11-19	4	2017-11-20	2017-11-22	458	6	2
1257	2017-11-19	4	2017-11-22	2017-11-20	1136	7	2
1258	2017-11-20	4	2017-11-21	2017-11-22	1099	7	2
1259	2017-11-21	3	2017-11-21	\N	4	7	2
1260	2017-11-22	4	2017-11-23	2017-11-24	1117	6	2
1261	2017-11-23	4	2017-11-25	2017-11-24	435	7	2
1262	2017-11-23	4	2017-11-26	2017-11-26	509	6	2
1263	2017-11-23	4	2017-11-26	2017-11-26	1408	6	2
1264	2017-11-24	4	2017-11-27	2017-11-25	113	6	2
1265	2017-11-24	4	2017-11-27	2017-11-27	950	7	2
1266	2017-11-25	4	2017-11-28	2017-11-27	387	6	2
1267	2017-11-25	4	2017-11-26	2017-11-26	467	6	2
1268	2017-11-26	4	2017-11-28	2017-11-29	774	3	1
1269	2017-11-26	4	2017-11-29	2017-11-29	1236	6	2
1270	2017-11-26	4	2017-11-29	2017-11-29	1388	6	2
1271	2017-11-27	4	2017-11-30	2017-11-30	734	6	2
1272	2017-11-27	4	2017-11-29	2017-11-30	935	6	2
1273	2017-11-27	4	2017-11-29	2017-11-29	1268	6	2
1274	2017-11-28	4	2017-11-29	2017-12-01	1364	7	2
1275	2017-11-29	4	2017-12-01	2017-11-30	165	2	1
1276	2017-11-30	4	2017-12-03	2017-12-02	893	6	2
1277	2017-12-01	4	2017-12-04	2017-12-02	227	6	2
1278	2017-12-01	4	2017-12-02	2017-12-04	980	7	2
1279	2017-12-01	4	2017-12-04	2017-12-03	1014	6	2
1280	2017-12-01	4	2017-12-03	2017-12-03	123	9	3
1281	2017-12-02	4	2017-12-05	2017-12-05	1060	6	2
1282	2017-12-03	4	2017-12-05	2017-12-05	320	6	2
1283	2017-12-04	4	2017-12-07	2017-12-07	85	7	2
1284	2017-12-04	4	2017-12-06	2017-12-07	128	7	2
1285	2017-12-04	4	2017-12-07	2017-12-07	262	7	2
1286	2017-12-04	4	2017-12-07	2017-12-06	1033	7	2
1287	2017-12-07	4	2017-12-10	2017-12-09	279	3	1
1288	2017-12-07	4	2017-12-10	2017-12-09	778	9	3
1289	2017-12-08	4	2017-12-11	2017-12-10	1292	3	1
1290	2017-12-08	4	2017-12-10	2017-12-10	967	6	2
1291	2017-12-09	4	2017-12-11	2017-12-12	1284	6	2
1292	2017-12-10	4	2017-12-13	2017-12-11	285	6	2
1293	2017-12-10	4	2017-12-12	2017-12-11	1401	7	2
1294	2017-12-11	4	2017-12-13	2017-12-14	947	2	1
1295	2017-12-11	4	2017-12-12	2017-12-14	37	7	2
1296	2017-12-14	4	2017-12-17	2017-12-15	231	3	1
1297	2017-12-14	4	2017-12-17	2017-12-16	108	6	2
1298	2017-12-14	4	2017-12-17	2017-12-16	533	9	3
1299	2017-12-15	4	2017-12-18	2017-12-16	1216	2	1
1300	2017-12-15	4	2017-12-17	2017-12-17	824	6	2
1301	2017-12-16	4	2017-12-19	2017-12-19	1088	3	1
1302	2017-12-16	4	2017-12-18	2017-12-19	322	7	2
1303	2017-12-16	4	2017-12-19	2017-12-18	878	7	2
1304	2017-12-16	4	2017-12-17	2017-12-17	1409	6	2
1305	2017-12-17	4	2017-12-19	2017-12-18	257	7	2
1306	2017-12-20	4	2017-12-21	2017-12-22	28	6	2
1307	2017-12-22	4	2017-12-23	2017-12-25	1384	2	1
1308	2017-12-22	4	2017-12-24	2017-12-24	713	7	2
1309	2017-12-22	4	2017-12-25	2017-12-24	821	6	2
1310	2017-12-24	4	2017-12-25	2017-12-26	444	3	1
1311	2017-12-24	4	2017-12-26	2017-12-27	1021	6	2
1312	2017-12-25	4	2017-12-28	2017-12-26	311	3	1
1313	2017-12-25	4	2017-12-27	2017-12-27	1294	3	1
1314	2017-12-25	4	2017-12-26	2017-12-28	1027	7	2
1315	2017-12-25	4	2017-12-27	2017-12-28	931	9	3
1316	2017-12-26	4	2017-12-29	2017-12-27	846	3	1
1317	2017-12-27	4	2017-12-28	2017-12-29	418	3	1
1318	2017-12-27	4	2017-12-30	2017-12-29	75	6	2
1319	2017-12-27	4	2017-12-30	2017-12-30	604	6	2
1320	2017-12-28	4	2017-12-30	2017-12-29	244	3	1
1321	2017-12-30	4	2017-12-31	2017-12-31	217	3	1
1322	2017-12-31	4	2018-01-03	2018-01-02	39	7	2
1323	2017-12-31	4	2018-01-01	2018-01-01	273	6	2
1324	2018-01-01	4	2018-01-04	2018-01-03	862	6	2
1325	2018-01-01	4	2018-01-02	2018-01-03	68	8	3
1326	2018-01-01	4	2018-01-03	2018-01-02	567	9	3
1327	2018-01-02	4	2018-01-03	2018-01-05	1026	6	2
1328	2018-01-02	4	2018-01-03	2018-01-03	1083	6	2
1329	2018-01-04	4	2018-01-05	2018-01-06	443	3	1
1330	2018-01-04	4	2018-01-05	2018-01-07	761	7	2
1331	2018-01-05	4	2018-01-06	2018-01-08	1122	6	2
1332	2018-01-06	4	2018-01-07	2018-01-09	256	7	2
1333	2018-01-06	4	2018-01-07	2018-01-07	203	8	3
1334	2018-01-07	4	2018-01-09	2018-01-10	425	6	2
1335	2018-01-07	4	2018-01-08	2018-01-08	955	7	2
1336	2018-01-09	4	2018-01-10	2018-01-12	904	2	1
1337	2018-01-09	4	2018-01-12	2018-01-12	970	7	2
1338	2018-01-10	4	2018-01-11	2018-01-13	905	6	2
1339	2018-01-11	4	2018-01-14	2018-01-13	580	3	1
1340	2018-01-12	4	2018-01-13	2018-01-13	1066	3	1
1341	2018-01-12	4	2018-01-13	2018-01-14	1258	7	2
1342	2018-01-12	4	2018-01-13	2018-01-15	1393	7	2
1343	2018-01-13	4	2018-01-15	2018-01-14	594	6	2
1344	2018-01-13	4	2018-01-16	2018-01-15	916	6	2
1345	2018-01-14	4	2018-01-15	2018-01-15	1037	6	2
1346	2018-01-14	4	2018-01-15	2018-01-15	136	8	3
1347	2018-01-15	4	2018-01-18	2018-01-18	247	2	1
1348	2018-01-15	4	2018-01-17	2018-01-17	1214	2	1
1349	2018-01-15	4	2018-01-17	2018-01-16	464	6	2
1350	2018-01-15	4	2018-01-18	2018-01-17	637	7	2
1351	2018-01-16	4	2018-01-19	2018-01-19	1016	7	2
1352	2018-01-16	4	2018-01-18	2018-01-18	1433	6	2
1353	2018-01-17	4	2018-01-19	2018-01-18	502	6	2
1354	2018-01-19	4	2018-01-20	2018-01-21	476	3	1
1355	2018-01-19	4	2018-01-21	2018-01-20	1010	7	2
1356	2018-01-19	4	2018-01-21	2018-01-22	1161	6	2
1357	2018-01-20	4	2018-01-23	2018-01-21	440	6	2
1358	2018-01-21	4	2018-01-23	2018-01-24	253	2	1
1359	2018-01-21	4	2018-01-22	2018-01-22	1008	9	3
1360	2018-01-22	4	2018-01-25	2018-01-24	71	6	2
1361	2018-01-22	4	2018-01-24	2018-01-23	1084	7	2
1362	2018-01-23	4	2018-01-24	2018-01-25	310	6	2
1363	2018-01-24	4	2018-01-25	2018-01-25	860	6	2
1364	2018-01-25	4	2018-01-28	2018-01-28	122	6	2
1365	2018-01-25	4	2018-01-28	2018-01-27	689	7	2
1366	2018-01-26	4	2018-01-27	2018-01-28	1441	6	2
1367	2018-01-27	4	2018-01-28	2018-01-28	1118	3	1
1368	2018-01-27	4	2018-01-28	2018-01-29	765	6	2
1369	2018-01-28	4	2018-01-30	2018-01-30	92	6	2
1370	2018-01-28	4	2018-01-29	2018-01-29	115	7	2
1371	2018-01-29	4	2018-01-30	2018-02-01	937	7	2
1372	2018-01-29	4	2018-02-01	2018-01-30	1013	6	2
1373	2018-01-29	4	2018-01-31	2018-01-31	427	9	3
1374	2018-01-30	4	2018-02-01	2018-02-01	1330	3	1
1375	2018-01-30	4	2018-02-01	2018-02-01	312	8	3
1376	2018-02-01	4	2018-02-02	2018-02-03	1186	2	1
1377	2018-02-01	4	2018-02-03	2018-02-03	1007	7	2
1378	2018-02-02	4	2018-02-05	2018-02-04	983	2	1
1379	2018-02-02	4	2018-02-05	2018-02-05	1256	6	2
1380	2018-02-05	4	2018-02-08	2018-02-08	818	3	1
1381	2018-02-05	4	2018-02-06	2018-02-08	680	7	2
1382	2018-02-06	4	2018-02-09	2018-02-08	1303	6	2
1383	2018-02-07	4	2018-02-08	2018-02-08	488	3	1
1384	2018-02-08	4	2018-02-10	2018-02-09	1126	7	2
1385	2018-02-08	4	2018-02-11	2018-02-09	866	9	3
1386	2018-02-09	4	2018-02-10	2018-02-11	1254	2	1
1387	2018-02-09	4	2018-02-11	2018-02-11	11	7	2
1388	2018-02-09	4	2018-02-12	2018-02-12	323	7	2
1389	2018-02-11	4	2018-02-12	2018-02-14	491	7	2
1390	2018-02-12	4	2018-02-13	2018-02-13	63	7	2
1391	2018-02-13	4	2018-02-14	2018-02-14	914	7	2
1392	2018-02-13	4	2018-02-14	2018-02-14	1187	6	2
1393	2018-02-14	4	2018-02-15	2018-02-15	547	7	2
1394	2018-02-14	4	2018-02-16	2018-02-16	906	8	3
1395	2018-02-15	4	2018-02-18	2018-02-16	1052	3	1
1396	2018-02-15	4	2018-02-18	2018-02-16	856	7	2
1397	2018-02-15	4	2018-02-17	2018-02-16	920	6	2
1398	2018-02-16	4	2018-02-19	2018-02-19	1383	3	1
1399	2018-02-16	4	2018-02-18	2018-02-18	146	6	2
1400	2018-02-17	4	2018-02-18	2018-02-18	987	6	2
1401	2018-02-18	4	2018-02-19	2018-02-20	15	7	2
1402	2018-02-19	4	2018-02-21	2018-02-21	1171	6	2
1403	2018-02-21	4	2018-02-22	2018-02-22	452	7	2
1404	2018-02-23	4	2018-02-26	2018-02-24	1240	3	1
1405	2018-02-25	4	2018-02-28	2018-02-27	100	6	2
1406	2018-02-25	4	2018-02-27	2018-02-27	1053	7	2
1407	2018-02-26	3	2018-02-26	\N	18	6	2
1408	2018-02-26	4	2018-02-27	2018-03-01	1172	6	2
1409	2018-02-26	4	2018-02-28	2018-02-28	21	8	3
1410	2018-02-27	4	2018-02-28	2018-02-28	1005	7	2
1411	2018-03-01	4	2018-03-02	2018-03-02	109	2	1
1412	2018-03-01	4	2018-03-02	2018-03-04	1043	7	2
1413	2018-03-01	4	2018-03-03	2018-03-04	56	8	3
1414	2018-03-03	4	2018-03-05	2018-03-06	293	7	2
1415	2018-03-03	4	2018-03-04	2018-03-05	839	7	2
1416	2018-03-03	4	2018-03-04	2018-03-06	566	8	3
1417	2018-03-04	4	2018-03-06	2018-03-07	300	2	1
1418	2018-03-04	4	2018-03-05	2018-03-07	364	6	2
1419	2018-03-04	4	2018-03-07	2018-03-07	474	6	2
1420	2018-03-04	4	2018-03-05	2018-03-07	838	7	2
1421	2018-03-05	4	2018-03-07	2018-03-07	1176	7	2
1422	2018-03-05	4	2018-03-06	2018-03-08	599	8	3
1423	2018-03-06	4	2018-03-07	2018-03-07	1231	2	1
1424	2018-03-07	4	2018-03-10	2018-03-10	1445	2	1
1425	2018-03-07	4	2018-03-09	2018-03-09	126	6	2
1426	2018-03-07	4	2018-03-08	2018-03-10	938	6	2
1427	2018-03-07	4	2018-03-08	2018-03-08	999	6	2
1428	2018-03-08	4	2018-03-10	2018-03-11	195	7	2
1429	2018-03-08	4	2018-03-09	2018-03-09	1116	6	2
1430	2018-03-10	4	2018-03-13	2018-03-11	1239	7	2
1431	2018-03-11	4	2018-03-12	2018-03-14	308	6	2
1432	2018-03-11	4	2018-03-12	2018-03-14	483	6	2
1433	2018-03-11	4	2018-03-13	2018-03-12	1142	7	2
1434	2018-03-14	4	2018-03-16	2018-03-16	595	6	2
1435	2018-03-14	4	2018-03-15	2018-03-16	744	6	2
1436	2018-03-14	4	2018-03-17	2018-03-16	1044	6	2
1437	2018-03-15	4	2018-03-16	2018-03-16	518	2	1
1438	2018-03-15	4	2018-03-17	2018-03-16	263	6	2
1439	2018-03-15	4	2018-03-16	2018-03-17	463	7	2
1440	2018-03-15	4	2018-03-18	2018-03-16	859	8	3
1441	2018-03-15	4	2018-03-16	2018-03-18	982	8	3
1442	2018-03-16	4	2018-03-17	2018-03-17	478	7	2
1443	2018-03-16	4	2018-03-17	2018-03-17	972	7	2
1444	2018-03-16	4	2018-03-17	2018-03-19	1154	6	2
1445	2018-03-17	4	2018-03-18	2018-03-20	515	7	2
1446	2018-03-17	4	2018-03-18	2018-03-18	820	6	2
1447	2018-03-18	4	2018-03-20	2018-03-20	1419	3	1
1448	2018-03-18	4	2018-03-19	2018-03-21	228	6	2
1449	2018-03-18	4	2018-03-19	2018-03-20	330	7	2
1450	2018-03-19	4	2018-03-20	2018-03-22	296	7	2
1451	2018-03-19	4	2018-03-22	2018-03-20	822	6	2
1452	2018-03-20	4	2018-03-23	2018-03-23	287	3	1
1453	2018-03-20	4	2018-03-23	2018-03-22	601	3	1
1454	2018-03-20	4	2018-03-21	2018-03-22	395	6	2
1455	2018-03-20	4	2018-03-22	2018-03-21	405	6	2
1456	2018-03-20	4	2018-03-21	2018-03-23	754	7	2
1457	2018-03-20	4	2018-03-23	2018-03-23	1411	6	2
1458	2018-03-20	4	2018-03-22	2018-03-21	1029	8	3
1459	2018-03-21	4	2018-03-22	2018-03-22	9	7	2
1460	2018-03-21	4	2018-03-23	2018-03-23	1131	7	2
1461	2018-03-22	4	2018-03-25	2018-03-23	139	6	2
1462	2018-03-22	4	2018-03-24	2018-03-24	1101	6	2
1463	2018-03-23	4	2018-03-24	2018-03-24	692	7	2
1464	2018-03-24	4	2018-03-25	2018-03-25	1279	7	2
1465	2018-03-25	4	2018-03-28	2018-03-28	623	7	2
1466	2018-03-26	4	2018-03-29	2018-03-28	738	3	1
1467	2018-03-26	4	2018-03-27	2018-03-29	152	7	2
1468	2018-03-27	4	2018-03-30	2018-03-29	3	2	1
1469	2018-03-27	4	2018-03-28	2018-03-30	1135	8	3
1470	2018-03-28	4	2018-03-31	2018-03-31	505	7	2
1471	2018-03-28	4	2018-03-30	2018-03-29	1310	7	2
1472	2018-03-29	4	2018-03-30	2018-03-31	114	6	2
1473	2018-03-30	4	2018-04-01	2018-04-02	302	2	1
1474	2018-03-30	4	2018-04-01	2018-04-02	816	3	1
1475	2018-03-30	4	2018-04-01	2018-03-31	112	6	2
1476	2018-03-31	4	2018-04-01	2018-04-01	35	7	2
1477	2018-03-31	4	2018-04-03	2018-04-01	180	6	2
1478	2018-03-31	4	2018-04-02	2018-04-02	392	6	2
1479	2018-04-01	2	2018-04-01	\N	23	7	2
1480	2018-04-01	2	2018-04-01	\N	27	7	2
1481	2018-04-01	1	2018-04-01	\N	62	6	2
1482	2018-04-01	1	2018-04-01	\N	94	7	2
1483	2018-04-02	1	2018-04-02	\N	15	7	2
1484	2018-04-02	2	2018-04-02	\N	35	6	2
1485	2018-04-02	2	2018-04-02	\N	51	7	2
1486	2018-04-02	2	2018-04-02	\N	84	7	2
1487	2018-04-03	1	2018-04-03	\N	33	3	1
1488	2018-04-03	2	2018-04-03	\N	181	3	1
1489	2018-04-03	1	2018-04-03	\N	194	3	1
1490	2018-04-03	2	2018-04-03	\N	217	3	1
1491	2018-04-04	1	2018-04-04	\N	82	3	1
1492	2018-04-04	1	2018-04-04	\N	41	7	2
1493	2018-04-04	2	2018-04-04	\N	64	8	3
1494	2018-04-05	2	2018-04-05	\N	69	3	1
1495	2018-04-05	2	2018-04-05	\N	86	7	2
1496	2018-04-06	1	2018-04-06	\N	3	3	1
1497	2018-04-06	2	2018-04-06	\N	31	2	1
1498	2018-04-06	1	2018-04-06	\N	81	2	1
1499	2018-04-06	2	2018-04-06	\N	120	2	1
1500	2018-04-06	2	2018-04-06	\N	151	3	1
1501	2018-04-06	1	2018-04-06	\N	52	6	2
1502	2018-04-06	2	2018-04-06	\N	83	6	2
1503	2018-04-07	2	2018-04-07	\N	208	3	1
1504	2018-04-08	2	2018-04-08	\N	237	2	1
1505	2018-04-08	1	2018-04-08	\N	22	7	2
1506	2018-04-08	1	2018-04-08	\N	75	7	2
1507	2018-04-08	2	2018-04-08	\N	85	6	2
1508	2018-04-08	2	2018-04-08	\N	92	6	2
1509	2018-04-09	1	2018-04-09	\N	2	3	1
1510	2018-04-09	2	2018-04-09	\N	16	6	2
1511	2018-04-09	1	2018-04-09	\N	25	6	2
1512	2018-04-09	1	2018-04-09	\N	68	9	3
1513	2018-04-10	2	2018-04-10	\N	32	2	1
1514	2018-04-10	2	2018-04-10	\N	87	3	1
1515	2018-04-10	1	2018-04-10	\N	61	9	3
1516	2018-04-11	2	2018-04-11	\N	47	3	1
1517	2018-04-11	1	2018-04-11	\N	97	2	1
1518	2018-04-11	1	2018-04-11	\N	175	2	1
1519	2018-04-11	2	2018-04-11	\N	26	7	2
1520	2018-04-11	2	2018-04-11	\N	66	8	3
1521	2018-04-12	1	2018-04-12	\N	53	3	1
1522	2018-04-12	1	2018-04-12	\N	78	3	1
1523	2018-04-12	1	2018-04-12	\N	8	7	2
1524	2018-04-12	1	2018-04-12	\N	37	6	2
1525	2018-04-12	2	2018-04-12	\N	38	7	2
1526	2018-04-12	2	2018-04-12	\N	59	7	2
1527	2018-04-12	2	2018-04-12	\N	13	9	3
1528	2018-04-12	1	2018-04-12	\N	20	8	3
1529	2018-04-12	1	2018-04-12	\N	50	8	3
1530	2018-04-13	1	2018-04-13	\N	110	2	1
1531	2018-04-13	1	2018-04-13	\N	233	2	1
1532	2018-04-13	2	2018-04-13	\N	7	7	2
1533	2018-04-13	2	2018-04-13	\N	28	6	2
1534	2018-04-14	2	2018-04-14	\N	18	7	2
1535	2018-04-14	2	2018-04-14	\N	19	7	2
1536	2018-04-14	2	2018-04-14	\N	34	7	2
1537	2018-04-15	1	2018-04-15	\N	36	6	2
1538	2018-04-15	2	2018-04-15	\N	79	6	2
1539	2018-04-15	1	2018-04-15	\N	116	9	3
1540	2018-04-16	1	2018-04-16	\N	187	2	1
1541	2018-04-16	2	2018-04-16	\N	10	7	2
1542	2018-04-16	2	2018-04-16	\N	58	6	2
1543	2018-04-16	1	2018-04-16	\N	76	6	2
1544	2018-04-17	1	2018-04-17	\N	5	2	1
1545	2018-04-17	1	2018-04-17	\N	67	3	1
1546	2018-04-17	2	2018-04-17	\N	91	3	1
1547	2018-04-17	1	2018-04-17	\N	169	3	1
1548	2018-04-17	1	2018-04-17	\N	170	2	1
1549	2018-04-17	1	2018-04-17	\N	17	7	2
1550	2018-04-17	1	2018-04-17	\N	39	6	2
1551	2018-04-17	1	2018-04-17	\N	70	7	2
1552	2018-04-17	1	2018-04-17	\N	73	7	2
1553	2018-04-18	2	2018-04-18	\N	30	3	1
1554	2018-04-18	1	2018-04-18	\N	172	3	1
1555	2018-04-18	1	2018-04-18	\N	1	7	2
1556	2018-04-18	2	2018-04-18	\N	4	6	2
1557	2018-04-19	2	2018-04-19	\N	121	3	1
1558	2018-04-19	1	2018-04-19	\N	63	6	2
1559	2018-04-20	2	2018-04-20	\N	42	6	2
1560	2018-04-20	1	2018-04-20	\N	57	7	2
1561	2018-04-20	2	2018-04-20	\N	65	7	2
1562	2018-04-20	1	2018-04-20	\N	88	7	2
1563	2018-04-20	2	2018-04-20	\N	77	9	3
1564	2018-04-21	1	2018-04-21	\N	46	3	1
1565	2018-04-21	2	2018-04-21	\N	60	2	1
1566	2018-04-21	1	2018-04-21	\N	72	3	1
1567	2018-04-21	2	2018-04-21	\N	89	2	1
1568	2018-04-21	2	2018-04-21	\N	192	3	1
1569	2018-04-22	2	2018-04-22	\N	29	7	2
1570	2018-04-22	2	2018-04-22	\N	54	7	2
1571	2018-04-22	1	2018-04-22	\N	80	7	2
1572	2018-04-22	1	2018-04-22	\N	14	9	3
1573	2018-04-23	2	2018-04-23	\N	24	2	1
1574	2018-04-23	1	2018-04-23	\N	124	2	1
1575	2018-04-23	2	2018-04-23	\N	224	3	1
1576	2018-04-23	2	2018-04-23	\N	12	7	2
1577	2018-04-23	1	2018-04-23	\N	48	7	2
1578	2018-04-23	2	2018-04-23	\N	93	7	2
1579	2018-04-24	2	2018-04-24	\N	104	2	1
1580	2018-04-24	2	2018-04-24	\N	191	2	1
1581	2018-04-25	2	2018-04-25	\N	188	2	1
1582	2018-04-25	1	2018-04-25	\N	240	3	1
1583	2018-04-25	1	2018-04-25	\N	44	6	2
1584	2018-04-26	2	2018-04-26	\N	109	3	1
1585	2018-04-26	1	2018-04-26	\N	157	3	1
1586	2018-04-26	1	2018-04-26	\N	176	2	1
1587	2018-04-26	2	2018-04-26	\N	231	2	1
1588	2018-04-26	1	2018-04-26	\N	11	6	2
1589	2018-04-27	2	2018-04-27	\N	40	3	1
1590	2018-04-27	1	2018-04-27	\N	138	3	1
1591	2018-04-27	2	2018-04-27	\N	165	2	1
1592	2018-04-27	2	2018-04-27	\N	6	7	2
1593	2018-04-27	1	2018-04-27	\N	9	6	2
1594	2018-04-28	1	2018-04-28	\N	45	7	2
1595	2018-04-28	2	2018-04-28	\N	71	7	2
1596	2018-04-28	2	2018-04-28	\N	21	8	3
1597	2018-04-28	1	2018-04-28	\N	56	9	3
1598	2018-04-29	2	2018-04-29	\N	239	3	1
1599	2018-04-29	1	2018-04-29	\N	49	7	2
1600	2018-04-29	1	2018-04-29	\N	90	6	2
1601	2018-04-29	1	2018-04-29	\N	43	8	3
1602	2018-04-30	1	2018-04-30	\N	55	6	2
1603	2018-04-30	2	2018-04-30	\N	74	6	2
1604	2018-06-17	3	2018-06-17	\N	7	7	2
1605	2018-07-01	3	2018-07-01	\N	123	8	3
1606	2018-07-10	3	2018-07-10	\N	119	8	3
1607	2018-07-11	3	2018-07-11	\N	33	2	1
1608	2018-07-12	3	2018-07-12	\N	53	2	1
1609	2018-08-23	3	2018-08-23	\N	10	7	2
1610	2018-08-25	3	2018-08-25	\N	15	7	2
1611	2018-09-06	3	2018-09-06	\N	6	7	2
1612	2018-10-21	3	2018-10-21	\N	3	3	1
1613	2018-11-18	3	2018-11-18	\N	1	6	2
1614	2018-11-28	3	2018-11-28	\N	135	8	3
1615	2018-12-28	3	2018-12-28	\N	136	8	3
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, list_price, model_year, product_name, brand_id, category_id) FROM stdin;
1	379.99	2016	Trek 820 - 2016	9	6
2	749.99	2016	Ritchey Timberwolf Frameset - 2016	5	6
3	999.99	2016	Surly Wednesday Frameset - 2016	8	6
4	2899.99	2016	Trek Fuel EX 8 29 - 2016	9	6
5	1320.99	2016	Heller Shagamaw Frame - 2016	3	6
6	469.99	2016	Surly Ice Cream Truck Frameset - 2016	8	6
7	3999.99	2016	Trek Slash 8 27.5 - 2016	9	6
8	1799.99	2016	Trek Remedy 29 Carbon Frameset - 2016	9	6
9	2999.99	2016	Trek Conduit+ - 2016	9	5
10	1549.00	2016	Surly Straggler - 2016	8	4
11	1680.99	2016	Surly Straggler 650b - 2016	8	4
12	549.99	2016	Electra Townie Original 21D - 2016	1	3
13	269.99	2016	Electra Cruiser 1 (24-Inch) - 2016	1	3
14	269.99	2016	Electra Girl's Hawaii 1 (16-inch) - 2015/2016	1	3
15	529.99	2016	Electra Moto 1 - 2016	1	3
16	599.99	2016	Electra Townie Original 7D EQ - 2016	1	3
17	429.00	2016	Pure Cycles Vine 8-Speed - 2016	4	3
18	449.00	2016	Pure Cycles Western 3-Speed - Women's - 2015/2016	4	3
19	449.00	2016	Pure Cycles William 3-Speed - 2016	4	3
20	599.99	2016	Electra Townie Original 7D EQ - Women's - 2016	1	3
21	269.99	2016	Electra Cruiser 1 (24-Inch) - 2016	1	1
22	269.99	2016	Electra Girl's Hawaii 1 (16-inch) - 2015/2016	1	1
23	299.99	2016	Electra Girl's Hawaii 1 (20-inch) - 2015/2016	1	1
24	549.99	2016	Electra Townie Original 21D - 2016	1	2
25	499.99	2016	Electra Townie Original 7D - 2015/2016	1	2
26	599.99	2016	Electra Townie Original 7D EQ - 2016	1	2
27	999.99	2017	Surly Big Dummy Frameset - 2017	8	6
28	2499.99	2017	Surly Karate Monkey 27.5+ Frameset - 2017	8	6
29	999.99	2017	Trek X-Caliber 8 - 2017	9	6
30	999.99	2017	Surly Ice Cream Truck Frameset - 2017	8	6
31	1632.99	2017	Surly Wednesday - 2017	8	6
32	469.99	2017	Trek Farley Alloy Frameset - 2017	9	6
33	469.99	2017	Surly Wednesday Frameset - 2017	8	6
34	469.99	2017	Trek Session DH 27.5 Carbon Frameset - 2017	9	6
35	832.99	2017	Sun Bicycles Spider 3i - 2017	7	6
36	832.99	2017	Surly Troll Frameset - 2017	8	6
37	379.99	2017	Haro Flightline One ST - 2017	2	6
38	549.99	2017	Haro Flightline Two 26 Plus - 2017	2	6
39	1499.99	2017	Trek Stache 5 - 2017	9	6
40	4999.99	2017	Trek Fuel EX 9.8 29 - 2017	9	6
41	1469.99	2017	Haro Shift R3 - 2017	2	6
42	2299.99	2017	Trek Fuel EX 5 27.5 Plus - 2017	9	6
43	5299.99	2017	Trek Fuel EX 9.8 27.5 Plus - 2017	9	6
44	539.99	2017	Haro SR 1.1 - 2017	2	6
45	869.99	2017	Haro SR 1.2 - 2017	2	6
46	1409.99	2017	Haro SR 1.3 - 2017	2	6
47	5299.99	2017	Trek Remedy 9.8 - 2017	9	6
48	1499.99	2017	Trek Emonda S 4 - 2017	9	7
49	3499.99	2017	Trek Domane SL 6 - 2017	9	7
50	5999.99	2017	Trek Silque SLR 7 Women's - 2017	9	7
51	6499.99	2017	Trek Silque SLR 8 Women's - 2017	9	7
52	875.99	2017	Surly Steamroller - 2017	8	7
53	749.99	2017	Surly Ogre Frameset - 2017	8	7
54	3199.99	2017	Trek Domane SL Disc Frameset - 2017	9	7
55	2699.99	2017	Trek Domane S 6 - 2017	9	7
56	5499.99	2017	Trek Domane SLR 6 Disc - 2017	9	7
57	1999.99	2017	Trek Emonda S 5 - 2017	9	7
58	4999.99	2017	Trek Madone 9.2 - 2017	9	7
59	2599.99	2017	Trek Domane S 5 Disc - 2017	9	7
60	1559.99	2017	Sun Bicycles ElectroLite - 2017	7	5
61	4999.99	2017	Trek Powerfly 8 FS Plus - 2017	9	5
62	3499.99	2017	Trek Boone 7 - 2017	9	4
63	3499.99	2017	Trek Boone Race Shop Limited - 2017	9	4
64	489.99	2017	Electra Townie Original 7D - 2017	1	3
65	346.99	2017	Sun Bicycles Lil Bolt Type-R - 2017	7	3
66	250.99	2017	Sun Bicycles Revolutions 24 - 2017	7	3
67	250.99	2017	Sun Bicycles Revolutions 24 - Girl's - 2017	7	3
68	449.99	2017	Sun Bicycles Cruz 3 - 2017	7	3
69	416.99	2017	Sun Bicycles Cruz 7 - 2017	7	3
70	659.99	2017	Electra Amsterdam Original 3i - 2015/2017	1	3
71	416.99	2017	Sun Bicycles Atlas X-Type - 2017	7	3
72	619.99	2017	Sun Bicycles Biscayne Tandem 7 - 2017	7	3
73	749.99	2017	Sun Bicycles Brickell Tandem 7 - 2017	7	3
74	439.99	2017	Electra Cruiser Lux 1 - 2017	1	3
75	599.99	2017	Electra Cruiser Lux Fat Tire 1 Ladies - 2017	1	3
76	299.99	2017	Electra Girl's Hawaii 1 16" - 2017	1	3
77	799.99	2017	Electra Glam Punk 3i Ladies' - 2017	1	3
78	647.99	2017	Sun Bicycles Biscayne Tandem CB - 2017	7	3
79	402.99	2017	Sun Bicycles Boardwalk (24-inch Wheels) - 2017	7	3
80	761.99	2017	Sun Bicycles Brickell Tandem CB - 2017	7	3
81	1099.99	2017	Electra Amsterdam Fashion 7i Ladies' - 2017	1	3
82	659.99	2017	Electra Amsterdam Original 3i Ladies' - 2017	1	3
83	149.99	2017	Trek Boy's Kickster - 2015/2017	9	1
84	109.99	2017	Sun Bicycles Lil Kitt'n - 2017	7	1
85	329.99	2017	Haro Downtown 16 - 2017	2	1
86	149.99	2017	Trek Girl's Kickster - 2017	9	1
87	189.99	2017	Trek Precaliber 12 Boys - 2017	9	1
88	189.99	2017	Trek Precaliber 12 Girls - 2017	9	1
89	209.99	2017	Trek Precaliber 16 Boys - 2017	9	1
90	209.99	2017	Trek Precaliber 16 Girls - 2017	9	1
91	349.99	2017	Trek Precaliber 24 (21-Speed) - Girls - 2017	9	1
92	209.99	2017	Haro Shredder 20 - 2017	2	1
93	209.99	2017	Haro Shredder 20 Girls - 2017	2	1
94	249.99	2017	Haro Shredder Pro 20 - 2017	2	1
95	299.99	2017	Electra Girl's Hawaii 1 16" - 2017	1	1
96	349.99	2017	Electra Moto 3i (20-inch) - Boy's - 2017	1	1
97	349.99	2017	Electra Savannah 3i (20-inch) - Girl's - 2017	1	1
98	489.99	2017	Electra Straight 8 3i (20-inch) - Boy's - 2017	1	1
99	299.99	2017	Electra Sugar Skulls 1 (20-inch) - Girl's - 2017	1	1
100	489.99	2017	Electra Townie 3i EQ (20-inch) - Boys' - 2017	1	1
101	339.99	2017	Electra Townie 7D (20-inch) - Boys' - 2017	1	1
102	489.99	2017	Electra Townie Original 7D - 2017	1	2
103	551.99	2017	Sun Bicycles Streamway 3 - 2017	7	2
104	481.99	2017	Sun Bicycles Streamway - 2017	7	2
105	533.99	2017	Sun Bicycles Streamway 7 - 2017	7	2
106	449.99	2017	Sun Bicycles Cruz 3 - 2017	7	2
107	416.99	2017	Sun Bicycles Cruz 7 - 2017	7	2
108	449.99	2017	Sun Bicycles Cruz 3 - Women's - 2017	7	2
109	416.99	2017	Sun Bicycles Cruz 7 - Women's - 2017	7	2
110	470.99	2017	Sun Bicycles Drifter 7 - 2017	7	2
111	470.99	2017	Sun Bicycles Drifter 7 - Women's - 2017	7	2
112	379.99	2018	Trek 820 - 2018	9	6
113	489.99	2018	Trek Marlin 5 - 2018	9	6
114	579.99	2018	Trek Marlin 6 - 2018	9	6
115	3199.99	2018	Trek Fuel EX 8 29 - 2018	9	6
116	749.99	2018	Trek Marlin 7 - 2017/2018	9	6
117	1469.99	2018	Trek Ticket S Frame - 2018	9	6
118	999.99	2018	Trek X-Caliber 8 - 2018	9	6
119	469.99	2018	Trek Kids' Neko - 2018	9	6
120	2499.99	2018	Trek Fuel EX 7 29 - 2018	9	6
121	2499.99	2018	Surly Krampus Frameset - 2018	8	6
122	2499.99	2018	Surly Troll Frameset - 2018	8	6
123	999.99	2018	Trek Farley Carbon Frameset - 2018	9	6
124	1499.00	2018	Surly Krampus - 2018	8	6
125	469.99	2018	Trek Kids' Dual Sport - 2018	9	6
126	469.99	2018	Surly Big Fat Dummy Frameset - 2018	8	6
127	469.99	2018	Surly Pack Rat Frameset - 2018	8	6
128	1899.00	2018	Surly ECR 27.5 - 2018	8	6
129	919.99	2018	Trek X-Caliber 7 - 2018	9	6
130	919.99	2018	Trek Stache Carbon Frameset - 2018	9	6
131	2599.00	2018	Heller Bloodhound Trail - 2018	3	6
132	1499.99	2018	Trek Procal AL Frameset - 2018	9	6
133	1499.99	2018	Trek Procaliber Frameset - 2018	9	6
134	1499.99	2018	Trek Remedy 27.5 C Frameset - 2018	9	6
135	1499.99	2018	Trek X-Caliber Frameset - 2018	9	6
136	1799.99	2018	Trek Procaliber 6 - 2018	9	6
137	2599.00	2018	Heller Shagamaw GX1 - 2018	3	6
138	2249.99	2018	Trek Fuel EX 5 Plus - 2018	9	6
139	2999.99	2018	Trek Remedy 7 27.5 - 2018	9	6
140	4999.99	2018	Trek Remedy 9.8 27.5 - 2018	9	6
141	1599.99	2018	Trek Stache 5 - 2018	9	6
142	3199.99	2018	Trek Fuel EX 8 29 XT - 2018	9	6
143	1099.99	2018	Trek Domane ALR 3 - 2018	9	7
144	1549.99	2018	Trek Domane ALR 4 Disc - 2018	9	7
145	1799.99	2018	Trek Domane ALR 5 Disc - 2018	9	7
146	4999.99	2018	Trek Domane SLR 6 - 2018	9	7
147	1799.99	2018	Trek Domane ALR 5 Gravel - 2018	9	7
148	5499.99	2018	Trek Domane SL 8 Disc - 2018	9	7
149	7499.99	2018	Trek Domane SLR 8 Disc - 2018	9	7
150	4499.99	2018	Trek Emonda SL 7 - 2018	9	7
151	1549.99	2018	Trek Domane ALR 4 Disc Women's - 2018	9	7
152	2499.99	2018	Trek Domane SL 5 Disc Women's - 2018	9	7
153	4999.99	2018	Trek Domane SL 7 Women's - 2018	9	7
154	5499.99	2018	Trek Domane SLR 6 Disc Women's - 2018	9	7
155	11999.99	2018	Trek Domane SLR 9 Disc - 2018	9	7
156	6499.99	2018	Trek Domane SL Frameset - 2018	9	7
157	6499.99	2018	Trek Domane SL Frameset Women's - 2018	9	7
158	959.99	2018	Trek CrossRip 1 - 2018	9	7
159	2299.99	2018	Trek Emonda ALR 6 - 2018	9	7
160	4499.99	2018	Trek Emonda SLR 6 - 2018	9	7
161	1899.00	2018	Surly ECR - 2018	8	7
162	2999.99	2018	Trek Emonda SL 6 Disc - 2018	9	7
163	1349.00	2018	Surly Pack Rat - 2018	8	7
164	1549.00	2018	Surly Straggler 650b - 2018	8	7
165	2499.99	2018	Trek 1120 - 2018	9	7
166	749.99	2018	Trek Domane AL 2 Women's - 2018	9	7
167	749.99	2018	Surly ECR Frameset - 2018	8	7
168	1549.00	2018	Surly Straggler - 2018	8	7
169	6499.99	2018	Trek Emonda SLR 8 - 2018	9	7
170	1299.99	2018	Trek CrossRip 2 - 2018	9	7
171	3199.99	2018	Trek Domane SL 6 - 2018	9	7
172	3199.99	2018	Trek Domane ALR Disc Frameset - 2018	9	7
173	3199.99	2018	Trek Domane ALR Frameset - 2018	9	7
174	3199.99	2018	Trek Domane SLR Disc Frameset - 2018	9	7
175	3199.99	2018	Trek Domane SLR Frameset - 2018	9	7
176	3199.99	2018	Trek Madone 9 Frameset - 2018	9	7
177	5499.99	2018	Trek Domane SLR 6 Disc - 2018	9	7
178	749.99	2018	Trek Domane AL 2 - 2018	9	7
179	919.99	2018	Trek Domane AL 3 - 2018	9	7
180	919.99	2018	Trek Domane AL 3 Women's - 2018	9	7
181	2199.99	2018	Trek Domane SL 5 - 2018	9	7
182	2499.99	2018	Trek Domane SL 5 Disc - 2018	9	7
183	2199.99	2018	Trek Domane SL 5 Women's - 2018	9	7
184	3499.99	2018	Trek Domane SL 6 Disc - 2018	9	7
185	2799.99	2018	Trek Conduit+ - 2018	9	5
186	4499.99	2018	Trek CrossRip+ - 2018	9	5
187	2799.99	2018	Trek Neko+ - 2018	9	5
188	3499.99	2018	Trek XM700+ Lowstep - 2018	9	5
189	2799.99	2018	Trek Lift+ Lowstep - 2018	9	5
190	2799.99	2018	Trek Dual Sport+ - 2018	9	5
191	2799.99	2018	Electra Loft Go! 8i - 2018	1	5
192	2599.99	2018	Electra Townie Go! 8i - 2017/2018	1	5
193	2799.99	2018	Trek Lift+ - 2018	9	5
194	3499.99	2018	Trek XM700+ - 2018	9	5
195	2599.99	2018	Electra Townie Go! 8i Ladies' - 2018	1	5
196	2299.99	2018	Trek Verve+ - 2018	9	5
197	2299.99	2018	Trek Verve+ Lowstep - 2018	9	5
198	2999.99	2018	Electra Townie Commute Go! - 2018	1	5
199	2999.99	2018	Electra Townie Commute Go! Ladies' - 2018	1	5
200	3499.99	2018	Trek Powerfly 5 - 2018	9	5
201	4499.99	2018	Trek Powerfly 5 FS - 2018	9	5
202	3499.99	2018	Trek Powerfly 5 Women's - 2018	9	5
203	4999.99	2018	Trek Powerfly 7 FS - 2018	9	5
204	3599.99	2018	Trek Super Commuter+ 7 - 2018	9	5
205	4999.99	2018	Trek Super Commuter+ 8S - 2018	9	5
206	3299.99	2018	Trek Boone 5 Disc - 2018	9	4
207	3999.99	2018	Trek Boone 7 Disc - 2018	9	4
208	1799.99	2018	Trek Crockett 5 Disc - 2018	9	4
209	2999.99	2018	Trek Crockett 7 Disc - 2018	9	4
210	1549.00	2018	Surly Straggler - 2018	8	4
211	1549.00	2018	Surly Straggler 650b - 2018	8	4
212	559.99	2018	Electra Townie Original 21D - 2018	1	3
213	269.99	2018	Electra Cruiser 1 - 2016/2017/2018	1	3
214	899.99	2018	Electra Tiger Shark 3i - 2018	1	3
215	749.99	2018	Electra Queen of Hearts 3i - 2018	1	3
216	899.99	2018	Electra Super Moto 8i - 2018	1	3
217	909.99	2018	Electra Straight 8 3i - 2018	1	3
218	319.99	2018	Electra Cruiser 7D - 2016/2017/2018	1	3
219	639.99	2018	Electra Moto 3i - 2018	1	3
220	269.99	2018	Electra Cruiser 1 Ladies' - 2018	1	3
221	319.99	2018	Electra Cruiser 7D Ladies' - 2016/2018	1	3
222	269.99	2018	Electra Cruiser 1 Tall - 2016/2018	1	3
223	529.99	2018	Electra Cruiser Lux 3i - 2018	1	3
224	479.99	2018	Electra Cruiser Lux 7D - 2018	1	3
225	959.99	2018	Electra Delivery 3i - 2016/2017/2018	1	3
226	679.99	2018	Electra Townie Original 21D EQ - 2017/2018	1	3
227	319.99	2018	Electra Cruiser 7D (24-Inch) Ladies' - 2016/2018	1	3
228	319.99	2018	Electra Cruiser 7D Tall - 2016/2018	1	3
229	429.99	2018	Electra Cruiser Lux 1 - 2016/2018	1	3
230	429.99	2018	Electra Cruiser Lux 1 Ladies' - 2018	1	3
231	529.99	2018	Electra Cruiser Lux 3i Ladies' - 2018	1	3
232	479.99	2018	Electra Cruiser Lux 7D Ladies' - 2018	1	3
233	639.99	2018	Electra Cruiser Lux Fat Tire 7D - 2018	1	3
234	899.99	2018	Electra Daydreamer 3i Ladies' - 2018	1	3
235	899.99	2018	Electra Koa 3i Ladies' - 2018	1	3
236	749.99	2018	Electra Morningstar 3i Ladies' - 2018	1	3
237	849.99	2018	Electra Relic 3i - 2018	1	3
238	749.99	2018	Electra Townie Balloon 8D EQ - 2016/2017/2018	1	3
239	749.99	2018	Electra Townie Balloon 8D EQ Ladies' - 2016/2017/2018	1	3
240	899.99	2018	Electra Townie Commute 27D Ladies - 2018	1	3
241	749.99	2018	Electra Townie Commute 8D - 2018	1	3
242	699.99	2018	Electra Townie Commute 8D Ladies' - 2018	1	3
243	679.99	2018	Electra Townie Original 21D EQ Ladies' - 2018	1	3
244	559.99	2018	Electra Townie Original 21D Ladies' - 2018	1	3
245	659.99	2018	Electra Townie Original 3i EQ - 2017/2018	1	3
246	639.99	2018	Electra Townie Original 3i EQ Ladies' - 2018	1	3
247	599.99	2018	Electra Townie Original 7D EQ - 2018	1	3
248	599.99	2018	Electra Townie Original 7D EQ Ladies' - 2017/2018	1	3
249	749.99	2018	Electra White Water 3i - 2018	1	3
250	2599.99	2018	Electra Townie Go! 8i - 2017/2018	1	3
251	2999.99	2018	Electra Townie Commute Go! - 2018	1	3
252	2999.99	2018	Electra Townie Commute Go! Ladies' - 2018	1	3
253	2599.99	2018	Electra Townie Go! 8i Ladies' - 2018	1	3
254	749.99	2018	Electra Townie Balloon 3i EQ - 2017/2018	1	3
255	899.99	2018	Electra Townie Balloon 7i EQ Ladies' - 2017/2018	1	3
256	899.99	2018	Electra Townie Commute 27D - 2018	1	3
257	899.99	2018	Electra Amsterdam Fashion 3i Ladies' - 2017/2018	1	3
258	1259.90	2018	Electra Amsterdam Royal 8i - 2017/2018	1	3
259	1199.99	2018	Electra Amsterdam Royal 8i Ladies - 2018	1	3
260	799.99	2018	Electra Townie Balloon 3i EQ Ladies' - 2018	1	3
261	899.99	2018	Electra Townie Balloon 7i EQ - 2018	1	3
262	249.99	2018	Trek MT 201 - 2018	9	1
263	89.99	2018	Strider Classic 12 Balance Bike - 2018	6	1
264	249.99	2018	Strider Sport 16 - 2018	6	1
265	289.99	2018	Strider Strider 20 Sport - 2018	6	1
266	399.99	2018	Trek Superfly 20 - 2018	9	1
267	199.99	2018	Trek Precaliber 12 Girl's - 2018	9	1
268	159.99	2018	Trek Kickster - 2018	9	1
269	199.99	2018	Trek Precaliber 12 Boy's - 2018	9	1
270	209.99	2018	Trek Precaliber 16 Boy's - 2018	9	1
271	209.99	2018	Trek Precaliber 16 Girl's - 2018	9	1
272	289.99	2018	Trek Precaliber 20 6-speed Boy's - 2018	9	1
273	289.99	2018	Trek Precaliber 20 6-speed Girl's - 2018	9	1
274	229.99	2018	Trek Precaliber 20 Boy's - 2018	9	1
275	229.99	2018	Trek Precaliber 20 Girl's - 2018	9	1
276	319.99	2018	Trek Precaliber 24 (7-Speed) - Boys - 2018	9	1
277	369.99	2018	Trek Precaliber 24 21-speed Boy's - 2018	9	1
278	369.99	2018	Trek Precaliber 24 21-speed Girl's - 2018	9	1
279	319.99	2018	Trek Precaliber 24 7-speed Girl's - 2018	9	1
280	489.99	2018	Trek Superfly 24 - 2017/2018	9	1
281	319.99	2018	Electra Cruiser 7D (24-Inch) Ladies' - 2016/2018	1	1
282	279.99	2018	Electra Cyclosaurus 1 (16-inch) - Boy's - 2018	1	1
283	319.99	2018	Electra Heartchya 1 (20-inch) - Girl's - 2018	1	1
284	319.99	2018	Electra Savannah 1 (20-inch) - Girl's - 2018	1	1
285	279.99	2018	Electra Soft Serve 1 (16-inch) - Girl's - 2018	1	1
286	279.99	2018	Electra Starship 1 16" - 2018	1	1
287	279.99	2018	Electra Straight 8 1 (16-inch) - Boy's - 2018	1	1
288	389.99	2018	Electra Straight 8 1 (20-inch) - Boy's - 2018	1	1
289	319.99	2018	Electra Superbolt 1 20" - 2018	1	1
290	369.99	2018	Electra Superbolt 3i 20" - 2018	1	1
291	319.99	2018	Electra Sweet Ride 1 (20-inch) - Girl's - 2018	1	1
292	369.99	2018	Electra Sweet Ride 3i (20-inch) - Girls' - 2018	1	1
293	319.99	2018	Electra Tiger Shark 1 (20-inch) - Boys' - 2018	1	1
294	369.99	2018	Electra Tiger Shark 3i (20-inch) - Boys' - 2018	1	1
295	319.99	2018	Electra Treasure 1 20" - 2018	1	1
296	369.99	2018	Electra Treasure 3i 20" - 2018	1	1
297	279.99	2018	Electra Under-The-Sea 1 16" - 2018	1	1
298	279.99	2018	Electra Water Lily 1 (16-inch) - Girl's - 2018	1	1
299	559.99	2018	Electra Townie Original 21D - 2018	1	2
300	799.99	2018	Electra Townie Balloon 3i EQ Ladies' - 2018	1	2
301	899.99	2018	Electra Townie Balloon 7i EQ - 2018	1	2
302	449.99	2018	Electra Townie Original 1 - 2018	1	2
303	2599.99	2018	Electra Townie Go! 8i - 2017/2018	1	2
304	679.99	2018	Electra Townie Original 21D EQ - 2017/2018	1	2
305	749.99	2018	Electra Townie Balloon 3i EQ - 2017/2018	1	2
306	899.99	2018	Electra Townie Balloon 7i EQ Ladies' - 2017/2018	1	2
307	749.99	2018	Electra Townie Balloon 8D EQ - 2016/2017/2018	1	2
308	749.99	2018	Electra Townie Balloon 8D EQ Ladies' - 2016/2017/2018	1	2
309	899.99	2018	Electra Townie Commute 27D - 2018	1	2
310	899.99	2018	Electra Townie Commute 27D Ladies - 2018	1	2
311	749.99	2018	Electra Townie Commute 8D - 2018	1	2
312	699.99	2018	Electra Townie Commute 8D Ladies' - 2018	1	2
313	449.99	2018	Electra Townie Original 1 Ladies' - 2018	1	2
314	679.99	2018	Electra Townie Original 21D EQ Ladies' - 2018	1	2
315	559.99	2018	Electra Townie Original 21D Ladies' - 2018	1	2
316	1699.99	2019	Trek Checkpoint ALR 4 Women's - 2019	9	7
317	1999.99	2019	Trek Checkpoint ALR 5 - 2019	9	7
318	1999.99	2019	Trek Checkpoint ALR 5 Women's - 2019	9	7
319	2799.99	2019	Trek Checkpoint SL 5 Women's - 2019	9	7
320	3799.99	2019	Trek Checkpoint SL 6 - 2019	9	7
321	3199.99	2019	Trek Checkpoint ALR Frameset - 2019	9	7
\.


--
-- Data for Name: staffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staffs (staff_id, active, email, first_name, last_name, phone, manager_id, store_id) FROM stdin;
1	1	fabiola.jackson@bikes.shop	Fabiola	Jackson	(831) 555-5554	\N	1
2	1	mireya.copeland@bikes.shop	Mireya	Copeland	(831) 555-5555	1	1
3	1	genna.serrano@bikes.shop	Genna	Serrano	(831) 555-5556	2	1
4	1	virgie.wiggins@bikes.shop	Virgie	Wiggins	(831) 555-5557	2	1
5	1	jannette.david@bikes.shop	Jannette	David	(516) 379-4444	1	2
6	1	marcelene.boyer@bikes.shop	Marcelene	Boyer	(516) 379-4445	5	2
7	1	venita.daniel@bikes.shop	Venita	Daniel	(516) 379-4446	5	2
8	1	kali.vargas@bikes.shop	Kali	Vargas	(972) 530-5555	1	3
9	1	layla.terrell@bikes.shop	Layla	Terrell	(972) 530-5556	7	3
10	1	bernardine.houston@bikes.shop	Bernardine	Houston	(972) 530-5557	7	3
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (product_id, store_id, quantity) FROM stdin;
1	1	27
2	1	5
3	1	6
4	1	23
5	1	22
6	1	0
7	1	8
8	1	0
9	1	11
10	1	15
11	1	8
12	1	16
13	1	13
14	1	8
15	1	3
16	1	4
17	1	2
18	1	16
19	1	4
20	1	26
21	1	24
22	1	29
23	1	9
24	1	10
25	1	10
26	1	16
27	1	21
28	1	20
29	1	13
30	1	30
31	1	2
32	1	0
33	1	10
34	1	2
35	1	18
36	1	26
37	1	12
38	1	13
39	1	2
40	1	24
41	1	10
42	1	0
43	1	2
44	1	1
45	1	15
46	1	19
47	1	21
48	1	5
49	1	8
50	1	29
51	1	2
52	1	18
53	1	17
54	1	11
55	1	11
56	1	15
57	1	1
58	1	1
59	1	22
60	1	19
61	1	30
62	1	21
63	1	4
64	1	30
65	1	10
66	1	12
67	1	19
68	1	30
69	1	4
70	1	3
71	1	25
72	1	9
73	1	7
74	1	9
75	1	23
76	1	15
77	1	16
78	1	13
79	1	13
80	1	11
81	1	25
82	1	1
83	1	13
84	1	11
85	1	23
86	1	19
87	1	27
88	1	7
89	1	9
90	1	4
91	1	8
92	1	0
93	1	22
94	1	6
95	1	25
96	1	20
97	1	20
98	1	28
99	1	28
100	1	15
101	1	17
102	1	9
103	1	13
104	1	25
105	1	7
106	1	30
107	1	20
108	1	15
109	1	30
110	1	1
111	1	11
112	1	17
113	1	24
114	1	3
115	1	10
116	1	24
117	1	15
118	1	12
119	1	17
120	1	23
121	1	19
122	1	22
123	1	8
124	1	23
125	1	22
126	1	28
127	1	12
128	1	11
129	1	21
130	1	22
131	1	20
132	1	1
133	1	9
134	1	26
135	1	15
136	1	12
137	1	12
138	1	6
139	1	17
140	1	3
141	1	21
142	1	22
143	1	19
144	1	7
145	1	5
146	1	6
147	1	8
148	1	6
149	1	1
150	1	22
151	1	24
152	1	12
153	1	25
154	1	13
155	1	8
156	1	13
157	1	25
158	1	11
159	1	18
160	1	0
161	1	17
162	1	14
163	1	0
164	1	15
165	1	16
166	1	23
167	1	28
168	1	0
169	1	25
170	1	14
171	1	3
172	1	3
173	1	2
174	1	26
175	1	2
176	1	11
177	1	19
178	1	23
179	1	16
180	1	5
181	1	19
182	1	28
183	1	11
184	1	4
185	1	3
186	1	1
187	1	16
188	1	30
189	1	6
190	1	21
191	1	21
192	1	20
193	1	30
194	1	24
195	1	1
196	1	26
197	1	22
198	1	1
199	1	2
200	1	27
201	1	16
202	1	5
203	1	4
204	1	23
205	1	9
206	1	10
207	1	27
208	1	13
209	1	22
210	1	25
211	1	13
212	1	17
213	1	14
214	1	4
215	1	1
216	1	11
217	1	11
218	1	27
219	1	30
220	1	4
221	1	7
222	1	12
223	1	3
224	1	16
225	1	24
226	1	18
227	1	19
228	1	22
229	1	27
230	1	7
231	1	25
232	1	5
233	1	5
234	1	13
235	1	7
236	1	18
237	1	26
238	1	20
239	1	28
240	1	17
241	1	17
242	1	10
243	1	11
244	1	10
245	1	3
246	1	0
247	1	15
248	1	14
249	1	27
250	1	3
251	1	2
252	1	28
253	1	16
254	1	24
255	1	13
256	1	20
257	1	17
258	1	25
259	1	10
260	1	20
261	1	3
262	1	6
263	1	21
264	1	16
265	1	28
266	1	1
267	1	27
268	1	23
269	1	22
270	1	16
271	1	6
272	1	14
273	1	20
274	1	19
275	1	28
276	1	7
277	1	13
278	1	17
279	1	17
280	1	23
281	1	11
282	1	6
283	1	10
284	1	27
285	1	20
286	1	28
287	1	2
288	1	9
289	1	2
290	1	8
291	1	9
292	1	30
293	1	18
294	1	3
295	1	24
296	1	9
297	1	22
298	1	26
299	1	18
300	1	7
301	1	10
302	1	0
303	1	12
304	1	15
305	1	23
306	1	21
307	1	17
308	1	23
309	1	7
310	1	18
311	1	20
312	1	23
313	1	14
1	2	14
2	2	16
3	2	28
4	2	2
5	2	1
6	2	11
7	2	8
8	2	1
9	2	17
10	2	13
11	2	21
12	2	2
13	2	1
14	2	18
15	2	6
16	2	20
17	2	3
18	2	13
19	2	15
20	2	20
21	2	16
22	2	0
23	2	12
24	2	16
25	2	18
26	2	2
27	2	10
28	2	25
29	2	29
30	2	17
31	2	10
32	2	13
33	2	8
34	2	24
35	2	25
36	2	15
37	2	5
38	2	18
39	2	28
40	2	15
41	2	6
42	2	16
43	2	2
44	2	24
45	2	13
46	2	18
47	2	0
48	2	20
49	2	4
50	2	7
51	2	8
52	2	23
53	2	19
54	2	6
55	2	5
56	2	20
57	2	27
58	2	15
59	2	17
60	2	1
61	2	20
62	2	4
63	2	5
64	2	30
65	2	16
66	2	22
67	2	8
68	2	23
69	2	22
70	2	6
71	2	30
72	2	1
73	2	20
74	2	23
75	2	11
76	2	20
77	2	25
78	2	4
79	2	29
80	2	27
81	2	19
82	2	4
83	2	21
84	2	22
85	2	6
86	2	24
87	2	14
88	2	8
89	2	8
90	2	26
91	2	0
92	2	22
93	2	22
94	2	2
95	2	10
96	2	22
97	2	15
98	2	14
99	2	24
100	2	12
101	2	4
102	2	12
103	2	1
104	2	26
105	2	3
106	2	7
107	2	29
108	2	29
109	2	25
110	2	7
111	2	6
112	2	1
113	2	7
114	2	12
115	2	19
116	2	17
117	2	18
118	2	25
119	2	23
120	2	16
121	2	3
122	2	11
123	2	18
124	2	4
125	2	10
126	2	13
127	2	12
128	2	28
129	2	21
130	2	17
131	2	9
132	2	6
133	2	28
134	2	13
135	2	30
136	2	8
137	2	1
138	2	16
139	2	24
140	2	13
141	2	28
142	2	24
143	2	12
144	2	4
145	2	23
146	2	3
147	2	13
148	2	27
149	2	22
150	2	7
151	2	2
152	2	21
153	2	21
154	2	9
155	2	21
156	2	8
157	2	28
158	2	0
159	2	30
160	2	4
161	2	9
162	2	18
163	2	30
164	2	9
165	2	6
166	2	27
167	2	1
168	2	29
169	2	1
170	2	2
171	2	28
172	2	16
173	2	17
174	2	8
175	2	0
176	2	26
177	2	9
178	2	1
179	2	16
180	2	3
181	2	29
182	2	21
183	2	26
184	2	0
185	2	4
186	2	16
187	2	10
188	2	27
189	2	13
190	2	18
191	2	15
192	2	0
193	2	21
194	2	15
195	2	19
196	2	28
197	2	10
198	2	0
199	2	13
200	2	11
201	2	24
202	2	1
203	2	7
204	2	25
205	2	13
206	2	9
207	2	8
208	2	12
209	2	11
210	2	10
211	2	4
212	2	22
213	2	10
214	2	7
215	2	11
216	2	19
217	2	22
218	2	26
219	2	16
220	2	6
221	2	12
222	2	30
223	2	7
224	2	4
225	2	11
226	2	5
227	2	12
228	2	7
229	2	29
230	2	25
231	2	8
232	2	11
233	2	25
234	2	12
235	2	4
236	2	7
237	2	30
238	2	6
239	2	17
240	2	19
241	2	24
242	2	2
243	2	18
244	2	1
245	2	18
246	2	10
247	2	16
248	2	26
249	2	10
250	2	23
251	2	0
252	2	20
253	2	29
254	2	7
255	2	12
256	2	8
257	2	5
258	2	10
259	2	16
260	2	20
261	2	4
262	2	8
263	2	4
264	2	13
265	2	4
266	2	18
267	2	21
268	2	3
269	2	4
270	2	15
271	2	26
272	2	1
273	2	28
274	2	15
275	2	3
276	2	9
277	2	4
278	2	8
279	2	18
280	2	11
281	2	3
282	2	8
283	2	28
284	2	6
285	2	22
286	2	3
287	2	15
288	2	13
289	2	5
290	2	29
291	2	22
292	2	22
293	2	12
294	2	7
295	2	15
296	2	8
297	2	7
298	2	27
299	2	0
300	2	13
301	2	26
302	2	6
303	2	23
304	2	6
305	2	21
306	2	17
307	2	18
308	2	15
309	2	9
310	2	5
311	2	27
312	2	2
313	2	24
1	3	14
2	3	24
3	3	0
4	3	11
5	3	3
6	3	27
7	3	12
8	3	12
9	3	23
10	3	21
11	3	30
12	3	30
13	3	19
14	3	4
15	3	22
16	3	19
17	3	22
18	3	5
19	3	24
20	3	19
21	3	8
22	3	20
23	3	8
24	3	18
25	3	15
26	3	27
27	3	21
28	3	20
29	3	11
30	3	23
31	3	10
32	3	14
33	3	14
34	3	6
35	3	3
36	3	28
37	3	30
38	3	23
39	3	22
40	3	2
41	3	25
42	3	9
43	3	26
44	3	26
45	3	1
46	3	16
47	3	14
48	3	2
49	3	4
50	3	25
51	3	2
52	3	8
53	3	6
54	3	13
55	3	5
56	3	19
57	3	9
58	3	27
59	3	0
60	3	7
61	3	28
62	3	4
63	3	8
64	3	22
65	3	1
66	3	3
67	3	6
68	3	18
69	3	29
70	3	2
71	3	13
72	3	6
73	3	3
74	3	17
75	3	29
76	3	23
77	3	23
78	3	19
79	3	29
80	3	22
81	3	18
82	3	7
83	3	23
84	3	15
85	3	15
86	3	27
87	3	16
88	3	28
89	3	22
90	3	9
91	3	8
92	3	28
93	3	18
94	3	15
95	3	14
96	3	1
97	3	28
98	3	5
99	3	19
100	3	28
101	3	17
102	3	22
103	3	10
104	3	22
105	3	1
106	3	1
107	3	11
108	3	23
109	3	24
110	3	11
111	3	29
112	3	24
113	3	23
114	3	12
115	3	25
116	3	30
117	3	23
118	3	9
119	3	29
120	3	25
121	3	4
122	3	8
123	3	15
124	3	11
125	3	2
126	3	5
127	3	4
128	3	20
129	3	10
130	3	20
131	3	23
132	3	16
133	3	16
134	3	17
135	3	15
136	3	4
137	3	17
138	3	17
139	3	21
140	3	3
141	3	4
142	3	29
143	3	9
144	3	9
145	3	11
146	3	9
147	3	3
148	3	6
149	3	1
150	3	21
151	3	1
152	3	1
153	3	7
154	3	22
155	3	25
156	3	14
157	3	12
158	3	17
159	3	6
160	3	27
161	3	11
162	3	11
163	3	11
164	3	18
165	3	19
166	3	27
167	3	8
168	3	23
169	3	3
170	3	13
171	3	11
172	3	22
173	3	15
174	3	1
175	3	3
176	3	6
177	3	2
178	3	12
179	3	20
180	3	6
181	3	8
182	3	28
183	3	26
184	3	21
185	3	15
186	3	30
187	3	2
188	3	29
189	3	20
190	3	20
191	3	23
192	3	10
193	3	5
194	3	20
195	3	20
196	3	25
197	3	8
198	3	27
199	3	5
200	3	29
201	3	30
202	3	11
203	3	6
204	3	16
205	3	3
206	3	29
207	3	29
208	3	12
209	3	1
210	3	22
211	3	3
212	3	23
213	3	10
214	3	30
215	3	12
216	3	5
217	3	4
218	3	21
219	3	29
220	3	0
221	3	25
222	3	12
223	3	29
224	3	23
225	3	12
226	3	14
227	3	22
228	3	29
229	3	7
230	3	29
231	3	6
232	3	16
233	3	9
234	3	24
235	3	1
236	3	3
237	3	16
238	3	12
239	3	29
240	3	26
241	3	8
242	3	5
243	3	7
244	3	5
245	3	10
246	3	7
247	3	3
248	3	11
249	3	6
250	3	16
251	3	10
252	3	27
253	3	15
254	3	4
255	3	17
256	3	1
257	3	25
258	3	10
259	3	0
260	3	5
261	3	24
262	3	29
263	3	21
264	3	7
265	3	22
266	3	18
267	3	12
268	3	17
269	3	26
270	3	6
271	3	23
272	3	12
273	3	19
274	3	7
275	3	23
276	3	14
277	3	26
278	3	15
279	3	15
280	3	1
281	3	2
282	3	18
283	3	1
284	3	26
285	3	2
286	3	7
287	3	26
288	3	2
289	3	2
290	3	6
291	3	10
292	3	16
293	3	14
294	3	13
295	3	9
296	3	12
297	3	22
298	3	14
299	3	29
300	3	3
301	3	29
302	3	6
303	3	13
304	3	23
305	3	11
306	3	7
307	3	17
308	3	9
309	3	30
310	3	8
311	3	23
312	3	18
313	3	0
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (store_id, city, email, phone, state, store_name, street, zip_code) FROM stdin;
1	Santa Cruz	santacruz@bikes.shop	(831) 476-4321	CA	Santa Cruz Bikes	3700 Portola Drive	95060
2	Baldwin	baldwin@bikes.shop	(516) 379-8888	NY	Baldwin Bikes	4200 Chestnut Lane	11432
3	Rowlett	rowlett@bikes.shop	(972) 530-5555	TX	Rowlett Bikes	8000 Fairway Avenue	75088
\.


--
-- Name: brands_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_brand_id_seq', 9, true);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 7, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1445, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1616, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 321, true);


--
-- Name: staffs_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staffs_staff_id_seq', 10, true);


--
-- Name: stores_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_store_id_seq', 3, true);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (brand_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (item_id, order_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: staffs staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffs
    ADD CONSTRAINT staffs_pkey PRIMARY KEY (staff_id);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (product_id, store_id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (store_id);


--
-- Name: stocks fk3refpt5bgpl6xevhc4ey0ct3v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT fk3refpt5bgpl6xevhc4ey0ct3v FOREIGN KEY (store_id) REFERENCES public.stores(store_id);


--
-- Name: orders fk7vt11rektq6d400j5r1ajw8st; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk7vt11rektq6d400j5r1ajw8st FOREIGN KEY (staff_id) REFERENCES public.staffs(staff_id);


--
-- Name: products fka3a4mpsfdf4d2y6r8ra3sc8mv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fka3a4mpsfdf4d2y6r8ra3sc8mv FOREIGN KEY (brand_id) REFERENCES public.brands(brand_id);


--
-- Name: order_items fkbioxgbv59vetrxe0ejfubep1w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fkbioxgbv59vetrxe0ejfubep1w FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: staffs fkefpdoo7xl4dp551s13w76pclk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffs
    ADD CONSTRAINT fkefpdoo7xl4dp551s13w76pclk FOREIGN KEY (manager_id) REFERENCES public.staffs(staff_id);


--
-- Name: stocks fkff7be959jyco0iukc1dcjj9qm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT fkff7be959jyco0iukc1dcjj9qm FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: staffs fkm8wik547o9kv83ubgmdct6tm4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staffs
    ADD CONSTRAINT fkm8wik547o9kv83ubgmdct6tm4 FOREIGN KEY (store_id) REFERENCES public.stores(store_id);


--
-- Name: orders fknqkwhwveegs6ne9ra90y1gq0e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fknqkwhwveegs6ne9ra90y1gq0e FOREIGN KEY (store_id) REFERENCES public.stores(store_id);


--
-- Name: order_items fkocimc7dtr037rh4ls4l95nlfi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fkocimc7dtr037rh4ls4l95nlfi FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: products fkog2rp4qthbtt2lfyhfo32lsw9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fkog2rp4qthbtt2lfyhfo32lsw9 FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: orders fkpxtb8awmi0dk6smoh2vp1litg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fkpxtb8awmi0dk6smoh2vp1litg FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- PostgreSQL database dump complete
--

