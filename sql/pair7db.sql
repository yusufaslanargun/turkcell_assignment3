--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-03-13 22:30:50

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

DROP DATABASE pair7db;
--
-- TOC entry 4916 (class 1262 OID 17070)
-- Name: pair7db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pair7db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE pair7db OWNER TO postgres;

\connect pair7db

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
-- TOC entry 215 (class 1259 OID 17071)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    city character varying NOT NULL,
    district character varying NOT NULL,
    postal_code character varying,
    description character varying,
    street character varying NOT NULL,
    no character varying NOT NULL,
    user_id integer,
    seller_id integer
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17076)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.addresses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 17077)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17082)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 17083)
-- Name: discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discounts (
    id integer NOT NULL,
    name character varying NOT NULL,
    expiration_date date,
    min_price_amount double precision DEFAULT 0 NOT NULL,
    amount double precision NOT NULL,
    description character varying,
    "product_Id" integer NOT NULL
);


ALTER TABLE public.discounts OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17088)
-- Name: discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.discounts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 17089)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    payment_date date NOT NULL,
    payment_method character varying NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17094)
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 17095)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    date date NOT NULL,
    total_amount double precision NOT NULL,
    order_status boolean NOT NULL,
    order_details_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17098)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 17286)
-- Name: orders_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_products (
    order_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.orders_products OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17105)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    price double precision NOT NULL,
    stock bigint NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17102)
-- Name: products_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_categories (
    category_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.products_categories OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17110)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 17111)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    review_text character varying,
    rating integer NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17116)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reviews ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 17117)
-- Name: sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellers (
    id integer NOT NULL,
    company_name character varying NOT NULL,
    address_id integer NOT NULL,
    mail character varying,
    tax_number character varying,
    phone character varying
);


ALTER TABLE public.sellers OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17122)
-- Name: seller_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sellers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.seller_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 17123)
-- Name: sellers_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sellers_products (
    product_id integer NOT NULL,
    seller_id integer NOT NULL
);


ALTER TABLE public.sellers_products OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17129)
-- Name: shopping_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_carts (
    id integer NOT NULL,
    total_amount double precision DEFAULT 0 NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.shopping_carts OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17133)
-- Name: shopping_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.shopping_carts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.shopping_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 17126)
-- Name: shopping_carts_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_carts_products (
    shopping_cart_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.shopping_carts_products OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17140)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    mail character varying NOT NULL,
    phone character varying NOT NULL,
    create_date date,
    address_id integer NOT NULL,
    cart_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17145)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 17146)
-- Name: wishlists_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlists_users (
    user_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.wishlists_users OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 17071)
-- Dependencies: 215
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (1, 'ankara', 'gd', '1222', 'desdesdes', 'cd', '1', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (2, 'istanbul', 'gd2', '1332', 'desdes', 'cddd', '1', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (3, 'istanbul', 'gd2', '1332', 'desdes', 'cddd', '1', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (4, 'istanbul', 'gd2', '1332', 'desdes', 'cddd', '1', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (5, 'istanbul', 'gd2', '1332', 'desdes', 'cddd', '1', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (6, 'istanbul', 'gd2', '1332', 'desdes', 'cddd', '1', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (8, 'Baoli', 'CN', NULL, 'Insertion of Endobronchial Valve into Right Lower Lobe Bronchus, Percutaneous Endoscopic Approach', 'Fulton', '23933', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (9, 'Santa Lucía', 'HN', NULL, 'Extirpation of Matter from Right Common Iliac Artery, Bifurcation, Percutaneous Endoscopic Approach', 'Boyd', '49695', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (10, 'Haveluloto', 'TO', NULL, 'Fusion of Cervicothoracic Vertebral Joint with Interbody Fusion Device, Anterior Approach, Anterior Column, Percutaneous Endoscopic Approach', 'Jackson', '39325', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (11, 'Charopó', 'GR', NULL, 'Fusion of Cervicothoracic Vertebral Joint with Interbody Fusion Device, Anterior Approach, Anterior Column, Percutaneous Approach', 'Hallows', '97', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (12, 'Novosheshminsk', 'RU', '423190', 'Repair Right Anterior Tibial Artery, Open Approach', 'Crownhardt', '42148', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (13, 'Safakulevo', 'RU', '641080', 'Supplement Gastric Vein with Synthetic Substitute, Percutaneous Endoscopic Approach', 'Prairie Rose', '026', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (14, 'Plavsk', 'RU', '301477', 'Supplement Left Inguinal Region with Nonautologous Tissue Substitute, Open Approach', 'Talisman', '9', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (15, 'Omaha', 'US', '68110', 'Release Right Vertebral Vein, Percutaneous Approach', 'Mendota', '577', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (16, 'Zhaotong', 'CN', NULL, 'Plain Radiography of Ileal Diversion Loop using Low Osmolar Contrast', 'Chive', '41480', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (17, 'Paraíso', 'BR', '15825-000', 'Destruction of Left Face Vein, Percutaneous Endoscopic Approach', 'Lakewood', '95', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (18, 'Suidong', 'CN', NULL, 'Plain Radiography of Right Parotid Gland using High Osmolar Contrast', 'Valley Edge', '560', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (19, 'Kalbugan', 'PH', '1485', 'Extirpation of Matter from Glomus Jugulare, Percutaneous Endoscopic Approach', 'Fairview', '37', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (20, 'Luokou', 'CN', NULL, 'Revision of External Fixation Device in Right Tarsal Joint, Open Approach', 'Maywood', '694', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (21, 'Cipicung', 'ID', NULL, 'Introduction of Local Anesthetic into Genitourinary Tract, Via Natural or Artificial Opening', 'Tennessee', '91', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (22, 'Siikainen', 'FI', '29811', 'Excision of Ileum, Via Natural or Artificial Opening Endoscopic, Diagnostic', 'Lotheville', '52', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (23, 'Shangma', 'CN', NULL, 'Occlusion of Right Main Bronchus, Via Natural or Artificial Opening', 'Ridgeview', '9', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (24, 'Boca de Uchire', 'VE', NULL, 'Fluoroscopy of Bilateral Pulmonary Veins using High Osmolar Contrast, Guidance', 'Alpine', '6936', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (25, 'Xihanling', 'CN', NULL, 'Fluoroscopy of Left Common Carotid Artery using High Osmolar Contrast, Laser Intraoperative', 'Autumn Leaf', '34487', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (26, 'Danchang', 'CN', NULL, 'Revision of Infusion Device in Female Perineum, Open Approach', '8th', '2010', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (27, 'Söderköping', 'SE', '614 94', 'Removal of Other Device on Left Inguinal Region', 'Huxley', '902', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (28, 'Yokosuka', 'JP', '987-2224', 'Contact Radiation of Rectum', 'Cascade', '7', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (29, 'Peristerá', 'GR', NULL, 'Dilation of Right Ulnar Artery with Three Intraluminal Devices, Percutaneous Endoscopic Approach', 'Dawn', '00', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (30, 'Kotkot', 'PH', '6612', 'Supplement Left Retinal Vessel with Autologous Tissue Substitute, Open Approach', 'Marquette', '31421', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (31, 'Kut Chap', 'TH', '30430', 'Repair Right Popliteal Artery, Open Approach', 'Arkansas', '85', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (32, 'Paracuru', 'BR', '62680-000', 'Extirpation of Matter from Lumbar Nerve, Percutaneous Endoscopic Approach', 'Browning', '5', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (33, 'Grivenskaya', 'RU', '353798', 'Bypass Left External Iliac Artery to Bilateral Internal Iliac Arteries with Autologous Arterial Tissue, Percutaneous Endoscopic Approach', 'Nobel', '05092', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (34, 'San Sebastián', 'SV', NULL, 'Revision of Contraceptive Device in Lower Extremity Subcutaneous Tissue and Fascia, Percutaneous Approach', 'Sachs', '960', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (35, 'Bāgh-e Malek', 'IR', NULL, 'Excision of Right Spermatic Cord, Open Approach', 'Vahlen', '718', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (36, 'Mekarsari', 'ID', NULL, 'Occlusion of Ampulla of Vater with Intraluminal Device, Percutaneous Endoscopic Approach', 'Sutherland', '951', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (37, 'Qaţanah', 'PS', NULL, 'Alteration of Right External Ear, Percutaneous Approach', 'Thompson', '524', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (38, 'Taounate', 'MA', NULL, 'Bypass Coronary Artery, Two Arteries from Right Internal Mammary with Autologous Arterial Tissue, Open Approach', 'Crownhardt', '61', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (39, 'Nifuboko', 'ID', NULL, 'Alteration of Right Lower Leg, Percutaneous Approach', 'Paget', '8', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (40, 'Bajia', 'CN', NULL, 'Drainage of Right Maxilla with Drainage Device, Open Approach', 'Steensland', '72288', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (41, 'Pittsburgh', 'US', '15286', 'Excision of Left Hand Artery, Percutaneous Approach, Diagnostic', 'Heffernan', '2', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (42, 'Dassa-Zoumé', 'BJ', NULL, 'Dilation of Right External Iliac Artery, Bifurcation, with Three Intraluminal Devices, Open Approach', 'Charing Cross', '4', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (43, 'Mapalacsiao', 'PH', '2826', 'Excision of Left Foot Subcutaneous Tissue and Fascia, Percutaneous Approach, Diagnostic', 'Chive', '0917', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (44, 'Pancan', 'PE', NULL, 'Drainage of Left Lower Lobe Bronchus with Drainage Device, Percutaneous Approach', 'Holy Cross', '15343', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (45, 'Aberdeen', 'GB', 'AB39', 'Drainage of Left Lesser Saphenous Vein with Drainage Device, Percutaneous Approach', 'Glacier Hill', '9982', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (46, 'Guicheng', 'CN', NULL, 'Revision of Nonautologous Tissue Substitute in Bladder, Via Natural or Artificial Opening', 'Shopko', '1', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (47, 'Cergy-Pontoise', 'FR', '95011 CEDEX', 'Release Left Anterior Tibial Artery, Percutaneous Endoscopic Approach', 'Portage', '9', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (48, 'Ouro Sogui', 'SN', NULL, 'Dilation of Left Main Bronchus, Percutaneous Endoscopic Approach', 'Graceland', '1889', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (49, 'Rowotengah', 'ID', NULL, 'Drainage of Buccal Mucosa, External Approach', 'Elmside', '0755', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (50, 'Guohe', 'CN', NULL, 'Destruction of Left Shoulder Bursa and Ligament, Open Approach', 'Becker', '4', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (51, 'Oleiros', 'PT', '6160-402', 'Dilation of Left Peroneal Artery, Percutaneous Approach', 'Morning', '4', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (52, 'Toledo', 'PH', '6038', 'Repair Left Thorax Bursa and Ligament, Percutaneous Approach', 'Sugar', '9732', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (53, 'Beixin', 'CN', NULL, 'Drainage of Left Common Iliac Vein with Drainage Device, Percutaneous Endoscopic Approach', 'Lighthouse Bay', '2963', NULL, NULL);
INSERT INTO public.addresses (id, city, district, postal_code, description, street, no, user_id, seller_id) OVERRIDING SYSTEM VALUE VALUES (54, 'Boston', 'PH', '5711', 'Removal of Autologous Tissue Substitute from Left Metacarpocarpal Joint, Percutaneous Approach', 'Roth', '59040', NULL, NULL);


--
-- TOC entry 4888 (class 0 OID 17077)
-- Dependencies: 217
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, name, description) OVERRIDING SYSTEM VALUE VALUES (1, 'Marlite Panels (FED)', 'Dx ultrasound NEC');
INSERT INTO public.categories (id, name, description) OVERRIDING SYSTEM VALUE VALUES (2, 'Landscaping & Irrigation', 'Aspiration of breast');
INSERT INTO public.categories (id, name, description) OVERRIDING SYSTEM VALUE VALUES (3, 'Glass & Glazing', 'Digital enterostomy exam');
INSERT INTO public.categories (id, name, description) OVERRIDING SYSTEM VALUE VALUES (4, 'Roofing (Metal)', 'Opn pulmon valvuloplasty');
INSERT INTO public.categories (id, name, description) OVERRIDING SYSTEM VALUE VALUES (5, 'Structural and Misc Steel (Fabrication)', 'Prosth rep hrt septa NOS');


--
-- TOC entry 4890 (class 0 OID 17083)
-- Dependencies: 219
-- Data for Name: discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4892 (class 0 OID 17089)
-- Dependencies: 221
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4894 (class 0 OID 17095)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4910 (class 0 OID 17286)
-- Dependencies: 239
-- Data for Name: orders_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4897 (class 0 OID 17105)
-- Dependencies: 226
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (id, name, description, price, stock) OVERRIDING SYSTEM VALUE VALUES (1, 'asd1', 'âa', 10, 1000);
INSERT INTO public.products (id, name, description, price, stock) OVERRIDING SYSTEM VALUE VALUES (2, 'asd2', 'âa', 20, 1000);
INSERT INTO public.products (id, name, description, price, stock) OVERRIDING SYSTEM VALUE VALUES (3, 'asd3', 'âa', 30, 1000);
INSERT INTO public.products (id, name, description, price, stock) OVERRIDING SYSTEM VALUE VALUES (4, 'asd4', 'âa', 40, 1000);
INSERT INTO public.products (id, name, description, price, stock) OVERRIDING SYSTEM VALUE VALUES (5, 'asd5', 'âa', 50, 1000);
INSERT INTO public.products (id, name, description, price, stock) OVERRIDING SYSTEM VALUE VALUES (6, 'string', NULL, 10, 10);
INSERT INTO public.products (id, name, description, price, stock) OVERRIDING SYSTEM VALUE VALUES (7, 'urunurun', NULL, 200, 0);


--
-- TOC entry 4896 (class 0 OID 17102)
-- Dependencies: 225
-- Data for Name: products_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4899 (class 0 OID 17111)
-- Dependencies: 228
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4901 (class 0 OID 17117)
-- Dependencies: 230
-- Data for Name: sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4903 (class 0 OID 17123)
-- Dependencies: 232
-- Data for Name: sellers_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4905 (class 0 OID 17129)
-- Dependencies: 234
-- Data for Name: shopping_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4904 (class 0 OID 17126)
-- Dependencies: 233
-- Data for Name: shopping_carts_products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4907 (class 0 OID 17140)
-- Dependencies: 236
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4909 (class 0 OID 17146)
-- Dependencies: 238
-- Data for Name: wishlists_users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 216
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 54, true);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 220
-- Name: discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discounts_id_seq', 1, false);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 222
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_id_seq', 1, false);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 224
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 227
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 7, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 229
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 231
-- Name: seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seller_id_seq', 1, false);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 235
-- Name: shopping_carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_carts_id_seq', 1, false);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 237
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4702 (class 2606 OID 17150)
-- Name: addresses Address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT "Address_pkey" PRIMARY KEY (id);


--
-- TOC entry 4704 (class 2606 OID 17152)
-- Name: categories Categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);


--
-- TOC entry 4706 (class 2606 OID 17154)
-- Name: discounts Discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT "Discounts_pkey" PRIMARY KEY (id);


--
-- TOC entry 4708 (class 2606 OID 17156)
-- Name: order_details Order_Details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "Order_Details_pkey" PRIMARY KEY (id);


--
-- TOC entry 4710 (class 2606 OID 17158)
-- Name: orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (id);


--
-- TOC entry 4712 (class 2606 OID 17160)
-- Name: products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- TOC entry 4714 (class 2606 OID 17162)
-- Name: reviews Reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "Reviews_pkey" PRIMARY KEY (id);


--
-- TOC entry 4718 (class 2606 OID 17166)
-- Name: shopping_carts Shopping_Carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_carts
    ADD CONSTRAINT "Shopping_Carts_pkey" PRIMARY KEY (id);


--
-- TOC entry 4720 (class 2606 OID 17170)
-- Name: users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- TOC entry 4716 (class 2606 OID 17164)
-- Name: sellers seller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT seller_pkey PRIMARY KEY (id);


--
-- TOC entry 4731 (class 2606 OID 17176)
-- Name: sellers FK_address_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT "FK_address_id" FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- TOC entry 4727 (class 2606 OID 17181)
-- Name: products_categories FK_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT "FK_category_id" FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 4725 (class 2606 OID 17299)
-- Name: orders FK_order_details_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_order_details_id" FOREIGN KEY (order_details_id) REFERENCES public.order_details(id) NOT VALID;


--
-- TOC entry 4724 (class 2606 OID 17191)
-- Name: order_details FK_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "FK_order_id" FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4741 (class 2606 OID 17289)
-- Name: orders_products FK_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT "FK_order_id" FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4728 (class 2606 OID 17196)
-- Name: products_categories FK_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_categories
    ADD CONSTRAINT "FK_product_id" FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4739 (class 2606 OID 17201)
-- Name: wishlists_users FK_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists_users
    ADD CONSTRAINT "FK_product_id" FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4734 (class 2606 OID 17206)
-- Name: shopping_carts_products FK_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_carts_products
    ADD CONSTRAINT "FK_product_id" FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4729 (class 2606 OID 17211)
-- Name: reviews FK_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "FK_product_id" FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4732 (class 2606 OID 17216)
-- Name: sellers_products FK_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers_products
    ADD CONSTRAINT "FK_product_id" FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4723 (class 2606 OID 17221)
-- Name: discounts FK_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discounts
    ADD CONSTRAINT "FK_product_id" FOREIGN KEY ("product_Id") REFERENCES public.products(id);


--
-- TOC entry 4742 (class 2606 OID 17294)
-- Name: orders_products FK_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_products
    ADD CONSTRAINT "FK_product_id" FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4733 (class 2606 OID 17226)
-- Name: sellers_products FK_seller_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sellers_products
    ADD CONSTRAINT "FK_seller_id" FOREIGN KEY (seller_id) REFERENCES public.sellers(id);


--
-- TOC entry 4735 (class 2606 OID 17256)
-- Name: shopping_carts_products FK_shopping_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_carts_products
    ADD CONSTRAINT "FK_shopping_cart_id" FOREIGN KEY (shopping_cart_id) REFERENCES public.shopping_carts(id);


--
-- TOC entry 4730 (class 2606 OID 17241)
-- Name: reviews FK_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "FK_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4740 (class 2606 OID 17251)
-- Name: wishlists_users FK_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlists_users
    ADD CONSTRAINT "FK_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4726 (class 2606 OID 17261)
-- Name: orders FK_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4721 (class 2606 OID 17309)
-- Name: addresses PK_seller_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT "PK_seller_id" FOREIGN KEY (seller_id) REFERENCES public.sellers(id) NOT VALID;


--
-- TOC entry 4722 (class 2606 OID 17304)
-- Name: addresses PK_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT "PK_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 4737 (class 2606 OID 17171)
-- Name: users address_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT address_id FOREIGN KEY (address_id) REFERENCES public.addresses(id) NOT VALID;


--
-- TOC entry 4738 (class 2606 OID 17318)
-- Name: users cart_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT cart_id FOREIGN KEY (cart_id) REFERENCES public.shopping_carts(id) NOT VALID;


--
-- TOC entry 4736 (class 2606 OID 17266)
-- Name: shopping_carts user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_carts
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2024-03-13 22:30:51

--
-- PostgreSQL database dump complete
--

