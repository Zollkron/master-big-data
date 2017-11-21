--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2017-08-28 15:57:51 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 32929)
-- Name: dw_facultatum; Type: SCHEMA; Schema: -; Owner: fiumrol
--

CREATE SCHEMA dw_facultatum;


ALTER SCHEMA dw_facultatum OWNER TO fiumrol;

SET search_path = dw_facultatum, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 32930)
-- Name: dim_acta; Type: TABLE; Schema: dw_facultatum; Owner: fiumrol
--

CREATE TABLE dim_acta (
    pk_acta integer NOT NULL,
    identificador_natural character varying(12) NOT NULL
);


ALTER TABLE dim_acta OWNER TO fiumrol;

--
-- TOC entry 183 (class 1259 OID 32933)
-- Name: dim_alumno; Type: TABLE; Schema: dw_facultatum; Owner: fiumrol
--

CREATE TABLE dim_alumno (
    pk_alumno integer NOT NULL,
    identificador_natural character varying(10) NOT NULL,
    sexo character varying(1),
    fecha_nacimiento date,
    codigo_postal integer,
    fk_titulacion integer NOT NULL,
    descripcion_acceso character varying(255),
    nota_acceso real,
    nota_admision real,
    centro_pau character varying(255)
);


ALTER TABLE dim_alumno OWNER TO fiumrol;

--
-- TOC entry 184 (class 1259 OID 32939)
-- Name: dim_asignatura; Type: TABLE; Schema: dw_facultatum; Owner: fiumrol
--

CREATE TABLE dim_asignatura (
    pk_asignatura integer NOT NULL,
    identificador_natural character varying(10) NOT NULL,
    descripcion character varying(255)
);


ALTER TABLE dim_asignatura OWNER TO fiumrol;

--
-- TOC entry 185 (class 1259 OID 32942)
-- Name: dim_grupo; Type: TABLE; Schema: dw_facultatum; Owner: fiumrol
--

CREATE TABLE dim_grupo (
    pk_grupo integer NOT NULL,
    identificador_natural integer NOT NULL
);


ALTER TABLE dim_grupo OWNER TO fiumrol;

--
-- TOC entry 186 (class 1259 OID 32945)
-- Name: dim_profesor; Type: TABLE; Schema: dw_facultatum; Owner: fiumrol
--

CREATE TABLE dim_profesor (
    pk_profesor integer NOT NULL,
    identificador_natural character varying(10) NOT NULL
);


ALTER TABLE dim_profesor OWNER TO fiumrol;

--
-- TOC entry 187 (class 1259 OID 32948)
-- Name: dim_tiempo; Type: TABLE; Schema: dw_facultatum; Owner: fiumrol
--

CREATE TABLE dim_tiempo (
    pk_tiempo integer NOT NULL,
    curso_academico integer NOT NULL,
    convocatoria character varying(1) NOT NULL
);


ALTER TABLE dim_tiempo OWNER TO fiumrol;

--
-- TOC entry 188 (class 1259 OID 32951)
-- Name: dim_titulacion; Type: TABLE; Schema: dw_facultatum; Owner: fiumrol
--

CREATE TABLE dim_titulacion (
    pk_titulacion integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE dim_titulacion OWNER TO fiumrol;

--
-- TOC entry 189 (class 1259 OID 32954)
-- Name: fact_calificaciones; Type: TABLE; Schema: dw_facultatum; Owner: fiumrol
--

CREATE TABLE fact_calificaciones (
    fk_titulacion integer NOT NULL,
    fk_tiempo integer NOT NULL,
    fk_alumno integer NOT NULL,
    fk_asignatura integer NOT NULL,
    fk_grupo integer NOT NULL,
    fk_profesor integer NOT NULL,
    fk_acta integer NOT NULL,
    nota_cualitativa integer,
    nota_numerica real,
    convocatorias integer
);


ALTER TABLE fact_calificaciones OWNER TO fiumrol;

--
-- TOC entry 2089 (class 2606 OID 32958)
-- Name: pk_acta; Type: CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY dim_acta
    ADD CONSTRAINT pk_acta PRIMARY KEY (pk_acta);


--
-- TOC entry 2092 (class 2606 OID 32960)
-- Name: pk_alumno; Type: CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY dim_alumno
    ADD CONSTRAINT pk_alumno PRIMARY KEY (pk_alumno);


--
-- TOC entry 2095 (class 2606 OID 32962)
-- Name: pk_asignatura; Type: CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY dim_asignatura
    ADD CONSTRAINT pk_asignatura PRIMARY KEY (pk_asignatura);


--
-- TOC entry 2109 (class 2606 OID 33019)
-- Name: pk_calificaciones; Type: CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY fact_calificaciones
    ADD CONSTRAINT pk_calificaciones PRIMARY KEY (fk_titulacion, fk_tiempo, fk_alumno, fk_asignatura, fk_grupo, fk_profesor, fk_acta);


--
-- TOC entry 2098 (class 2606 OID 32964)
-- Name: pk_grupo; Type: CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY dim_grupo
    ADD CONSTRAINT pk_grupo PRIMARY KEY (pk_grupo);


--
-- TOC entry 2101 (class 2606 OID 32966)
-- Name: pk_profesor; Type: CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY dim_profesor
    ADD CONSTRAINT pk_profesor PRIMARY KEY (pk_profesor);


--
-- TOC entry 2104 (class 2606 OID 32968)
-- Name: pk_tiempo; Type: CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY dim_tiempo
    ADD CONSTRAINT pk_tiempo PRIMARY KEY (pk_tiempo);


--
-- TOC entry 2107 (class 2606 OID 32970)
-- Name: pk_titulacion; Type: CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY dim_titulacion
    ADD CONSTRAINT pk_titulacion PRIMARY KEY (pk_titulacion);


--
-- TOC entry 2087 (class 1259 OID 32971)
-- Name: idx_acta; Type: INDEX; Schema: dw_facultatum; Owner: fiumrol
--

CREATE INDEX idx_acta ON dim_acta USING btree (pk_acta);


--
-- TOC entry 2090 (class 1259 OID 32972)
-- Name: idx_alumno; Type: INDEX; Schema: dw_facultatum; Owner: fiumrol
--

CREATE INDEX idx_alumno ON dim_alumno USING btree (pk_alumno);


--
-- TOC entry 2093 (class 1259 OID 32973)
-- Name: idx_asignatura; Type: INDEX; Schema: dw_facultatum; Owner: fiumrol
--

CREATE INDEX idx_asignatura ON dim_asignatura USING btree (pk_asignatura);


--
-- TOC entry 2096 (class 1259 OID 32974)
-- Name: idx_grupo; Type: INDEX; Schema: dw_facultatum; Owner: fiumrol
--

CREATE INDEX idx_grupo ON dim_grupo USING btree (pk_grupo);


--
-- TOC entry 2099 (class 1259 OID 32975)
-- Name: idx_profesor; Type: INDEX; Schema: dw_facultatum; Owner: fiumrol
--

CREATE INDEX idx_profesor ON dim_profesor USING btree (pk_profesor);


--
-- TOC entry 2102 (class 1259 OID 32976)
-- Name: idx_tiempo; Type: INDEX; Schema: dw_facultatum; Owner: fiumrol
--

CREATE INDEX idx_tiempo ON dim_tiempo USING btree (pk_tiempo);


--
-- TOC entry 2105 (class 1259 OID 32977)
-- Name: idx_titulacion; Type: INDEX; Schema: dw_facultatum; Owner: fiumrol
--

CREATE INDEX idx_titulacion ON dim_titulacion USING btree (pk_titulacion);


--
-- TOC entry 2111 (class 2606 OID 32978)
-- Name: fk_acta; Type: FK CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY fact_calificaciones
    ADD CONSTRAINT fk_acta FOREIGN KEY (fk_acta) REFERENCES dim_acta(pk_acta);


--
-- TOC entry 2112 (class 2606 OID 32983)
-- Name: fk_alumno; Type: FK CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY fact_calificaciones
    ADD CONSTRAINT fk_alumno FOREIGN KEY (fk_alumno) REFERENCES dim_alumno(pk_alumno);


--
-- TOC entry 2113 (class 2606 OID 32988)
-- Name: fk_asignatura; Type: FK CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY fact_calificaciones
    ADD CONSTRAINT fk_asignatura FOREIGN KEY (fk_asignatura) REFERENCES dim_asignatura(pk_asignatura);


--
-- TOC entry 2114 (class 2606 OID 32993)
-- Name: fk_grupo; Type: FK CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY fact_calificaciones
    ADD CONSTRAINT fk_grupo FOREIGN KEY (fk_grupo) REFERENCES dim_grupo(pk_grupo);


--
-- TOC entry 2115 (class 2606 OID 32998)
-- Name: fk_profesor; Type: FK CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY fact_calificaciones
    ADD CONSTRAINT fk_profesor FOREIGN KEY (fk_profesor) REFERENCES dim_profesor(pk_profesor);


--
-- TOC entry 2116 (class 2606 OID 33003)
-- Name: fk_tiempo; Type: FK CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY fact_calificaciones
    ADD CONSTRAINT fk_tiempo FOREIGN KEY (fk_tiempo) REFERENCES dim_tiempo(pk_tiempo);


--
-- TOC entry 2117 (class 2606 OID 33008)
-- Name: fk_titulacion; Type: FK CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY fact_calificaciones
    ADD CONSTRAINT fk_titulacion FOREIGN KEY (fk_titulacion) REFERENCES dim_titulacion(pk_titulacion);


--
-- TOC entry 2110 (class 2606 OID 33013)
-- Name: fk_titulacion_alumno; Type: FK CONSTRAINT; Schema: dw_facultatum; Owner: fiumrol
--

ALTER TABLE ONLY dim_alumno
    ADD CONSTRAINT fk_titulacion_alumno FOREIGN KEY (fk_titulacion) REFERENCES dim_titulacion(pk_titulacion);


-- Completed on 2017-08-28 15:57:51 CEST

--
-- PostgreSQL database dump complete
--

