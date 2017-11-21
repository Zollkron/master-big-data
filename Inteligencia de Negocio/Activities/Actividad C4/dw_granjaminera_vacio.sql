--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2017-05-31 00:54:55 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 26070)
-- Name: dw_granjaminera; Type: SCHEMA; Schema: -; Owner: inrol
--

CREATE SCHEMA dw_granjaminera;


ALTER SCHEMA dw_granjaminera OWNER TO inrol;

SET search_path = dw_granjaminera, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 26077)
-- Name: dim_minero; Type: TABLE; Schema: dw_granjaminera; Owner: inrol
--

CREATE TABLE dim_minero (
    pk_minero integer NOT NULL,
    identificador_natural character varying(255) NOT NULL,
    producido real NOT NULL,
    roi real NOT NULL,
    gasto real NOT NULL,
    consumo_electrico real NOT NULL,
    temperatura real NOT NULL,
    trabajos_por_minuto real
);


ALTER TABLE dim_minero OWNER TO inrol;

--
-- TOC entry 182 (class 1259 OID 26074)
-- Name: dim_moneda; Type: TABLE; Schema: dw_granjaminera; Owner: inrol
--

CREATE TABLE dim_moneda (
    pk_moneda integer NOT NULL,
    nombre character varying(50) NOT NULL,
    abreviatura character varying(10) NOT NULL,
    cotizacion real NOT NULL,
    dificultad real NOT NULL
);


ALTER TABLE dim_moneda OWNER TO inrol;

--
-- TOC entry 184 (class 1259 OID 26080)
-- Name: dim_pool; Type: TABLE; Schema: dw_granjaminera; Owner: inrol
--

CREATE TABLE dim_pool (
    pk_pool integer NOT NULL,
    url character varying(255) NOT NULL,
    puerto integer NOT NULL,
    operativo boolean NOT NULL
);


ALTER TABLE dim_pool OWNER TO inrol;

--
-- TOC entry 185 (class 1259 OID 26125)
-- Name: dim_tiempo; Type: TABLE; Schema: dw_granjaminera; Owner: inrol
--

CREATE TABLE dim_tiempo (
    pk_tiempo integer NOT NULL,
    dia integer NOT NULL,
    mes integer NOT NULL,
    anyo integer NOT NULL
);


ALTER TABLE dim_tiempo OWNER TO inrol;

--
-- TOC entry 186 (class 1259 OID 26143)
-- Name: fact_produccion; Type: TABLE; Schema: dw_granjaminera; Owner: inrol
--

CREATE TABLE fact_produccion (
    fk_minero integer,
    fk_moneda integer,
    fk_pool integer,
    fk_tiempo integer,
    inversion_inicial real,
    producido_hoy real,
    gasto_hoy real,
    consumo_electrico_hoy real,
    moneda_mas_beneficiosa real,
    inversion_total real,
    total_producido real,
    total_roi date,
    total_gasto real,
    total_consumo_electrico real
);


ALTER TABLE fact_produccion OWNER TO inrol;

--
-- TOC entry 2204 (class 0 OID 26077)
-- Dependencies: 183
-- Data for Name: dim_minero; Type: TABLE DATA; Schema: dw_granjaminera; Owner: inrol
--

COPY dim_minero (pk_minero, identificador_natural, producido, roi, gasto, consumo_electrico, temperatura, trabajos_por_minuto) FROM stdin;
\.


--
-- TOC entry 2203 (class 0 OID 26074)
-- Dependencies: 182
-- Data for Name: dim_moneda; Type: TABLE DATA; Schema: dw_granjaminera; Owner: inrol
--

COPY dim_moneda (pk_moneda, nombre, abreviatura, cotizacion, dificultad) FROM stdin;
\.


--
-- TOC entry 2205 (class 0 OID 26080)
-- Dependencies: 184
-- Data for Name: dim_pool; Type: TABLE DATA; Schema: dw_granjaminera; Owner: inrol
--

COPY dim_pool (pk_pool, url, puerto, operativo) FROM stdin;
\.


--
-- TOC entry 2206 (class 0 OID 26125)
-- Dependencies: 185
-- Data for Name: dim_tiempo; Type: TABLE DATA; Schema: dw_granjaminera; Owner: inrol
--

COPY dim_tiempo (pk_tiempo, dia, mes, anyo) FROM stdin;
\.


--
-- TOC entry 2207 (class 0 OID 26143)
-- Dependencies: 186
-- Data for Name: fact_produccion; Type: TABLE DATA; Schema: dw_granjaminera; Owner: inrol
--

COPY fact_produccion (fk_minero, fk_moneda, fk_pool, fk_tiempo, inversion_inicial, producido_hoy, gasto_hoy, consumo_electrico_hoy, moneda_mas_beneficiosa, inversion_total, total_producido, total_roi, total_gasto, total_consumo_electrico) FROM stdin;
\.


--
-- TOC entry 2084 (class 2606 OID 26129)
-- Name: dim_tiempo_pkey; Type: CONSTRAINT; Schema: dw_granjaminera; Owner: inrol
--

ALTER TABLE ONLY dim_tiempo
    ADD CONSTRAINT dim_tiempo_pkey PRIMARY KEY (pk_tiempo);


--
-- TOC entry 2079 (class 2606 OID 26097)
-- Name: pk_minero; Type: CONSTRAINT; Schema: dw_granjaminera; Owner: inrol
--

ALTER TABLE ONLY dim_minero
    ADD CONSTRAINT pk_minero PRIMARY KEY (pk_minero);


--
-- TOC entry 2076 (class 2606 OID 26084)
-- Name: pk_moneda; Type: CONSTRAINT; Schema: dw_granjaminera; Owner: inrol
--

ALTER TABLE ONLY dim_moneda
    ADD CONSTRAINT pk_moneda PRIMARY KEY (pk_moneda);


--
-- TOC entry 2082 (class 2606 OID 26100)
-- Name: pk_pool; Type: CONSTRAINT; Schema: dw_granjaminera; Owner: inrol
--

ALTER TABLE ONLY dim_pool
    ADD CONSTRAINT pk_pool PRIMARY KEY (pk_pool);


--
-- TOC entry 2077 (class 1259 OID 26098)
-- Name: idx_minero; Type: INDEX; Schema: dw_granjaminera; Owner: inrol
--

CREATE INDEX idx_minero ON dim_minero USING btree (pk_minero);


--
-- TOC entry 2074 (class 1259 OID 26085)
-- Name: idx_moneda; Type: INDEX; Schema: dw_granjaminera; Owner: inrol
--

CREATE INDEX idx_moneda ON dim_moneda USING btree (pk_moneda);


--
-- TOC entry 2080 (class 1259 OID 26101)
-- Name: idx_pool; Type: INDEX; Schema: dw_granjaminera; Owner: inrol
--

CREATE INDEX idx_pool ON dim_pool USING btree (pk_pool);


--
-- TOC entry 2085 (class 2606 OID 26146)
-- Name: fk_minero; Type: FK CONSTRAINT; Schema: dw_granjaminera; Owner: inrol
--

ALTER TABLE ONLY fact_produccion
    ADD CONSTRAINT fk_minero FOREIGN KEY (fk_minero) REFERENCES dim_minero(pk_minero);


--
-- TOC entry 2086 (class 2606 OID 26151)
-- Name: fk_moneda; Type: FK CONSTRAINT; Schema: dw_granjaminera; Owner: inrol
--

ALTER TABLE ONLY fact_produccion
    ADD CONSTRAINT fk_moneda FOREIGN KEY (fk_moneda) REFERENCES dim_moneda(pk_moneda);


--
-- TOC entry 2087 (class 2606 OID 26156)
-- Name: fk_pool; Type: FK CONSTRAINT; Schema: dw_granjaminera; Owner: inrol
--

ALTER TABLE ONLY fact_produccion
    ADD CONSTRAINT fk_pool FOREIGN KEY (fk_pool) REFERENCES dim_pool(pk_pool);


--
-- TOC entry 2088 (class 2606 OID 26161)
-- Name: fk_tiempo; Type: FK CONSTRAINT; Schema: dw_granjaminera; Owner: inrol
--

ALTER TABLE ONLY fact_produccion
    ADD CONSTRAINT fk_tiempo FOREIGN KEY (fk_tiempo) REFERENCES dim_tiempo(pk_tiempo);


-- Completed on 2017-05-31 00:54:56 CEST

--
-- PostgreSQL database dump complete
--

