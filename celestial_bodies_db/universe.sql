--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(25) NOT NULL,
    description text,
    galaxy_types character varying(25),
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(25) NOT NULL,
    description text,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(25) NOT NULL,
    description text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_to_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_to_moon (
    planet_to_moon_id integer NOT NULL,
    name character varying(25) NOT NULL,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.planet_to_moon OWNER TO freecodecamp;

--
-- Name: planet_to_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_to_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_to_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_to_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_to_moon_id_seq OWNED BY public.planet_to_moon.planet_to_moon_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(25) NOT NULL,
    galaxy_id integer,
    description text,
    distance_from_earth numeric(20,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_to_moon planet_to_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_to_moon ALTER COLUMN planet_to_moon_id SET DEFAULT nextval('public.planet_to_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home galaxy of Earth.', 'spiral', 240);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Neighbor of Milky Way', 'barred spiral', 5000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Next closest galaxy', 'unbarred spiral', 2000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Visible in the southern sky.', 'dwarf irregular', 1101);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Visible in the southern hemisphere with the naked eye.', 'dwarf irregular', 13000);
INSERT INTO public.galaxy VALUES (6, 'Sagittarius Dwarf Spher.', 'Contains four globular clusters', 'elliptical loop-shaped', 6000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Our Moon', true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', '', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', '', false, 4);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, NULL, 6);
INSERT INTO public.moon VALUES (5, 'Io', NULL, NULL, 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, NULL, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', NULL, NULL, 6);
INSERT INTO public.moon VALUES (8, 'Amalthea', NULL, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Kallichore', NULL, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Lysithea', NULL, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Euporie', NULL, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Adraste', NULL, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Himalia', NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Jupiter LXI', NULL, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Orthosie', NULL, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Titan', NULL, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Enceladus', NULL, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Mimas', NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Dione', NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Tethys', NULL, NULL, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', '', false, 2);
INSERT INTO public.planet VALUES (2, 'Venus', '', false, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 'home sweet home', true, 2);
INSERT INTO public.planet VALUES (4, 'Mars', '', false, 2);
INSERT INTO public.planet VALUES (6, 'Jupiter', '', false, 2);
INSERT INTO public.planet VALUES (7, 'Saturn', 'the rings!', false, 2);
INSERT INTO public.planet VALUES (8, 'Uranus', 'insert beavis and butthead chuckle', false, 2);
INSERT INTO public.planet VALUES (9, 'Neptune', '', false, 2);
INSERT INTO public.planet VALUES (10, 'Pluto', 'planet or not a planet', false, 2);
INSERT INTO public.planet VALUES (11, 'Ceres', '', false, 2);
INSERT INTO public.planet VALUES (12, 'Haumea', '', false, 2);
INSERT INTO public.planet VALUES (13, 'Makemake', 'dwarf planet', false, 2);


--
-- Data for Name: planet_to_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_to_moon VALUES (1, 'first', 3, 1);
INSERT INTO public.planet_to_moon VALUES (2, 'second', 4, 2);
INSERT INTO public.planet_to_moon VALUES (3, 'third', 4, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', 1, '1,700 times larger than the sun', 9459.00);
INSERT INTO public.star VALUES (2, 'Sol', 1, 'Earth''s Sun', 93.67);
INSERT INTO public.star VALUES (3, 'Alpheratz', 2, 'the brightest star in the constellation', 96.87);
INSERT INTO public.star VALUES (4, 'Mirach', 2, 'red giant star', 199.00);
INSERT INTO public.star VALUES (5, 'Almach', 2, 'third brightest star', 355.50);
INSERT INTO public.star VALUES (6, 'Beta Trianguli', 3, 'only a third-magnitude star', 127.00);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- Name: planet_to_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_to_moon_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_to_moon planet_to_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_to_moon
    ADD CONSTRAINT planet_to_moon_name_key UNIQUE (name);


--
-- Name: planet_to_moon planet_to_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_to_moon
    ADD CONSTRAINT planet_to_moon_pkey PRIMARY KEY (planet_to_moon_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

