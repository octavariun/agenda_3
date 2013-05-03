--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: atendentes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE atendentes (
    id integer NOT NULL,
    nome character varying(255),
    usuario_id integer,
    cargo_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: atendentes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE atendentes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: atendentes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE atendentes_id_seq OWNED BY atendentes.id;


--
-- Name: cargos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cargos (
    id integer NOT NULL,
    nome character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cargos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cargos_id_seq OWNED BY cargos.id;


--
-- Name: cidades; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cidades (
    id integer NOT NULL,
    nome character varying(255),
    estado_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cidades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
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
    local_id integer,
    valor double precision,
    atendente_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    paga boolean
);


--
-- Name: consultas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE consultas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
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
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: convenios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE convenios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
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
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: estados_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
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
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: locais_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
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
    numero character varying(255),
    bairro character varying(255),
    cep character varying(255),
    cidade_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pessoas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pessoas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
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
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    login character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY atendentes ALTER COLUMN id SET DEFAULT nextval('atendentes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cargos ALTER COLUMN id SET DEFAULT nextval('cargos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cidades ALTER COLUMN id SET DEFAULT nextval('cidades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY consultas ALTER COLUMN id SET DEFAULT nextval('consultas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY convenios ALTER COLUMN id SET DEFAULT nextval('convenios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY estados ALTER COLUMN id SET DEFAULT nextval('estados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locais ALTER COLUMN id SET DEFAULT nextval('locais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pessoas ALTER COLUMN id SET DEFAULT nextval('pessoas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Name: atendentes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY atendentes
    ADD CONSTRAINT atendentes_pkey PRIMARY KEY (id);


--
-- Name: cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id);


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
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: index_atendentes_on_cargo_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_atendentes_on_cargo_id ON atendentes USING btree (cargo_id);


--
-- Name: index_atendentes_on_usuario_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_atendentes_on_usuario_id ON atendentes USING btree (usuario_id);


--
-- Name: index_cidades_on_estado_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cidades_on_estado_id ON cidades USING btree (estado_id);


--
-- Name: index_consultas_on_atendente_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_consultas_on_atendente_id ON consultas USING btree (atendente_id);


--
-- Name: index_consultas_on_convenio_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_consultas_on_convenio_id ON consultas USING btree (convenio_id);


--
-- Name: index_consultas_on_local_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_consultas_on_local_id ON consultas USING btree (local_id);


--
-- Name: index_consultas_on_pessoa_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_consultas_on_pessoa_id ON consultas USING btree (pessoa_id);


--
-- Name: index_pessoas_on_cidade_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pessoas_on_cidade_id ON pessoas USING btree (cidade_id);


--
-- Name: index_usuarios_on_login; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_usuarios_on_login ON usuarios USING btree (login);


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

INSERT INTO schema_migrations (version) VALUES ('20120810023016');

INSERT INTO schema_migrations (version) VALUES ('20120810112332');

INSERT INTO schema_migrations (version) VALUES ('20120810115340');

INSERT INTO schema_migrations (version) VALUES ('20120810120054');

INSERT INTO schema_migrations (version) VALUES ('20120810121159');

INSERT INTO schema_migrations (version) VALUES ('20120810123241');

INSERT INTO schema_migrations (version) VALUES ('20120811170921');

INSERT INTO schema_migrations (version) VALUES ('20120811174319');

INSERT INTO schema_migrations (version) VALUES ('20120811194410');

INSERT INTO schema_migrations (version) VALUES ('20121120000254');