PGDMP      7                 |            bakery    16.1    16.0 �              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17658    bakery    DATABASE     z   CREATE DATABASE bakery WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE bakery;
                postgres    false            �            1259    17711    admins    TABLE     �   CREATE TABLE public.admins (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.admins;
       public         heap    postgres    false            �            1259    17710    admins_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.admins_id_seq;
       public          postgres    false    224            �           0    0    admins_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;
          public          postgres    false    223            �            1259    17692    basketItems    TABLE     �   CREATE TABLE public."basketItems" (
    id integer NOT NULL,
    quantity integer NOT NULL,
    "basketId" integer,
    "productId" integer
);
 !   DROP TABLE public."basketItems";
       public         heap    postgres    false            �            1259    17691    basketItems_id_seq    SEQUENCE     �   CREATE SEQUENCE public."basketItems_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."basketItems_id_seq";
       public          postgres    false    222            �           0    0    basketItems_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."basketItems_id_seq" OWNED BY public."basketItems".id;
          public          postgres    false    221            �            1259    17680    baskets    TABLE     O   CREATE TABLE public.baskets (
    id integer NOT NULL,
    "userId" integer
);
    DROP TABLE public.baskets;
       public         heap    postgres    false            �            1259    17679    baskets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.baskets_id_seq;
       public          postgres    false    220            �           0    0    baskets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;
          public          postgres    false    219            �            1259    17722    orders    TABLE     �  CREATE TABLE public.orders (
    id integer NOT NULL,
    status character varying(255) NOT NULL,
    "userId" integer,
    "adminId" integer,
    delivery_address character varying(255) NOT NULL,
    total_cost integer NOT NULL,
    completion_time character varying(255),
    name character varying(255) NOT NULL,
    description character varying(255),
    date_of_ordering timestamp with time zone NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    17721    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    226            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    225            �            1259    17671    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price integer NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    17670    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    218            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    217            �            1259    17741    reviews    TABLE     �   CREATE TABLE public.reviews (
    id integer NOT NULL,
    rating integer NOT NULL,
    description character varying(255) NOT NULL,
    "orderId" integer,
    short_review character varying(255) NOT NULL
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    17740    reviews_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public          postgres    false    228            �           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public          postgres    false    227            �            1259    17660    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    phone character varying(255) NOT NULL,
    description character varying(255),
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    birth_date timestamp with time zone NOT NULL,
    "basketId" integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17659    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    216            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    215            <           2604    17714 	   admins id    DEFAULT     f   ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);
 8   ALTER TABLE public.admins ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            ;           2604    17695    basketItems id    DEFAULT     t   ALTER TABLE ONLY public."basketItems" ALTER COLUMN id SET DEFAULT nextval('public."basketItems_id_seq"'::regclass);
 ?   ALTER TABLE public."basketItems" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            :           2604    17683 
   baskets id    DEFAULT     h   ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);
 9   ALTER TABLE public.baskets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            =           2604    17725 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            9           2604    17674    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            >           2604    17744 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            8           2604    17663    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            x          0    17711    admins 
   TABLE DATA           5   COPY public.admins (id, email, password) FROM stdin;
    public          postgres    false    224   �	      v          0    17692    basketItems 
   TABLE DATA           N   COPY public."basketItems" (id, quantity, "basketId", "productId") FROM stdin;
    public          postgres    false    222   a
      t          0    17680    baskets 
   TABLE DATA           /   COPY public.baskets (id, "userId") FROM stdin;
    public          postgres    false    220   ~
      z          0    17722    orders 
   TABLE DATA           �   COPY public.orders (id, status, "userId", "adminId", delivery_address, total_cost, completion_time, name, description, date_of_ordering) FROM stdin;
    public          postgres    false    226   �
      r          0    17671    products 
   TABLE DATA           @   COPY public.products (id, name, description, price) FROM stdin;
    public          postgres    false    218   �      |          0    17741    reviews 
   TABLE DATA           S   COPY public.reviews (id, rating, description, "orderId", short_review) FROM stdin;
    public          postgres    false    228   ?      p          0    17660    users 
   TABLE DATA           o   COPY public.users (id, phone, description, email, password, name, surname, birth_date, "basketId") FROM stdin;
    public          postgres    false    216   h      �           0    0    admins_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.admins_id_seq', 1, true);
          public          postgres    false    223            �           0    0    basketItems_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."basketItems_id_seq"', 80, true);
          public          postgres    false    221            �           0    0    baskets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.baskets_id_seq', 18, true);
          public          postgres    false    219            �           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 15, true);
          public          postgres    false    225            �           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 9, true);
          public          postgres    false    217            �           0    0    reviews_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.reviews_id_seq', 7, true);
          public          postgres    false    227            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 18, true);
          public          postgres    false    215            �           2606    204897    admins admins_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key;
       public            postgres    false    224            �           2606    204899    admins admins_email_key1 
   CONSTRAINT     T   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key1 UNIQUE (email);
 B   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key1;
       public            postgres    false    224            �           2606    204663    admins admins_email_key10 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key10 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key10;
       public            postgres    false    224            �           2606    204469    admins admins_email_key100 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key100 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key100;
       public            postgres    false    224            �           2606    204743    admins admins_email_key101 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key101 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key101;
       public            postgres    false    224            �           2606    204473    admins admins_email_key102 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key102 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key102;
       public            postgres    false    224            �           2606    204741    admins admins_email_key103 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key103 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key103;
       public            postgres    false    224            �           2606    204475    admins admins_email_key104 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key104 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key104;
       public            postgres    false    224            �           2606    204565    admins admins_email_key105 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key105 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key105;
       public            postgres    false    224            �           2606    204479    admins admins_email_key106 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key106 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key106;
       public            postgres    false    224            �           2606    204563    admins admins_email_key107 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key107 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key107;
       public            postgres    false    224            �           2606    204481    admins admins_email_key108 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key108 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key108;
       public            postgres    false    224            �           2606    204735    admins admins_email_key109 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key109 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key109;
       public            postgres    false    224            �           2606    204717    admins admins_email_key11 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key11 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key11;
       public            postgres    false    224            �           2606    204485    admins admins_email_key110 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key110 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key110;
       public            postgres    false    224            �           2606    204561    admins admins_email_key111 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key111 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key111;
       public            postgres    false    224            �           2606    204487    admins admins_email_key112 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key112 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key112;
       public            postgres    false    224            �           2606    204559    admins admins_email_key113 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key113 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key113;
       public            postgres    false    224            �           2606    204547    admins admins_email_key114 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key114 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key114;
       public            postgres    false    224            �           2606    204557    admins admins_email_key115 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key115 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key115;
       public            postgres    false    224            �           2606    204551    admins admins_email_key116 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key116 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key116;
       public            postgres    false    224            �           2606    204555    admins admins_email_key117 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key117 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key117;
       public            postgres    false    224            �           2606    204553    admins admins_email_key118 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key118 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key118;
       public            postgres    false    224            �           2606    204887    admins admins_email_key119 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key119 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key119;
       public            postgres    false    224            �           2606    204497    admins admins_email_key12 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key12 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key12;
       public            postgres    false    224            �           2606    204885    admins admins_email_key120 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key120 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key120;
       public            postgres    false    224            �           2606    204959    admins admins_email_key121 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key121 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key121;
       public            postgres    false    224            �           2606    204589    admins admins_email_key122 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key122 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key122;
       public            postgres    false    224            �           2606    204957    admins admins_email_key123 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key123 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key123;
       public            postgres    false    224            �           2606    204591    admins admins_email_key124 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key124 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key124;
       public            postgres    false    224            �           2606    204879    admins admins_email_key125 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key125 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key125;
       public            postgres    false    224            �           2606    204881    admins admins_email_key126 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key126 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key126;
       public            postgres    false    224            �           2606    204639    admins admins_email_key127 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key127 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key127;
       public            postgres    false    224            �           2606    204883    admins admins_email_key128 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key128 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key128;
       public            postgres    false    224            �           2606    204935    admins admins_email_key129 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key129 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key129;
       public            postgres    false    224            �           2606    204625    admins admins_email_key13 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key13 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key13;
       public            postgres    false    224            �           2606    204787    admins admins_email_key130 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key130 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key130;
       public            postgres    false    224            �           2606    204501    admins admins_email_key131 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key131 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key131;
       public            postgres    false    224            �           2606    204505    admins admins_email_key132 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key132 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key132;
       public            postgres    false    224            �           2606    204545    admins admins_email_key133 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key133 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key133;
       public            postgres    false    224            �           2606    204507    admins admins_email_key134 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key134 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key134;
       public            postgres    false    224            �           2606    204543    admins admins_email_key135 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key135 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key135;
       public            postgres    false    224            �           2606    204509    admins admins_email_key136 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key136 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key136;
       public            postgres    false    224            �           2606    204541    admins admins_email_key137 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key137 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key137;
       public            postgres    false    224            �           2606    204511    admins admins_email_key138 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key138 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key138;
       public            postgres    false    224            �           2606    204539    admins admins_email_key139 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key139 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key139;
       public            postgres    false    224            �           2606    204623    admins admins_email_key14 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key14 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key14;
       public            postgres    false    224            �           2606    204513    admins admins_email_key140 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key140 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key140;
       public            postgres    false    224            �           2606    204531    admins admins_email_key141 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key141 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key141;
       public            postgres    false    224            �           2606    204515    admins admins_email_key142 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key142 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key142;
       public            postgres    false    224            �           2606    204751    admins admins_email_key143 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key143 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key143;
       public            postgres    false    224            �           2606    204753    admins admins_email_key144 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key144 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key144;
       public            postgres    false    224            �           2606    204529    admins admins_email_key145 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key145 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key145;
       public            postgres    false    224            �           2606    204755    admins admins_email_key146 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key146 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key146;
       public            postgres    false    224            �           2606    204525    admins admins_email_key147 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key147 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key147;
       public            postgres    false    224                        2606    204757    admins admins_email_key148 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key148 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key148;
       public            postgres    false    224                       2606    204523    admins admins_email_key149 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key149 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key149;
       public            postgres    false    224                       2606    204569    admins admins_email_key15 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key15 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key15;
       public            postgres    false    224                       2606    204759    admins admins_email_key150 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key150 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key150;
       public            postgres    false    224                       2606    204521    admins admins_email_key151 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key151 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key151;
       public            postgres    false    224            
           2606    204761    admins admins_email_key152 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key152 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key152;
       public            postgres    false    224                       2606    204519    admins admins_email_key153 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key153 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key153;
       public            postgres    false    224                       2606    204763    admins admins_email_key154 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key154 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key154;
       public            postgres    false    224                       2606    204517    admins admins_email_key155 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key155 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key155;
       public            postgres    false    224                       2606    204649    admins admins_email_key156 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key156 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key156;
       public            postgres    false    224                       2606    204821    admins admins_email_key157 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key157 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key157;
       public            postgres    false    224                       2606    204615    admins admins_email_key158 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key158 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key158;
       public            postgres    false    224                       2606    204979    admins admins_email_key159 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key159 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key159;
       public            postgres    false    224                       2606    204571    admins admins_email_key16 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key16 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key16;
       public            postgres    false    224                       2606    204617    admins admins_email_key160 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key160 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key160;
       public            postgres    false    224                       2606    204977    admins admins_email_key161 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key161 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key161;
       public            postgres    false    224                        2606    204903    admins admins_email_key162 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key162 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key162;
       public            postgres    false    224            "           2606    204975    admins admins_email_key163 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key163 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key163;
       public            postgres    false    224            $           2606    204905    admins admins_email_key164 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key164 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key164;
       public            postgres    false    224            &           2606    204915    admins admins_email_key165 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key165 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key165;
       public            postgres    false    224            (           2606    204689    admins admins_email_key166 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key166 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key166;
       public            postgres    false    224            *           2606    204613    admins admins_email_key167 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key167 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key167;
       public            postgres    false    224            ,           2606    204691    admins admins_email_key168 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key168 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key168;
       public            postgres    false    224            .           2606    204611    admins admins_email_key169 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key169 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key169;
       public            postgres    false    224            0           2606    204621    admins admins_email_key17 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key17 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key17;
       public            postgres    false    224            2           2606    204695    admins admins_email_key170 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key170 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key170;
       public            postgres    false    224            4           2606    204609    admins admins_email_key171 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key171 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key171;
       public            postgres    false    224            6           2606    204697    admins admins_email_key172 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key172 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key172;
       public            postgres    false    224            8           2606    204607    admins admins_email_key173 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key173 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key173;
       public            postgres    false    224            :           2606    204699    admins admins_email_key174 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key174 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key174;
       public            postgres    false    224            <           2606    204605    admins admins_email_key175 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key175 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key175;
       public            postgres    false    224            >           2606    204913    admins admins_email_key176 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key176 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key176;
       public            postgres    false    224            @           2606    204603    admins admins_email_key177 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key177 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key177;
       public            postgres    false    224            B           2606    204823    admins admins_email_key178 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key178 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key178;
       public            postgres    false    224            D           2606    204825    admins admins_email_key179 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key179 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key179;
       public            postgres    false    224            F           2606    204499    admins admins_email_key18 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key18 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key18;
       public            postgres    false    224            H           2606    204827    admins admins_email_key180 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key180 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key180;
       public            postgres    false    224            J           2606    204843    admins admins_email_key181 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key181 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key181;
       public            postgres    false    224            L           2606    204845    admins admins_email_key182 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key182 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key182;
       public            postgres    false    224            N           2606    204601    admins admins_email_key183 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key183 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key183;
       public            postgres    false    224            P           2606    204847    admins admins_email_key184 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key184 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key184;
       public            postgres    false    224            R           2606    204599    admins admins_email_key185 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key185 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key185;
       public            postgres    false    224            T           2606    204851    admins admins_email_key186 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key186 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key186;
       public            postgres    false    224            V           2606    204597    admins admins_email_key187 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key187 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key187;
       public            postgres    false    224            X           2606    204867    admins admins_email_key188 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key188 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key188;
       public            postgres    false    224            Z           2606    204595    admins admins_email_key189 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key189 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key189;
       public            postgres    false    224            \           2606    204573    admins admins_email_key19 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key19 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key19;
       public            postgres    false    224            ^           2606    204869    admins admins_email_key190 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key190 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key190;
       public            postgres    false    224            `           2606    204593    admins admins_email_key191 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key191 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key191;
       public            postgres    false    224            b           2606    204873    admins admins_email_key192 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key192 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key192;
       public            postgres    false    224            d           2606    204707    admins admins_email_key193 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key193 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key193;
       public            postgres    false    224            f           2606    204709    admins admins_email_key194 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key194 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key194;
       public            postgres    false    224            h           2606    204661    admins admins_email_key195 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key195 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key195;
       public            postgres    false    224            j           2606    204711    admins admins_email_key196 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key196 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key196;
       public            postgres    false    224            l           2606    204657    admins admins_email_key197 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key197 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key197;
       public            postgres    false    224            n           2606    204713    admins admins_email_key198 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key198 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key198;
       public            postgres    false    224            p           2606    204669    admins admins_email_key199 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key199 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key199;
       public            postgres    false    224            r           2606    204901    admins admins_email_key2 
   CONSTRAINT     T   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key2 UNIQUE (email);
 B   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key2;
       public            postgres    false    224            t           2606    204575    admins admins_email_key20 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key20 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key20;
       public            postgres    false    224            v           2606    204715    admins admins_email_key200 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key200 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key200;
       public            postgres    false    224            x           2606    204667    admins admins_email_key201 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key201 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key201;
       public            postgres    false    224            z           2606    204665    admins admins_email_key202 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key202 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key202;
       public            postgres    false    224            |           2606    204739    admins admins_email_key203 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key203 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key203;
       public            postgres    false    224            ~           2606    204567    admins admins_email_key204 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key204 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key204;
       public            postgres    false    224            �           2606    204829    admins admins_email_key205 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key205 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key205;
       public            postgres    false    224            �           2606    204831    admins admins_email_key206 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key206 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key206;
       public            postgres    false    224            �           2606    204841    admins admins_email_key207 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key207 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key207;
       public            postgres    false    224            �           2606    204833    admins admins_email_key208 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key208 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key208;
       public            postgres    false    224            �           2606    204839    admins admins_email_key209 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key209 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key209;
       public            postgres    false    224            �           2606    204737    admins admins_email_key21 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key21 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key21;
       public            postgres    false    224            �           2606    204837    admins admins_email_key210 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key210 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key210;
       public            postgres    false    224            �           2606    204537    admins admins_email_key211 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key211 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key211;
       public            postgres    false    224            �           2606    204835    admins admins_email_key212 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key212 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key212;
       public            postgres    false    224            �           2606    204943    admins admins_email_key213 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key213 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key213;
       public            postgres    false    224            �           2606    204671    admins admins_email_key214 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key214 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key214;
       public            postgres    false    224            �           2606    204725    admins admins_email_key215 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key215 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key215;
       public            postgres    false    224            �           2606    204675    admins admins_email_key216 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key216 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key216;
       public            postgres    false    224            �           2606    204723    admins admins_email_key217 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key217 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key217;
       public            postgres    false    224            �           2606    204721    admins admins_email_key218 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key218 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key218;
       public            postgres    false    224            �           2606    204535    admins admins_email_key219 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key219 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key219;
       public            postgres    false    224            �           2606    204577    admins admins_email_key22 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key22 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key22;
       public            postgres    false    224            �           2606    204677    admins admins_email_key220 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key220 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key220;
       public            postgres    false    224            �           2606    204679    admins admins_email_key221 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key221 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key221;
       public            postgres    false    224            �           2606    204681    admins admins_email_key222 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key222 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key222;
       public            postgres    false    224            �           2606    204705    admins admins_email_key223 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key223 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key223;
       public            postgres    false    224            �           2606    204683    admins admins_email_key224 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key224 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key224;
       public            postgres    false    224            �           2606    204703    admins admins_email_key225 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key225 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key225;
       public            postgres    false    224            �           2606    204701    admins admins_email_key226 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key226 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key226;
       public            postgres    false    224            �           2606    204503    admins admins_email_key227 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key227 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key227;
       public            postgres    false    224            �           2606    204685    admins admins_email_key228 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key228 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key228;
       public            postgres    false    224            �           2606    204489    admins admins_email_key229 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key229 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key229;
       public            postgres    false    224            �           2606    204579    admins admins_email_key23 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key23 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key23;
       public            postgres    false    224            �           2606    204491    admins admins_email_key230 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key230 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key230;
       public            postgres    false    224            �           2606    204655    admins admins_email_key231 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key231 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key231;
       public            postgres    false    224            �           2606    204493    admins admins_email_key232 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key232 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key232;
       public            postgres    false    224            �           2606    204653    admins admins_email_key233 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key233 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key233;
       public            postgres    false    224            �           2606    204651    admins admins_email_key234 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key234 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key234;
       public            postgres    false    224            �           2606    204583    admins admins_email_key235 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key235 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key235;
       public            postgres    false    224            �           2606    204495    admins admins_email_key236 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key236 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key236;
       public            postgres    false    224            �           2606    204483    admins admins_email_key237 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key237 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key237;
       public            postgres    false    224            �           2606    204907    admins admins_email_key238 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key238 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key238;
       public            postgres    false    224            �           2606    204911    admins admins_email_key239 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key239 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key239;
       public            postgres    false    224            �           2606    204733    admins admins_email_key24 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key24 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key24;
       public            postgres    false    224            �           2606    204527    admins admins_email_key240 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key240 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key240;
       public            postgres    false    224            �           2606    205009    admins admins_email_key241 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key241 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key241;
       public            postgres    false    224            �           2606    204973    admins admins_email_key242 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key242 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key242;
       public            postgres    false    224            �           2606    204917    admins admins_email_key243 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key243 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key243;
       public            postgres    false    224            �           2606    204919    admins admins_email_key244 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key244 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key244;
       public            postgres    false    224            �           2606    204931    admins admins_email_key245 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key245 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key245;
       public            postgres    false    224            �           2606    204923    admins admins_email_key246 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key246 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key246;
       public            postgres    false    224            �           2606    204929    admins admins_email_key247 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key247 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key247;
       public            postgres    false    224            �           2606    204927    admins admins_email_key248 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key248 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key248;
       public            postgres    false    224            �           2606    204987    admins admins_email_key249 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key249 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key249;
       public            postgres    false    224            �           2606    204731    admins admins_email_key25 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key25 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key25;
       public            postgres    false    224            �           2606    204925    admins admins_email_key250 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key250 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key250;
       public            postgres    false    224            �           2606    204477    admins admins_email_key251 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key251 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key251;
       public            postgres    false    224            �           2606    204659    admins admins_email_key252 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key252 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key252;
       public            postgres    false    224            �           2606    204871    admins admins_email_key253 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key253 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key253;
       public            postgres    false    224            �           2606    204909    admins admins_email_key254 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key254 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key254;
       public            postgres    false    224            �           2606    204471    admins admins_email_key255 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key255 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key255;
       public            postgres    false    224            �           2606    204635    admins admins_email_key256 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key256 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key256;
       public            postgres    false    224            �           2606    204633    admins admins_email_key257 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key257 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key257;
       public            postgres    false    224            �           2606    204789    admins admins_email_key258 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key258 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key258;
       public            postgres    false    224            �           2606    204791    admins admins_email_key259 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key259 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key259;
       public            postgres    false    224            �           2606    204581    admins admins_email_key26 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key26 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key26;
       public            postgres    false    224            �           2606    204793    admins admins_email_key260 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key260 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key260;
       public            postgres    false    224            �           2606    204631    admins admins_email_key261 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key261 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key261;
       public            postgres    false    224            �           2606    204795    admins admins_email_key262 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key262 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key262;
       public            postgres    false    224                        2606    204629    admins admins_email_key263 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key263 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key263;
       public            postgres    false    224                       2606    204627    admins admins_email_key264 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key264 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key264;
       public            postgres    false    224                       2606    204849    admins admins_email_key265 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key265 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key265;
       public            postgres    false    224                       2606    204797    admins admins_email_key266 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key266 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key266;
       public            postgres    false    224                       2606    204799    admins admins_email_key267 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key267 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key267;
       public            postgres    false    224            
           2606    204801    admins admins_email_key268 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key268 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key268;
       public            postgres    false    224                       2606    204811    admins admins_email_key269 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key269 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key269;
       public            postgres    false    224                       2606    204729    admins admins_email_key27 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key27 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key27;
       public            postgres    false    224                       2606    204803    admins admins_email_key270 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key270 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key270;
       public            postgres    false    224                       2606    204809    admins admins_email_key271 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key271 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key271;
       public            postgres    false    224                       2606    204807    admins admins_email_key272 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key272 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key272;
       public            postgres    false    224                       2606    205011    admins admins_email_key273 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key273 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key273;
       public            postgres    false    224                       2606    204805    admins admins_email_key274 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key274 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key274;
       public            postgres    false    224                       2606    204673    admins admins_email_key275 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key275 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key275;
       public            postgres    false    224                       2606    204533    admins admins_email_key276 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key276 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key276;
       public            postgres    false    224                       2606    204921    admins admins_email_key277 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key277 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key277;
       public            postgres    false    224                        2606    204875    admins admins_email_key278 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key278 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key278;
       public            postgres    false    224            "           2606    204457    admins admins_email_key279 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key279 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key279;
       public            postgres    false    224            $           2606    204587    admins admins_email_key28 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key28 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key28;
       public            postgres    false    224            &           2606    204877    admins admins_email_key280 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key280 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key280;
       public            postgres    false    224            (           2606    204813    admins admins_email_key281 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key281 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key281;
       public            postgres    false    224            *           2606    204637    admins admins_email_key282 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key282 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key282;
       public            postgres    false    224            ,           2606    204549    admins admins_email_key283 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key283 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key283;
       public            postgres    false    224            .           2606    204953    admins admins_email_key284 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key284 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key284;
       public            postgres    false    224            0           2606    204955    admins admins_email_key285 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key285 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key285;
       public            postgres    false    224            2           2606    204857    admins admins_email_key286 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key286 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key286;
       public            postgres    false    224            4           2606    204693    admins admins_email_key287 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key287 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key287;
       public            postgres    false    224            6           2606    205033    admins admins_email_key288 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key288 UNIQUE (email);
 D   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key288;
       public            postgres    false    224            8           2606    204585    admins admins_email_key29 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key29 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key29;
       public            postgres    false    224            :           2606    204767    admins admins_email_key3 
   CONSTRAINT     T   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key3 UNIQUE (email);
 B   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key3;
       public            postgres    false    224            <           2606    204775    admins admins_email_key30 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key30 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key30;
       public            postgres    false    224            >           2606    204773    admins admins_email_key31 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key31 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key31;
       public            postgres    false    224            @           2606    204971    admins admins_email_key32 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key32 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key32;
       public            postgres    false    224            B           2606    205013    admins admins_email_key33 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key33 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key33;
       public            postgres    false    224            D           2606    204771    admins admins_email_key34 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key34 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key34;
       public            postgres    false    224            F           2606    205015    admins admins_email_key35 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key35 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key35;
       public            postgres    false    224            H           2606    204769    admins admins_email_key36 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key36 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key36;
       public            postgres    false    224            J           2606    204819    admins admins_email_key37 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key37 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key37;
       public            postgres    false    224            L           2606    205017    admins admins_email_key38 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key38 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key38;
       public            postgres    false    224            N           2606    205023    admins admins_email_key39 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key39 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key39;
       public            postgres    false    224            P           2606    204967    admins admins_email_key4 
   CONSTRAINT     T   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key4 UNIQUE (email);
 B   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key4;
       public            postgres    false    224            R           2606    205021    admins admins_email_key40 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key40 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key40;
       public            postgres    false    224            T           2606    205019    admins admins_email_key41 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key41 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key41;
       public            postgres    false    224            V           2606    204687    admins admins_email_key42 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key42 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key42;
       public            postgres    false    224            X           2606    204815    admins admins_email_key43 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key43 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key43;
       public            postgres    false    224            Z           2606    204965    admins admins_email_key44 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key44 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key44;
       public            postgres    false    224            \           2606    204817    admins admins_email_key45 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key45 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key45;
       public            postgres    false    224            ^           2606    204961    admins admins_email_key46 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key46 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key46;
       public            postgres    false    224            `           2606    204963    admins admins_email_key47 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key47 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key47;
       public            postgres    false    224            b           2606    204865    admins admins_email_key48 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key48 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key48;
       public            postgres    false    224            d           2606    204783    admins admins_email_key49 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key49 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key49;
       public            postgres    false    224            f           2606    204969    admins admins_email_key5 
   CONSTRAINT     T   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key5 UNIQUE (email);
 B   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key5;
       public            postgres    false    224            h           2606    204863    admins admins_email_key50 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key50 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key50;
       public            postgres    false    224            j           2606    204785    admins admins_email_key51 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key51 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key51;
       public            postgres    false    224            l           2606    204861    admins admins_email_key52 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key52 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key52;
       public            postgres    false    224            n           2606    204853    admins admins_email_key53 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key53 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key53;
       public            postgres    false    224            p           2606    204859    admins admins_email_key54 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key54 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key54;
       public            postgres    false    224            r           2606    204855    admins admins_email_key55 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key55 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key55;
       public            postgres    false    224            t           2606    205025    admins admins_email_key56 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key56 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key56;
       public            postgres    false    224            v           2606    205027    admins admins_email_key57 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key57 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key57;
       public            postgres    false    224            x           2606    204719    admins admins_email_key58 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key58 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key58;
       public            postgres    false    224            z           2606    204727    admins admins_email_key59 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key59 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key59;
       public            postgres    false    224            |           2606    204777    admins admins_email_key6 
   CONSTRAINT     T   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key6 UNIQUE (email);
 B   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key6;
       public            postgres    false    224            ~           2606    204889    admins admins_email_key60 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key60 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key60;
       public            postgres    false    224            �           2606    204941    admins admins_email_key61 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key61 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key61;
       public            postgres    false    224            �           2606    204891    admins admins_email_key62 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key62 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key62;
       public            postgres    false    224            �           2606    204939    admins admins_email_key63 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key63 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key63;
       public            postgres    false    224            �           2606    204893    admins admins_email_key64 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key64 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key64;
       public            postgres    false    224            �           2606    204937    admins admins_email_key65 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key65 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key65;
       public            postgres    false    224            �           2606    205029    admins admins_email_key66 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key66 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key66;
       public            postgres    false    224            �           2606    204933    admins admins_email_key67 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key67 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key67;
       public            postgres    false    224            �           2606    205031    admins admins_email_key68 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key68 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key68;
       public            postgres    false    224            �           2606    204459    admins admins_email_key69 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key69 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key69;
       public            postgres    false    224            �           2606    204779    admins admins_email_key7 
   CONSTRAINT     T   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key7 UNIQUE (email);
 B   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key7;
       public            postgres    false    224            �           2606    204461    admins admins_email_key70 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key70 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key70;
       public            postgres    false    224            �           2606    204619    admins admins_email_key71 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key71 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key71;
       public            postgres    false    224            �           2606    204463    admins admins_email_key72 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key72 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key72;
       public            postgres    false    224            �           2606    205007    admins admins_email_key73 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key73 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key73;
       public            postgres    false    224            �           2606    204465    admins admins_email_key74 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key74 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key74;
       public            postgres    false    224            �           2606    205005    admins admins_email_key75 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key75 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key75;
       public            postgres    false    224            �           2606    204467    admins admins_email_key76 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key76 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key76;
       public            postgres    false    224            �           2606    205003    admins admins_email_key77 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key77 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key77;
       public            postgres    false    224            �           2606    204641    admins admins_email_key78 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key78 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key78;
       public            postgres    false    224            �           2606    205001    admins admins_email_key79 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key79 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key79;
       public            postgres    false    224            �           2606    204781    admins admins_email_key8 
   CONSTRAINT     T   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key8 UNIQUE (email);
 B   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key8;
       public            postgres    false    224            �           2606    204643    admins admins_email_key80 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key80 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key80;
       public            postgres    false    224            �           2606    204999    admins admins_email_key81 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key81 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key81;
       public            postgres    false    224            �           2606    204645    admins admins_email_key82 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key82 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key82;
       public            postgres    false    224            �           2606    204647    admins admins_email_key83 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key83 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key83;
       public            postgres    false    224            �           2606    204981    admins admins_email_key84 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key84 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key84;
       public            postgres    false    224            �           2606    204997    admins admins_email_key85 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key85 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key85;
       public            postgres    false    224            �           2606    204983    admins admins_email_key86 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key86 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key86;
       public            postgres    false    224            �           2606    204995    admins admins_email_key87 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key87 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key87;
       public            postgres    false    224            �           2606    204985    admins admins_email_key88 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key88 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key88;
       public            postgres    false    224            �           2606    204993    admins admins_email_key89 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key89 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key89;
       public            postgres    false    224            �           2606    204895    admins admins_email_key9 
   CONSTRAINT     T   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key9 UNIQUE (email);
 B   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key9;
       public            postgres    false    224            �           2606    204989    admins admins_email_key90 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key90 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key90;
       public            postgres    false    224            �           2606    204765    admins admins_email_key91 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key91 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key91;
       public            postgres    false    224            �           2606    204991    admins admins_email_key92 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key92 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key92;
       public            postgres    false    224            �           2606    204749    admins admins_email_key93 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key93 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key93;
       public            postgres    false    224            �           2606    204945    admins admins_email_key94 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key94 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key94;
       public            postgres    false    224            �           2606    204747    admins admins_email_key95 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key95 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key95;
       public            postgres    false    224            �           2606    204947    admins admins_email_key96 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key96 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key96;
       public            postgres    false    224            �           2606    204949    admins admins_email_key97 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key97 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key97;
       public            postgres    false    224            �           2606    204951    admins admins_email_key98 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key98 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key98;
       public            postgres    false    224            �           2606    204745    admins admins_email_key99 
   CONSTRAINT     U   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key99 UNIQUE (email);
 C   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_key99;
       public            postgres    false    224            �           2606    17718    admins admins_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    224            �           2606    17699 .   basketItems basketItems_basketId_productId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."basketItems"
    ADD CONSTRAINT "basketItems_basketId_productId_key" UNIQUE ("basketId", "productId");
 \   ALTER TABLE ONLY public."basketItems" DROP CONSTRAINT "basketItems_basketId_productId_key";
       public            postgres    false    222    222            �           2606    17697    basketItems basketItems_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."basketItems"
    ADD CONSTRAINT "basketItems_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."basketItems" DROP CONSTRAINT "basketItems_pkey";
       public            postgres    false    222            �           2606    17685    baskets baskets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.baskets DROP CONSTRAINT baskets_pkey;
       public            postgres    false    220            �           2606    17729    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    226            �           2606    17678    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    218            �           2606    17748    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    228            @           2606    203965    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    216            B           2606    203967    users users_email_key1 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key1;
       public            postgres    false    216            D           2606    204381    users users_email_key10 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key10 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key10;
       public            postgres    false    216            F           2606    203915    users users_email_key100 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key100 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key100;
       public            postgres    false    216            H           2606    203987    users users_email_key101 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key101 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key101;
       public            postgres    false    216            J           2606    203917    users users_email_key102 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key102 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key102;
       public            postgres    false    216            L           2606    203919    users users_email_key103 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key103 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key103;
       public            postgres    false    216            N           2606    204377    users users_email_key104 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key104 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key104;
       public            postgres    false    216            P           2606    203921    users users_email_key105 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key105 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key105;
       public            postgres    false    216            R           2606    204375    users users_email_key106 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key106 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key106;
       public            postgres    false    216            T           2606    203923    users users_email_key107 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key107 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key107;
       public            postgres    false    216            V           2606    204373    users users_email_key108 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key108 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key108;
       public            postgres    false    216            X           2606    203931    users users_email_key109 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key109 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key109;
       public            postgres    false    216            Z           2606    203937    users users_email_key11 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key11 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key11;
       public            postgres    false    216            \           2606    203933    users users_email_key110 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key110 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key110;
       public            postgres    false    216            ^           2606    203895    users users_email_key111 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key111 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key111;
       public            postgres    false    216            `           2606    203903    users users_email_key112 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key112 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key112;
       public            postgres    false    216            b           2606    203897    users users_email_key113 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key113 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key113;
       public            postgres    false    216            d           2606    203901    users users_email_key114 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key114 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key114;
       public            postgres    false    216            f           2606    203899    users users_email_key115 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key115 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key115;
       public            postgres    false    216            h           2606    203877    users users_email_key116 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key116 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key116;
       public            postgres    false    216            j           2606    204231    users users_email_key117 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key117 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key117;
       public            postgres    false    216            l           2606    203875    users users_email_key118 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key118 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key118;
       public            postgres    false    216            n           2606    204333    users users_email_key119 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key119 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key119;
       public            postgres    false    216            p           2606    204383    users users_email_key12 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key12 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key12;
       public            postgres    false    216            r           2606    203873    users users_email_key120 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key120 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key120;
       public            postgres    false    216            t           2606    204005    users users_email_key121 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key121 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key121;
       public            postgres    false    216            v           2606    203871    users users_email_key122 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key122 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key122;
       public            postgres    false    216            x           2606    204007    users users_email_key123 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key123 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key123;
       public            postgres    false    216            z           2606    203869    users users_email_key124 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key124 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key124;
       public            postgres    false    216            |           2606    204009    users users_email_key125 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key125 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key125;
       public            postgres    false    216            ~           2606    204011    users users_email_key126 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key126 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key126;
       public            postgres    false    216            �           2606    204013    users users_email_key127 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key127 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key127;
       public            postgres    false    216            �           2606    204279    users users_email_key128 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key128 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key128;
       public            postgres    false    216            �           2606    204015    users users_email_key129 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key129 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key129;
       public            postgres    false    216            �           2606    203935    users users_email_key13 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key13 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key13;
       public            postgres    false    216            �           2606    204277    users users_email_key130 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key130 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key130;
       public            postgres    false    216            �           2606    204017    users users_email_key131 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key131 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key131;
       public            postgres    false    216            �           2606    204019    users users_email_key132 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key132 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key132;
       public            postgres    false    216            �           2606    204021    users users_email_key133 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key133 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key133;
       public            postgres    false    216            �           2606    204023    users users_email_key134 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key134 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key134;
       public            postgres    false    216            �           2606    204243    users users_email_key135 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key135 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key135;
       public            postgres    false    216            �           2606    204025    users users_email_key136 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key136 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key136;
       public            postgres    false    216            �           2606    203891    users users_email_key137 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key137 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key137;
       public            postgres    false    216            �           2606    204027    users users_email_key138 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key138 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key138;
       public            postgres    false    216            �           2606    203889    users users_email_key139 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key139 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key139;
       public            postgres    false    216            �           2606    203867    users users_email_key14 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key14 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key14;
       public            postgres    false    216            �           2606    204029    users users_email_key140 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key140 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key140;
       public            postgres    false    216            �           2606    203887    users users_email_key141 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key141 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key141;
       public            postgres    false    216            �           2606    204031    users users_email_key142 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key142 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key142;
       public            postgres    false    216            �           2606    203885    users users_email_key143 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key143 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key143;
       public            postgres    false    216            �           2606    204033    users users_email_key144 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key144 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key144;
       public            postgres    false    216            �           2606    204035    users users_email_key145 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key145 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key145;
       public            postgres    false    216            �           2606    204037    users users_email_key146 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key146 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key146;
       public            postgres    false    216            �           2606    203883    users users_email_key147 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key147 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key147;
       public            postgres    false    216            �           2606    204039    users users_email_key148 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key148 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key148;
       public            postgres    false    216            �           2606    203881    users users_email_key149 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key149 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key149;
       public            postgres    false    216            �           2606    204385    users users_email_key15 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key15 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key15;
       public            postgres    false    216            �           2606    204041    users users_email_key150 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key150 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key150;
       public            postgres    false    216            �           2606    204371    users users_email_key151 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key151 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key151;
       public            postgres    false    216            �           2606    204043    users users_email_key152 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key152 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key152;
       public            postgres    false    216            �           2606    204369    users users_email_key153 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key153 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key153;
       public            postgres    false    216            �           2606    204045    users users_email_key154 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key154 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key154;
       public            postgres    false    216            �           2606    204367    users users_email_key155 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key155 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key155;
       public            postgres    false    216            �           2606    204047    users users_email_key156 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key156 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key156;
       public            postgres    false    216            �           2606    204365    users users_email_key157 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key157 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key157;
       public            postgres    false    216            �           2606    204049    users users_email_key158 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key158 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key158;
       public            postgres    false    216            �           2606    204051    users users_email_key159 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key159 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key159;
       public            postgres    false    216            �           2606    204387    users users_email_key16 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key16 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key16;
       public            postgres    false    216            �           2606    204053    users users_email_key160 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key160 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key160;
       public            postgres    false    216            �           2606    204363    users users_email_key161 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key161 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key161;
       public            postgres    false    216            �           2606    204055    users users_email_key162 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key162 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key162;
       public            postgres    false    216            �           2606    204361    users users_email_key163 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key163 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key163;
       public            postgres    false    216            �           2606    204057    users users_email_key164 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key164 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key164;
       public            postgres    false    216            �           2606    204241    users users_email_key165 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key165 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key165;
       public            postgres    false    216            �           2606    204059    users users_email_key166 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key166 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key166;
       public            postgres    false    216            �           2606    204239    users users_email_key167 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key167 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key167;
       public            postgres    false    216            �           2606    204061    users users_email_key168 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key168 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key168;
       public            postgres    false    216            �           2606    203963    users users_email_key169 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key169 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key169;
       public            postgres    false    216            �           2606    204391    users users_email_key17 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key17 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key17;
       public            postgres    false    216            �           2606    204063    users users_email_key170 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key170 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key170;
       public            postgres    false    216            �           2606    203961    users users_email_key171 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key171 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key171;
       public            postgres    false    216            �           2606    204065    users users_email_key172 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key172 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key172;
       public            postgres    false    216            �           2606    203959    users users_email_key173 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key173 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key173;
       public            postgres    false    216            �           2606    204067    users users_email_key174 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key174 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key174;
       public            postgres    false    216            �           2606    203957    users users_email_key175 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key175 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key175;
       public            postgres    false    216            �           2606    203925    users users_email_key176 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key176 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key176;
       public            postgres    false    216            �           2606    203955    users users_email_key177 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key177 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key177;
       public            postgres    false    216            �           2606    203927    users users_email_key178 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key178 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key178;
       public            postgres    false    216            �           2606    203953    users users_email_key179 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key179 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key179;
       public            postgres    false    216            �           2606    204389    users users_email_key18 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key18 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key18;
       public            postgres    false    216            �           2606    203929    users users_email_key180 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key180 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key180;
       public            postgres    false    216            �           2606    204069    users users_email_key181 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key181 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key181;
       public            postgres    false    216            �           2606    204071    users users_email_key182 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key182 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key182;
       public            postgres    false    216            �           2606    204073    users users_email_key183 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key183 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key183;
       public            postgres    false    216            �           2606    204075    users users_email_key184 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key184 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key184;
       public            postgres    false    216                        2606    203951    users users_email_key185 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key185 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key185;
       public            postgres    false    216                       2606    204077    users users_email_key186 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key186 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key186;
       public            postgres    false    216                       2606    203949    users users_email_key187 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key187 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key187;
       public            postgres    false    216                       2606    204079    users users_email_key188 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key188 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key188;
       public            postgres    false    216                       2606    204343    users users_email_key189 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key189 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key189;
       public            postgres    false    216            
           2606    204213    users users_email_key19 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key19 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key19;
       public            postgres    false    216                       2606    204081    users users_email_key190 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key190 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key190;
       public            postgres    false    216                       2606    204341    users users_email_key191 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key191 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key191;
       public            postgres    false    216                       2606    204083    users users_email_key192 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key192 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key192;
       public            postgres    false    216                       2606    204339    users users_email_key193 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key193 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key193;
       public            postgres    false    216                       2606    204085    users users_email_key194 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key194 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key194;
       public            postgres    false    216                       2606    204087    users users_email_key195 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key195 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key195;
       public            postgres    false    216                       2606    204089    users users_email_key196 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key196 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key196;
       public            postgres    false    216                       2606    204337    users users_email_key197 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key197 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key197;
       public            postgres    false    216                       2606    204091    users users_email_key198 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key198 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key198;
       public            postgres    false    216                       2606    204335    users users_email_key199 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key199 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key199;
       public            postgres    false    216                        2606    203969    users users_email_key2 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key2;
       public            postgres    false    216            "           2606    203975    users users_email_key20 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key20 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key20;
       public            postgres    false    216            $           2606    204093    users users_email_key200 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key200 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key200;
       public            postgres    false    216            &           2606    204211    users users_email_key201 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key201 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key201;
       public            postgres    false    216            (           2606    204113    users users_email_key202 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key202 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key202;
       public            postgres    false    216            *           2606    204209    users users_email_key203 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key203 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key203;
       public            postgres    false    216            ,           2606    204115    users users_email_key204 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key204 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key204;
       public            postgres    false    216            .           2606    204207    users users_email_key205 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key205 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key205;
       public            postgres    false    216            0           2606    204117    users users_email_key206 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key206 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key206;
       public            postgres    false    216            2           2606    204119    users users_email_key207 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key207 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key207;
       public            postgres    false    216            4           2606    204121    users users_email_key208 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key208 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key208;
       public            postgres    false    216            6           2606    204205    users users_email_key209 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key209 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key209;
       public            postgres    false    216            8           2606    204003    users users_email_key21 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key21 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key21;
       public            postgres    false    216            :           2606    204123    users users_email_key210 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key210 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key210;
       public            postgres    false    216            <           2606    204203    users users_email_key211 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key211 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key211;
       public            postgres    false    216            >           2606    204125    users users_email_key212 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key212 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key212;
       public            postgres    false    216            @           2606    204201    users users_email_key213 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key213 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key213;
       public            postgres    false    216            B           2606    204127    users users_email_key214 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key214 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key214;
       public            postgres    false    216            D           2606    204129    users users_email_key215 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key215 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key215;
       public            postgres    false    216            F           2606    204131    users users_email_key216 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key216 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key216;
       public            postgres    false    216            H           2606    204199    users users_email_key217 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key217 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key217;
       public            postgres    false    216            J           2606    204133    users users_email_key218 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key218 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key218;
       public            postgres    false    216            L           2606    204197    users users_email_key219 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key219 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key219;
       public            postgres    false    216            N           2606    203977    users users_email_key22 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key22 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key22;
       public            postgres    false    216            P           2606    204135    users users_email_key220 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key220 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key220;
       public            postgres    false    216            R           2606    204195    users users_email_key221 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key221 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key221;
       public            postgres    false    216            T           2606    204137    users users_email_key222 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key222 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key222;
       public            postgres    false    216            V           2606    204139    users users_email_key223 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key223 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key223;
       public            postgres    false    216            X           2606    204141    users users_email_key224 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key224 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key224;
       public            postgres    false    216            Z           2606    204193    users users_email_key225 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key225 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key225;
       public            postgres    false    216            \           2606    204143    users users_email_key226 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key226 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key226;
       public            postgres    false    216            ^           2606    204191    users users_email_key227 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key227 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key227;
       public            postgres    false    216            `           2606    204145    users users_email_key228 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key228 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key228;
       public            postgres    false    216            b           2606    204189    users users_email_key229 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key229 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key229;
       public            postgres    false    216            d           2606    203979    users users_email_key23 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key23 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key23;
       public            postgres    false    216            f           2606    204147    users users_email_key230 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key230 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key230;
       public            postgres    false    216            h           2606    204149    users users_email_key231 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key231 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key231;
       public            postgres    false    216            j           2606    204151    users users_email_key232 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key232 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key232;
       public            postgres    false    216            l           2606    204187    users users_email_key233 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key233 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key233;
       public            postgres    false    216            n           2606    204153    users users_email_key234 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key234 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key234;
       public            postgres    false    216            p           2606    204185    users users_email_key235 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key235 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key235;
       public            postgres    false    216            r           2606    204155    users users_email_key236 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key236 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key236;
       public            postgres    false    216            t           2606    204183    users users_email_key237 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key237 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key237;
       public            postgres    false    216            v           2606    204157    users users_email_key238 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key238 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key238;
       public            postgres    false    216            x           2606    204181    users users_email_key239 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key239 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key239;
       public            postgres    false    216            z           2606    204001    users users_email_key24 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key24 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key24;
       public            postgres    false    216            |           2606    204159    users users_email_key240 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key240 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key240;
       public            postgres    false    216            ~           2606    204179    users users_email_key241 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key241 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key241;
       public            postgres    false    216            �           2606    204161    users users_email_key242 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key242 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key242;
       public            postgres    false    216            �           2606    204177    users users_email_key243 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key243 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key243;
       public            postgres    false    216            �           2606    204163    users users_email_key244 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key244 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key244;
       public            postgres    false    216            �           2606    204165    users users_email_key245 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key245 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key245;
       public            postgres    false    216            �           2606    204167    users users_email_key246 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key246 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key246;
       public            postgres    false    216            �           2606    204175    users users_email_key247 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key247 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key247;
       public            postgres    false    216            �           2606    204169    users users_email_key248 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key248 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key248;
       public            postgres    false    216            �           2606    204173    users users_email_key249 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key249 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key249;
       public            postgres    false    216            �           2606    203893    users users_email_key25 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key25 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key25;
       public            postgres    false    216            �           2606    204171    users users_email_key250 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key250 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key250;
       public            postgres    false    216            �           2606    204111    users users_email_key251 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key251 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key251;
       public            postgres    false    216            �           2606    204095    users users_email_key252 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key252 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key252;
       public            postgres    false    216            �           2606    204109    users users_email_key253 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key253 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key253;
       public            postgres    false    216            �           2606    204097    users users_email_key254 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key254 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key254;
       public            postgres    false    216            �           2606    204107    users users_email_key255 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key255 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key255;
       public            postgres    false    216            �           2606    204099    users users_email_key256 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key256 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key256;
       public            postgres    false    216            �           2606    204105    users users_email_key257 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key257 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key257;
       public            postgres    false    216            �           2606    204101    users users_email_key258 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key258 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key258;
       public            postgres    false    216            �           2606    204103    users users_email_key259 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key259 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key259;
       public            postgres    false    216            �           2606    203981    users users_email_key26 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key26 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key26;
       public            postgres    false    216            �           2606    204275    users users_email_key260 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key260 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key260;
       public            postgres    false    216            �           2606    204271    users users_email_key261 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key261 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key261;
       public            postgres    false    216            �           2606    204273    users users_email_key262 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key262 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key262;
       public            postgres    false    216            �           2606    204393    users users_email_key263 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key263 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key263;
       public            postgres    false    216            �           2606    203865    users users_email_key264 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key264 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key264;
       public            postgres    false    216            �           2606    204395    users users_email_key265 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key265 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key265;
       public            postgres    false    216            �           2606    203863    users users_email_key266 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key266 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key266;
       public            postgres    false    216            �           2606    204397    users users_email_key267 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key267 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key267;
       public            postgres    false    216            �           2606    203861    users users_email_key268 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key268 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key268;
       public            postgres    false    216            �           2606    204399    users users_email_key269 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key269 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key269;
       public            postgres    false    216            �           2606    204359    users users_email_key27 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key27 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key27;
       public            postgres    false    216            �           2606    204401    users users_email_key270 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key270 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key270;
       public            postgres    false    216            �           2606    204403    users users_email_key271 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key271 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key271;
       public            postgres    false    216            �           2606    203859    users users_email_key272 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key272 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key272;
       public            postgres    false    216            �           2606    204405    users users_email_key273 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key273 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key273;
       public            postgres    false    216            �           2606    203857    users users_email_key274 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key274 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key274;
       public            postgres    false    216            �           2606    204407    users users_email_key275 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key275 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key275;
       public            postgres    false    216            �           2606    203855    users users_email_key276 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key276 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key276;
       public            postgres    false    216            �           2606    204409    users users_email_key277 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key277 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key277;
       public            postgres    false    216            �           2606    203853    users users_email_key278 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key278 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key278;
       public            postgres    false    216            �           2606    204411    users users_email_key279 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key279 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key279;
       public            postgres    false    216            �           2606    204357    users users_email_key28 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key28 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key28;
       public            postgres    false    216            �           2606    203851    users users_email_key280 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key280 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key280;
       public            postgres    false    216            �           2606    204413    users users_email_key281 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key281 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key281;
       public            postgres    false    216            �           2606    203849    users users_email_key282 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key282 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key282;
       public            postgres    false    216            �           2606    204415    users users_email_key283 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key283 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key283;
       public            postgres    false    216            �           2606    203847    users users_email_key284 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key284 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key284;
       public            postgres    false    216            �           2606    204417    users users_email_key285 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key285 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key285;
       public            postgres    false    216            �           2606    203845    users users_email_key286 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key286 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key286;
       public            postgres    false    216            �           2606    204419    users users_email_key287 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key287 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key287;
       public            postgres    false    216            �           2606    203843    users users_email_key288 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key288 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key288;
       public            postgres    false    216            �           2606    204421    users users_email_key289 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key289 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key289;
       public            postgres    false    216            �           2606    203983    users users_email_key29 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key29 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key29;
       public            postgres    false    216            �           2606    203841    users users_email_key290 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key290 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key290;
       public            postgres    false    216            �           2606    204423    users users_email_key291 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key291 UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key291;
       public            postgres    false    216            �           2606    203971    users users_email_key3 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key3;
       public            postgres    false    216            �           2606    204355    users users_email_key30 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key30 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key30;
       public            postgres    false    216            �           2606    204353    users users_email_key31 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key31 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key31;
       public            postgres    false    216            �           2606    204301    users users_email_key32 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key32 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key32;
       public            postgres    false    216            �           2606    204217    users users_email_key33 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key33 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key33;
       public            postgres    false    216            �           2606    204351    users users_email_key34 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key34 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key34;
       public            postgres    false    216            �           2606    204219    users users_email_key35 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key35 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key35;
       public            postgres    false    216            �           2606    204349    users users_email_key36 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key36 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key36;
       public            postgres    false    216            �           2606    204347    users users_email_key37 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key37 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key37;
       public            postgres    false    216                        2606    204221    users users_email_key38 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key38 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key38;
       public            postgres    false    216                       2606    204345    users users_email_key39 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key39 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key39;
       public            postgres    false    216                       2606    203973    users users_email_key4 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key4 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key4;
       public            postgres    false    216                       2606    204227    users users_email_key40 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key40 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key40;
       public            postgres    false    216                       2606    204223    users users_email_key41 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key41 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key41;
       public            postgres    false    216            
           2606    204225    users users_email_key42 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key42 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key42;
       public            postgres    false    216                       2606    204303    users users_email_key43 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key43 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key43;
       public            postgres    false    216                       2606    204215    users users_email_key44 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key44 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key44;
       public            postgres    false    216                       2606    204305    users users_email_key45 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key45 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key45;
       public            postgres    false    216                       2606    204307    users users_email_key46 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key46 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key46;
       public            postgres    false    216                       2606    204331    users users_email_key47 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key47 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key47;
       public            postgres    false    216                       2606    203943    users users_email_key48 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key48 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key48;
       public            postgres    false    216                       2606    204309    users users_email_key49 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key49 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key49;
       public            postgres    false    216                       2606    204233    users users_email_key5 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key5 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key5;
       public            postgres    false    216                       2606    203941    users users_email_key50 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key50 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key50;
       public            postgres    false    216                       2606    204311    users users_email_key51 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key51 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key51;
       public            postgres    false    216                        2606    203985    users users_email_key52 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key52 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key52;
       public            postgres    false    216            "           2606    204313    users users_email_key53 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key53 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key53;
       public            postgres    false    216            $           2606    203905    users users_email_key54 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key54 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key54;
       public            postgres    false    216            &           2606    204315    users users_email_key55 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key55 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key55;
       public            postgres    false    216            (           2606    204317    users users_email_key56 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key56 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key56;
       public            postgres    false    216            *           2606    204229    users users_email_key57 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key57 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key57;
       public            postgres    false    216            ,           2606    203879    users users_email_key58 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key58 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key58;
       public            postgres    false    216            .           2606    203999    users users_email_key59 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key59 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key59;
       public            postgres    false    216            0           2606    204235    users users_email_key6 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key6 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key6;
       public            postgres    false    216            2           2606    204281    users users_email_key60 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key60 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key60;
       public            postgres    false    216            4           2606    203997    users users_email_key61 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key61 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key61;
       public            postgres    false    216            6           2606    204283    users users_email_key62 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key62 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key62;
       public            postgres    false    216            8           2606    203995    users users_email_key63 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key63 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key63;
       public            postgres    false    216            :           2606    204285    users users_email_key64 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key64 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key64;
       public            postgres    false    216            <           2606    203993    users users_email_key65 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key65 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key65;
       public            postgres    false    216            >           2606    204287    users users_email_key66 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key66 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key66;
       public            postgres    false    216            @           2606    203991    users users_email_key67 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key67 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key67;
       public            postgres    false    216            B           2606    204289    users users_email_key68 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key68 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key68;
       public            postgres    false    216            D           2606    204291    users users_email_key69 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key69 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key69;
       public            postgres    false    216            F           2606    204237    users users_email_key7 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key7 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key7;
       public            postgres    false    216            H           2606    204293    users users_email_key70 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key70 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key70;
       public            postgres    false    216            J           2606    203909    users users_email_key71 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key71 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key71;
       public            postgres    false    216            L           2606    204295    users users_email_key72 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key72 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key72;
       public            postgres    false    216            N           2606    203907    users users_email_key73 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key73 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key73;
       public            postgres    false    216            P           2606    204297    users users_email_key74 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key74 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key74;
       public            postgres    false    216            R           2606    204299    users users_email_key75 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key75 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key75;
       public            postgres    false    216            T           2606    204245    users users_email_key76 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key76 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key76;
       public            postgres    false    216            V           2606    204269    users users_email_key77 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key77 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key77;
       public            postgres    false    216            X           2606    204247    users users_email_key78 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key78 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key78;
       public            postgres    false    216            Z           2606    204267    users users_email_key79 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key79 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key79;
       public            postgres    false    216            \           2606    204379    users users_email_key8 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key8 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key8;
       public            postgres    false    216            ^           2606    204249    users users_email_key80 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key80 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key80;
       public            postgres    false    216            `           2606    204265    users users_email_key81 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key81 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key81;
       public            postgres    false    216            b           2606    204251    users users_email_key82 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key82 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key82;
       public            postgres    false    216            d           2606    204253    users users_email_key83 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key83 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key83;
       public            postgres    false    216            f           2606    204255    users users_email_key84 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key84 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key84;
       public            postgres    false    216            h           2606    204263    users users_email_key85 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key85 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key85;
       public            postgres    false    216            j           2606    204257    users users_email_key86 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key86 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key86;
       public            postgres    false    216            l           2606    204261    users users_email_key87 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key87 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key87;
       public            postgres    false    216            n           2606    204259    users users_email_key88 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key88 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key88;
       public            postgres    false    216            p           2606    204329    users users_email_key89 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key89 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key89;
       public            postgres    false    216            r           2606    203939    users users_email_key9 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key9 UNIQUE (email);
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key9;
       public            postgres    false    216            t           2606    203945    users users_email_key90 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key90 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key90;
       public            postgres    false    216            v           2606    204327    users users_email_key91 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key91 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key91;
       public            postgres    false    216            x           2606    203947    users users_email_key92 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key92 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key92;
       public            postgres    false    216            z           2606    204325    users users_email_key93 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key93 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key93;
       public            postgres    false    216            |           2606    204319    users users_email_key94 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key94 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key94;
       public            postgres    false    216            ~           2606    204323    users users_email_key95 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key95 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key95;
       public            postgres    false    216            �           2606    204321    users users_email_key96 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key96 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key96;
       public            postgres    false    216            �           2606    203911    users users_email_key97 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key97 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key97;
       public            postgres    false    216            �           2606    203913    users users_email_key98 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key98 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key98;
       public            postgres    false    216            �           2606    203989    users users_email_key99 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key99 UNIQUE (email);
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key99;
       public            postgres    false    216            �           2606    17667    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �           2606    204434 %   basketItems basketItems_basketId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."basketItems"
    ADD CONSTRAINT "basketItems_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public."basketItems" DROP CONSTRAINT "basketItems_basketId_fkey";
       public          postgres    false    5260    222    220            �           2606    204439 &   basketItems basketItems_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."basketItems"
    ADD CONSTRAINT "basketItems_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."basketItems" DROP CONSTRAINT "basketItems_productId_fkey";
       public          postgres    false    222    5258    218            �           2606    204429    baskets baskets_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT "baskets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.baskets DROP CONSTRAINT "baskets_userId_fkey";
       public          postgres    false    5256    216    220            �           2606    204449    orders orders_adminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES public.admins(id) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT "orders_adminId_fkey";
       public          postgres    false    224    226    5844            �           2606    204444    orders orders_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.orders DROP CONSTRAINT "orders_userId_fkey";
       public          postgres    false    216    5256    226            �           2606    205034    reviews reviews_orderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT "reviews_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.reviews DROP CONSTRAINT "reviews_orderId_fkey";
       public          postgres    false    226    5846    228            �           2606    204424    users users_basketId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT "users_basketId_fkey";
       public          postgres    false    220    5260    216            x   ^   x�3�LL���sH�H�-�I�K���T1JT14P1J6/4��t�,06s7pN+�r	,)�2��w�2��-q��02�M�q�s5������� �w/      v      x������ � �      t      x�3�4�2�4�2�4����� �      z   �  x��V�NA����w1���B���pc`cH�I/�i�M�ZSj-��E/z��_������
�F�g�̜����,NZpC�p��<ЗpE�p�K��U���B��եW�?���m��-s�	!m�J�n�vȶ���3�M8�I�R8�?�-�k�$��nԮ������r��9^�I/������E���$�P���:��;���C�&����C����ɱ��>'�&��}�.���������X(��+T-����˥���`�B+��F��/�V�_+K��&3�GN�q5�&������!�j"p��L��bJ�J��۝Ɲ����|�e�@��E.y������3$�@?��V4yb17�7��0���f 6_����vb7��I#���2Z��������3�BP�9����V�	�p1T��O|�����>@�wn%\�(?ӈ��p9P5��k8`��<A����#N�ڹf�-�o� ��M���ޢ�[���D,4#=���&v�Q ��@�Q:Şm�Am�R�&>5����!*g x�C�~�_H�:�:�\'$�1��H��l�e����� ق��4q?Ƃ��J�l��@[\�NF��t%����'ː�k3=�E�"w-Z^D��l�tu�I�zɩ�t��J٤����8���|�]�����L��~��TΏy�'M�R3��H$���{�      r   �  x��SIN�@<�_1����_x�'!�#,8������x����Q=v��X�8d�鮪��92x@�
9j4XH�ϣ���'K����Aɻ�����3)�آ���Gb�[���]���^"3�ޙX #�­��3c�
 Sw8rt�6]`�4%#r� A���-	N>�Y�W5]_1�7xR@��R�\�/!���,�2~�V�J�����M�S��gXJd�ڨ)6x���u5j����.�^�O]*w̜J���g��u�6&y�`t6���ͱ&,$cZ�#>��h�kG�uJT�Z`ΈN䕊p��ZF�sΐDm���Й��uO��W���&�h��������&�E��������,#�]:U<u�)	�{a��N{�<X���y#7����Y�u�GtSΎ����vhp��n$�Kܶ��9�<�<��d��      |     x���;N�@D�S9 �q����%��_@>�gm_��FT�B "!�F��yUճpk�[����6�v�`�/"j�m`�Ā�v1!��7+0�h9�h���በ�>�
�V���L��/���A�̜l�>y3�ɤH���`E {&���ȄNw_2��\B�+�����lO����ro�i����Ꝅx�HԜx���Kpp+�;��հ<�
��j���o/�E�%��b�g]t�|\<G�k���o�_J�A+�1}ͣ	
,=ApLC�ĝ��6'���{�	#�J�      p   U  x���;o�0���آ����ģ	�Qu1�!��Ӧ��5����n8K���?L���Q�@"Z�!kd�a)N���)H8U6�߆�.L<���0}�E�i��~F$7��&Gh>�=�����о/ޗ}�p�BT5�8q�,���^�D.��L����ri�.,��8u�"J;_:F���*�mk������!�	oN���v�x���k�g�v>��=/�lݺ7�f��`���z���8N9H�/	��u�ȷPha�+�<�f����A �%��0ٰ��$��B�k=2�(<�%�m+4�@j���2�Tu��c�q!r.�϶a�����     