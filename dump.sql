--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: accesses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accesses (
    id integer NOT NULL,
    "urlId" integer NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: accesses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accesses_id_seq OWNED BY public.accesses.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL
);


--
-- Name: sessio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessio_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    password text NOT NULL,
    email text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: accesses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accesses ALTER COLUMN id SET DEFAULT nextval('public.accesses_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessio_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: accesses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accesses VALUES (45, 14, 3);
INSERT INTO public.accesses VALUES (46, 14, 3);
INSERT INTO public.accesses VALUES (47, 14, 3);
INSERT INTO public.accesses VALUES (48, 14, 3);
INSERT INTO public.accesses VALUES (49, 14, 3);
INSERT INTO public.accesses VALUES (50, 14, 3);
INSERT INTO public.accesses VALUES (51, 14, 3);
INSERT INTO public.accesses VALUES (52, 14, 3);
INSERT INTO public.accesses VALUES (53, 14, 3);
INSERT INTO public.accesses VALUES (54, 14, 3);
INSERT INTO public.accesses VALUES (55, 15, 3);
INSERT INTO public.accesses VALUES (56, 15, 3);
INSERT INTO public.accesses VALUES (57, 15, 3);
INSERT INTO public.accesses VALUES (58, 15, 3);
INSERT INTO public.accesses VALUES (59, 15, 3);
INSERT INTO public.accesses VALUES (60, 15, 3);
INSERT INTO public.accesses VALUES (61, 15, 3);
INSERT INTO public.accesses VALUES (62, 15, 3);
INSERT INTO public.accesses VALUES (63, 15, 3);
INSERT INTO public.accesses VALUES (64, 15, 3);
INSERT INTO public.accesses VALUES (65, 15, 3);
INSERT INTO public.accesses VALUES (66, 15, 3);
INSERT INTO public.accesses VALUES (67, 15, 3);
INSERT INTO public.accesses VALUES (68, 15, 3);
INSERT INTO public.accesses VALUES (69, 15, 3);
INSERT INTO public.accesses VALUES (70, 15, 3);
INSERT INTO public.accesses VALUES (71, 15, 3);
INSERT INTO public.accesses VALUES (72, 15, 3);
INSERT INTO public.accesses VALUES (73, 15, 3);
INSERT INTO public.accesses VALUES (74, 15, 3);
INSERT INTO public.accesses VALUES (75, 15, 3);
INSERT INTO public.accesses VALUES (76, 15, 3);
INSERT INTO public.accesses VALUES (77, 15, 3);
INSERT INTO public.accesses VALUES (78, 15, 3);
INSERT INTO public.accesses VALUES (79, 15, 3);
INSERT INTO public.accesses VALUES (80, 15, 3);
INSERT INTO public.accesses VALUES (81, 15, 3);
INSERT INTO public.accesses VALUES (82, 15, 3);
INSERT INTO public.accesses VALUES (83, 15, 3);
INSERT INTO public.accesses VALUES (84, 15, 3);
INSERT INTO public.accesses VALUES (85, 15, 3);
INSERT INTO public.accesses VALUES (86, 16, 3);
INSERT INTO public.accesses VALUES (87, 16, 3);
INSERT INTO public.accesses VALUES (88, 16, 3);
INSERT INTO public.accesses VALUES (89, 16, 3);
INSERT INTO public.accesses VALUES (90, 16, 3);
INSERT INTO public.accesses VALUES (91, 16, 3);
INSERT INTO public.accesses VALUES (92, 16, 3);
INSERT INTO public.accesses VALUES (93, 16, 3);
INSERT INTO public.accesses VALUES (94, 16, 3);
INSERT INTO public.accesses VALUES (95, 16, 3);
INSERT INTO public.accesses VALUES (96, 16, 3);
INSERT INTO public.accesses VALUES (97, 16, 3);
INSERT INTO public.accesses VALUES (98, 16, 3);
INSERT INTO public.accesses VALUES (99, 16, 3);
INSERT INTO public.accesses VALUES (100, 16, 3);
INSERT INTO public.accesses VALUES (101, 16, 3);
INSERT INTO public.accesses VALUES (102, 16, 3);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 3, '10801325-eb2e-4f78-8dc8-b05f99718c48');
INSERT INTO public.sessions VALUES (2, 3, '55481ee9-509a-491b-bd61-e9591f611962');
INSERT INTO public.sessions VALUES (3, 4, '6ad6a588-f61b-46fe-b414-70f4b895191a');
INSERT INTO public.sessions VALUES (4, 4, '4440974e-9f67-4ae9-8fcf-d2071d5ae58f');
INSERT INTO public.sessions VALUES (5, 3, '9c2d42c2-1c71-4598-bbf9-b76fb0bdbeb2');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 'https://www.youtube.com', 'gN7_UFccgm', 3);
INSERT INTO public.urls VALUES (2, 'https://www.youtube.com', 'd248sqgaZm', 3);
INSERT INTO public.urls VALUES (3, 'https://www.youtube.com', 'DRKkTrpGrE', 3);
INSERT INTO public.urls VALUES (4, 'https://www.youtube.com', '8pNWiJu9vF', 3);
INSERT INTO public.urls VALUES (5, 'https://www.youtube.com', 'W5qeM472-5', 3);
INSERT INTO public.urls VALUES (6, 'https://www.youtube.com', 'iLUbXIAD8I', 3);
INSERT INTO public.urls VALUES (7, 'https://www.youtube.com', 'f8THG3E0ss', 3);
INSERT INTO public.urls VALUES (8, 'https://www.youtube.com', 'EY2Ayi3jEc', 3);
INSERT INTO public.urls VALUES (9, 'https://www.youtube.com', 'Q-XNESy-9S', 3);
INSERT INTO public.urls VALUES (10, 'https://www.youtube.com', '4gu__R6G7Z', 3);
INSERT INTO public.urls VALUES (11, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2hxtfyAw32uBMiBc7mOv3233UNFCNeDbq2Q&usqp=CAU', 'ZU6oOVG1b4', 3);
INSERT INTO public.urls VALUES (12, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2hxtfyAw32uBMiBc7mOv3233UNFCNeDbq2Q&usqp=CAU', 'Gj4Ze4iurJ', 3);
INSERT INTO public.urls VALUES (14, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2hxtfyAw32uBMiBc7mOv3233UNFCNeDbq2Q&usqp=CAU', 'aY1mjQQGji', 3);
INSERT INTO public.urls VALUES (15, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2hxtfyAw32uBMiBc7mOv3233UNFCNeDbq2Q&usqp=CAU', 'kn4O87pL8J', 3);
INSERT INTO public.urls VALUES (16, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2hxtfyAw32uBMiBc7mOv3233UNFCNeDbq2Q&usqp=CAU', 'C4jRzCtdXb', 3);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (3, 'João3', '$2b$10$VdHdcwhSQ0vyUo7WcqmtGu3IVZ8UwBj1zSh4gMBj9nFRzelQPYMFC', 'joao3@driven.com.br');
INSERT INTO public.users VALUES (4, 'João4', '$2b$10$3ozr.oXXG50Y5UZCUxsaF.iol461Ap38fnQTynyPcP70gQGcxP.gy', 'joao4@driven.com.br');


--
-- Name: accesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accesses_id_seq', 102, true);


--
-- Name: sessio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessio_id_seq', 5, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: accesses accesses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accesses
    ADD CONSTRAINT accesses_pkey PRIMARY KEY (id);


--
-- Name: sessions sessio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessio_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: accesses accesses_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accesses
    ADD CONSTRAINT "accesses_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- Name: accesses accesses_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accesses
    ADD CONSTRAINT "accesses_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessio_usersId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessio_usersId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

