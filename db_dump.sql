-- Hash of passwords are changed and therefore are not original

--
-- PostgreSQL database dump
--

-- Dumped from database version 8.4.13
-- Dumped by pg_dump version 9.1.5
-- Started on 2012-12-29 15:54:16 CET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 140 (class 1259 OID 16387)
-- Dependencies: 3
-- Name: auth_group; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO example_devel;

--
-- TOC entry 141 (class 1259 OID 16390)
-- Dependencies: 3 140
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO example_devel;

--
-- TOC entry 1936 (class 0 OID 0)
-- Dependencies: 141
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 1937 (class 0 OID 0)
-- Dependencies: 141
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 142 (class 1259 OID 16392)
-- Dependencies: 3
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO example_devel;

--
-- TOC entry 143 (class 1259 OID 16395)
-- Dependencies: 3 142
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO example_devel;

--
-- TOC entry 1938 (class 0 OID 0)
-- Dependencies: 143
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 1939 (class 0 OID 0)
-- Dependencies: 143
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 144 (class 1259 OID 16397)
-- Dependencies: 3
-- Name: auth_message; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE auth_message (
    id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.auth_message OWNER TO example_devel;

--
-- TOC entry 145 (class 1259 OID 16403)
-- Dependencies: 3 144
-- Name: auth_message_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE auth_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_message_id_seq OWNER TO example_devel;

--
-- TOC entry 1940 (class 0 OID 0)
-- Dependencies: 145
-- Name: auth_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE auth_message_id_seq OWNED BY auth_message.id;


--
-- TOC entry 1941 (class 0 OID 0)
-- Dependencies: 145
-- Name: auth_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('auth_message_id_seq', 1, false);


--
-- TOC entry 146 (class 1259 OID 16405)
-- Dependencies: 3
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO example_devel;

--
-- TOC entry 147 (class 1259 OID 16408)
-- Dependencies: 146 3
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO example_devel;

--
-- TOC entry 1942 (class 0 OID 0)
-- Dependencies: 147
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 1943 (class 0 OID 0)
-- Dependencies: 147
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('auth_permission_id_seq', 60, true);


--
-- TOC entry 148 (class 1259 OID 16410)
-- Dependencies: 3
-- Name: auth_user; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO example_devel;

--
-- TOC entry 149 (class 1259 OID 16413)
-- Dependencies: 3
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO example_devel;

--
-- TOC entry 150 (class 1259 OID 16416)
-- Dependencies: 149 3
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO example_devel;

--
-- TOC entry 1944 (class 0 OID 0)
-- Dependencies: 150
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 1945 (class 0 OID 0)
-- Dependencies: 150
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 151 (class 1259 OID 16418)
-- Dependencies: 148 3
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO example_devel;

--
-- TOC entry 1946 (class 0 OID 0)
-- Dependencies: 151
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 1947 (class 0 OID 0)
-- Dependencies: 151
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('auth_user_id_seq', 32, true);


--
-- TOC entry 152 (class 1259 OID 16420)
-- Dependencies: 3
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO example_devel;

--
-- TOC entry 153 (class 1259 OID 16423)
-- Dependencies: 3 152
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO example_devel;

--
-- TOC entry 1948 (class 0 OID 0)
-- Dependencies: 153
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 1949 (class 0 OID 0)
-- Dependencies: 153
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 154 (class 1259 OID 16425)
-- Dependencies: 1896 3
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO example_devel;

--
-- TOC entry 155 (class 1259 OID 16432)
-- Dependencies: 154 3
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO example_devel;

--
-- TOC entry 1950 (class 0 OID 0)
-- Dependencies: 155
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 1951 (class 0 OID 0)
-- Dependencies: 155
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 47, true);


--
-- TOC entry 156 (class 1259 OID 16434)
-- Dependencies: 3
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO example_devel;

--
-- TOC entry 157 (class 1259 OID 16437)
-- Dependencies: 156 3
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO example_devel;

--
-- TOC entry 1952 (class 0 OID 0)
-- Dependencies: 157
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 1953 (class 0 OID 0)
-- Dependencies: 157
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('django_content_type_id_seq', 20, true);


--
-- TOC entry 158 (class 1259 OID 16439)
-- Dependencies: 3
-- Name: django_session; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO example_devel;

--
-- TOC entry 159 (class 1259 OID 16445)
-- Dependencies: 3
-- Name: django_site; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO example_devel;

--
-- TOC entry 160 (class 1259 OID 16448)
-- Dependencies: 3 159
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO example_devel;

--
-- TOC entry 1954 (class 0 OID 0)
-- Dependencies: 160
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- TOC entry 1955 (class 0 OID 0)
-- Dependencies: 160
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- TOC entry 161 (class 1259 OID 16450)
-- Dependencies: 1899 1900 3
-- Name: frontend_ad; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE frontend_ad (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(255) NOT NULL,
    title_url character varying(255) NOT NULL,
    city_id integer NOT NULL,
    address character varying(255) NOT NULL,
    psc character varying(6) NOT NULL,
    category_id integer NOT NULL,
    text_of_ad text NOT NULL,
    type_of_ad boolean NOT NULL,
    is_new boolean NOT NULL,
    is_antique boolean NOT NULL,
    is_inventory boolean NOT NULL,
    time_of_publication timestamp with time zone NOT NULL,
    count_of_views integer NOT NULL,
    count_of_plus integer NOT NULL,
    count_of_minus integer NOT NULL,
    reservation_id integer,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    active boolean DEFAULT true NOT NULL,
    time_of_reservation timestamp with time zone,
    can_be_reservated boolean DEFAULT true
);


ALTER TABLE public.frontend_ad OWNER TO example_devel;

--
-- TOC entry 162 (class 1259 OID 16458)
-- Dependencies: 3 161
-- Name: frontend_ad_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE frontend_ad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.frontend_ad_id_seq OWNER TO example_devel;

--
-- TOC entry 1956 (class 0 OID 0)
-- Dependencies: 162
-- Name: frontend_ad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE frontend_ad_id_seq OWNED BY frontend_ad.id;


--
-- TOC entry 1957 (class 0 OID 0)
-- Dependencies: 162
-- Name: frontend_ad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('frontend_ad_id_seq', 23, true);


--
-- TOC entry 163 (class 1259 OID 16460)
-- Dependencies: 3
-- Name: frontend_adimage; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE frontend_adimage (
    id integer NOT NULL,
    ad_id integer NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.frontend_adimage OWNER TO example_devel;

--
-- TOC entry 164 (class 1259 OID 16463)
-- Dependencies: 163 3
-- Name: frontend_adimage_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE frontend_adimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.frontend_adimage_id_seq OWNER TO example_devel;

--
-- TOC entry 1958 (class 0 OID 0)
-- Dependencies: 164
-- Name: frontend_adimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE frontend_adimage_id_seq OWNED BY frontend_adimage.id;


--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 164
-- Name: frontend_adimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('frontend_adimage_id_seq', 27, true);


--
-- TOC entry 165 (class 1259 OID 16465)
-- Dependencies: 3
-- Name: frontend_banner; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE frontend_banner (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(255),
    banner_url character varying(255) NOT NULL,
    target_url character varying(255) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.frontend_banner OWNER TO example_devel;

--
-- TOC entry 166 (class 1259 OID 16471)
-- Dependencies: 3 165
-- Name: frontend_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE frontend_banner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.frontend_banner_id_seq OWNER TO example_devel;

--
-- TOC entry 1960 (class 0 OID 0)
-- Dependencies: 166
-- Name: frontend_banner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE frontend_banner_id_seq OWNED BY frontend_banner.id;


--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 166
-- Name: frontend_banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('frontend_banner_id_seq', 1, false);


--
-- TOC entry 167 (class 1259 OID 16473)
-- Dependencies: 3
-- Name: frontend_category; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE frontend_category (
    id integer NOT NULL,
    category character varying(100) NOT NULL,
    category_url character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    parent_id integer
);


ALTER TABLE public.frontend_category OWNER TO example_devel;

--
-- TOC entry 168 (class 1259 OID 16476)
-- Dependencies: 3 167
-- Name: frontend_category_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE frontend_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.frontend_category_id_seq OWNER TO example_devel;

--
-- TOC entry 1962 (class 0 OID 0)
-- Dependencies: 168
-- Name: frontend_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE frontend_category_id_seq OWNED BY frontend_category.id;


--
-- TOC entry 1963 (class 0 OID 0)
-- Dependencies: 168
-- Name: frontend_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('frontend_category_id_seq', 6, true);


--
-- TOC entry 169 (class 1259 OID 16478)
-- Dependencies: 3
-- Name: frontend_city; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE frontend_city (
    id integer NOT NULL,
    city character varying(100) NOT NULL,
    city_url character varying(100) NOT NULL,
    city_lokal character varying(100) NOT NULL
);


ALTER TABLE public.frontend_city OWNER TO example_devel;

--
-- TOC entry 170 (class 1259 OID 16481)
-- Dependencies: 169 3
-- Name: frontend_city_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE frontend_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.frontend_city_id_seq OWNER TO example_devel;

--
-- TOC entry 1964 (class 0 OID 0)
-- Dependencies: 170
-- Name: frontend_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE frontend_city_id_seq OWNED BY frontend_city.id;


--
-- TOC entry 1965 (class 0 OID 0)
-- Dependencies: 170
-- Name: frontend_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('frontend_city_id_seq', 6, true);


--
-- TOC entry 171 (class 1259 OID 16483)
-- Dependencies: 3
-- Name: frontend_news; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE frontend_news (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(255) NOT NULL,
    title_url character varying(255) NOT NULL,
    text text NOT NULL,
    time_of_publication timestamp with time zone NOT NULL
);


ALTER TABLE public.frontend_news OWNER TO example_devel;

--
-- TOC entry 172 (class 1259 OID 16489)
-- Dependencies: 3 171
-- Name: frontend_news_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE frontend_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.frontend_news_id_seq OWNER TO example_devel;

--
-- TOC entry 1966 (class 0 OID 0)
-- Dependencies: 172
-- Name: frontend_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE frontend_news_id_seq OWNED BY frontend_news.id;


--
-- TOC entry 1967 (class 0 OID 0)
-- Dependencies: 172
-- Name: frontend_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('frontend_news_id_seq', 2, true);


--
-- TOC entry 173 (class 1259 OID 16491)
-- Dependencies: 3
-- Name: frontend_profile; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE frontend_profile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    phone character varying(20) NOT NULL
);


ALTER TABLE public.frontend_profile OWNER TO example_devel;

--
-- TOC entry 174 (class 1259 OID 16494)
-- Dependencies: 173 3
-- Name: frontend_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE frontend_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.frontend_profile_id_seq OWNER TO example_devel;

--
-- TOC entry 1968 (class 0 OID 0)
-- Dependencies: 174
-- Name: frontend_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE frontend_profile_id_seq OWNED BY frontend_profile.id;


--
-- TOC entry 1969 (class 0 OID 0)
-- Dependencies: 174
-- Name: frontend_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('frontend_profile_id_seq', 10, true);


--
-- TOC entry 175 (class 1259 OID 16496)
-- Dependencies: 3
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE registration_registrationprofile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    activation_key character varying(40) NOT NULL
);


ALTER TABLE public.registration_registrationprofile OWNER TO example_devel;

--
-- TOC entry 176 (class 1259 OID 16499)
-- Dependencies: 175 3
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: example_devel
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registration_registrationprofile_id_seq OWNER TO example_devel;

--
-- TOC entry 1970 (class 0 OID 0)
-- Dependencies: 176
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example_devel
--

ALTER SEQUENCE registration_registrationprofile_id_seq OWNED BY registration_registrationprofile.id;


--
-- TOC entry 1971 (class 0 OID 0)
-- Dependencies: 176
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example_devel
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 9, true);


--
-- TOC entry 177 (class 1259 OID 16501)
-- Dependencies: 3
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: example_devel; Tablespace: 
--

CREATE TABLE thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO example_devel;

--
-- TOC entry 1888 (class 2604 OID 16507)
-- Dependencies: 141 140
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 1889 (class 2604 OID 16508)
-- Dependencies: 143 142
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 1890 (class 2604 OID 16509)
-- Dependencies: 145 144
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY auth_message ALTER COLUMN id SET DEFAULT nextval('auth_message_id_seq'::regclass);


--
-- TOC entry 1891 (class 2604 OID 16510)
-- Dependencies: 147 146
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 1892 (class 2604 OID 16511)
-- Dependencies: 151 148
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 1893 (class 2604 OID 16512)
-- Dependencies: 150 149
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 1894 (class 2604 OID 16513)
-- Dependencies: 153 152
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 1895 (class 2604 OID 16514)
-- Dependencies: 155 154
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 1897 (class 2604 OID 16515)
-- Dependencies: 157 156
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 1898 (class 2604 OID 16516)
-- Dependencies: 160 159
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- TOC entry 1901 (class 2604 OID 16517)
-- Dependencies: 162 161
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY frontend_ad ALTER COLUMN id SET DEFAULT nextval('frontend_ad_id_seq'::regclass);


--
-- TOC entry 1902 (class 2604 OID 16518)
-- Dependencies: 164 163
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY frontend_adimage ALTER COLUMN id SET DEFAULT nextval('frontend_adimage_id_seq'::regclass);


--
-- TOC entry 1903 (class 2604 OID 16519)
-- Dependencies: 166 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY frontend_banner ALTER COLUMN id SET DEFAULT nextval('frontend_banner_id_seq'::regclass);


--
-- TOC entry 1904 (class 2604 OID 16520)
-- Dependencies: 168 167
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY frontend_category ALTER COLUMN id SET DEFAULT nextval('frontend_category_id_seq'::regclass);


--
-- TOC entry 1905 (class 2604 OID 16521)
-- Dependencies: 170 169
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY frontend_city ALTER COLUMN id SET DEFAULT nextval('frontend_city_id_seq'::regclass);


--
-- TOC entry 1906 (class 2604 OID 16522)
-- Dependencies: 172 171
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY frontend_news ALTER COLUMN id SET DEFAULT nextval('frontend_news_id_seq'::regclass);


--
-- TOC entry 1907 (class 2604 OID 16523)
-- Dependencies: 174 173
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY frontend_profile ALTER COLUMN id SET DEFAULT nextval('frontend_profile_id_seq'::regclass);


--
-- TOC entry 1908 (class 2604 OID 16524)
-- Dependencies: 176 175
-- Name: id; Type: DEFAULT; Schema: public; Owner: example_devel
--

ALTER TABLE ONLY registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_registrationprofile_id_seq'::regclass);


--
-- TOC entry 1909 (class 0 OID 16387)
-- Dependencies: 140 1929
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 1910 (class 0 OID 16392)
-- Dependencies: 142 1929
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 1911 (class 0 OID 16397)
-- Dependencies: 144 1929
-- Data for Name: auth_message; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY auth_message (id, user_id, message) FROM stdin;
\.


--
-- TOC entry 1912 (class 0 OID 16405)
-- Dependencies: 146 1929
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add message	4	add_message
11	Can change message	4	change_message
12	Can delete message	4	delete_message
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add mesto	8	add_city
23	Can change mesto	8	change_city
24	Can delete mesto	8	delete_city
25	Can add kategória	9	add_category
26	Can change kategória	9	change_category
27	Can delete kategória	9	delete_category
28	Can add novinka	10	add_news
29	Can change novinka	10	change_news
30	Can delete novinka	10	delete_news
31	Can add banner	11	add_banner
32	Can change banner	11	change_banner
33	Can delete banner	11	delete_banner
34	Can add inzerát	12	add_ad
35	Can change inzerát	12	change_ad
36	Can delete inzerát	12	delete_ad
37	Can add log entry	13	add_logentry
38	Can change log entry	13	change_logentry
39	Can delete log entry	13	delete_logentry
40	Can add kv store	14	add_kvstore
41	Can change kv store	14	change_kvstore
42	Can delete kv store	14	delete_kvstore
43	Can add obrázok	15	add_adimage
44	Can change obrázok	15	change_adimage
45	Can delete obrázok	15	delete_adimage
46	Can add registration profile	16	add_registrationprofile
47	Can change registration profile	16	change_registrationprofile
48	Can delete registration profile	16	delete_registrationprofile
58	Can add profil	20	add_profile
59	Can change profil	20	change_profile
60	Can delete profil	20	delete_profile
\.


--
-- TOC entry 1913 (class 0 OID 16410)
-- Dependencies: 148 1929
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY auth_user (id, username, first_name, last_name, email, password, is_staff, is_active, is_superuser, last_login, date_joined) FROM stdin;
16	skuska6	Skuska	skuskovka	info@funes.sk	sha1$21de8$72a51242d7323bfad838c514381ea9338f6139e3	f	f	f	2012-09-02 23:40:21.346865+02	2012-09-02 23:40:21.346865+02
17	skuska9	Skuska	Skusobna	info@funes.sk	sha1$e8d55$bf150a9126f2323eaa86b5da7a074deb4d2e0a86	f	f	f	2012-09-02 23:49:47.051157+02	2012-09-02 23:49:47.051157+02
3	stachitka	Ďuri	Štachitka	359273@mail.muni.cz	sha1$b79e9$3ae1ba7a988b554c170089f758b32a64d7f947a9	f	t	f	2012-07-08 13:31:09+02	2012-07-08 13:31:09+02
4	anderZkosic	Ander	Z Košíc	359273@law.muni.cz	sha1$60285$1f4bd3278e3db5c5e41c4d55627f8e4c247dc58d	f	t	f	2012-07-08 13:31:22+02	2012-07-08 13:31:22+02
5	admin	Admin	Administrátorsky	info@funes.sk	sha1$8c55b$4722843e3007774841dcb24c7d9cf13895981021	t	t	t	2012-08-30 15:53:39+02	2012-08-30 12:36:37+02
24	Skuska10	Skuska	Skuskova	katuscak.d@gmail.com	sha1$65f80$72a2bc80224cfbd0adb69205fb7706f2f66a9f0e	f	t	f	2012-09-05 19:49:51.307935+02	2012-09-05 19:49:51.307935+02
25	Skuska11	Skuska	Skuskovska	katuscak.d@gmail.com	sha1$22f02$ab351bf22d0148f2d4b543b98938fa7242e4bf18	f	t	f	2012-09-05 20:03:07.088733+02	2012-09-05 20:03:07.088733+02
8	skusobne	Skuska	skusobne	katuscak.d@gmail.com	sha1$c8a2c$e17841e2be227d9531dd5726e926f70cb06a03f0	f	f	f	2012-09-02 17:27:06.913281+02	2012-09-02 17:27:06.913281+02
9	skusobne2	Skuska	Skusobnik	info@funes.sk	sha1$1b575$a2c3a0a409cc63c2e9cf8f02dda41fb90a38a9e1	f	f	f	2012-09-02 17:28:33.834617+02	2012-09-02 17:28:33.834617+02
10	skuska3	Skuska	skuska3	katuscak.d@gmail.com	sha1$2c5fa$ff651c7f11db6387ba9eee6e737a0a4017c45ef3	f	f	f	2012-09-02 17:35:11.17634+02	2012-09-02 17:35:11.17634+02
11	skuska4	skuska	skuska	info@funes.sk	sha1$58e86$c481781a9b79d27588170c9adda945329dfe7323	f	f	f	2012-09-02 17:46:27.748002+02	2012-09-02 17:46:27.748002+02
15	skuska5	Skuska	Skuskovska	info@funes.sk	sha1$66866$19fd495b640e55287efa9959dd4a62c3060361fb	f	f	f	2012-09-02 22:34:32.796107+02	2012-09-02 22:34:32.796107+02
26	Skuska12	Skuska	Skuskovska	katuscak.d@gmail.com	sha1$67838$d8185388471ac79cc51e02b30040ec4e1bb4430b	f	t	f	2012-09-05 20:33:01.01423+02	2012-09-05 20:33:01.01423+02
27	hesso_jasterak	Hesso	Jašterák	kokossino@gmail.com	sha1$3c2d0$f4d7dc5154924d9d2e34b4c1449fc65a21c7f53a	f	t	f	2012-10-30 20:55:40.149403+01	2012-10-30 20:55:23.155638+01
28	smrtka97	Lukáš	Hlavatý	smrtka97@gmail.com	sha1$b8b8b$0aae33000dc88cdc4eb350c29eb1ab65f8396fcc	f	t	f	2012-10-30 21:04:30.889078+01	2012-10-30 21:04:12.499678+01
1	devel_root	Devel	root	katuscak.d@gmail.com	sha1$ba4e2$209028975b693b7e43fcdd8027c3106bdea8ef05	t	t	t	2012-12-25 12:09:52.379405+01	2012-06-08 22:52:09.910613+02
30	oli.G	Oliver	Gašpar	oliver.g.sk@gmail.com	sha1$ba4e2$209048975b691b7e43fcdd8027c3106bdea8ef05	f	t	f	2012-12-26 13:27:54.076527+01	2012-12-18 22:22:52.043744+01
29	skuska30	Skuska	Skuskovska	katuscak.d@gmail.com	sha1$49c21$d9e4be0183499d6646d84d55614394059f4cb832	f	t	f	2012-11-26 02:40:02.401683+01	2012-11-26 02:40:02.401683+01
32	pokus123				sha1$ba4e2$209048975b693b7e43fcdd3027c3106bdea8ef05	f	t	f	2012-12-26 16:18:13.454471+01	2012-12-26 16:18:13.454471+01
2	sopruso	Dávid	Katuščák	katuscak.d@gmail.com	sha1$ba4e2$209048575b693b7e43fcdd8027c3106bdea8ef05	f	t	f	2012-12-29 12:38:25.133381+01	2012-07-08 13:30:50+02
31	Meliško	Richard	Meliško	katuscak.d@gmail.com	sha1$ba4e2$209048975b693b3e43fcdd8027c3106bdea8ef05	f	t	f	2012-12-23 15:15:05.153718+01	2012-12-23 15:14:42.884975+01
\.


--
-- TOC entry 1914 (class 0 OID 16413)
-- Dependencies: 149 1929
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 1915 (class 0 OID 16420)
-- Dependencies: 152 1929
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 1916 (class 0 OID 16425)
-- Dependencies: 154 1929
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2012-06-09 15:39:44.774219+02	1	8	1	Prešov	1	
2	2012-06-09 15:52:42.685421+02	1	9	1	Elektro	1	
3	2012-06-09 15:53:10.501122+02	1	9	2	Audio	1	
4	2012-06-09 15:57:22.165843+02	1	10	1	Lorem Ipsum	1	
5	2012-06-09 16:34:28.545497+02	1	8	2	Banská Bystrica	1	
6	2012-07-08 13:30:50.751837+02	1	3	2	sopruso	1	
7	2012-07-08 13:31:09.145254+02	1	3	3	stachitka	1	
8	2012-07-08 13:31:22.858781+02	1	3	4	anderZkosic	1	
9	2012-07-08 13:32:25.002328+02	1	3	4	anderZkosic	2	Zmenené first_name, last_name a email.
10	2012-07-08 13:32:44.321912+02	1	3	2	sopruso	2	Zmenené first_name, last_name a email.
11	2012-07-08 13:32:54.786584+02	1	3	3	stachitka	2	Zmenené first_name, last_name a email.
12	2012-07-08 13:33:29.212183+02	1	8	3	Bratislava	1	
13	2012-07-08 13:33:46.878393+02	1	8	4	Kereštvej	1	
14	2012-07-08 13:33:58.140007+02	1	8	5	Kokyňa	1	
15	2012-07-08 13:34:32.152563+02	1	8	6	Kocúrkovo	1	
16	2012-07-08 13:34:59.611802+02	1	9	3	Auto-moto	1	
17	2012-07-08 13:35:28.01423+02	1	9	4	Autá do 3,5t	1	
18	2012-07-08 13:35:53.165834+02	1	9	5	Motorky	1	
19	2012-07-08 13:36:14.451678+02	1	9	6	Nákladné auta	1	
20	2012-07-08 13:37:19.712654+02	1	10	2	Mama ožen ma	1	
21	2012-07-08 13:38:47.322462+02	1	12	1	Predam ošče	1	
22	2012-07-09 16:09:01.74104+02	1	12	2	Darujem potrhaný stan	1	
23	2012-07-09 16:09:21.108944+02	1	12	1	Darujem ošče	2	Zmenené title a title_url.
24	2012-07-09 16:10:48.402072+02	1	12	3	Zháňam zborník ľudových vtipov	1	
25	2012-07-09 16:20:54.291477+02	1	12	4	Našiel by sa použitý televízor?	1	
26	2012-07-26 23:14:44.077406+02	1	15	1	img/ads/18TH.png	1	
27	2012-07-26 23:15:22.01343+02	1	15	2	img/ads/3621_409248662444708_1610848873_n.jpg	1	
28	2012-07-26 23:15:51.658036+02	1	15	3	img/ads/165847_10150912611400426_887555583_n.jpg	1	
29	2012-08-07 23:46:32.062888+02	1	15	4	img/ads/181145_445117735518600_511708912_n.jpg	1	
30	2012-08-07 23:46:57.514173+02	1	15	5	img/ads/66261_1596036497318_1013615_n.jpg	1	
31	2012-08-07 23:47:08.322325+02	1	15	6	img/ads/189573_421658561213901_161667969_n.jpg	1	
32	2012-08-21 16:15:15.961273+02	1	12	5	Darujem ošče	1	
33	2012-08-21 16:16:04.532971+02	1	12	6	Halo halo ho	1	
34	2012-08-21 16:17:15.654917+02	1	12	7	Hladam cedecko Andera z Kosic	1	
35	2012-08-30 12:36:37.865538+02	1	3	5	admin	1	
36	2012-08-30 12:37:09.059876+02	1	3	5	admin	2	Zmenené first_name, last_name, email a is_superuser.
37	2012-08-30 12:37:39.093508+02	1	3	5	admin	2	Zmenené is_staff.
38	2012-08-30 17:00:40.220414+02	1	3	5	admin	2	Zmenené is_active.
39	2012-08-30 17:01:09.005434+02	1	3	5	admin	2	Zmenené is_active.
40	2012-09-02 14:33:47.289429+02	1	7	1	www.nevyhadzujto.sk	2	Zmenené domain a name.
41	2012-09-02 17:09:15.945646+02	1	16	1	Registration information for skusobne	3	
42	2012-09-02 17:09:27.702235+02	1	3	6	skusobne	3	
43	2012-09-02 17:26:41.51234+02	1	3	7	skusobne	3	
44	2012-09-02 22:11:11.288416+02	1	3	13	skuska_pica	1	
45	2012-09-02 22:16:43.137539+02	1	3	13	skuska_pica	3	
46	2012-09-03 00:48:08.860562+02	1	12	8	Skuska time of publication	1	
47	2012-09-13 00:25:43.279645+02	1	12	1	Darujem ošče	2	Zmenené psc.
\.


--
-- TOC entry 1917 (class 0 OID 16434)
-- Dependencies: 156 1929
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	message	auth	message
5	content type	contenttypes	contenttype
6	session	sessions	session
7	site	sites	site
8	mesto	frontend	city
9	kategória	frontend	category
10	novinka	frontend	news
11	banner	frontend	banner
12	inzerát	frontend	ad
13	log entry	admin	logentry
14	kv store	thumbnail	kvstore
15	obrázok	frontend	adimage
16	registration profile	registration	registrationprofile
20	profil	frontend	profile
\.


--
-- TOC entry 1918 (class 0 OID 16439)
-- Dependencies: 158 1929
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
0b4c251718979a712b90f9a356e86fec	NjcxM2JlMmQ5YjU1OGZhNjc2NzdkMGZiZmMwZWQxZjM5YjcwYjIxMTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-06-23 15:11:29.808726+02
db620ec8cc364ae555045a74e56ad0b0	OTdlMjk4YWI4OGVkZDk2YWNmNWEzZWJmYTk4OWNiZjZkOTNkYjExZTqAAn1xAShVBnNlYXJjaHEC\nWAEAAABhVQ1fYXV0aF91c2VyX2lkSwFVCGxva2FsaXRhcQNYBwAAAGNlbGEtc3JVBnNrdXNrYVUG\nc2t1c2thVQhzX2ZvdGtvdXEEWAQAAABOb25lVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5j\nb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kVQlrYXRlZ29yaWFxBVgGAAAAdnNldGt5\nVQN0eXBxBlgEAAAATm9uZVUHc2t1c2thMlgHAAAAc2t1c2thMnUu\n	2012-10-18 19:44:04.001526+02
0cbba3f50ffdbc89fbd703e044ef6887	YmE4ZTcyYTQ5MjdmMTU2NWJlNDkzNDdjZDVmMTAyMjQ1Mjc5NDhkZDqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n	2012-10-31 01:05:49.613328+01
4e006b4de8d3d28c0c6e3dfdab86c102	Y2YzMDRmNWY1YWM0NjAyNTRjNDJmYjM0OWUxMmFlNmYwZjY2ZDFmMzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVDV9h\ndXRoX3VzZXJfaWRLAVUPZGphbmdvX2xhbmd1YWdlWAIAAABza3ECdS4=\n	2012-06-24 13:01:38.558305+02
a3f2d99318672f92c52fc563c6ebaa8c	NjcxM2JlMmQ5YjU1OGZhNjc2NzdkMGZiZmMwZWQxZjM5YjcwYjIxMTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-06-24 20:39:26.306237+02
7f496e72f9fbf7536ce1ba690892fc4b	MzJmYzgwOWVhOGVjZDA1MTY4ZGZlNzNlZmVlYzJlZWRmMWJiYmYyOTqAAn1xAS4=\n	2012-06-24 20:39:26.51067+02
f8e97cebab8b1463a3708233dfb69b5f	YmE4ZTcyYTQ5MjdmMTU2NWJlNDkzNDdjZDVmMTAyMjQ1Mjc5NDhkZDqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n	2012-07-09 21:18:07.188878+02
7aa9b2d35c7074581fe2e1f64ff99e3f	MWY0MTIwOGFmZmJjMDhiYTcyOGFhNThiMjc0NDQ2MmU3OTQyMzgyYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-07-09 21:18:42.925432+02
c6402f50e80eecefc8af1aa23a634ec9	NjcxM2JlMmQ5YjU1OGZhNjc2NzdkMGZiZmMwZWQxZjM5YjcwYjIxMTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-08-03 12:29:47.551038+02
29a856d9e8eedf972eaa5e5cb0f2ceb3	NjcxM2JlMmQ5YjU1OGZhNjc2NzdkMGZiZmMwZWQxZjM5YjcwYjIxMTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n	2012-08-03 12:29:47.734028+02
f454a63ba149af8a2bf4d73d0fe19463	MWY0MTIwOGFmZmJjMDhiYTcyOGFhNThiMjc0NDQ2MmU3OTQyMzgyYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-08-08 19:54:47.15453+02
a93d4111bb9ed23618a670bdc2dcb359	MWY0MTIwOGFmZmJjMDhiYTcyOGFhNThiMjc0NDQ2MmU3OTQyMzgyYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-09-27 00:03:52.49519+02
37780b9f156c69e4408e765bc5372c5b	YmE4ZTcyYTQ5MjdmMTU2NWJlNDkzNDdjZDVmMTAyMjQ1Mjc5NDhkZDqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n	2012-09-13 12:39:12.210437+02
2d04bc96043afcb3c20c01f2c5e63134	NWI0MzhmOThkMmNhOTMyMjkzNDU4YWZlNDJhNmI0YWI2NjM5MzE2ZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLBXUu\n	2012-09-13 15:51:37.891231+02
08c3ce647a5abf38b60c8c965740315e	ZTdhOWQ0NTc4OGU2YTQ3NmQwMmIwMmQyMDNhMjljYmI0M2JjN2VhMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLG3Uu\n	2012-11-13 20:55:40.187883+01
3936f9fc3a689ecef00c965ad247f6c1	ZmFiYzZmZDcxMjZkYmU0YTU1N2I3MjdmMGI5NTBkNTAzMTljM2M5MTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLHHUu\n	2012-11-13 21:04:31.00436+01
e67154335173c6a88f144dfb3b248a69	ZWFiNDI5YTQ5MjFlODM3NDhiYjcxYTk2ZmUwYzMyM2U5NzNiYjRiYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2012-11-13 23:32:44.653218+01
1f6072cc6fe2fc032c13938fce5c2bbc	ODMyMGY3YWViNTkwODM4ZjJkNGQ1NWRiMzFiMzQ0YTRjYTk4MjQ3ZTqAAn1xAShVCWthdGVnb3Jp\nYXECWAEAAAA0VQhzX2ZvdGtvdXEDWAQAAABOb25lcQRVBnNlYXJjaHEFWAAAAABVA3R5cHEGWAYA\nAAB2c2V0a3lxB1UIbG9rYWxpdGFxCFgBAAAAM3Uu\n	2013-01-01 21:14:45.940754+01
50c491664b7aa4c9270faf679028de07	ODI4Nzg2OTNlYTA2OWExMWQwZjgwYTk2ZDMzNGExMDBhZTBiNjc2YTqAAn1xAShVCWthdGVnb3Jp\nYXECWAYAAAB2c2V0a3lxA1UDdHlwcQRYBgAAAHZzZXRreXEFVQZzZWFyY2hxBlgAAAAAVQhzX2Zv\ndGtvdXEHWAQAAABOb25lcQhVCGxva2FsaXRhcQlYBwAAAGNlbGEtc3JxCnUu\n	2012-12-15 22:24:13.003+01
10d8db858624c8d8d9f92757183efb5a	OWQzMjIxNDA1NTU2ZTNkZDk2NTNhYzBiOTE3MjY2MDlhZmEyN2Y3YjqAAn1xAShVCWthdGVnb3Jp\nYXECWAEAAAA1VQhzX2ZvdGtvdXEDWAQAAABOb25lcQRVBnNlYXJjaHEFWAAAAABVA3R5cHEGWAYA\nAAB2c2V0a3lxB1UIbG9rYWxpdGFxCFgBAAAAMXUu\n	2012-12-06 16:01:42.231507+01
15cb4d7d005ff1e80655548d7ab75b59	MWY0MTIwOGFmZmJjMDhiYTcyOGFhNThiMjc0NDQ2MmU3OTQyMzgyYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAXUu\n	2012-12-17 15:44:17.624892+01
1394dd181109930c83dfaf7c74130b84	OTFjMWYyZmUxNzc3MTNjMmYwNjFmZmZiNDk3YmNhZTVlZmU2ZGJkNTqAAn1xAShVBnNlYXJjaHEC\nWAAAAABVDV9hdXRoX3VzZXJfaWRxA0sCVQhsb2thbGl0YXEEWAcAAABjZWxhLXNycQVVCHNfZm90\na291cQZYBAAAAE5vbmVxB1USX2F1dGhfdXNlcl9iYWNrZW5kcQhVKWRqYW5nby5jb250cmliLmF1\ndGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcQlVCWthdGVnb3JpYXEKWAYAAAB2c2V0a3lxC1UDdHlw\ncQxYBgAAAHZzZXRreXENdS4=\n	2012-12-20 22:27:35.074294+01
5d5d4afea3f53450ea79a9c35e6a586b	OWExMDM2YTgyYjJiYjcyYjk5NTQ2NzAyNmUzNTIyMzQ3Yzk2OTBkZDqAAn1xAShVBnNlYXJjaHEC\nWAAAAABVDV9hdXRoX3VzZXJfaWRxA0sBVRJfYXV0aF91c2VyX2JhY2tlbmRxBFUpZGphbmdvLmNv\nbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxBXUu\n	2012-12-27 00:22:17.858893+01
f516749dd5ca1b0024d89f3a54894b53	MzJmYzgwOWVhOGVjZDA1MTY4ZGZlNzNlZmVlYzJlZWRmMWJiYmYyOTqAAn1xAS4=\n	2013-01-01 23:36:41.468177+01
fc69ac998a03deb5c4c6569246eea8ad	YjJlZTM1ZTIwNDAyNDEyMGE3ZTNmMTY1MjUyMDllNjZiZjNhZWM5MjqAAn1xAShVCWthdGVnb3Jp\nYXECWAEAAAAzVQN0eXBxA1gGAAAAdnNldGt5cQRVBnNlYXJjaHEFWAAAAABVCHNfZm90a291cQZY\nBAAAAE5vbmVxB1UIbG9rYWxpdGFxCFgHAAAAY2VsYS1zcnEJdS4=\n	2013-01-03 11:53:32.740489+01
4ee5695f44a737d54ed0731f261e6954	ZWFiNDI5YTQ5MjFlODM3NDhiYjcxYTk2ZmUwYzMyM2U5NzNiYjRiYzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQRLAnUu\n	2013-01-06 17:59:45.026429+01
526c347cd0e36ee38424f14c81cb2bc8	ZmMyMjYyMWEyMDg5YzI5ZmRkNTVhZDQ5YzVjZjIyMThmODI3Y2VlYjqAAn1xAShVBnNlYXJjaHEC\nWAAAAABVDV9hdXRoX3VzZXJfaWRxA0sCVQhsb2thbGl0YXEEWAEAAAAxVQN0eXBxBVgGAAAAdnNl\ndGt5cQZVEl9hdXRoX3VzZXJfYmFja2VuZHEHVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRz\nLk1vZGVsQmFja2VuZHEIVQlrYXRlZ29yaWFxCVgBAAAAM1UIc19mb3Rrb3VxClgBAAAAMXUu\n	2013-01-10 17:27:07.763208+01
440aa5d85012ad54836b2629ce204355	MzIxNjYxZDFjNGE4NzI5NzIyZjcyZmNmMmI3MGExMmVmMjRiNWFmZTqAAn1xAShVCWthdGVnb3Jp\nYXECWAYAAAB2c2V0a3lxA1UIc19mb3Rrb3VxBFgEAAAATm9uZXEFVQZzZWFyY2hxBlgAAAAAVQN0\neXBxB1gGAAAAcG9udWthcQhVCGxva2FsaXRhcQlYBwAAAGNlbGEtc3JxCnUu\n	2013-01-09 16:22:04.259428+01
42649b8a28ab3a92cd93ca1616333f95	MWQ3N2JkNmExNGZkYjkyODQ0Zjk4MWExOGQ2Y2ZiYTQyMzA5NDYxYjqAAn1xAShVBnNlYXJjaHEC\nWAAAAABVDV9hdXRoX3VzZXJfaWRxA0sCVRJfYXV0aF91c2VyX2JhY2tlbmRxBFUpZGphbmdvLmNv\nbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxBXUu\n	2013-01-12 13:07:39.209936+01
\.


--
-- TOC entry 1919 (class 0 OID 16445)
-- Dependencies: 159 1929
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY django_site (id, domain, name) FROM stdin;
1	www.nevyhadzujto.sk	Nevyhadzujto.Sk
\.


--
-- TOC entry 1920 (class 0 OID 16450)
-- Dependencies: 161 1929
-- Data for Name: frontend_ad; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY frontend_ad (id, user_id, title, title_url, city_id, address, psc, category_id, text_of_ad, type_of_ad, is_new, is_antique, is_inventory, time_of_publication, count_of_views, count_of_plus, count_of_minus, reservation_id, latitude, longitude, active, time_of_reservation, can_be_reservated) FROM stdin;
2	2	Darujem potrhaný stan	darujem-potrhany-stan	2	Banskobystrická 19	8900	6	Darujem potrhaný stan. Je z neho možné použiť celtu, prípadne ho nejako opraviť.	t	f	f	f	2012-09-03 00:40:57.007054+02	100	0	0	\N	49.075575100000002	20.1433596	t	\N	t
3	3	Zháňam zborník ľudových vtipov	zhanam-zbornik-udovych-vtipov	1	Lomnická 14	8001	2	Dobrý deň, zháňam zborník ľudových vtipov, ktoré by som mohol použiť pri nahrávke mojej novej kazety: Vtipy Ďuriho Štachitku.\n\nĎakujem za odpoveď.	f	f	f	f	2012-07-09 16:10:48.400541+02	29	0	0	\N	49	34	t	\N	t
16	2	Darujem ošče	darujem-osce-3	1	Lomnická 12	08212	4	asdsdsa	t	t	f	f	2012-09-20 01:49:59.373498+02	20	0	0	\N	48.972858700000003	21.261832999999999	t	\N	t
4	4	Našiel by sa použitý televízor?	nasiel-sa-pouzity-televizor	5	Trnkov 49	8212	1	Najde sa u niekoho použitý, funkčný a nechcený starý televízor? Potrebujem ho na chalupu, aby som si mohol pozrieť Tour de France, olympiádu a podobné športové udalosti.	f	f	t	f	2012-07-09 16:20:54.289554+02	8	0	0	\N	49	0	t	\N	t
1	4	Darujem ošče	darujem-osce	4	Kokyňská 32	08212	5	Darujem pojazdné dvojkolesové ošče. Fajne. Po generálnej oprave.	t	t	f	f	2012-07-09 16:09:21+02	38	0	0	\N	49	37	t	\N	t
15	2	Darujem ošče	darujem-osce-1	1	Lomnická 12	08212	4	asdsdsa	t	t	f	f	2012-09-20 01:47:44.6093+02	4	0	0	\N	48.972858700000003	21.261832999999999	t	\N	t
14	2	Halo 2	halo-2	4	Kokyňska 18	08212	1	text text text	t	t	f	f	2012-09-13 02:59:05.872397+02	2	0	0	\N	0	0	t	\N	t
5	3	Darujem ošče	darujem-osce-2	3	Bratislavská 12	2000	2	Nejaky ten text inzeratu, alebo Lorem ipsum ...	t	t	f	f	2012-08-21 16:15:15.80194+02	37	0	0	\N	0	0	t	\N	t
17	2	Polar light	polar-light	1	Kokyňská 32	08212	3	Mali by byt chybne suradnice	f	t	f	f	2012-09-20 01:52:01.1991+02	24	0	0	\N	49.057173300000002	21.3643453	t	\N	t
13	2	Nový inzerát z vonku ščťž	novy-inzerat-z-vonku-sctz-1	3	Kereštvejská 122	08005	4	text inzeratu	t	t	f	f	2012-09-13 02:21:16.220516+02	15	0	0	\N	0	0	t	\N	f
21	2	Darujem Chrysler 300c 3.0CRD-diesel	darujem-chrysler-300c-30crd-diesel-1	1	Lomnická 12	08001	3	Darujem Chrysler 300c 3.0CRD-diesel, úprava na 300PS + 620Nm. R.v: 2006, model 2007, 187000km, kúpené nové v SR, servisná historia, sezónne prezutie, full výbava. \r\nAuto je bez ďaľších investícií. T.Č.:0904874112.	t	t	f	f	2012-12-23 17:28:29.387247+01	22	0	0	1	49.250144800000001	20.568389499999999	t	2012-12-25 12:33:47.241714+01	t
11	2	Novy inzerat z vonku	novy-inzerat-z-vonku-1	2	Haluškova 12	08212	2	Text z vonku	f	t	f	f	2012-09-13 02:02:08.485574+02	8	0	0	\N	0	0	t	\N	t
12	2	Nový inzerát z vonku ščťž	novy-inzerat-z-vonku-sctz	3	Kokyňská 32	08212	4	text inzeratu	t	t	f	f	2012-09-13 02:16:12.616646+02	2	0	0	\N	0	0	t	\N	t
19	2	Lelákov inzerát	lelakov-inzerat	1	Hlavná 58	08001	5	Zháňam motorku JAWA 350. V zachovalom stave, vhodná na jazdenie. Papiere nie sú potrebné.\r\n\r\nPrípadne vymaním za Pionier 50.\r\n\r\nĎakujem.	f	f	t	f	2012-11-20 00:04:49.95801+01	262	0	0	\N	48.996684700000003	21.241400299999999	t	\N	t
9	2	Novy inzerat z vonku	novy-inzerat-z-vonku	2	Haluškova 12	08212	2	Text z vonku	f	t	f	f	2012-09-13 01:49:51.738323+02	11	0	0	\N	0	0	t	\N	t
8	2	Skuska time of publication	skuska-time-publication	1	Bratislavská 12	8212	2	Skuska time of publication	t	f	f	f	2012-09-03 00:47:50+02	30	0	0	\N	0	0	t	\N	t
7	4	Hladam cedecko Andera z Kosic	hladam-cedecko-andera-z-kosic	5	Kokyňska 18	8212	4	Hľadám CéDéčko Andera z Košíc, alebo Anderov rebrinák. Diky za každú ponuku.	f	f	f	t	2012-08-21 16:17:15.653393+02	14	0	0	\N	0	0	t	\N	t
6	2	Halo halo ho	halo-halo-ho	4	Kereštvejská 122	8212	3	Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido Doremifa solasido	f	f	t	f	2012-08-21 16:16:04.530256+02	16	0	0	\N	0	0	t	\N	t
20	2	Darujem Chrysler 300c 3.0CRD-diesel	darujem-chrysler-300c-30crd-diesel	1	Lomnická 12	08001	3	Darujem Chrysler 300c 3.0CRD-diesel, úprava na 300PS + 620Nm. R.v: 2006, model 2007, 187000km, kúpené nové v SR, servisná historia, sezónne prezutie, full výbava. \r\nAuto je bez ďaľších investícií. T.Č.:0904874112.	t	t	f	f	2012-12-23 17:26:35.48486+01	5	0	0	\N	49.250144800000001	20.568389499999999	t	\N	t
18	2	Polar light	polar-light-1	1	Kokyňská 32	12345	3	Mali by byt chybne suradnice	f	t	f	f	2012-09-20 01:53:11.047635+02	100	0	0	\N	42.8142432	-73.939568699999995	t	\N	t
22	2	Darujem Mercedes ML 270CDi 4x4 r.v.2005 Automat-DVD-Koza	darujem-mercedes-ml-270cdi-4x4-rv2005-automat-dvd-koza	1	Švábska 14	08001	3	Darujem Mercedes ML 270CDi 120KW/163PS 4x4, Automat,r.v.4/2005,naj.195000km. Garancia na pocet najazdenych kilometrov!!! Servisovane v mercedesi!!! Posledny servis dna 18.8.2012 v hodnote 1560eur. 3-kluce\r\nVYBAVA:Alarm, Airbag 8X, EBD, Posilňovač riad., ABS, ESP(VDC), EBV, DSC(DTC), Brzdový asistent(BAS)\r\nKomfort:\r\nAutomatická klimatizácia, Centrál, El. predné a zadné okná, El. sedadlá, El. zrkadlá, Diaľkové ovládanie, Rádio/CD+MP3, Lakťová opierka, Vonkajší teplomer, Klimatizovaná priehradka\r\nOstatné:\r\nHliníkové disky, Hmlovky, Imobilizér, Palubný počítač, Parkovací asistent, Strešné okno, Strešný nosič, Tažné zariadenie, Tempomat, Kožený interiér, Tónované sklá, Vyhrievané sedadlá, Vyhrievané zrkadlá, Fólie, Dažďový senzor, Svetelný senzor, Elektrický šíber, Park. senzor zadný+predný\r\n3kluce,DVD-prehravanie filmov pocas jazdy,Navigacia, Odnimatelne tazne na 3363KG. Servisovane v Mercedesi! Posledny servis dna 18.8.2012 v hodnote 1560eur.Zdokladujem fakturov. Garancia na pocet najazdenych kilometrov!!! BEZ INVESTICIE!!! Top-stav!!!\r\n\r\nDovezene od 1majitela. Max.zachovale! Pekny cisti interier bez poskodenia. Auto Je cersto prihlasene na slovenskych znackach.Nova STK-EM do 11/2014.Letne+Nove zimne gumy v hodnote 500eur. Darujem! Chcem sa ho zbavit, idu po nom policajti.	t	t	f	f	2012-12-23 18:28:11.248746+01	12	0	0	\N	48.976581199999998	21.263383000000001	t	\N	t
23	2	Darujem Mercedes ML 270CDi 4x4	darujem-mercedes-ml-270cdi-4x4	1	Švábska 14	08001	3	Darujem Mercedes ML 270CDi 120KW/163PS 4x4, Automat,r.v.4/2005,naj.195000km. Garancia na pocet najazdenych kilometrov!!! Servisovane v mercedesi!!! Posledny servis dna 18.8.2012 v hodnote 1560eur. 3-kluce VYBAVA:Alarm, Airbag 8X, EBD, Posilňovač riad., ABS, ESP(VDC), EBV, DSC(DTC), Brzdový asistent(BAS) Komfort: Automatická klimatizácia, Centrál, El. predné a zadné okná, El. sedadlá, El. zrkadlá, Diaľkové ovládanie, Rádio/CD+MP3, Lakťová opierka, Vonkajší teplomer, Klimatizovaná priehradka Ostatné: Hliníkové disky, Hmlovky, Imobilizér.	t	t	f	f	2012-12-25 01:05:34.952716+01	48	0	0	\N	48.976581199999998	21.263383000000001	t	\N	t
\.


--
-- TOC entry 1921 (class 0 OID 16460)
-- Dependencies: 163 1929
-- Data for Name: frontend_adimage; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY frontend_adimage (id, ad_id, image) FROM stdin;
2	2	img/ads/3621_409248662444708_1610848873_n.jpg
3	1	img/ads/165847_10150912611400426_887555583_n.jpg
4	2	img/ads/181145_445117735518600_511708912_n.jpg
5	2	img/ads/66261_1596036497318_1013615_n.jpg
6	2	img/ads/189573_421658561213901_161667969_n.jpg
10	11	img/ads/8061_452304748133182_1488096436_n.jpg
11	15	img/ads/009.jpg
12	16	img/ads/009_1.jpg
13	17	img/ads/009_2.jpg
14	18	img/ads/009_3.jpg
15	19	img/ads/559421_372242646189612_739368363_n.jpg
16	19	img/ads/280.jpg
17	21	img/ads/21009396.jpg
18	21	img/ads/21009396_1.jpg
19	21	img/ads/21009396_2.jpg
20	22	img/ads/21043495.jpg
21	22	img/ads/21043495_1.jpg
22	22	img/ads/21043495_2.jpg
23	22	img/ads/21043495_3.jpg
24	23	img/ads/21043495_3_1.jpg
25	23	img/ads/21043495_4.jpg
26	23	img/ads/21043495_2_1.jpg
27	23	img/ads/21043495_1_1.jpg
\.


--
-- TOC entry 1922 (class 0 OID 16465)
-- Dependencies: 165 1929
-- Data for Name: frontend_banner; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY frontend_banner (id, title, description, banner_url, target_url, from_date, to_date) FROM stdin;
\.


--
-- TOC entry 1923 (class 0 OID 16473)
-- Dependencies: 167 1929
-- Data for Name: frontend_category; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY frontend_category (id, category, category_url, description, parent_id) FROM stdin;
1	Elektro	elektro	Všetko ohľadom elektro spotrebičov	\N
2	Audio	audio	Audio spotrebiče	1
3	Auto-moto	auto-moto	Atuá, motorky a iné	\N
4	Autá do 3,5t	auta-do-35t	Atuá s hmotnosťou do 3,5 t	3
5	Motorky	motorky	Všetky druhy motoriek	3
6	Nákladné auta	nakladne-auta	Nákladne auta	3
\.


--
-- TOC entry 1924 (class 0 OID 16478)
-- Dependencies: 169 1929
-- Data for Name: frontend_city; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY frontend_city (id, city, city_url, city_lokal) FROM stdin;
1	Prešov	presov	v Prešove
2	Banská Bystrica	banska-bystrica	v Banskej Bystrici
3	Bratislava	bratislava	v Bratislave
4	Kereštvej	kerestvej	na Kereštveju
5	Kokyňa	kokyna	v Kokyňi
6	Kocúrkovo	kocurkovo	v Kocúrkove
\.


--
-- TOC entry 1925 (class 0 OID 16483)
-- Dependencies: 171 1929
-- Data for Name: frontend_news; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY frontend_news (id, user_id, title, title_url, text, time_of_publication) FROM stdin;
1	1	Lorem Ipsum	lorem-ipsum	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mattis suscipit sem placerat laoreet. Phasellus at turpis dolor. Praesent vehicula nibh a libero interdum ullamcorper. Fusce luctus purus commodo neque pretium rhoncus. Nam vel dolor a massa posuere cursus. Morbi eleifend turpis eget quam placerat dapibus. Etiam et lectus nec dolor elementum tincidunt a vitae ipsum. Suspendisse ante lacus, semper sed tincidunt vel, tincidunt non augue. Duis elementum fermentum neque eleifend varius. Duis at lacus ultrices leo molestie lobortis. Vestibulum luctus, eros ut fringilla cursus, elit tellus consectetur dui, et ullamcorper urna nibh ut lectus. Vestibulum tincidunt nulla id elit convallis non bibendum elit iaculis. Fusce aliquet, ligula sit amet pharetra fermentum, leo risus volutpat mi, eu vulputate dui dolor lobortis lorem. Aliquam non sem nisi. In quis enim vel metus suscipit hendrerit et nec lectus.\n\nIn hac habitasse platea dictumst. Proin tortor erat, elementum at vulputate id, volutpat at libero. Proin a nisl ipsum. Nulla iaculis nibh a nisl mattis elementum. Suspendisse ac turpis id sem varius venenatis non ac nunc. Nam quis nulla ipsum. Nunc porta, dui ac sodales imperdiet, elit elit tristique turpis, vitae tristique leo quam id enim. Vestibulum mollis, leo eget varius facilisis, ante metus tincidunt velit, sed viverra massa nibh non ipsum.\n\nMauris tempor leo nec lectus sodales euismod. Vivamus aliquet posuere lectus quis ultrices. Donec vel nisl id mi cursus faucibus. Quisque quis vestibulum eros. Sed at tellus non risus euismod accumsan a ac justo. Nam in elit eros, vel porta leo. Vivamus viverra nunc at eros suscipit adipiscing imperdiet turpis imperdiet. Etiam sed tortor sit amet ipsum tempor pharetra. Donec tortor tellus, aliquam et congue eu, tincidunt laoreet nibh. Quisque a arcu dolor. Donec ac lorem justo, consequat cursus ipsum. Donec sit amet risus sit amet eros lobortis posuere ac quis magna. Pellentesque ultricies hendrerit interdum. Mauris risus velit, euismod ut faucibus quis, ornare ac lectus. Phasellus vehicula nisi eu lacus facilisis in dignissim ipsum condimentum. Quisque at erat suscipit dui tincidunt varius non et augue.\n\nNunc fringilla dapibus dapibus. Praesent rutrum purus auctor arcu facilisis quis cursus quam consequat. Nulla orci ligula, porttitor ac mattis id, vulputate in arcu. Donec porta nulla vulputate sem tempor eget dapibus nisi tempus. Quisque gravida, diam vel elementum hendrerit, massa mauris tempus velit, non dapibus magna nisl sed nulla. Cras nec eros eros. Suspendisse vulputate luctus dolor, sed ornare purus fermentum tincidunt. Donec dapibus, ante vitae elementum venenatis, risus est pharetra purus, a euismod mauris metus at turpis.\n\nAliquam viverra tincidunt orci, pellentesque laoreet velit iaculis eu. Etiam quis cursus eros. Donec varius, urna id dignissim adipiscing, elit nisl euismod felis, a lacinia magna nibh id nibh. Morbi fringilla lobortis turpis, vitae convallis nulla fringilla sit amet. Nunc pharetra sollicitudin elit vel imperdiet. Praesent dignissim rutrum dignissim. Donec ornare gravida dignissim. Curabitur ut velit sit amet massa pharetra consectetur. Morbi vitae ante vitae nulla tempus volutpat volutpat ut orci. 	2012-06-09 15:57:22.114357+02
2	1	Mama ožen ma	mama-ozen-ma	Nejaká reporáž z Mama ožeň ma. Nikdy v živote som to nevidel, takže nemám šajnu o čo ide ...\n\nAle to nie je podstatné, no nie? :-)	2012-07-08 13:37:19.663795+02
\.


--
-- TOC entry 1926 (class 0 OID 16491)
-- Dependencies: 173 1929
-- Data for Name: frontend_profile; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY frontend_profile (id, user_id, phone) FROM stdin;
1	25	0907035639
2	26	0907035639
3	1	1234567890
4	27	+421908999555
5	28	421949376796
7	29	1234567890
8	30	
9	31	0907035639
6	2	0907035639
10	32	
\.


--
-- TOC entry 1927 (class 0 OID 16496)
-- Dependencies: 175 1929
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY registration_registrationprofile (id, user_id, activation_key) FROM stdin;
3	8	5f492114973e2bb47e1194d05ffe99d733ef5548
4	9	6ccb8242369deb12fc4895ee212f577e7e315028
5	10	e69d19525406d28d910a1a8dd4bcde62180d3978
6	11	5008d565ccfbd0a60fbc5693854258acae4649c1
7	15	05c610422775a9660a6d08998d65feaea4e5adcc
8	16	1156ea8c12301c9fac3b71bc1df65cff3859b38d
9	17	11ed4909f586523b0c86f3a97e311979a0a74a83
\.


--
-- TOC entry 1928 (class 0 OID 16501)
-- Dependencies: 177 1929
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: example_devel
--

COPY thumbnail_kvstore (key, value) FROM stdin;
\.


--
-- TOC entry 1935 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2012-12-29 15:54:23 CET

--
-- PostgreSQL database dump complete
--

