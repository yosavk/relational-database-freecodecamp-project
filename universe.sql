--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    width_in_light_years numeric(4,1),
    description text,
    is_sphere boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    width_in_km numeric(6,1),
    description text,
    is_sphere boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    width_in_km numeric(6,1),
    description text,
    is_sphere boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    distance_in_km numeric(5,1),
    planet_moon_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.planet_moon.planet_moon_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_year integer,
    width_in_km integer,
    description text,
    is_sphere boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moon planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN planet_moon_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 3, 5, 1.0, 'Closest galaxy to the earth', true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 1, 2, 1.0, 'Earth galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Billian', 4, 3, 2.0, 'Billian is the beatiful galaxy that has been discovered', false);
INSERT INTO public.galaxy VALUES (4, 'Cillord', 4, 1, 3.0, 'Cillord has the biggest star in the galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Dirdrop', 2, 3, 3.0, 'Dirdrop has the smallest star in the galaxy', false);
INSERT INTO public.galaxy VALUES (6, 'Emil', 3, 1, 1.0, 'Emil is very bright', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Titan', 3500, 1, 200.0, 'The biggest moon in Jupiter', true, 1);
INSERT INTO public.moon VALUES (2, 'Timmy', 2000, 1, 100.0, 'The second largest moon in Jupiter', true, 1);
INSERT INTO public.moon VALUES (3, 'Bino', 5000, 1, 20.0, 'The smallest moon in Bili', false, 2);
INSERT INTO public.moon VALUES (4, 'Bull', 8000, 1, 250.0, 'Bull has unique atmosphere', true, 7);
INSERT INTO public.moon VALUES (5, 'Grog', 9000, 2, 257.0, 'There is a magnetic field in this moon', true, 11);
INSERT INTO public.moon VALUES (6, 'Hina', 8000, 3, 268.0, 'Grog has large amount of methane on its surface', true, 12);
INSERT INTO public.moon VALUES (7, 'Luni', 2400, 2, 155.0, 'This moon has 2 days for revolving its planet', false, 5);
INSERT INTO public.moon VALUES (8, 'Timmynor', 2000, 1, 100.0, 'The second largest moon in Tirky', true, 6);
INSERT INTO public.moon VALUES (9, 'Binomo', 5000, 2, 20.0, 'The smallest moon in Bilizy', true, 7);
INSERT INTO public.moon VALUES (10, 'Bullymo', 9000, 1, 250.0, 'Bullymo has unique atmosphere', true, 10);
INSERT INTO public.moon VALUES (11, 'Grogumun', 8000, 1, 290.0, 'There is a magnetic field in this moon', true, 2);
INSERT INTO public.moon VALUES (12, 'Hinani', 4000, 2, 270.0, 'Hinani has large amount of methane on its surface', true, 6);
INSERT INTO public.moon VALUES (13, 'Lunitac', 6400, 1, 175.0, 'This moon has 2 days for revolving its planet', false, 9);
INSERT INTO public.moon VALUES (14, 'Binmor', 2000, 1, 100.0, 'The second largest moon in Bilizy', true, 7);
INSERT INTO public.moon VALUES (15, 'Hompa', 4000, 1, 20.0, 'The smallest moon in Giro', true, 12);
INSERT INTO public.moon VALUES (16, 'Kirk', 8500, 3, 750.0, 'Kirk has unique atmosphere', true, 8);
INSERT INTO public.moon VALUES (17, 'Vormy', 8000, 3, 990.0, 'There is a magnetic field in this moon', true, 9);
INSERT INTO public.moon VALUES (18, 'Workmu', 3000, 1, 670.0, 'Workmu has large amount of methane on its surface', true, 3);
INSERT INTO public.moon VALUES (19, 'Zurk', 4400, 1, 785.0, 'This moon has 2 days for revolving its planet', true, 8);
INSERT INTO public.moon VALUES (20, 'Jimpo', 8070, 2, 177.0, 'This moon has rock surface', true, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Jupiter', 500, 1, 3000.0, 'The biggest planet in solar system', true, 1);
INSERT INTO public.planet VALUES (2, 'Bili', 1, 5, 200.0, 'Bili is one of the cold planet', true, 6);
INSERT INTO public.planet VALUES (3, 'Zark', 3, 2, 1000.0, 'Zark is one of the hot planet', false, 4);
INSERT INTO public.planet VALUES (4, 'Kuno', 2, 1, 100.0, 'Kuno is a gas planet', true, 2);
INSERT INTO public.planet VALUES (5, 'Rino', 2, 3, 4000.0, 'Rino is the habitable planet', true, 2);
INSERT INTO public.planet VALUES (6, 'Tirky', 4, 4, 1000.0, 'Tirky is the dark planet in the star system', true, 3);
INSERT INTO public.planet VALUES (7, 'Bilizy', 2, 3, 500.0, 'Bilizy is one of the cold planet', true, 2);
INSERT INTO public.planet VALUES (8, 'Zarkily', 2, 2, 3000.0, 'Zarkily is one of the hot planet', true, 1);
INSERT INTO public.planet VALUES (9, 'Kuniono', 6, 3, 3000.0, 'Kunoino is a gas planet', true, 1);
INSERT INTO public.planet VALUES (10, 'Rinomon', 1, 4, 5000.0, 'Rinomon is the habitable planet', true, 2);
INSERT INTO public.planet VALUES (11, 'Tirkymo', 2, 4, 5000.0, 'Tirkymo is the dark planet in the star system', true, 5);
INSERT INTO public.planet VALUES (12, 'Giro', 1, 2, 500.0, 'Giro is the safe place to visit', true, 2);


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (1, 3, 500.0, 1, 'Jupiter-Bino');
INSERT INTO public.planet_moon VALUES (9, 1, 5000.0, 2, 'Kunoino-Titan');
INSERT INTO public.planet_moon VALUES (5, 5, 9000.0, 3, 'Rino-Grog');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Centauri', 3, 1, 1000, 'Andromeda star near center of the galaxy', true, 1);
INSERT INTO public.star VALUES (2, 'Berry', 4, 2, 100, 'Milky Way star near the farthest center of the galaxy', false, 2);
INSERT INTO public.star VALUES (3, 'Cimon', 1, 1, 4400, 'Andromeda star near the farthest center of the galaxy', false, 1);
INSERT INTO public.star VALUES (4, 'Demin', 3, 3, 200, 'Cillord star near the center of the galaxy', true, 4);
INSERT INTO public.star VALUES (5, 'Dimmy', 2, 2, 6400, 'Emil brighest star', true, 6);
INSERT INTO public.star VALUES (6, 'Ebur', 1, 3, 300, 'Emil star near the center of the galaxy', true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_planet_moon_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_moon planet_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_name_key UNIQUE (name);


--
-- Name: planet_moon planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_pkey PRIMARY KEY (planet_moon_id);


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
-- Name: planet_moon planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_moon planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

