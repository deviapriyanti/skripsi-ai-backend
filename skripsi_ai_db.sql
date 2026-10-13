--
-- PostgreSQL database dump
--

\restrict eGSrQeDKhI9GwLjQGK1wtwdLWHcsNMMXAU7iha7O4k7BjsozepLIbgMGcqsolIS

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-13 16:44:09

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 20436)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration bigint NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 20447)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration bigint NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 20489)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection character varying(255) NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 20488)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 229
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 246 (class 1259 OID 20641)
-- Name: generations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.generations (
    id_generate bigint NOT NULL,
    id_session bigint NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.generations OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 20640)
-- Name: generations_id_generate_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.generations_id_generate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.generations_id_generate_seq OWNER TO postgres;

--
-- TOC entry 5218 (class 0 OID 0)
-- Dependencies: 245
-- Name: generations_id_generate_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.generations_id_generate_seq OWNED BY public.generations.id_generate;


--
-- TOC entry 252 (class 1259 OID 20731)
-- Name: histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.histories (
    id_history bigint NOT NULL,
    user_id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    category character varying(255) NOT NULL,
    jurusan character varying(255),
    reference_type character varying(255),
    reference_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.histories OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 20730)
-- Name: histories_id_history_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.histories_id_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.histories_id_history_seq OWNER TO postgres;

--
-- TOC entry 5219 (class 0 OID 0)
-- Dependencies: 251
-- Name: histories_id_history_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.histories_id_history_seq OWNED BY public.histories.id_history;


--
-- TOC entry 228 (class 1259 OID 20474)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 20459)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 20458)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 226
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 220 (class 1259 OID 20398)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 20397)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 242 (class 1259 OID 20592)
-- Name: paraphrase_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paraphrase_requests (
    id_paraphrase bigint NOT NULL,
    id_user bigint NOT NULL,
    original_text text NOT NULL,
    paraphrase_text text NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.paraphrase_requests OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 20591)
-- Name: paraphrase_requests_id_paraphrase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paraphrase_requests_id_paraphrase_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paraphrase_requests_id_paraphrase_seq OWNER TO postgres;

--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 241
-- Name: paraphrase_requests_id_paraphrase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paraphrase_requests_id_paraphrase_seq OWNED BY public.paraphrase_requests.id_paraphrase;


--
-- TOC entry 223 (class 1259 OID 20427)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 20682)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name text NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 20681)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 249
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 232 (class 1259 OID 20509)
-- Name: plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plans (
    id_plan integer NOT NULL,
    name_plan character varying(100) NOT NULL,
    token_quota integer NOT NULL,
    price numeric(10,2) NOT NULL,
    duration integer,
    description text,
    features json
);


ALTER TABLE public.plans OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 20508)
-- Name: plans_id_plan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plans_id_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plans_id_plan_seq OWNER TO postgres;

--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 231
-- Name: plans_id_plan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plans_id_plan_seq OWNED BY public.plans.id_plan;


--
-- TOC entry 244 (class 1259 OID 20612)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id_session bigint NOT NULL,
    id_user bigint NOT NULL,
    id_role integer NOT NULL,
    id_style integer NOT NULL,
    thesis_title character varying(255),
    research_topic text NOT NULL,
    research_detail text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 20611)
-- Name: sessions_id_session_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_session_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sessions_id_session_seq OWNER TO postgres;

--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 243
-- Name: sessions_id_session_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_session_seq OWNED BY public.sessions.id_session;


--
-- TOC entry 234 (class 1259 OID 20520)
-- Name: study_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.study_roles (
    id_role integer NOT NULL,
    name_role character varying(100) NOT NULL,
    description text,
    system_prompt text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.study_roles OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 20519)
-- Name: study_roles_id_role_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.study_roles_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.study_roles_id_role_seq OWNER TO postgres;

--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 233
-- Name: study_roles_id_role_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.study_roles_id_role_seq OWNED BY public.study_roles.id_role;


--
-- TOC entry 238 (class 1259 OID 20548)
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id_subscription bigint NOT NULL,
    id_user bigint NOT NULL,
    id_plan integer NOT NULL,
    status character varying(255) DEFAULT 'Active'::character varying NOT NULL,
    expired_at timestamp(0) without time zone NOT NULL,
    CONSTRAINT subscriptions_status_check CHECK (((status)::text = ANY ((ARRAY['Active'::character varying, 'Expired'::character varying, 'Cancelled'::character varying])::text[])))
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 20547)
-- Name: subscriptions_id_subscription_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriptions_id_subscription_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscriptions_id_subscription_seq OWNER TO postgres;

--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 237
-- Name: subscriptions_id_subscription_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriptions_id_subscription_seq OWNED BY public.subscriptions.id_subscription;


--
-- TOC entry 248 (class 1259 OID 20657)
-- Name: title_recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.title_recommendations (
    id_title bigint NOT NULL,
    id_generate bigint NOT NULL,
    title text NOT NULL,
    explanation text NOT NULL
);


ALTER TABLE public.title_recommendations OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 20656)
-- Name: title_recommendations_id_title_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.title_recommendations_id_title_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.title_recommendations_id_title_seq OWNER TO postgres;

--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 247
-- Name: title_recommendations_id_title_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.title_recommendations_id_title_seq OWNED BY public.title_recommendations.id_title;


--
-- TOC entry 240 (class 1259 OID 20572)
-- Name: token_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token_transactions (
    id_transaction bigint NOT NULL,
    id_user bigint NOT NULL,
    transaction_type character varying(255) NOT NULL,
    feature_tag character varying(100),
    amount integer NOT NULL,
    balance_after integer NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT token_transactions_transaction_type_check CHECK (((transaction_type)::text = ANY ((ARRAY['Debit'::character varying, 'Credit'::character varying])::text[])))
);


ALTER TABLE public.token_transactions OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 20571)
-- Name: token_transactions_id_transaction_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.token_transactions_id_transaction_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.token_transactions_id_transaction_seq OWNER TO postgres;

--
-- TOC entry 5229 (class 0 OID 0)
-- Dependencies: 239
-- Name: token_transactions_id_transaction_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.token_transactions_id_transaction_seq OWNED BY public.token_transactions.id_transaction;


--
-- TOC entry 222 (class 1259 OID 20408)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_user bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    login_provider character varying(255) DEFAULT 'Email'::character varying NOT NULL,
    token_balance integer DEFAULT 250 NOT NULL,
    profile_photo_path character varying(255),
    university character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role character varying(255) DEFAULT 'user'::character varying NOT NULL,
    id_role bigint,
    CONSTRAINT users_login_provider_check CHECK (((login_provider)::text = ANY ((ARRAY['Email'::character varying, 'Google'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 20407)
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_user_seq OWNER TO postgres;

--
-- TOC entry 5230 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;


--
-- TOC entry 236 (class 1259 OID 20534)
-- Name: writing_styles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.writing_styles (
    id_style integer NOT NULL,
    name_style character varying(100) NOT NULL,
    description text,
    instruction text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.writing_styles OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 20533)
-- Name: writing_styles_id_style_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.writing_styles_id_style_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.writing_styles_id_style_seq OWNER TO postgres;

--
-- TOC entry 5231 (class 0 OID 0)
-- Dependencies: 235
-- Name: writing_styles_id_style_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.writing_styles_id_style_seq OWNED BY public.writing_styles.id_style;


--
-- TOC entry 4948 (class 2604 OID 20492)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 4962 (class 2604 OID 20644)
-- Name: generations id_generate; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generations ALTER COLUMN id_generate SET DEFAULT nextval('public.generations_id_generate_seq'::regclass);


--
-- TOC entry 4966 (class 2604 OID 20734)
-- Name: histories id_history; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories ALTER COLUMN id_history SET DEFAULT nextval('public.histories_id_history_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 20462)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 20401)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4959 (class 2604 OID 20595)
-- Name: paraphrase_requests id_paraphrase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paraphrase_requests ALTER COLUMN id_paraphrase SET DEFAULT nextval('public.paraphrase_requests_id_paraphrase_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 20685)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 20512)
-- Name: plans id_plan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans ALTER COLUMN id_plan SET DEFAULT nextval('public.plans_id_plan_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 20615)
-- Name: sessions id_session; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id_session SET DEFAULT nextval('public.sessions_id_session_seq'::regclass);


--
-- TOC entry 4951 (class 2604 OID 20523)
-- Name: study_roles id_role; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_roles ALTER COLUMN id_role SET DEFAULT nextval('public.study_roles_id_role_seq'::regclass);


--
-- TOC entry 4955 (class 2604 OID 20551)
-- Name: subscriptions id_subscription; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id_subscription SET DEFAULT nextval('public.subscriptions_id_subscription_seq'::regclass);


--
-- TOC entry 4964 (class 2604 OID 20660)
-- Name: title_recommendations id_title; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title_recommendations ALTER COLUMN id_title SET DEFAULT nextval('public.title_recommendations_id_title_seq'::regclass);


--
-- TOC entry 4957 (class 2604 OID 20575)
-- Name: token_transactions id_transaction; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_transactions ALTER COLUMN id_transaction SET DEFAULT nextval('public.token_transactions_id_transaction_seq'::regclass);


--
-- TOC entry 4943 (class 2604 OID 20411)
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);


--
-- TOC entry 4953 (class 2604 OID 20537)
-- Name: writing_styles id_style; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.writing_styles ALTER COLUMN id_style SET DEFAULT nextval('public.writing_styles_id_style_seq'::regclass);


--
-- TOC entry 5183 (class 0 OID 20436)
-- Dependencies: 224
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
laravel-cache-livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer	i:1791547099;	1791547099
laravel-cache-livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3	i:1;	1791547099
\.


--
-- TOC entry 5184 (class 0 OID 20447)
-- Dependencies: 225
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- TOC entry 5189 (class 0 OID 20489)
-- Dependencies: 230
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 5205 (class 0 OID 20641)
-- Dependencies: 246
-- Data for Name: generations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.generations (id_generate, id_session, created_at) FROM stdin;
\.


--
-- TOC entry 5211 (class 0 OID 20731)
-- Dependencies: 252
-- Data for Name: histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.histories (id_history, user_id, title, description, category, jurusan, reference_type, reference_id, created_at, updated_at) FROM stdin;
1	3	Parafrase Teks (formal)	"1"	Parafrase (formal)	Informatika	Paraphrase	6	2026-10-13 09:13:24	2026-10-13 09:13:24
2	3	Parafrase Teks (formal)	"abcdefghijklmnopqrstuvwxyz"	Parafrase (formal)	Informatika	Paraphrase	7	2026-10-13 09:14:17	2026-10-13 09:14:17
3	3	Top-Up 50 Token Berhasil	Pembelian 50 token via pembayaran QRIS.	Top Up Token	\N	Transaction	\N	2026-10-13 09:14:34	2026-10-13 09:14:34
\.


--
-- TOC entry 5187 (class 0 OID 20474)
-- Dependencies: 228
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- TOC entry 5186 (class 0 OID 20459)
-- Dependencies: 227
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- TOC entry 5179 (class 0 OID 20398)
-- Dependencies: 220
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2026_09_17_000001_create_plans_table	1
5	2026_09_17_000002_create_study_roles_table	1
6	2026_09_17_000003_create_writing_styles_table	1
7	2026_09_17_000004_create_subscriptions_table	1
8	2026_09_17_000005_create_token_transactions_table	1
9	2026_09_17_000006_create_paraphrase_requests_table	1
10	2026_09_17_000007_create_sessions_table	1
11	2026_09_17_000008_create_generations_table	1
12	2026_09_17_000009_create_title_recommendations_table	1
13	2026_09_17_074105_add_role_to_users_table	1
14	2026_09_17_114806_add_id_role_to_users_table	1
15	2026_09_17_124522_create_personal_access_tokens_table	1
16	2026_09_26_005618_add_description_and_features_to_plans_table	2
17	2026_10_13_084453_create_histories_table	3
\.


--
-- TOC entry 5201 (class 0 OID 20592)
-- Dependencies: 242
-- Data for Name: paraphrase_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paraphrase_requests (id_paraphrase, id_user, original_text, paraphrase_text, created_at) FROM stdin;
1	2	aaaaa	Hasil parafrase (formal): aaaaa [Kalimat telah disesuaikan untuk kebutuhan akademik dan bebas dari potensi plagiarisme.]	2026-09-26 00:10:15
2	3	satu dua tiga	Hasil parafrase (formal): satu dua tiga [Kalimat telah disesuaikan untuk kebutuhan akademik dan bebas dari potensi plagiarisme.]	2026-09-28 05:52:45
3	3	1234	Hasil parafrase (formal): 1234 [Kalimat telah disesuaikan untuk kebutuhan akademik dan bebas dari potensi plagiarisme.]	2026-10-02 12:10:25
4	3	1111	Hasil parafrase (formal): 1111 [Kalimat telah disesuaikan untuk kebutuhan akademik dan bebas dari potensi plagiarisme.]	2026-10-09 12:45:02
5	3	11111	Hasil parafrase (formal): 11111 [Kalimat telah disesuaikan untuk kebutuhan akademik dan bebas dari potensi plagiarisme.]	2026-10-13 09:11:11
6	3	1	Hasil parafrase (formal): 1 [Kalimat telah disesuaikan untuk kebutuhan akademik dan bebas dari potensi plagiarisme.]	2026-10-13 09:13:24
7	3	abcdefghijklmnopqrstuvwxyz	Hasil parafrase (formal): abcdefghijklmnopqrstuvwxyz [Kalimat telah disesuaikan untuk kebutuhan akademik dan bebas dari potensi plagiarisme.]	2026-10-13 09:14:17
\.


--
-- TOC entry 5182 (class 0 OID 20427)
-- Dependencies: 223
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 5209 (class 0 OID 20682)
-- Dependencies: 250
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5191 (class 0 OID 20509)
-- Dependencies: 232
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plans (id_plan, name_plan, token_quota, price, duration, description, features) FROM stdin;
1	Free	250	0.00	30	Untuk mencoba fitur dasar Skripsi AI.	[{"text":"250 Token \\/ bulan","enabled":true},{"text":"Akses Paraphrasing Dasar","enabled":true},{"text":"Review Bab Spesifik","enabled":false}]
2	Pro	500	49000.00	30	Rekomendasi terbaik untuk pejuang skripsi aktif.	[{"text":"500 Token \\/ bulan","enabled":true},{"text":"Paraphrasing Tingkat Lanjut","enabled":true},{"text":"Review Bab Spesifik (Bab 1-5)","enabled":true},{"text":"Prioritas Respon AI","enabled":true}]
3	Pro++	-1	99000.00	30	Akses tanpa batas untuk percepatan kelulusan.	[{"text":"Unlimited Token","enabled":true},{"text":"Semua Fitur Pro","enabled":true},{"text":"Simulasi Sidang Skripsi (Audio)","enabled":true}]
\.


--
-- TOC entry 5203 (class 0 OID 20612)
-- Dependencies: 244
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id_session, id_user, id_role, id_style, thesis_title, research_topic, research_detail, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5193 (class 0 OID 20520)
-- Dependencies: 234
-- Data for Name: study_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.study_roles (id_role, name_role, description, system_prompt, is_active, created_at, updated_at) FROM stdin;
1	Ilmu Komputer	Khusus untuk mahasiswa Teknik Informatika, Sistem Informasi, Rekayasa Perangkat Lunak, dan Ilmu Komputer.	Anda adalah pakar akademis dan pembimbing skripsi bidang Teknik Informatika, Sistem Informasi, Rekayasa Perangkat Lunak, dan Ilmu Komputer. Fokus pada topik seperti Machine Learning, Computer Vision, Software Engineering, Web/Mobile Development, Cyber Security, dan Data Science. Gunakan terminologi teknis yang tepat dan metodologi riset standar IT.	t	2026-10-09 11:59:35	2026-10-09 11:59:35
\.


--
-- TOC entry 5197 (class 0 OID 20548)
-- Dependencies: 238
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions (id_subscription, id_user, id_plan, status, expired_at) FROM stdin;
\.


--
-- TOC entry 5207 (class 0 OID 20657)
-- Dependencies: 248
-- Data for Name: title_recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.title_recommendations (id_title, id_generate, title, explanation) FROM stdin;
\.


--
-- TOC entry 5199 (class 0 OID 20572)
-- Dependencies: 240
-- Data for Name: token_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_transactions (id_transaction, id_user, transaction_type, feature_tag, amount, balance_after, created_at) FROM stdin;
1	3	Credit	Subscription Plan: Pro	500	750	2026-10-02 19:30:37
2	3	Credit	Subscription Plan: Free	250	1000	2026-10-02 19:30:44
3	3	Credit	Subscription Plan: Pro	500	1500	2026-10-02 19:34:47
4	3	Credit	Topup Token Satuan	50	1550	2026-10-02 19:53:15
5	3	Credit	Subscription Plan: Free	250	1800	2026-10-02 19:58:10
6	3	Credit	Topup Token Satuan	150	1950	2026-10-02 19:58:35
9	3	Credit	Topup Token Satuan	50	2000	2026-10-13 16:14:35
\.


--
-- TOC entry 5181 (class 0 OID 20408)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_user, name, email, password, login_provider, token_balance, profile_photo_path, university, created_at, updated_at, role, id_role) FROM stdin;
1	Admin	admin@skripsi.ai	$2y$12$znOMvb/Vm0iNqlGH5enqFOW2F.jboOohXsLCIvAvJG0OF6kfN4LZq	Email	250	\N	\N	2026-09-17 12:47:23	2026-09-17 12:47:23	admin	\N
2	user	user2@gmail.com	$2y$12$8H5YUJYi.k1icnnMMvh6huR8Z12JmV1ePTC/N81WMFlpZOW0098Cq	Email	250	profile-photos/aXseOquwcfLwZDDigkybCFmsG01Pr6Xp7i9MC8yb.webp	\N	2026-09-17 12:50:38	2026-09-25 23:41:27	user	1
3	user1	user1@gmail.com	$2y$12$JbXkXNTmTWgsYJ.4q94PJujvXQo3JIdCu4EbOW086k1Q1ys7/I0wG	Email	2000	profile-photos/m6BVv5oG1AV6aQYvO6XkfS9Bn8BB2qR4xeVai8ok.webp	Universitas buana perjuangan karawang	2026-09-28 05:51:54	2026-10-13 09:14:34	user	1
\.


--
-- TOC entry 5195 (class 0 OID 20534)
-- Dependencies: 236
-- Data for Name: writing_styles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.writing_styles (id_style, name_style, description, instruction, is_active, created_at, updated_at) FROM stdin;
1	Formal & Akademik Standard	Bahasa baku sesuai PUEBI/EYD, gaya penulisan karya ilmiah resmi perguruan tinggi.	Gunakan tata bahasa formal baku, kalimat efektif, objektif, dan istilah ilmiah yang presisi.	t	2026-10-09 11:59:35	2026-10-09 11:59:35
2	Ringkas & Point-to-Point	Penjelasan lugas berfokus pada inti masalah, batasan sistem, dan poin penting.	Gunakan poin-poin terstruktur, ringkas, tanpa bertele-tele, dan langsung menargetkan rumusan masalah.	f	2026-10-09 11:59:35	2026-10-09 12:03:43
\.


--
-- TOC entry 5232 (class 0 OID 0)
-- Dependencies: 229
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 5233 (class 0 OID 0)
-- Dependencies: 245
-- Name: generations_id_generate_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.generations_id_generate_seq', 1, false);


--
-- TOC entry 5234 (class 0 OID 0)
-- Dependencies: 251
-- Name: histories_id_history_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.histories_id_history_seq', 3, true);


--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 226
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 219
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 17, true);


--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 241
-- Name: paraphrase_requests_id_paraphrase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paraphrase_requests_id_paraphrase_seq', 7, true);


--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 249
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 16, true);


--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 231
-- Name: plans_id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plans_id_plan_seq', 1, false);


--
-- TOC entry 5240 (class 0 OID 0)
-- Dependencies: 243
-- Name: sessions_id_session_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessions_id_session_seq', 1, false);


--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 233
-- Name: study_roles_id_role_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.study_roles_id_role_seq', 1, false);


--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 237
-- Name: subscriptions_id_subscription_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriptions_id_subscription_seq', 9, true);


--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 247
-- Name: title_recommendations_id_title_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.title_recommendations_id_title_seq', 1, false);


--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 239
-- Name: token_transactions_id_transaction_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_transactions_id_transaction_seq', 9, true);


--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_user_seq', 3, true);


--
-- TOC entry 5246 (class 0 OID 0)
-- Dependencies: 235
-- Name: writing_styles_id_style_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.writing_styles_id_style_seq', 1, false);


--
-- TOC entry 4983 (class 2606 OID 20456)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 4980 (class 2606 OID 20445)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 4991 (class 2606 OID 20504)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4993 (class 2606 OID 20507)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 5009 (class 2606 OID 20650)
-- Name: generations generations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generations
    ADD CONSTRAINT generations_pkey PRIMARY KEY (id_generate);


--
-- TOC entry 5019 (class 2606 OID 20743)
-- Name: histories histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id_history);


--
-- TOC entry 4988 (class 2606 OID 20487)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 4985 (class 2606 OID 20472)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 4971 (class 2606 OID 20406)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 5005 (class 2606 OID 20605)
-- Name: paraphrase_requests paraphrase_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paraphrase_requests
    ADD CONSTRAINT paraphrase_requests_pkey PRIMARY KEY (id_paraphrase);


--
-- TOC entry 4977 (class 2606 OID 20435)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 5014 (class 2606 OID 20694)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 5016 (class 2606 OID 20697)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 4995 (class 2606 OID 20518)
-- Name: plans plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 5007 (class 2606 OID 20624)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id_session);


--
-- TOC entry 4997 (class 2606 OID 20532)
-- Name: study_roles study_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.study_roles
    ADD CONSTRAINT study_roles_pkey PRIMARY KEY (id_role);


--
-- TOC entry 5001 (class 2606 OID 20560)
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id_subscription);


--
-- TOC entry 5011 (class 2606 OID 20668)
-- Name: title_recommendations title_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title_recommendations
    ADD CONSTRAINT title_recommendations_pkey PRIMARY KEY (id_title);


--
-- TOC entry 5003 (class 2606 OID 20585)
-- Name: token_transactions token_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_transactions
    ADD CONSTRAINT token_transactions_pkey PRIMARY KEY (id_transaction);


--
-- TOC entry 4973 (class 2606 OID 20426)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 4975 (class 2606 OID 20424)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4999 (class 2606 OID 20546)
-- Name: writing_styles writing_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.writing_styles
    ADD CONSTRAINT writing_styles_pkey PRIMARY KEY (id_style);


--
-- TOC entry 4978 (class 1259 OID 20446)
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- TOC entry 4981 (class 1259 OID 20457)
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- TOC entry 4989 (class 1259 OID 20505)
-- Name: failed_jobs_connection_queue_failed_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX failed_jobs_connection_queue_failed_at_index ON public.failed_jobs USING btree (connection, queue, failed_at);


--
-- TOC entry 4986 (class 1259 OID 20473)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 5012 (class 1259 OID 20698)
-- Name: personal_access_tokens_expires_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_expires_at_index ON public.personal_access_tokens USING btree (expires_at);


--
-- TOC entry 5017 (class 1259 OID 20695)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 5028 (class 2606 OID 20651)
-- Name: generations generations_id_session_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.generations
    ADD CONSTRAINT generations_id_session_foreign FOREIGN KEY (id_session) REFERENCES public.sessions(id_session) ON DELETE CASCADE;


--
-- TOC entry 5030 (class 2606 OID 20744)
-- Name: histories histories_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories
    ADD CONSTRAINT histories_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id_user) ON DELETE CASCADE;


--
-- TOC entry 5024 (class 2606 OID 20606)
-- Name: paraphrase_requests paraphrase_requests_id_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paraphrase_requests
    ADD CONSTRAINT paraphrase_requests_id_user_foreign FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;


--
-- TOC entry 5025 (class 2606 OID 20630)
-- Name: sessions sessions_id_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_id_role_foreign FOREIGN KEY (id_role) REFERENCES public.study_roles(id_role) ON DELETE CASCADE;


--
-- TOC entry 5026 (class 2606 OID 20635)
-- Name: sessions sessions_id_style_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_id_style_foreign FOREIGN KEY (id_style) REFERENCES public.writing_styles(id_style) ON DELETE CASCADE;


--
-- TOC entry 5027 (class 2606 OID 20625)
-- Name: sessions sessions_id_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_id_user_foreign FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;


--
-- TOC entry 5021 (class 2606 OID 20566)
-- Name: subscriptions subscriptions_id_plan_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_id_plan_foreign FOREIGN KEY (id_plan) REFERENCES public.plans(id_plan) ON DELETE CASCADE;


--
-- TOC entry 5022 (class 2606 OID 20561)
-- Name: subscriptions subscriptions_id_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_id_user_foreign FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;


--
-- TOC entry 5029 (class 2606 OID 20669)
-- Name: title_recommendations title_recommendations_id_generate_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title_recommendations
    ADD CONSTRAINT title_recommendations_id_generate_foreign FOREIGN KEY (id_generate) REFERENCES public.generations(id_generate) ON DELETE CASCADE;


--
-- TOC entry 5023 (class 2606 OID 20586)
-- Name: token_transactions token_transactions_id_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_transactions
    ADD CONSTRAINT token_transactions_id_user_foreign FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON DELETE CASCADE;


--
-- TOC entry 5020 (class 2606 OID 20676)
-- Name: users users_id_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_role_foreign FOREIGN KEY (id_role) REFERENCES public.study_roles(id_role) ON DELETE SET NULL;


-- Completed on 2026-10-13 16:44:09

--
-- PostgreSQL database dump complete
--

\unrestrict eGSrQeDKhI9GwLjQGK1wtwdLWHcsNMMXAU7iha7O4k7BjsozepLIbgMGcqsolIS

