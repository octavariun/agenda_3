--
-- PostgreSQL database dump
--

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
-- Name: cidades; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cidades (
    id integer NOT NULL,
    nome character varying(255),
    estado_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cidades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: cidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cidades_id_seq OWNED BY cidades.id;


--
-- Name: consultas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE consultas (
    id integer NOT NULL,
    data_hora timestamp without time zone,
    efetuado boolean,
    pessoa_id integer,
    convenio_id integer,
    valor double precision,
    local_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: consultas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE consultas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: consultas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE consultas_id_seq OWNED BY consultas.id;


--
-- Name: convenios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE convenios (
    id integer NOT NULL,
    nome character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: convenios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE convenios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: convenios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE convenios_id_seq OWNED BY convenios.id;


--
-- Name: estados; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE estados (
    id integer NOT NULL,
    nome character varying(255),
    sigla character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: estados_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: estados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE estados_id_seq OWNED BY estados.id;


--
-- Name: locais; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locais (
    id integer NOT NULL,
    nome character varying(255),
    quantidade integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: locais_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: locais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locais_id_seq OWNED BY locais.id;


--
-- Name: pessoas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pessoas (
    id integer NOT NULL,
    nome character varying(255),
    cpf character varying(255),
    telefone character varying(255),
    email character varying(255),
    endereco character varying(255),
    numero integer,
    bairro character varying(255),
    cep character varying(255),
    cidade_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pessoas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: pessoas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pessoas_id_seq OWNED BY pessoas.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(128) DEFAULT ''::character varying NOT NULL,
    password_salt character varying(255) DEFAULT ''::character varying NOT NULL,
    confirmation_token character varying(255),
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    reset_password_token character varying(255),
    remember_token character varying(255),
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(128) DEFAULT ''::character varying NOT NULL,
    password_salt character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    remember_token character varying(255),
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    usuario character varying(255)
);


--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE cidades ALTER COLUMN id SET DEFAULT nextval('cidades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE consultas ALTER COLUMN id SET DEFAULT nextval('consultas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE convenios ALTER COLUMN id SET DEFAULT nextval('convenios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE estados ALTER COLUMN id SET DEFAULT nextval('estados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE locais ALTER COLUMN id SET DEFAULT nextval('locais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE pessoas ALTER COLUMN id SET DEFAULT nextval('pessoas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Name: cidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (id);


--
-- Name: consultas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY consultas
    ADD CONSTRAINT consultas_pkey PRIMARY KEY (id);


--
-- Name: convenios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY convenios
    ADD CONSTRAINT convenios_pkey PRIMARY KEY (id);


--
-- Name: estados_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- Name: locais_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locais
    ADD CONSTRAINT locais_pkey PRIMARY KEY (id);


--
-- Name: pessoas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_usuarios_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_usuarios_on_reset_password_token ON usuarios USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20110628130017');

INSERT INTO schema_migrations (version) VALUES ('20110628132952');

INSERT INTO schema_migrations (version) VALUES ('20110628133735');

INSERT INTO schema_migrations (version) VALUES ('20110628135051');

INSERT INTO schema_migrations (version) VALUES ('20110628140828');

INSERT INTO schema_migrations (version) VALUES ('20110628165220');

INSERT INTO schema_migrations (version) VALUES ('20110725133449');

INSERT INTO schema_migrations (version) VALUES ('20110905120455');

INSERT INTO schema_migrations (version) VALUES ('20110905143217');