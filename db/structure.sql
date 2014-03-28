--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: apps; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE apps (
    id integer NOT NULL,
    play_store_id character varying(255),
    name character varying(255)
);


--
-- Name: apps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE apps_id_seq OWNED BY apps.id;


--
-- Name: data_points; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE data_points (
    id integer NOT NULL,
    installs character varying(255),
    size double precision,
    price double precision,
    rating_distribution hstore,
    app_id integer,
    rating double precision,
    num_of_ratings integer,
    created_at timestamp without time zone
);


--
-- Name: data_points_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE data_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE data_points_id_seq OWNED BY data_points.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY apps ALTER COLUMN id SET DEFAULT nextval('apps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_points ALTER COLUMN id SET DEFAULT nextval('data_points_id_seq'::regclass);


--
-- Name: apps_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY apps
    ADD CONSTRAINT apps_pkey PRIMARY KEY (id);


--
-- Name: data_points_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY data_points
    ADD CONSTRAINT data_points_pkey PRIMARY KEY (id);


--
-- Name: data_points_rating_distribution; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX data_points_rating_distribution ON data_points USING gin (rating_distribution);


--
-- Name: index_apps_on_play_store_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_apps_on_play_store_id ON apps USING btree (play_store_id);


--
-- Name: index_data_points_on_app_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_data_points_on_app_id ON data_points USING btree (app_id);


--
-- Name: index_data_points_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_data_points_on_created_at ON data_points USING btree (created_at);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20140317154153');

INSERT INTO schema_migrations (version) VALUES ('20140317154234');

INSERT INTO schema_migrations (version) VALUES ('20140317154402');

INSERT INTO schema_migrations (version) VALUES ('20140317154904');