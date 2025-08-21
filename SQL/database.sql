--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 17.5

-- Started on 2025-08-20 21:02:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 2392097)
-- Name: almacenamiento; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.almacenamiento (
    id integer NOT NULL,
    serial character varying(50),
    marca character varying(50),
    modelo character varying(50),
    tipo character varying(15),
    factor_de_forma character varying(10),
    interfaz character varying(20),
    capacidad_gb numeric(10,2),
    velocidad_rpm integer,
    velocidad_mb_s numeric(6,0),
    tbw integer,
    fecha_compra date,
    fecha_garantia date,
    estado character varying(12),
    CONSTRAINT almacenamiento_estado_check CHECK (((estado)::text = ANY ((ARRAY['activo'::character varying, 'reserva'::character varying, 'retirado'::character varying, 'rma'::character varying])::text[]))),
    CONSTRAINT almacenamiento_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['HDD'::character varying, 'SSD'::character varying, 'NVMe'::character varying, 'SAS'::character varying, 'SATA'::character varying])::text[])))
);


ALTER TABLE public.almacenamiento OWNER TO "Comfe_owner";

--
-- TOC entry 233 (class 1259 OID 2392096)
-- Name: almacenamiento_id_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.almacenamiento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.almacenamiento_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 233
-- Name: almacenamiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.almacenamiento_id_seq OWNED BY public.almacenamiento.id;


--
-- TOC entry 224 (class 1259 OID 2342958)
-- Name: contratista; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.contratista (
    "ID" integer NOT NULL,
    razon_social character varying(20),
    servicio text,
    nit bigint
);


ALTER TABLE public.contratista OWNER TO "Comfe_owner";

--
-- TOC entry 223 (class 1259 OID 2342957)
-- Name: contratista_ID_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public."contratista_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."contratista_ID_seq" OWNER TO "Comfe_owner";

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 223
-- Name: contratista_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public."contratista_ID_seq" OWNED BY public.contratista."ID";


--
-- TOC entry 226 (class 1259 OID 2383946)
-- Name: gpu; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.gpu (
    "ID" integer NOT NULL,
    modelo character varying(20),
    "TPU" integer,
    memoria integer
);


ALTER TABLE public.gpu OWNER TO "Comfe_owner";

--
-- TOC entry 225 (class 1259 OID 2383945)
-- Name: gpu_ID_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public."gpu_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."gpu_ID_seq" OWNER TO "Comfe_owner";

--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 225
-- Name: gpu_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public."gpu_ID_seq" OWNED BY public.gpu."ID";


--
-- TOC entry 218 (class 1259 OID 2342935)
-- Name: lugar; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.lugar (
    "ID" integer NOT NULL,
    direccion json,
    coordenada json,
    videovigilancia boolean,
    climatizacion boolean
);


ALTER TABLE public.lugar OWNER TO "Comfe_owner";

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE lugar; Type: COMMENT; Schema: public; Owner: Comfe_owner
--

COMMENT ON TABLE public.lugar IS 'ubicación del equipo';


--
-- TOC entry 217 (class 1259 OID 2342934)
-- Name: lugar_ID_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public."lugar_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."lugar_ID_seq" OWNER TO "Comfe_owner";

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 217
-- Name: lugar_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public."lugar_ID_seq" OWNED BY public.lugar."ID";


--
-- TOC entry 216 (class 1259 OID 2342928)
-- Name: modelo; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.modelo (
    "ID" integer NOT NULL,
    fabricante character varying(20),
    marca character varying(20),
    modelo character varying(20),
    serial character varying(20),
    factor_de_forma character varying(20),
    "RAM" integer,
    almacenamiento character varying(20),
    red character varying(20)
);


ALTER TABLE public.modelo OWNER TO "Comfe_owner";

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE modelo; Type: COMMENT; Schema: public; Owner: Comfe_owner
--

COMMENT ON TABLE public.modelo IS 'modelos de equipos ';


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN modelo."RAM"; Type: COMMENT; Schema: public; Owner: Comfe_owner
--

COMMENT ON COLUMN public.modelo."RAM" IS 'cantidad de bahías ';


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN modelo.almacenamiento; Type: COMMENT; Schema: public; Owner: Comfe_owner
--

COMMENT ON COLUMN public.modelo.almacenamiento IS 'raid';


--
-- TOC entry 215 (class 1259 OID 2342927)
-- Name: modelo_ID_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public."modelo_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."modelo_ID_seq" OWNER TO "Comfe_owner";

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 215
-- Name: modelo_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public."modelo_ID_seq" OWNED BY public.modelo."ID";


--
-- TOC entry 220 (class 1259 OID 2342944)
-- Name: rack; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.rack (
    "ID" integer NOT NULL,
    fila integer,
    "UPS" boolean
);


ALTER TABLE public.rack OWNER TO "Comfe_owner";

--
-- TOC entry 219 (class 1259 OID 2342943)
-- Name: rack_ID_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public."rack_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."rack_ID_seq" OWNER TO "Comfe_owner";

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 219
-- Name: rack_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public."rack_ID_seq" OWNED BY public.rack."ID";


--
-- TOC entry 232 (class 1259 OID 2392072)
-- Name: ram; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.ram (
    id integer NOT NULL,
    marca character varying(30),
    modelo character varying(40),
    capacidad_gb numeric(6,2),
    velocidad_mhz integer,
    tipo character varying(10),
    factor_forma character varying(10),
    numero_modulos smallint DEFAULT 1,
    ecc boolean DEFAULT false,
    voltaje numeric(3,2),
    fecha_compra date,
    estado character varying(12),
    serial character varying(50),
    CONSTRAINT ram_estado_check CHECK (((estado)::text = ANY ((ARRAY['activo'::character varying, 'reserva'::character varying, 'retirado'::character varying, 'rma'::character varying])::text[]))),
    CONSTRAINT ram_factor_forma_check CHECK (((factor_forma)::text = ANY ((ARRAY['DIMM'::character varying, 'SODIMM'::character varying, 'RDIMM'::character varying, 'LRDIMM'::character varying, 'UDIMM'::character varying])::text[]))),
    CONSTRAINT ram_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['DDR3'::character varying, 'DDR4'::character varying, 'DDR5'::character varying, 'LPDDR4'::character varying, 'LPDDR5'::character varying])::text[])))
);


ALTER TABLE public.ram OWNER TO "Comfe_owner";

--
-- TOC entry 231 (class 1259 OID 2392071)
-- Name: ram_id_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.ram_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ram_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 231
-- Name: ram_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.ram_id_seq OWNED BY public.ram.id;


--
-- TOC entry 228 (class 1259 OID 2383989)
-- Name: red; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.red (
    "ID" integer NOT NULL,
    cidr cidr NOT NULL,
    vlan integer,
    dns inet,
    gateway inet,
    fecha_alta date,
    activa boolean DEFAULT true NOT NULL,
    dhcp inet,
    observacion text,
    tipo character varying(30),
    hostname character varying(30),
    CONSTRAINT red_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['admin'::character varying, 'publica'::character varying, 'privada'::character varying, 'vip'::character varying, 'loopback'::character varying])::text[])))
);


ALTER TABLE public.red OWNER TO "Comfe_owner";

--
-- TOC entry 227 (class 1259 OID 2383988)
-- Name: red_ID_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public."red_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."red_ID_seq" OWNER TO "Comfe_owner";

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 227
-- Name: red_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public."red_ID_seq" OWNED BY public.red."ID";


--
-- TOC entry 222 (class 1259 OID 2342951)
-- Name: responsable; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.responsable (
    "ID" integer NOT NULL,
    nombre character varying(20),
    telefono character varying(20),
    email character varying(20)
);


ALTER TABLE public.responsable OWNER TO "Comfe_owner";

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE responsable; Type: COMMENT; Schema: public; Owner: Comfe_owner
--

COMMENT ON TABLE public.responsable IS 'responsable del equipo';


--
-- TOC entry 221 (class 1259 OID 2342950)
-- Name: responsable_ID_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public."responsable_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."responsable_ID_seq" OWNER TO "Comfe_owner";

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 221
-- Name: responsable_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public."responsable_ID_seq" OWNED BY public.responsable."ID";


--
-- TOC entry 230 (class 1259 OID 2384015)
-- Name: servicios; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.servicios (
    "ID" integer NOT NULL,
    fecha_instalacion timestamp with time zone DEFAULT now(),
    ruta_bin text,
    ruta_conf text,
    fecha_actualizacion timestamp with time zone,
    activo boolean DEFAULT true,
    version character varying(20),
    estado character varying(12),
    CONSTRAINT servicios_estado_check CHECK (((estado)::text = ANY ((ARRAY['running'::character varying, 'stop'::character varying, 'maintenance'::character varying, 'failed'::character varying, 'unknown'::character varying])::text[])))
);


ALTER TABLE public.servicios OWNER TO "Comfe_owner";

--
-- TOC entry 229 (class 1259 OID 2384014)
-- Name: servicios_ID_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public."servicios_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."servicios_ID_seq" OWNER TO "Comfe_owner";

--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 229
-- Name: servicios_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public."servicios_ID_seq" OWNED BY public.servicios."ID";


--
-- TOC entry 238 (class 1259 OID 2433025)
-- Name: servidores; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.servidores (
    id integer NOT NULL,
    almacenamiento_id integer,
    lugar_id integer,
    modelo_id integer,
    rack_id integer,
    ram_id integer,
    red_id integer NOT NULL,
    responsable_id integer NOT NULL,
    serervicios_id integer NOT NULL,
    sistemas_operativos_id integer NOT NULL
);


ALTER TABLE public.servidores OWNER TO "Comfe_owner";

--
-- TOC entry 237 (class 1259 OID 2433024)
-- Name: servidores_id_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.servidores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servidores_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 237
-- Name: servidores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.servidores_id_seq OWNED BY public.servidores.id;


--
-- TOC entry 236 (class 1259 OID 2400257)
-- Name: sistemas_operativos; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.sistemas_operativos (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    version character varying(30) NOT NULL,
    arquitectura character varying(10),
    edicion character varying(30),
    fecha_lanzamiento date,
    fecha_fin_soporte date,
    ciclo_actualizacion character varying(20),
    licencia character varying(15),
    soporte_extendido boolean DEFAULT false,
    observaciones text,
    CONSTRAINT sistemas_operativos_arquitectura_check CHECK (((arquitectura)::text = ANY ((ARRAY['x86'::character varying, 'x64'::character varying, 'ARM'::character varying, 'ARM64'::character varying])::text[]))),
    CONSTRAINT sistemas_operativos_licencia_check CHECK (((licencia)::text = ANY ((ARRAY['GPL'::character varying, 'Commercial'::character varying, 'OEM'::character varying, 'Subscription'::character varying])::text[])))
);


ALTER TABLE public.sistemas_operativos OWNER TO "Comfe_owner";

--
-- TOC entry 235 (class 1259 OID 2400256)
-- Name: sistemas_operativos_id_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.sistemas_operativos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sistemas_operativos_id_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 235
-- Name: sistemas_operativos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.sistemas_operativos_id_seq OWNED BY public.sistemas_operativos.id;


--
-- TOC entry 3249 (class 2604 OID 2392100)
-- Name: almacenamiento id; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.almacenamiento ALTER COLUMN id SET DEFAULT nextval('public.almacenamiento_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 2342961)
-- Name: contratista ID; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.contratista ALTER COLUMN "ID" SET DEFAULT nextval('public."contratista_ID_seq"'::regclass);


--
-- TOC entry 3240 (class 2604 OID 2383949)
-- Name: gpu ID; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.gpu ALTER COLUMN "ID" SET DEFAULT nextval('public."gpu_ID_seq"'::regclass);


--
-- TOC entry 3236 (class 2604 OID 2342938)
-- Name: lugar ID; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.lugar ALTER COLUMN "ID" SET DEFAULT nextval('public."lugar_ID_seq"'::regclass);


--
-- TOC entry 3235 (class 2604 OID 2342931)
-- Name: modelo ID; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.modelo ALTER COLUMN "ID" SET DEFAULT nextval('public."modelo_ID_seq"'::regclass);


--
-- TOC entry 3237 (class 2604 OID 2342947)
-- Name: rack ID; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.rack ALTER COLUMN "ID" SET DEFAULT nextval('public."rack_ID_seq"'::regclass);


--
-- TOC entry 3246 (class 2604 OID 2392075)
-- Name: ram id; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.ram ALTER COLUMN id SET DEFAULT nextval('public.ram_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 2383992)
-- Name: red ID; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.red ALTER COLUMN "ID" SET DEFAULT nextval('public."red_ID_seq"'::regclass);


--
-- TOC entry 3238 (class 2604 OID 2342954)
-- Name: responsable ID; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.responsable ALTER COLUMN "ID" SET DEFAULT nextval('public."responsable_ID_seq"'::regclass);


--
-- TOC entry 3243 (class 2604 OID 2384018)
-- Name: servicios ID; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.servicios ALTER COLUMN "ID" SET DEFAULT nextval('public."servicios_ID_seq"'::regclass);


--
-- TOC entry 3252 (class 2604 OID 2433028)
-- Name: servidores id; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.servidores ALTER COLUMN id SET DEFAULT nextval('public.servidores_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 2400260)
-- Name: sistemas_operativos id; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.sistemas_operativos ALTER COLUMN id SET DEFAULT nextval('public.sistemas_operativos_id_seq'::regclass);


--
-- TOC entry 3459 (class 0 OID 2392097)
-- Dependencies: 234
-- Data for Name: almacenamiento; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.almacenamiento (id, serial, marca, modelo, tipo, factor_de_forma, interfaz, capacidad_gb, velocidad_rpm, velocidad_mb_s, tbw, fecha_compra, fecha_garantia, estado) FROM stdin;
1	WD-WCC4E6XXXXX	Western Digital	Ultrastar DC HC550	HDD	3.5"	SATA-III	18000.00	7200	\N	\N	2023-05-10	2026-05-10	activo
2	ST2000NM0033	Seagate	IronWolf Pro	HDD	3.5"	SATA-III	2000.00	7200	\N	\N	2024-01-15	2027-01-15	activo
3	SAMSUNG-MZVLB1T0	Samsung	PM981	NVMe	M.2	NVMe-PCIe3x4	1024.00	\N	3500	600	2023-08-20	2026-08-20	activo
4	KIOX-KXG60ZNV1T02	Kioxia	XG6	NVMe	M.2	NVMe-PCIe3x4	1024.00	\N	3180	400	2023-11-05	2026-11-05	reserva
5	INTEL-SSDPE2KX020T8	Intel	D7-P5510	SSD	U.2	NVMe-PCIe4x4	2048.00	\N	7000	3650	2024-02-01	2027-02-01	activo
6	MICRON-MTFDKBA960TFR	Micron	7300 Pro	SSD	U.2	NVMe-PCIe3x4	960.00	\N	3000	1650	2023-06-12	2026-06-12	activo
7	SEAG-ST8000NM017B	Seagate	Exos 7E8	HDD	3.5"	SATA-III	8000.00	7200	\N	\N	2023-09-30	2026-09-30	retirado
8	SAMSUNG-MZ7LH960	Samsung	PM883	SSD	2.5"	SATA-III	960.00	\N	550	1366	2023-04-25	2026-04-25	activo
9	TOSHIBA-HDWG11C	Toshiba	N300	HDD	3.5"	SATA-III	4000.00	7200	\N	\N	2023-12-03	2026-12-03	rma
10	WDC-WUS4C6432DSP	Western Digital	Ultrastar DC SN640	SSD	U.2	NVMe-PCIe3x4	3840.00	\N	3100	5460	2024-03-18	2027-03-18	activo
\.


--
-- TOC entry 3449 (class 0 OID 2342958)
-- Dependencies: 224
-- Data for Name: contratista; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.contratista ("ID", razon_social, servicio, nit) FROM stdin;
1	Segurimax SRL	seguridad	1234567890
2	ElectroMant SAS	mantenimiento electrico	2345678901
3	ClimaPlus Ltda	aire	3456789012
4	MultiServicios SA	otros	4567890123
5	VigilTotal EIRL	seguridad	5678901234
6	PowerFix SpA	mantenimiento electrico	6789012345
7	AirControl SRL	aire	7890123456
8	SupportGlobal SRL	otros	8901234567
9	SegurPro SRL	seguridad	9012345678
10	ElectroCare Ltda	mantenimiento electrico	1023456789
\.


--
-- TOC entry 3451 (class 0 OID 2383946)
-- Dependencies: 226
-- Data for Name: gpu; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.gpu ("ID", modelo, "TPU", memoria) FROM stdin;
\.


--
-- TOC entry 3443 (class 0 OID 2342935)
-- Dependencies: 218
-- Data for Name: lugar; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.lugar ("ID", direccion, coordenada, videovigilancia, climatizacion) FROM stdin;
1	{"calle":"Av. Siempre Viva 123","ciudad":"Springfield","pais":"USA"}	{"lat":39.7817,"lng":-89.6501}	t	t
2	{"calle":"Calle 50 # 10-20","ciudad":"Bogotá","pais":"Colombia"}	{"lat":4.711,"lng":-74.0721}	t	t
3	{"calle":"Paseo de la Reforma 500","ciudad":"Ciudad de México","pais":"México"}	{"lat":19.4326,"lng":-99.1332}	t	t
4	{"calle":"Rua Augusta 1000","ciudad":"São Paulo","pais":"Brasil"}	{"lat":-23.5505,"lng":-46.6333}	t	f
5	{"calle":"Via Roma 15","ciudad":"Milano","pais":"Italia"}	{"lat":45.4642,"lng":9.1900}	f	t
6	{"calle":"1 Queen Victoria St","ciudad":"Londres","pais":"Reino Unido"}	{"lat":51.5074,"lng":-0.1278}	t	t
7	{"calle":"Calle Mayor 8","ciudad":"Madrid","pais":"España"}	{"lat":40.4168,"lng":-3.7038}	t	t
8	{"calle":"Ulitsa Tverskaya 13","ciudad":"Moscú","pais":"Rusia"}	{"lat":55.7558,"lng":37.6176}	f	f
9	{"calle":"Kurfürstendamm 200","ciudad":"Berlín","pais":"Alemania"}	{"lat":52.5200,"lng":13.4050}	t	t
10	{"calle":"Avenida 9 de Julio 500","ciudad":"Buenos Aires","pais":"Argentina"}	{"lat":-34.6037,"lng":-58.3816}	t	t
\.


--
-- TOC entry 3441 (class 0 OID 2342928)
-- Dependencies: 216
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.modelo ("ID", fabricante, marca, modelo, serial, factor_de_forma, "RAM", almacenamiento, red) FROM stdin;
1	Dell	PowerEdge	R740	SN-DR740-001	Rack 2U	8	RAID-5 1TB SSD	4×1 GbE
2	HP	ProLiant	DL380 Gen10	SN-DL380-002	Rack 2U	16	RAID-6 2TB SAS	2×10 GbE
3	Lenovo	ThinkSystem	SR650	SN-SR650-003	Rack 1U	32	RAID-10 500GB NVMe	2×25 GbE
4	Supermicro	SuperServer	2029P	SN-2029P-004	Rack 1U	4	RAID-1 960GB SATA	4×1 GbE
5	Cisco	UCS	C220 M5	SN-C220M5-005	Rack 1U	64	RAID-5 1.2TB SAS	2×10 GbE
6	Dell	PowerEdge	R740	DELL-R740-001	Rack 2U	8	RAID-5 1TB SSD	4×1 GbE
7	HP	ProLiant	DL380 Gen10	HP-DL380-002	Rack 2U	16	RAID-6 2TB SAS	2×10 GbE
8	Lenovo	ThinkSystem	SR650	LEN-SR650-003	Rack 1U	32	RAID-10 500GB NVMe	2×25 GbE
9	Supermicro	SuperServer	2029P	SM-2029P-004	Rack 1U	4	RAID-1 960GB SATA	4×1 GbE
10	Cisco	UCS	C220 M5	CSC-C220M5-005	Rack 1U	64	RAID-5 1.2TB SAS	2×10 GbE
11	HPE	Apollo	4200	HPE-APL-420-006	Rack 2U	24	RAID-6 4TB SATA	2×25 GbE
12	Fujitsu	PRIMERGY	RX2540	FJ-RX2540-007	Rack 2U	12	RAID-5 2TB SSD	4×10 GbE
13	Oracle	SPARC	T8-1	ORA-T8-1-008	Rack 1U	32	RAID-10 1TB NVMe	2×10 GbE
14	Inspur	NF5280M5	NF5280	INS-NF5280-009	Rack 2U	48	RAID-50 3TB SAS	2×25 GbE
15	Quanta	QuantaGrid	D52B-1U	QNT-D52B-010	Rack 1U	16	RAID-1 1TB SSD	4×1 GbE
\.


--
-- TOC entry 3445 (class 0 OID 2342944)
-- Dependencies: 220
-- Data for Name: rack; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.rack ("ID", fila, "UPS") FROM stdin;
1	5	t
2	10	t
3	12	t
4	12	t
5	10	t
\.


--
-- TOC entry 3457 (class 0 OID 2392072)
-- Dependencies: 232
-- Data for Name: ram; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.ram (id, marca, modelo, capacidad_gb, velocidad_mhz, tipo, factor_forma, numero_modulos, ecc, voltaje, fecha_compra, estado, serial) FROM stdin;
1	Kingston	KVR24R17D8/16	16.00	2400	DDR4	RDIMM	1	t	1.20	2023-02-15	activo	KST-RDIMM-2400-001
2	Corsair	CMK32GX4M2E3200	32.00	3200	DDR4	DIMM	2	f	1.35	2023-05-10	activo	COR-DIMM-3200-002
3	Crucial	CT16G4DFD8266	16.00	2666	DDR4	DIMM	1	f	1.20	2022-11-03	reserva	CRU-DIMM-2666-003
4	Samsung	M393A2K43BB1	16.00	2133	DDR4	RDIMM	1	t	1.20	2023-01-20	activo	SAM-RDIMM-2133-004
5	Hynix	HMA81GR7CJR8N	8.00	2666	DDR4	RDIMM	1	t	1.20	2023-07-12	activo	HYN-RDIMM-2666-005
6	Micron	MTA8ATF1G64HZ	8.00	3200	DDR4	SODIMM	1	f	1.10	2023-04-05	activo	MIC-SODIMM-3200-006
7	G.Skill	F4-3200C16D-32	32.00	3200	DDR4	DIMM	2	f	1.35	2024-03-18	activo	GS-DIMM-3200-007
8	Kingston	KVR26N19S8/8	8.00	2666	DDR4	SODIMM	1	f	1.20	2023-09-22	retirado	KST-SODIMM-2666-008
9	Samsung	M474A1K43DB1	8.00	2666	DDR4	SODIMM	1	f	1.20	2023-06-30	rma	SAM-SODIMM-2666-009
10	Crucial	CT8G4DFS8266	8.00	2666	DDR4	DIMM	1	f	1.20	2023-10-11	activo	CRU-DIMM-2666-010
\.


--
-- TOC entry 3453 (class 0 OID 2383989)
-- Dependencies: 228
-- Data for Name: red; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.red ("ID", cidr, vlan, dns, gateway, fecha_alta, activa, dhcp, observacion, tipo, hostname) FROM stdin;
1	10.0.1.0/24	10	8.8.8.8	10.0.1.1	2023-01-15	t	\N	\N	\N	\N
2	172.16.1.0/24	20	1.1.1.1	172.16.1.1	2023-02-01	t	\N	\N	\N	\N
3	192.168.10.0/24	30	8.8.4.4	192.168.10.1	2023-02-10	t	\N	\N	\N	\N
4	10.0.2.0/24	40	8.8.8.8	10.0.2.1	2023-03-05	t	\N	\N	\N	\N
5	192.168.20.0/24	50	\N	192.168.20.1	2023-03-20	t	\N	\N	\N	\N
6	192.168.30.0/24	60	208.67.222.222	192.168.30.1	2023-04-01	t	\N	\N	\N	\N
7	10.0.3.0/24	70	8.8.8.8	10.0.3.1	2023-04-15	t	\N	\N	\N	\N
8	172.16.2.0/24	80	9.9.9.9	172.16.2.1	2023-05-01	t	\N	\N	\N	\N
9	192.168.40.0/24	90	\N	192.168.40.1	2023-05-10	t	\N	\N	\N	\N
10	10.10.10.0/24	100	8.8.4.4	10.10.10.1	2023-06-01	t	\N	\N	\N	\N
11	10.0.1.0/24	10	8.8.8.8	10.0.1.1	2023-01-15	t	10.0.1.50	Red corporativa de producción	privada	lan-prd
12	172.16.1.0/24	20	1.1.1.1	172.16.1.1	2023-02-01	t	\N	Zona desmilitarizada web	publica	dmz-web
13	192.168.10.0/24	30	8.8.4.4	192.168.10.1	2023-02-10	t	\N	Gestión iDRAC/IPMI	admin	mgmt-ipmi
14	10.0.2.0/24	40	8.8.8.8	10.0.2.1	2023-03-05	t	10.0.2.100	Laboratorio de desarrollo	privada	dev-lab
15	192.168.20.0/24	50	\N	192.168.20.1	2023-03-20	t	\N	Almacenamiento iSCSI	admin	san-iscsi
16	10.0.3.0/24	60	208.67.222.222	10.0.3.1	2023-04-01	t	10.0.3.50	Wi-Fi corporativo invitados	publica	guest-wifi
17	172.16.2.0/24	70	9.9.9.9	172.16.2.1	2023-05-01	t	\N	DMZ de pruebas	publica	dmz-test
18	192.168.30.0/24	80	\N	192.168.30.1	2023-05-10	t	\N	Red de backups	admin	backup-net
19	10.0.4.0/24	90	8.8.8.8	10.0.4.1	2023-06-01	t	\N	Loopback interno	loopback	loop-int
20	10.0.1.254/32	\N	8.8.4.4	10.0.1.254	2023-06-05	t	\N	IP virtual balanceador	vip	vip-lb
\.


--
-- TOC entry 3447 (class 0 OID 2342951)
-- Dependencies: 222
-- Data for Name: responsable; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.responsable ("ID", nombre, telefono, email) FROM stdin;
1	Ana López	555-1234	ana.lopez@corp
2	Carlos Ruiz	555-2345	carlos.ruiz@corp
3	María García	555-3456	maria.garcia@corp
4	Luis Fernández	555-4567	luis.fer@corp
5	Sofía Martínez	555-5678	sofia.m@corp
6	Juan Pérez	555-6789	juan.perez@corp
7	Lucía Gómez	555-7890	lucia.gomez@corp
8	Miguel Sánchez	555-8901	miguel.s@corp
9	Elena Díaz	555-9012	elena.diaz@corp
10	Diego Herrera	555-0123	diego.h@corp
\.


--
-- TOC entry 3455 (class 0 OID 2384015)
-- Dependencies: 230
-- Data for Name: servicios; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.servicios ("ID", fecha_instalacion, ruta_bin, ruta_conf, fecha_actualizacion, activo, version, estado) FROM stdin;
1	2025-08-18 03:07:16.845849+00	/usr/sbin/nginx	/etc/nginx/nginx.conf	2025-08-18 03:07:16.845849+00	t	1.24.0	running
2	2025-08-17 03:07:16.845849+00	/usr/bin/postgresql	/var/lib/pgsql/data/postgresql.conf	2025-08-18 03:07:16.845849+00	t	15.3	running
3	2025-08-16 03:07:16.845849+00	/usr/bin/redis-server	/etc/redis/redis.conf	2025-08-18 03:07:16.845849+00	t	7.0.12	running
4	2025-08-15 03:07:16.845849+00	/usr/sbin/httpd	/etc/httpd/conf/httpd.conf	2025-08-18 03:07:16.845849+00	t	2.4.57	running
5	2025-08-14 03:07:16.845849+00	/usr/sbin/mysqld	/etc/my.cnf	2025-08-18 03:07:16.845849+00	t	8.0.34	running
6	2025-08-13 03:07:16.845849+00	/usr/bin/dockerd	/etc/docker/daemon.json	2025-08-18 03:07:16.845849+00	t	24.0.2	running
7	2025-08-12 03:07:16.845849+00	/usr/local/bin/node	/app/config.json	2025-08-18 03:07:16.845849+00	t	18.16.1	running
8	2025-08-11 03:07:16.845849+00	/usr/bin/ssh	/etc/ssh/sshd_config	2025-08-18 03:07:16.845849+00	t	8.9p1	running
9	2025-08-10 03:07:16.845849+00	/usr/bin/prometheus	/etc/prometheus/prometheus.yml	2025-08-18 03:07:16.845849+00	t	2.44.0	running
10	2025-08-09 03:07:16.845849+00	/usr/bin/ntpd	/etc/ntp.conf	2025-08-18 03:07:16.845849+00	t	4.2.8p15	running
\.


--
-- TOC entry 3463 (class 0 OID 2433025)
-- Dependencies: 238
-- Data for Name: servidores; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.servidores (id, almacenamiento_id, lugar_id, modelo_id, rack_id, ram_id, red_id, responsable_id, serervicios_id, sistemas_operativos_id) FROM stdin;
\.


--
-- TOC entry 3461 (class 0 OID 2400257)
-- Dependencies: 236
-- Data for Name: sistemas_operativos; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.sistemas_operativos (id, nombre, version, arquitectura, edicion, fecha_lanzamiento, fecha_fin_soporte, ciclo_actualizacion, licencia, soporte_extendido, observaciones) FROM stdin;
25	Windows Server	2022	x64	Datacenter	2021-08-18	2031-10-14	LTS	Commercial	f	Incluye licencia por core
26	Windows Server	2019	x64	Standard	2018-10-02	2029-01-09	LTS	Commercial	f	Soporte extendido hasta 2034
27	Ubuntu	22.04 LTS	x64	Server	2022-04-21	2027-04-21	LTS	GPL	f	APT + snap packages
28	Ubuntu	20.04 LTS	x64	Desktop	2020-04-23	2025-04-23	LTS	GPL	f	Long-term support option
29	CentOS Stream	9	x64	Server	2021-12-03	2027-05-31	Rolling	GPL	f	Upstream de RHEL 9
30	Debian	12 (Bookworm)	x64	Server	2023-06-10	2026-06-10	LTS	GPL	f	Sin costo, repositorios amplios
31	Red Hat	9.2	x64	Server	2023-05-10	2032-05-31	LTS	Subscription	f	RHEL 9.2 con soporte 10 años
32	Oracle Linux	9	x64	Server	2022-07-06	2032-06-30	LTS	Commercial	f	Compatible con RHEL 9
33	Rocky Linux	9.2	ARM64	Server	2023-05-15	2032-05-31	LTS	GPL	f	Reemplazo 1:1 de CentOS
34	SUSE Linux	15 SP5	x64	Server	2023-06-20	2028-07-31	LTS	Subscription	f	SLES con soporte comercial
\.


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 233
-- Name: almacenamiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.almacenamiento_id_seq', 10, true);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 223
-- Name: contratista_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public."contratista_ID_seq"', 10, true);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 225
-- Name: gpu_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public."gpu_ID_seq"', 1, false);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 217
-- Name: lugar_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public."lugar_ID_seq"', 10, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 215
-- Name: modelo_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public."modelo_ID_seq"', 15, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 219
-- Name: rack_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public."rack_ID_seq"', 5, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 231
-- Name: ram_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.ram_id_seq', 10, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 227
-- Name: red_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public."red_ID_seq"', 20, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 221
-- Name: responsable_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public."responsable_ID_seq"', 10, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 229
-- Name: servicios_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public."servicios_ID_seq"', 10, true);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 237
-- Name: servidores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.servidores_id_seq', 1, false);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 235
-- Name: sistemas_operativos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.sistemas_operativos_id_seq', 34, true);


--
-- TOC entry 3287 (class 2606 OID 2392104)
-- Name: almacenamiento almacenamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.almacenamiento
    ADD CONSTRAINT almacenamiento_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 2392106)
-- Name: almacenamiento almacenamiento_serial_key; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.almacenamiento
    ADD CONSTRAINT almacenamiento_serial_key UNIQUE (serial);


--
-- TOC entry 3275 (class 2606 OID 2342965)
-- Name: contratista contratista_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.contratista
    ADD CONSTRAINT contratista_pkey PRIMARY KEY ("ID");


--
-- TOC entry 3277 (class 2606 OID 2383951)
-- Name: gpu gpu_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.gpu
    ADD CONSTRAINT gpu_pkey PRIMARY KEY ("ID");


--
-- TOC entry 3267 (class 2606 OID 2342942)
-- Name: lugar lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.lugar
    ADD CONSTRAINT lugar_pkey PRIMARY KEY ("ID");


--
-- TOC entry 3263 (class 2606 OID 2342933)
-- Name: modelo modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY ("ID");


--
-- TOC entry 3265 (class 2606 OID 2441219)
-- Name: modelo modelo_serial_unique; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_serial_unique UNIQUE (serial);


--
-- TOC entry 3269 (class 2606 OID 2342949)
-- Name: rack rack_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.rack
    ADD CONSTRAINT rack_pkey PRIMARY KEY ("ID");


--
-- TOC entry 3283 (class 2606 OID 2392082)
-- Name: ram ram_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.ram
    ADD CONSTRAINT ram_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 2392084)
-- Name: ram ram_serial_key; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.ram
    ADD CONSTRAINT ram_serial_key UNIQUE (serial);


--
-- TOC entry 3279 (class 2606 OID 2383996)
-- Name: red red_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.red
    ADD CONSTRAINT red_pkey PRIMARY KEY ("ID");


--
-- TOC entry 3271 (class 2606 OID 2441217)
-- Name: responsable responsable_nombre_unique; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_nombre_unique UNIQUE (nombre);


--
-- TOC entry 3273 (class 2606 OID 2342956)
-- Name: responsable responsable_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_pkey PRIMARY KEY ("ID");


--
-- TOC entry 3281 (class 2606 OID 2384024)
-- Name: servicios servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY ("ID");


--
-- TOC entry 3296 (class 2606 OID 2433030)
-- Name: servidores servidores_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.servidores
    ADD CONSTRAINT servidores_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 2400267)
-- Name: sistemas_operativos sistemas_operativos_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.sistemas_operativos
    ADD CONSTRAINT sistemas_operativos_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 1259 OID 2400270)
-- Name: idx_so_fin_soporte; Type: INDEX; Schema: public; Owner: Comfe_owner
--

CREATE INDEX idx_so_fin_soporte ON public.sistemas_operativos USING btree (fecha_fin_soporte);


--
-- TOC entry 3291 (class 1259 OID 2400268)
-- Name: idx_so_nombre; Type: INDEX; Schema: public; Owner: Comfe_owner
--

CREATE INDEX idx_so_nombre ON public.sistemas_operativos USING btree (nombre);


--
-- TOC entry 3292 (class 1259 OID 2400269)
-- Name: idx_so_version; Type: INDEX; Schema: public; Owner: Comfe_owner
--

CREATE INDEX idx_so_version ON public.sistemas_operativos USING btree (version);


--
-- TOC entry 2094 (class 826 OID 1982467)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2093 (class 826 OID 1982466)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2025-08-20 21:02:47

--
-- PostgreSQL database dump complete
--

