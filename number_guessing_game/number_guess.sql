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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_of_guesses integer,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (17, 557, 108);
INSERT INTO public.games VALUES (18, 120, 108);
INSERT INTO public.games VALUES (19, 662, 109);
INSERT INTO public.games VALUES (20, 490, 109);
INSERT INTO public.games VALUES (21, 885, 108);
INSERT INTO public.games VALUES (22, 163, 108);
INSERT INTO public.games VALUES (23, 123, 108);
INSERT INTO public.games VALUES (24, 460, 110);
INSERT INTO public.games VALUES (25, 745, 110);
INSERT INTO public.games VALUES (26, 2, 111);
INSERT INTO public.games VALUES (27, 183, 111);
INSERT INTO public.games VALUES (28, 540, 110);
INSERT INTO public.games VALUES (29, 328, 110);
INSERT INTO public.games VALUES (30, 765, 110);
INSERT INTO public.games VALUES (31, 887, 112);
INSERT INTO public.games VALUES (32, 759, 112);
INSERT INTO public.games VALUES (33, 713, 113);
INSERT INTO public.games VALUES (34, 587, 113);
INSERT INTO public.games VALUES (35, 959, 112);
INSERT INTO public.games VALUES (36, 940, 112);
INSERT INTO public.games VALUES (37, 104, 112);
INSERT INTO public.games VALUES (38, 16, 114);
INSERT INTO public.games VALUES (39, 289, 114);
INSERT INTO public.games VALUES (40, 279, 115);
INSERT INTO public.games VALUES (41, 789, 115);
INSERT INTO public.games VALUES (42, 83, 114);
INSERT INTO public.games VALUES (43, 18, 114);
INSERT INTO public.games VALUES (44, 700, 114);
INSERT INTO public.games VALUES (45, 110, 116);
INSERT INTO public.games VALUES (46, 3, 116);
INSERT INTO public.games VALUES (47, 862, 117);
INSERT INTO public.games VALUES (48, 446, 117);
INSERT INTO public.games VALUES (49, 29, 116);
INSERT INTO public.games VALUES (50, 107, 116);
INSERT INTO public.games VALUES (51, 23, 116);
INSERT INTO public.games VALUES (52, 10, 118);
INSERT INTO public.games VALUES (53, 433, 119);
INSERT INTO public.games VALUES (54, 92, 119);
INSERT INTO public.games VALUES (55, 845, 120);
INSERT INTO public.games VALUES (56, 433, 120);
INSERT INTO public.games VALUES (57, 53, 119);
INSERT INTO public.games VALUES (58, 457, 119);
INSERT INTO public.games VALUES (59, 425, 119);
INSERT INTO public.games VALUES (60, 30, 118);
INSERT INTO public.games VALUES (61, 737, 121);
INSERT INTO public.games VALUES (62, 983, 121);
INSERT INTO public.games VALUES (63, 732, 122);
INSERT INTO public.games VALUES (64, 53, 122);
INSERT INTO public.games VALUES (65, 158, 121);
INSERT INTO public.games VALUES (66, 413, 121);
INSERT INTO public.games VALUES (67, 588, 121);
INSERT INTO public.games VALUES (68, 273, 123);
INSERT INTO public.games VALUES (69, 775, 123);
INSERT INTO public.games VALUES (70, 933, 124);
INSERT INTO public.games VALUES (71, 191, 124);
INSERT INTO public.games VALUES (72, 194, 123);
INSERT INTO public.games VALUES (73, 217, 123);
INSERT INTO public.games VALUES (74, 816, 123);
INSERT INTO public.games VALUES (75, 679, 125);
INSERT INTO public.games VALUES (76, 301, 125);
INSERT INTO public.games VALUES (77, 354, 126);
INSERT INTO public.games VALUES (78, 424, 126);
INSERT INTO public.games VALUES (79, 183, 125);
INSERT INTO public.games VALUES (80, 555, 125);
INSERT INTO public.games VALUES (81, 558, 125);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (108, 'user_1749518370359');
INSERT INTO public.users VALUES (109, 'user_1749518370358');
INSERT INTO public.users VALUES (110, 'user_1749518501150');
INSERT INTO public.users VALUES (111, 'user_1749518501149');
INSERT INTO public.users VALUES (112, 'user_1749518571853');
INSERT INTO public.users VALUES (113, 'user_1749518571852');
INSERT INTO public.users VALUES (114, 'user_1749518661929');
INSERT INTO public.users VALUES (115, 'user_1749518661928');
INSERT INTO public.users VALUES (116, 'user_1749518813850');
INSERT INTO public.users VALUES (117, 'user_1749518813849');
INSERT INTO public.users VALUES (118, 'CallieC');
INSERT INTO public.users VALUES (119, 'user_1749518974161');
INSERT INTO public.users VALUES (120, 'user_1749518974160');
INSERT INTO public.users VALUES (121, 'user_1749519087940');
INSERT INTO public.users VALUES (122, 'user_1749519087939');
INSERT INTO public.users VALUES (123, 'user_1749519187864');
INSERT INTO public.users VALUES (124, 'user_1749519187863');
INSERT INTO public.users VALUES (125, 'user_1749519343363');
INSERT INTO public.users VALUES (126, 'user_1749519343362');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 81, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 126, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

