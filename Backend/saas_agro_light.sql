--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7
-- Dumped by pg_dump version 15.7

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
-- Name: d_bairro; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_bairro AS character varying(30);


ALTER DOMAIN public.d_bairro OWNER TO postgres;

--
-- Name: d_cep; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_cep AS character varying(8);


ALTER DOMAIN public.d_cep OWNER TO postgres;

--
-- Name: d_cidade; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_cidade AS character varying(30);


ALTER DOMAIN public.d_cidade OWNER TO postgres;

--
-- Name: d_complemento; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_complemento AS character varying(50);


ALTER DOMAIN public.d_complemento OWNER TO postgres;

--
-- Name: d_cpf_cnpj; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_cpf_cnpj AS character varying(14);


ALTER DOMAIN public.d_cpf_cnpj OWNER TO postgres;

--
-- Name: d_dataquitacao; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_dataquitacao AS date;


ALTER DOMAIN public.d_dataquitacao OWNER TO postgres;

--
-- Name: d_datavencimento; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_datavencimento AS date;


ALTER DOMAIN public.d_datavencimento OWNER TO postgres;

--
-- Name: d_descricao; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_descricao AS character varying(30);


ALTER DOMAIN public.d_descricao OWNER TO postgres;

--
-- Name: d_email; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_email AS character varying(50);


ALTER DOMAIN public.d_email OWNER TO postgres;

--
-- Name: d_estado; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_estado AS character(2);


ALTER DOMAIN public.d_estado OWNER TO postgres;

--
-- Name: d_logradouro; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_logradouro AS character varying(50);


ALTER DOMAIN public.d_logradouro OWNER TO postgres;

--
-- Name: d_nome; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_nome AS character varying(50);


ALTER DOMAIN public.d_nome OWNER TO postgres;

--
-- Name: d_numero; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_numero AS integer;


ALTER DOMAIN public.d_numero OWNER TO postgres;

--
-- Name: d_numeroparcela; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_numeroparcela AS integer;


ALTER DOMAIN public.d_numeroparcela OWNER TO postgres;

--
-- Name: d_valordesconto; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_valordesconto AS numeric(15,2);


ALTER DOMAIN public.d_valordesconto OWNER TO postgres;

--
-- Name: d_valorjuros; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_valorjuros AS numeric(15,2);


ALTER DOMAIN public.d_valorjuros OWNER TO postgres;

--
-- Name: d_valorparcela; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.d_valorparcela AS numeric(15,2);


ALTER DOMAIN public.d_valorparcela OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: a_pagar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_pagar (
    idcontapagar integer NOT NULL,
    descricao public.d_descricao,
    valorparcela public.d_valorparcela,
    numeroparcela public.d_numeroparcela,
    datavencimento public.d_datavencimento,
    dataquitacao public.d_dataquitacao,
    valordesconto public.d_valordesconto,
    valorjuros public.d_valorjuros,
    idpropriedade integer NOT NULL,
    idfornecedor integer NOT NULL,
    idplanocontas integer NOT NULL
);


ALTER TABLE public.a_pagar OWNER TO postgres;

--
-- Name: a_pagar_idcontapagar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.a_pagar_idcontapagar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.a_pagar_idcontapagar_seq OWNER TO postgres;

--
-- Name: a_pagar_idcontapagar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.a_pagar_idcontapagar_seq OWNED BY public.a_pagar.idcontapagar;


--
-- Name: a_receber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.a_receber (
    idconta integer NOT NULL,
    descricao public.d_descricao,
    valorparcela public.d_valorparcela,
    numeroparcela public.d_numeroparcela,
    datavencimento public.d_datavencimento,
    dataquitacao public.d_dataquitacao,
    valordesconto public.d_valordesconto,
    valorjuros public.d_valorjuros,
    idpropriedade integer NOT NULL,
    idcliente integer NOT NULL,
    idplanocontas integer NOT NULL
);


ALTER TABLE public.a_receber OWNER TO postgres;

--
-- Name: a_receber_idconta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.a_receber_idconta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.a_receber_idconta_seq OWNER TO postgres;

--
-- Name: a_receber_idconta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.a_receber_idconta_seq OWNED BY public.a_receber.idconta;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    cpf character varying(14),
    logradouro character varying(255),
    numero character varying(10),
    complemento character varying(255),
    bairro character varying(255),
    cep character varying(9),
    cidade character varying(255),
    estado character varying(2),
    tipousuario character varying(50)
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cadastros_clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cadastros_clientes (
    id bigint NOT NULL,
    logradouro character varying(255),
    numero character varying(10),
    complemento character varying(255),
    bairro character varying(100),
    cep character varying(20),
    cidade character varying(100),
    estado character varying(2),
    nome character varying(255) NOT NULL,
    email character varying(254),
    cpf_cnpj character varying(14)
);


ALTER TABLE public.cadastros_clientes OWNER TO postgres;

--
-- Name: cadastros_clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cadastros_clientes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cadastros_clientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cadastros_fornecedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cadastros_fornecedores (
    id bigint NOT NULL,
    logradouro character varying(255),
    numero character varying(10),
    complemento character varying(255),
    bairro character varying(100),
    cep character varying(20),
    cidade character varying(100),
    estado character varying(2),
    nome character varying(255) NOT NULL,
    cpf_cnpj character varying(14),
    email character varying(254)
);


ALTER TABLE public.cadastros_fornecedores OWNER TO postgres;

--
-- Name: cadastros_fornecedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cadastros_fornecedores ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cadastros_fornecedores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cadastros_propriedades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cadastros_propriedades (
    id bigint NOT NULL,
    logradouro character varying(255),
    numero character varying(10),
    complemento character varying(255),
    bairro character varying(100),
    cep character varying(20),
    cidade character varying(100),
    estado character varying(2),
    descricao text,
    tipousuario smallint
);


ALTER TABLE public.cadastros_propriedades OWNER TO postgres;

--
-- Name: cadastros_propriedades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cadastros_propriedades ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cadastros_propriedades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    idcliente integer NOT NULL,
    nome public.d_nome NOT NULL,
    email public.d_email,
    cpf_cnpj character varying(14),
    logradouro public.d_logradouro,
    numero public.d_numero,
    complemento public.d_complemento,
    bairro public.d_bairro,
    cep public.d_cep,
    cidade public.d_cidade,
    estado public.d_estado
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: clientes_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_idcliente_seq OWNER TO postgres;

--
-- Name: clientes_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_idcliente_seq OWNED BY public.clientes.idcliente;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: fornecedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedores (
    idfornecedor integer NOT NULL,
    nome public.d_nome NOT NULL,
    cpf_cnpj public.d_cpf_cnpj,
    email public.d_email,
    logradouro public.d_logradouro,
    numero public.d_numero,
    complemento public.d_complemento,
    bairro public.d_bairro,
    cep public.d_cep,
    cidade public.d_cidade,
    estado public.d_estado
);


ALTER TABLE public.fornecedores OWNER TO postgres;

--
-- Name: fornecedores_idfornecedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fornecedores_idfornecedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fornecedores_idfornecedor_seq OWNER TO postgres;

--
-- Name: fornecedores_idfornecedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fornecedores_idfornecedor_seq OWNED BY public.fornecedores.idfornecedor;


--
-- Name: plano_de_contas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plano_de_contas (
    idplanocontas integer NOT NULL,
    descricao public.d_descricao,
    tipofluxocaixa smallint,
    conta character varying(15)
);


ALTER TABLE public.plano_de_contas OWNER TO postgres;

--
-- Name: plano_de_contas_idplanocontas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plano_de_contas_idplanocontas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plano_de_contas_idplanocontas_seq OWNER TO postgres;

--
-- Name: plano_de_contas_idplanocontas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plano_de_contas_idplanocontas_seq OWNED BY public.plano_de_contas.idplanocontas;


--
-- Name: propriedades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propriedades (
    idpropriedade integer NOT NULL,
    descricao public.d_descricao,
    logradouro public.d_logradouro,
    numero public.d_numero,
    complemento public.d_complemento,
    bairro public.d_bairro,
    cep public.d_cep,
    cidade public.d_cidade,
    estado public.d_estado,
    tipousuario smallint
);


ALTER TABLE public.propriedades OWNER TO postgres;

--
-- Name: propriedades_idpropriedade_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.propriedades_idpropriedade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.propriedades_idpropriedade_seq OWNER TO postgres;

--
-- Name: propriedades_idpropriedade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.propriedades_idpropriedade_seq OWNED BY public.propriedades.idpropriedade;


--
-- Name: usuarios_propriedades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_propriedades (
    idtiporelacaopropriedade integer NOT NULL,
    idusuario integer NOT NULL,
    idpropriedade integer NOT NULL
);


ALTER TABLE public.usuarios_propriedades OWNER TO postgres;

--
-- Name: a_pagar idcontapagar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_pagar ALTER COLUMN idcontapagar SET DEFAULT nextval('public.a_pagar_idcontapagar_seq'::regclass);


--
-- Name: a_receber idconta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_receber ALTER COLUMN idconta SET DEFAULT nextval('public.a_receber_idconta_seq'::regclass);


--
-- Name: clientes idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN idcliente SET DEFAULT nextval('public.clientes_idcliente_seq'::regclass);


--
-- Name: fornecedores idfornecedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedores ALTER COLUMN idfornecedor SET DEFAULT nextval('public.fornecedores_idfornecedor_seq'::regclass);


--
-- Name: plano_de_contas idplanocontas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plano_de_contas ALTER COLUMN idplanocontas SET DEFAULT nextval('public.plano_de_contas_idplanocontas_seq'::regclass);


--
-- Name: propriedades idpropriedade; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propriedades ALTER COLUMN idpropriedade SET DEFAULT nextval('public.propriedades_idpropriedade_seq'::regclass);


--
-- Data for Name: a_pagar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.a_pagar (idcontapagar, descricao, valorparcela, numeroparcela, datavencimento, dataquitacao, valordesconto, valorjuros, idpropriedade, idfornecedor, idplanocontas) FROM stdin;
\.


--
-- Data for Name: a_receber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.a_receber (idconta, descricao, valorparcela, numeroparcela, datavencimento, dataquitacao, valordesconto, valorjuros, idpropriedade, idcliente, idplanocontas) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add exemplo	6	add_exemplo
22	Can change exemplo	6	change_exemplo
23	Can delete exemplo	6	delete_exemplo
24	Can view exemplo	6	view_exemplo
25	Can add usuario	7	add_usuario
26	Can change usuario	7	change_usuario
27	Can delete usuario	7	delete_usuario
28	Can view usuario	7	view_usuario
29	Can add clientes	8	add_clientes
30	Can change clientes	8	change_clientes
31	Can delete clientes	8	delete_clientes
32	Can view clientes	8	view_clientes
33	Can add fornecedores	9	add_fornecedores
34	Can change fornecedores	9	change_fornecedores
35	Can delete fornecedores	9	delete_fornecedores
36	Can view fornecedores	9	view_fornecedores
37	Can add propriedades	10	add_propriedades
38	Can change propriedades	10	change_propriedades
39	Can delete propriedades	10	delete_propriedades
40	Can view propriedades	10	view_propriedades
41	Can add cliente	11	add_cliente
42	Can change cliente	11	change_cliente
43	Can delete cliente	11	delete_cliente
44	Can view cliente	11	view_cliente
45	Can add fornecedor	12	add_fornecedor
46	Can change fornecedor	12	change_fornecedor
47	Can delete fornecedor	12	delete_fornecedor
48	Can view fornecedor	12	view_fornecedor
49	Can add propriedade	13	add_propriedade
50	Can change propriedade	13	change_propriedade
51	Can delete propriedade	13	delete_propriedade
52	Can view propriedade	13	view_propriedade
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, cpf, logradouro, numero, complemento, bairro, cep, cidade, estado, tipousuario) FROM stdin;
3	pbkdf2_sha256$1000000$jWauuFQehXEgWP7S2QPLmY$YRoUOIZj8FdfXN/PqxM5SEFpDw18Bxp+4gTIEwCE8Uw=	\N	f	leila			leila@gmail.com	f	t	2025-05-13 21:40:37.767356-03	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	pbkdf2_sha256$870000$HNk6BhQW5KH8xkNlMVN5cC$+iZmRmcChXwk/WyLYnISpesreT5JXDAebnSuYkiJ0gM=	\N	t	fernanda			fer@ennes.com	f	t	2025-03-28 19:36:42.547061-03	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	pbkdf2_sha256$1000000$i5UXCHV2KdSZ4Skx1Xb0oO$QaJRSNB6POPAaalqdyGTMuYKm/Gpq8+SQf/IugKOn1U=	2025-05-14 21:30:49.615185-03	t	admin			admin@gmail.com	f	t	2025-05-14 20:56:31.80697-03	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	pbkdf2_sha256$1000000$w5rsJ1ThUQN6X2lzcjcnBm$mAjesMfPm2DSHOQP4UzKidpHFS6AUkLGdtRO6WMZkEE=	2025-05-15 20:23:10.317284-03	t	sergio			sergio@gmail.com	f	t	2025-05-15 20:22:57.598122-03	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	pbkdf2_sha256$1000000$UWjfCn66VjjICi2HA5wtRe$MbdxgZKMTZ+LecS9I91WNqQldW9MciasyyV473Em0AE=	2025-03-28 19:36:30.277264-03	t	isabella			rmsisabella@gmail.com	f	t	2025-03-08 16:28:22.776463-03	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, usuario_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, usuario_id, permission_id) FROM stdin;
\.


--
-- Data for Name: cadastros_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cadastros_clientes (id, logradouro, numero, complemento, bairro, cep, cidade, estado, nome, email, cpf_cnpj) FROM stdin;
\.


--
-- Data for Name: cadastros_fornecedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cadastros_fornecedores (id, logradouro, numero, complemento, bairro, cep, cidade, estado, nome, cpf_cnpj, email) FROM stdin;
\.


--
-- Data for Name: cadastros_propriedades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cadastros_propriedades (id, logradouro, numero, complemento, bairro, cep, cidade, estado, descricao, tipousuario) FROM stdin;
\.


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (idcliente, nome, email, cpf_cnpj, logradouro, numero, complemento, bairro, cep, cidade, estado) FROM stdin;
1	Sabine Chesnokova	sabine@gmail.com	511.506.270-42	Vicolo Calcirell	82			32050280	Contagem	MG
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	galeria	exemplo
7	users	usuario
8	cadastros	clientes
9	cadastros	fornecedores
10	cadastros	propriedades
11	cadastros	cliente
12	cadastros	fornecedor
13	cadastros	propriedade
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-03-08 16:10:47.20759-03
2	contenttypes	0002_remove_content_type_name	2025-03-08 16:10:47.220366-03
3	auth	0001_initial	2025-03-08 16:10:47.305856-03
4	auth	0002_alter_permission_name_max_length	2025-03-08 16:10:47.311434-03
5	auth	0003_alter_user_email_max_length	2025-03-08 16:10:47.31979-03
6	auth	0004_alter_user_username_opts	2025-03-08 16:10:47.328791-03
7	auth	0005_alter_user_last_login_null	2025-03-08 16:10:47.336314-03
8	auth	0006_require_contenttypes_0002	2025-03-08 16:10:47.338265-03
9	auth	0007_alter_validators_add_error_messages	2025-03-08 16:10:47.343868-03
10	auth	0008_alter_user_username_max_length	2025-03-08 16:10:47.354569-03
11	auth	0009_alter_user_last_name_max_length	2025-03-08 16:10:47.360563-03
12	auth	0010_alter_group_name_max_length	2025-03-08 16:10:47.373673-03
13	auth	0011_update_proxy_permissions	2025-03-08 16:10:47.379127-03
14	auth	0012_alter_user_first_name_max_length	2025-03-08 16:10:47.387499-03
15	users	0001_initial	2025-03-08 16:10:47.510619-03
16	admin	0001_initial	2025-03-08 16:10:47.566739-03
17	admin	0002_logentry_remove_auto_add	2025-03-08 16:10:47.577463-03
18	admin	0003_logentry_add_action_flag_choices	2025-03-08 16:10:47.586991-03
19	sessions	0001_initial	2025-03-08 16:10:47.612349-03
20	cadastros	0001_initial	2025-05-30 20:25:46.637853-03
21	users	0002_usuario_telefone	2025-07-27 18:54:31.965427-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
mlsxvgecn8yxrnvqc7kiufqv7p95o2i7	.eJxVjMsOwiAQRf-FtSEwwBRcuvcbyPCSqoGktCvjv2uTLnR7zzn3xTxta_XbyIufEzszyU6_W6D4yG0H6U7t1nnsbV3mwHeFH3Twa0_5eTncv4NKo35rocEEa9CKHEtRULQgDZAkWMKMlpKcDAnrXI4Oo4yESuuCoIJVEwJ7fwDLFjcU:1tqzqX:lH0FNCmL23lzGQqQ1wWuSvQeqr2LeiU3GxRqNIf5vcQ	2025-03-22 16:28:29.129175-03
22zp708w9plcjuut53abyf31zq4a8d3m	.eJxVjMsOwiAQRf-FtSEwwBRcuvcbyPCSqoGktCvjv2uTLnR7zzn3xTxta_XbyIufEzszyU6_W6D4yG0H6U7t1nnsbV3mwHeFH3Twa0_5eTncv4NKo35rocEEa9CKHEtRULQgDZAkWMKMlpKcDAnrXI4Oo4yESuuCoIJVEwJ7fwDLFjcU:1tyIJS:j-UF7l2eRajh3O6jWaGOp0NqkC_4wZvf8A-Yv_x5sAc	2025-04-11 19:36:30.290038-03
03r3706k1f3ngzsm0oia96wys9a0fjzz	.eJxVjDsOgzAQRO_iOrL8W5tNmZ4zWGvWxCSRkTBUUe4ekCiSbjTvzbxFpG0tcWt5iROLqwBx-e0SDc9cD8APqvdZDnNdlynJQ5EnbbKfOb9up_t3UKiVfZ3dCKCU1VkjsycDXpvgySEZP6LvGBSFzlhtATiopNMe0KHTbDmj-HwBuEM2ig:1uFhuw:bZSUcMehOKZ8sAxyZdZoJhsbRVZFHlstjsR57OeTbEw	2025-05-29 20:23:10.321581-03
\.


--
-- Data for Name: fornecedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fornecedores (idfornecedor, nome, cpf_cnpj, email, logradouro, numero, complemento, bairro, cep, cidade, estado) FROM stdin;
\.


--
-- Data for Name: plano_de_contas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plano_de_contas (idplanocontas, descricao, tipofluxocaixa, conta) FROM stdin;
1	Ativos	1	1
2	Caixa	1	1.1
3	Investimentos	1	1.2
4	Produtos para revenda	1	1.3
5	Passivo	1	2
6	Impostos	1	2.1
7	Empréstimos	1	2.2
8	Salários	1	2.3
9	Saída de caixa	1	3
10	Custos dos produtos ou serviço	1	3.1
11	Despesas administrativas	1	3.2
12	Despesas comerciais	1	3.3
13	Despesas financeiras	1	3.4
14	Entrada de caixa	1	4
15	Faturamento	1	4.1
16	Rendimentos de aplicações	1	4.2
17	Ativo	2	1
18	Ativo Circulante	2	1.1
19	Disponível	2	1.1.1
20	Caixa	2	1.1.1.1
21	Movimentação na conta	2	1.1.1.2
22	Aplicações financeiras	2	1.1.1.3
23	Recebimentos	2	1.1.2
24	Clientes	2	1.1.2.1
25	Pagamentos a receber	2	1.1.2.2
26	Ações da empresa	2	1.1.2.3
27	Possíveis inadimplentes	2	1.1.2.4
28	Empréstimos a receber	2	1.1.2.5
29	Cheques em cobrança	2	1.1.2.6
30	Adiantamentos Salariais	2	1.1.2.7
31	Estoques	2	1.1.3
32	Mercadorias para venda	2	1.1.3.1
33	Produtos Finais	2	1.1.3.2
34	Produtos em processo	2	1.1.3.3
35	Despesas	2	1.1.4
36	Produção	2	1.1.4.1
37	Ativo não circulante	2	1.1.5
38	Direitos a longo prazo	2	1.1.5.1
39	Títulos a receber	2	1.1.5.1.1
40	Fundo de reserva	2	1.1.5.1.2
41	Consórcios	2	1.1.5.1.3
42	Investimentos	2	1.1.5.1.4
43	Participações em outras empres	2	1.1.5.1.5
44	Imobilizados	2	1.1.5.2
45	Terrenos	2	1.1.5.2.1
46	Edificadores	2	1.1.5.2.2
47	Imóveis para renda	2	1.1.5.2.3
48	Veículos	2	1.1.5.2.4
49	Marcas e patentes	2	1.1.5.2.5
50	Tecnologia	2	1.1.5.3
51	Despesas com pesquisas	2	1.1.5.3.1
52	Desenvolvimento de produtos	2	1.1.5.3.2
53	Automação de processos na empr	2	1.1.5.3.3
54	Passivo	2	2
55	Circulante	2	2.1
56	Obrigações fiscais	2	2.1.1
57	ICMS	2	2.1.1.1
58	ISS	2	2.1.1.2
59	INSS	2	2.1.1.3
60	Cofins	2	2.1.1.4
61	IRPJ	2	2.1.1.5
62	CSLL	2	2.1.1.6
63	CPP	2	2.1.1.7
64	Contas a pagar	2	2.1.2
65	Fornecedores	2	2.1.2.1
66	Salários	2	2.1.2.2
67	13º Salário	2	2.1.2.3
68	Férias	2	2.1.2.4
69	Empréstimos	2	2.1.3
70	Custos	2	3
71	Custos das mercadorias	2	3.1
72	Compra de mercadoria	2	3.1.1
73	Frete	2	3.1.2
74	Mão de obra	2	3.1.3
75	Custo de Produção	2	3.2
76	Matéria-prima	2	3.2.1
77	Material de consumo	2	3.2.2
78	Combustível	2	3.2.3
79	Mão de obra	2	3.2.4
80	Custo de prestação de serviço	2	3.3
81	Material de uso	2	3.3.1
82	Combustível	2	3.3.2
83	Mão de obra	2	3.3.3
84	Despesas	2	4
85	Administrativas	2	4.1
86	Aluguel	2	4.1.1
87	Energia e Água	2	4.1.2
88	Internet	2	4.1.3
89	Correios	2	4.1.4
90	Honorários	2	4.1.5
91	Serviços terceirizados	2	4.1.6
92	Despesas financeiras	2	4.2
93	Juros passivos	2	4.2.1
94	Despesas com banco	2	4.2.2
95	Comissões e juros	2	4.2.3
96	Descontos	2	4.2.4
97	Despesas comerciais	2	4.3
98	Publicidade	2	4.3.1
99	Brindes	2	4.3.2
100	Receitas	2	5
101	Receita de vendas	2	5.1
102	Vendas de produtos à vista	2	5.1.1
103	Vendas de produto a prazo	2	5.1.2
104	Receita de prestação de serviç	2	5.2
105	Vendas de produtos à vista	2	5.2.1
106	Vendas de produto a prazo	2	5.2.2
107	Receitas financeiras	2	5.3
108	Juros ativos	2	5.3.1
109	Descontos obtidos	2	5.3.2
110	Juros em aplicações financeira	2	5.3.3
111	Despesas recuperadas	2	5.3.4
\.


--
-- Data for Name: propriedades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.propriedades (idpropriedade, descricao, logradouro, numero, complemento, bairro, cep, cidade, estado, tipousuario) FROM stdin;
\.


--
-- Data for Name: usuarios_propriedades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_propriedades (idtiporelacaopropriedade, idusuario, idpropriedade) FROM stdin;
\.


--
-- Name: a_pagar_idcontapagar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.a_pagar_idcontapagar_seq', 1, false);


--
-- Name: a_receber_idconta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.a_receber_idconta_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: cadastros_clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cadastros_clientes_id_seq', 1, false);


--
-- Name: cadastros_fornecedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cadastros_fornecedores_id_seq', 1, false);


--
-- Name: cadastros_propriedades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cadastros_propriedades_id_seq', 1, false);


--
-- Name: clientes_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_idcliente_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: fornecedores_idfornecedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fornecedores_idfornecedor_seq', 1, false);


--
-- Name: plano_de_contas_idplanocontas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plano_de_contas_idplanocontas_seq', 111, true);


--
-- Name: propriedades_idpropriedade_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.propriedades_idpropriedade_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_cpf_key UNIQUE (cpf);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_usuario_id_group_id_2d4e26e8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_usuario_id_group_id_2d4e26e8_uniq UNIQUE (usuario_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissio_usuario_id_permission_id_a72d8789_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissio_usuario_id_permission_id_a72d8789_uniq UNIQUE (usuario_id, permission_id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cadastros_clientes cadastros_clientes_cpf_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cadastros_clientes
    ADD CONSTRAINT cadastros_clientes_cpf_cnpj_key UNIQUE (cpf_cnpj);


--
-- Name: cadastros_clientes cadastros_clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cadastros_clientes
    ADD CONSTRAINT cadastros_clientes_email_key UNIQUE (email);


--
-- Name: cadastros_clientes cadastros_clientes_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cadastros_clientes
    ADD CONSTRAINT cadastros_clientes_nome_key UNIQUE (nome);


--
-- Name: cadastros_clientes cadastros_clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cadastros_clientes
    ADD CONSTRAINT cadastros_clientes_pkey PRIMARY KEY (id);


--
-- Name: cadastros_fornecedores cadastros_fornecedores_cpf_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cadastros_fornecedores
    ADD CONSTRAINT cadastros_fornecedores_cpf_cnpj_key UNIQUE (cpf_cnpj);


--
-- Name: cadastros_fornecedores cadastros_fornecedores_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cadastros_fornecedores
    ADD CONSTRAINT cadastros_fornecedores_email_key UNIQUE (email);


--
-- Name: cadastros_fornecedores cadastros_fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cadastros_fornecedores
    ADD CONSTRAINT cadastros_fornecedores_pkey PRIMARY KEY (id);


--
-- Name: cadastros_propriedades cadastros_propriedades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cadastros_propriedades
    ADD CONSTRAINT cadastros_propriedades_pkey PRIMARY KEY (id);


--
-- Name: clientes clientes_cpf_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_cnpj_key UNIQUE (cpf_cnpj);


--
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- Name: clientes clientes_nome_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_nome_key UNIQUE (nome);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: fornecedores fornecedores_cpf_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_cpf_cnpj_key UNIQUE (cpf_cnpj);


--
-- Name: fornecedores fornecedores_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_email_key UNIQUE (email);


--
-- Name: clientes pk_idcliente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT pk_idcliente PRIMARY KEY (idcliente);


--
-- Name: a_receber pk_idconta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_receber
    ADD CONSTRAINT pk_idconta PRIMARY KEY (idconta);


--
-- Name: a_pagar pk_idcontapagar; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_pagar
    ADD CONSTRAINT pk_idcontapagar PRIMARY KEY (idcontapagar);


--
-- Name: fornecedores pk_idfornecedor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT pk_idfornecedor PRIMARY KEY (idfornecedor);


--
-- Name: plano_de_contas pk_idplanocontas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plano_de_contas
    ADD CONSTRAINT pk_idplanocontas PRIMARY KEY (idplanocontas);


--
-- Name: propriedades pk_idpropriedade; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propriedades
    ADD CONSTRAINT pk_idpropriedade PRIMARY KEY (idpropriedade);


--
-- Name: usuarios_propriedades pk_idtiporelacaopropriedade; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_propriedades
    ADD CONSTRAINT pk_idtiporelacaopropriedade PRIMARY KEY (idtiporelacaopropriedade);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_cpf_41431a0b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_cpf_41431a0b_like ON public.auth_user USING btree (cpf varchar_pattern_ops);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_usuario_id_1458dadc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_usuario_id_1458dadc ON public.auth_user_groups USING btree (usuario_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_usuario_id_453820ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_usuario_id_453820ab ON public.auth_user_user_permissions USING btree (usuario_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: cadastros_clientes_cpf_cnpj_68ceebf6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cadastros_clientes_cpf_cnpj_68ceebf6_like ON public.cadastros_clientes USING btree (cpf_cnpj varchar_pattern_ops);


--
-- Name: cadastros_clientes_email_2019bacf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cadastros_clientes_email_2019bacf_like ON public.cadastros_clientes USING btree (email varchar_pattern_ops);


--
-- Name: cadastros_clientes_nome_022dab39_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cadastros_clientes_nome_022dab39_like ON public.cadastros_clientes USING btree (nome varchar_pattern_ops);


--
-- Name: cadastros_fornecedores_cpf_cnpj_4089718f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cadastros_fornecedores_cpf_cnpj_4089718f_like ON public.cadastros_fornecedores USING btree (cpf_cnpj varchar_pattern_ops);


--
-- Name: cadastros_fornecedores_email_eb043129_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cadastros_fornecedores_email_eb043129_like ON public.cadastros_fornecedores USING btree (email varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_usuario_id_1458dadc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_usuario_id_1458dadc_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_usuario_id_453820ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_usuario_id_453820ab_fk_auth_user_id FOREIGN KEY (usuario_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: a_receber fk_idcliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_receber
    ADD CONSTRAINT fk_idcliente FOREIGN KEY (idcliente) REFERENCES public.clientes(idcliente);


--
-- Name: a_pagar fk_idfornecedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_pagar
    ADD CONSTRAINT fk_idfornecedor FOREIGN KEY (idfornecedor) REFERENCES public.fornecedores(idfornecedor);


--
-- Name: a_receber fk_idplanocontas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_receber
    ADD CONSTRAINT fk_idplanocontas FOREIGN KEY (idplanocontas) REFERENCES public.plano_de_contas(idplanocontas);


--
-- Name: a_pagar fk_idplanocontas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_pagar
    ADD CONSTRAINT fk_idplanocontas FOREIGN KEY (idplanocontas) REFERENCES public.plano_de_contas(idplanocontas);


--
-- Name: usuarios_propriedades fk_idpropriedade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_propriedades
    ADD CONSTRAINT fk_idpropriedade FOREIGN KEY (idpropriedade) REFERENCES public.propriedades(idpropriedade);


--
-- Name: a_receber fk_idpropriedade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_receber
    ADD CONSTRAINT fk_idpropriedade FOREIGN KEY (idpropriedade) REFERENCES public.propriedades(idpropriedade);


--
-- Name: a_pagar fk_idpropriedade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.a_pagar
    ADD CONSTRAINT fk_idpropriedade FOREIGN KEY (idpropriedade) REFERENCES public.propriedades(idpropriedade);


--
-- Name: usuarios_propriedades fk_idusuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_propriedades
    ADD CONSTRAINT fk_idusuario FOREIGN KEY (idusuario) REFERENCES public.auth_user(id);


--
-- PostgreSQL database dump complete
--

