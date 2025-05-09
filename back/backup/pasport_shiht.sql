PGDMP  3                    |            Pasport_shiht    16.3    16.3 �    T           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            U           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            V           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            W           1262    19256    Pasport_shiht    DATABASE     �   CREATE DATABASE "Pasport_shiht" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Pasport_shiht";
                postgres    false            �            1259    19697    Appointments    TABLE     e   CREATE TABLE public."Appointments" (
    id integer NOT NULL,
    name character varying NOT NULL
);
 "   DROP TABLE public."Appointments";
       public         heap    postgres    false            X           0    0    COLUMN "Appointments".id    COMMENT     a   COMMENT ON COLUMN public."Appointments".id IS 'идентификатор назначения';
          public          postgres    false    243            Y           0    0    COLUMN "Appointments".name    COMMENT     a   COMMENT ON COLUMN public."Appointments".name IS 'наименование назначения';
          public          postgres    false    243            �            1259    19700    Appointments_id_seq    SEQUENCE     �   ALTER TABLE public."Appointments" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Appointments_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    243            �            1259    19338    Batchs    TABLE     _   CREATE TABLE public."Batchs" (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public."Batchs";
       public         heap    postgres    false            �            1259    19341    Batches_id_seq    SEQUENCE     �   ALTER TABLE public."Batchs" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Batches_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    19319    Calculations    TABLE     <  CREATE TABLE public."Calculations" (
    id integer NOT NULL,
    al_content real DEFAULT 0,
    mo_content real DEFAULT 0,
    v_content real DEFAULT 0,
    c_content real DEFAULT 0,
    cr_content real DEFAULT 0,
    ntc_order_number character varying(50) NOT NULL,
    directive character varying(10) NOT NULL
);
 "   DROP TABLE public."Calculations";
       public         heap    postgres    false            Z           0    0    COLUMN "Calculations".id    COMMENT     ]   COMMENT ON COLUMN public."Calculations".id IS 'идентефикатор рассчёта';
          public          postgres    false    226            [           0    0     COLUMN "Calculations".al_content    COMMENT     _   COMMENT ON COLUMN public."Calculations".al_content IS 'содержание алюминия';
          public          postgres    false    226            \           0    0     COLUMN "Calculations".mo_content    COMMENT     a   COMMENT ON COLUMN public."Calculations".mo_content IS 'содержание молебдена';
          public          postgres    false    226            ]           0    0    COLUMN "Calculations".v_content    COMMENT     \   COMMENT ON COLUMN public."Calculations".v_content IS 'содержание ванадия';
          public          postgres    false    226            ^           0    0    COLUMN "Calculations".c_content    COMMENT     ^   COMMENT ON COLUMN public."Calculations".c_content IS 'содержание углерода';
          public          postgres    false    226            _           0    0     COLUMN "Calculations".cr_content    COMMENT     Y   COMMENT ON COLUMN public."Calculations".cr_content IS 'содержание хрома';
          public          postgres    false    226            `           0    0 &   COLUMN "Calculations".ntc_order_number    COMMENT     V   COMMENT ON COLUMN public."Calculations".ntc_order_number IS '№ заказа (MFG)';
          public          postgres    false    226            a           0    0    COLUMN "Calculations".directive    COMMENT     b   COMMENT ON COLUMN public."Calculations".directive IS 'наименование указания';
          public          postgres    false    226            �            1259    19290    Charge_marks    TABLE     e   CREATE TABLE public."Charge_marks" (
    id integer NOT NULL,
    name character varying NOT NULL
);
 "   DROP TABLE public."Charge_marks";
       public         heap    postgres    false            b           0    0    COLUMN "Charge_marks".id    COMMENT     b   COMMENT ON COLUMN public."Charge_marks".id IS 'идентификатор марки шихты';
          public          postgres    false    224            c           0    0    COLUMN "Charge_marks".name    COMMENT     Z   COMMENT ON COLUMN public."Charge_marks".name IS 'название марки шихты';
          public          postgres    false    224            �            1259    19284    Charge_types    TABLE     e   CREATE TABLE public."Charge_types" (
    id integer NOT NULL,
    name character varying NOT NULL
);
 "   DROP TABLE public."Charge_types";
       public         heap    postgres    false            d           0    0    COLUMN "Charge_types".id    COMMENT     `   COMMENT ON COLUMN public."Charge_types".id IS 'идентификатор типа шихты';
          public          postgres    false    222            e           0    0    COLUMN "Charge_types".name    COMMENT     X   COMMENT ON COLUMN public."Charge_types".name IS 'название типа шихты';
          public          postgres    false    222            �            1259    19435 	   Contracts    TABLE     �   CREATE TABLE public."Contracts" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    attachment integer NOT NULL,
    "position" integer NOT NULL,
    customer_id integer NOT NULL
);
    DROP TABLE public."Contracts";
       public         heap    postgres    false            f           0    0    COLUMN "Contracts".id    COMMENT     \   COMMENT ON COLUMN public."Contracts".id IS 'идентификатор контракта';
          public          postgres    false    237            g           0    0    COLUMN "Contracts".name    COMMENT     T   COMMENT ON COLUMN public."Contracts".name IS 'название контракта';
          public          postgres    false    237            h           0    0    COLUMN "Contracts".attachment    COMMENT     K   COMMENT ON COLUMN public."Contracts".attachment IS 'приложение';
          public          postgres    false    237            i           0    0    COLUMN "Contracts"."position"    COMMENT     E   COMMENT ON COLUMN public."Contracts"."position" IS 'позиция';
          public          postgres    false    237            j           0    0    COLUMN "Contracts".customer_id    COMMENT     e   COMMENT ON COLUMN public."Contracts".customer_id IS 'идентификатор заказчика';
          public          postgres    false    237            �            1259    19438    Contracts_id_seq    SEQUENCE     �   ALTER TABLE public."Contracts" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Contracts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    19353    Control_types    TABLE     f   CREATE TABLE public."Control_types" (
    id integer NOT NULL,
    name character varying NOT NULL
);
 #   DROP TABLE public."Control_types";
       public         heap    postgres    false            �            1259    19422 	   Customers    TABLE     f   CREATE TABLE public."Customers" (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public."Customers";
       public         heap    postgres    false            k           0    0    COLUMN "Customers".id    COMMENT     \   COMMENT ON COLUMN public."Customers".id IS 'идентификатор заказчика';
          public          postgres    false    235            l           0    0    COLUMN "Customers".name    COMMENT     A   COMMENT ON COLUMN public."Customers".name IS 'заказчик';
          public          postgres    false    235            �            1259    19425    Customers_id_seq    SEQUENCE     �   ALTER TABLE public."Customers" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Customers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    19602    Electrode_indexs    TABLE     l   CREATE TABLE public."Electrode_indexs" (
    id integer NOT NULL,
    name character varying(2) NOT NULL
);
 &   DROP TABLE public."Electrode_indexs";
       public         heap    postgres    false            m           0    0    COLUMN "Electrode_indexs".id    COMMENT     P   COMMENT ON COLUMN public."Electrode_indexs".id IS 'идентификатор';
          public          postgres    false    240            n           0    0    COLUMN "Electrode_indexs".name    COMMENT     W   COMMENT ON COLUMN public."Electrode_indexs".name IS 'название индекса';
          public          postgres    false    240            �            1259    19270 
   Electrodes    TABLE     �  CREATE TABLE public."Electrodes" (
    id integer NOT NULL,
    mass real NOT NULL,
    vshm real NOT NULL,
    nv integer NOT NULL,
    place_number character varying(10),
    batch_id integer NOT NULL,
    fraction_id integer,
    pasport_id integer NOT NULL,
    manufacturer_id integer NOT NULL,
    charge_mark_id integer NOT NULL,
    charge_type_id integer NOT NULL,
    electrode_index_id integer NOT NULL,
    o_content real,
    fe_content real
);
     DROP TABLE public."Electrodes";
       public         heap    postgres    false            o           0    0    COLUMN "Electrodes".id    COMMENT     ]   COMMENT ON COLUMN public."Electrodes".id IS 'идентификатор электрода';
          public          postgres    false    218            p           0    0    COLUMN "Electrodes".mass    COMMENT     <   COMMENT ON COLUMN public."Electrodes".mass IS 'масса';
          public          postgres    false    218            q           0    0    COLUMN "Electrodes".vshm    COMMENT     G   COMMENT ON COLUMN public."Electrodes".vshm IS 'процент ВШМ';
          public          postgres    false    218            r           0    0    COLUMN "Electrodes".nv    COMMENT     4   COMMENT ON COLUMN public."Electrodes".nv IS 'НВ';
          public          postgres    false    218            s           0    0     COLUMN "Electrodes".place_number    COMMENT     H   COMMENT ON COLUMN public."Electrodes".place_number IS '№ места';
          public          postgres    false    218            t           0    0    COLUMN "Electrodes".batch_id    COMMENT     ]   COMMENT ON COLUMN public."Electrodes".batch_id IS 'идентификатор партии';
          public          postgres    false    218            u           0    0    COLUMN "Electrodes".fraction_id    COMMENT     b   COMMENT ON COLUMN public."Electrodes".fraction_id IS 'идентификатор фракции';
          public          postgres    false    218            v           0    0    COLUMN "Electrodes".pasport_id    COMMENT     c   COMMENT ON COLUMN public."Electrodes".pasport_id IS 'идентификатор паспорта';
          public          postgres    false    218            w           0    0 #   COLUMN "Electrodes".manufacturer_id    COMMENT     {   COMMENT ON COLUMN public."Electrodes".manufacturer_id IS 'идентификатор изготовителя сырья';
          public          postgres    false    218            x           0    0 "   COLUMN "Electrodes".charge_mark_id    COMMENT     l   COMMENT ON COLUMN public."Electrodes".charge_mark_id IS 'идентификатор марки шихты';
          public          postgres    false    218            y           0    0 "   COLUMN "Electrodes".charge_type_id    COMMENT     j   COMMENT ON COLUMN public."Electrodes".charge_type_id IS 'идентификатор типа шихты';
          public          postgres    false    218            z           0    0 &   COLUMN "Electrodes".electrode_index_id    COMMENT     |   COMMENT ON COLUMN public."Electrodes".electrode_index_id IS 'идентификатор индекса электрода';
          public          postgres    false    218            {           0    0    COLUMN "Electrodes".o_content    COMMENT     \   COMMENT ON COLUMN public."Electrodes".o_content IS 'содержание кислорда';
          public          postgres    false    218            |           0    0    COLUMN "Electrodes".fe_content    COMMENT     Y   COMMENT ON COLUMN public."Electrodes".fe_content IS 'содержание железа';
          public          postgres    false    218            �            1259    19389 	   Fractions    TABLE     b   CREATE TABLE public."Fractions" (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public."Fractions";
       public         heap    postgres    false            }           0    0    COLUMN "Fractions".id    COMMENT     X   COMMENT ON COLUMN public."Fractions".id IS 'идентификатор фракции';
          public          postgres    false    233            ~           0    0    COLUMN "Fractions".name    COMMENT     N   COMMENT ON COLUMN public."Fractions".name IS 'формула фракции';
          public          postgres    false    233            �            1259    19392    Fractions_id_seq    SEQUENCE     �   ALTER TABLE public."Fractions" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Fractions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    19329    Manufacturers    TABLE     j   CREATE TABLE public."Manufacturers" (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
 #   DROP TABLE public."Manufacturers";
       public         heap    postgres    false                       0    0    COLUMN "Manufacturers".id    COMMENT     f   COMMENT ON COLUMN public."Manufacturers".id IS 'идентификатор изготовителя';
          public          postgres    false    227            �           0    0    COLUMN "Manufacturers".name    COMMENT     ^   COMMENT ON COLUMN public."Manufacturers".name IS 'название изготовителя';
          public          postgres    false    227            �            1259    19332    Manufacturers_id_seq    SEQUENCE     �   ALTER TABLE public."Manufacturers" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Manufacturers_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    19257    Pasports    TABLE     �  CREATE TABLE public."Pasports" (
    id integer NOT NULL,
    calc_id integer NOT NULL,
    control_type_id integer NOT NULL,
    timesheet_id integer NOT NULL,
    request_number character varying(50) NOT NULL,
    contract_id integer NOT NULL,
    press_date date NOT NULL,
    press_time time without time zone NOT NULL,
    electrode_number integer NOT NULL,
    appointment_id integer NOT NULL
);
    DROP TABLE public."Pasports";
       public         heap    postgres    false            �           0    0    COLUMN "Pasports".id    COMMENT     Y   COMMENT ON COLUMN public."Pasports".id IS 'идентификатор паспорта';
          public          postgres    false    215            �           0    0    COLUMN "Pasports".calc_id    COMMENT     ^   COMMENT ON COLUMN public."Pasports".calc_id IS 'идентификатор рассчёта';
          public          postgres    false    215            �           0    0 !   COLUMN "Pasports".control_type_id    COMMENT     o   COMMENT ON COLUMN public."Pasports".control_type_id IS 'идентификатор типа контроля';
          public          postgres    false    215            �           0    0    COLUMN "Pasports".timesheet_id    COMMENT     h   COMMENT ON COLUMN public."Pasports".timesheet_id IS 'идентификатор листа смены';
          public          postgres    false    215            �           0    0     COLUMN "Pasports".request_number    COMMENT     Q   COMMENT ON COLUMN public."Pasports".request_number IS 'номер заявки';
          public          postgres    false    215            �           0    0    COLUMN "Pasports".contract_id    COMMENT     T   COMMENT ON COLUMN public."Pasports".contract_id IS 'номер контракта';
          public          postgres    false    215            �           0    0    COLUMN "Pasports".press_date    COMMENT     h   COMMENT ON COLUMN public."Pasports".press_date IS 'дата прессования электрода';
          public          postgres    false    215            �           0    0    COLUMN "Pasports".press_time    COMMENT     W   COMMENT ON COLUMN public."Pasports".press_time IS 'время прессования';
          public          postgres    false    215            �           0    0 "   COLUMN "Pasports".electrode_number    COMMENT     j   COMMENT ON COLUMN public."Pasports".electrode_number IS 'номер паспорта электрода';
          public          postgres    false    215            �           0    0     COLUMN "Pasports".appointment_id    COMMENT     i   COMMENT ON COLUMN public."Pasports".appointment_id IS 'идентификатор назначения';
          public          postgres    false    215            �            1259    19280 
   Timesheets    TABLE     +  CREATE TABLE public."Timesheets" (
    id integer NOT NULL,
    controller_tn integer NOT NULL,
    apparat_tn integer NOT NULL,
    dispenser_tn integer NOT NULL,
    loader_tn integer NOT NULL,
    weigher_tn integer NOT NULL,
    charger_tn integer NOT NULL,
    shift_number integer NOT NULL
);
     DROP TABLE public."Timesheets";
       public         heap    postgres    false            �           0    0    COLUMN "Timesheets".id    COMMENT     l   COMMENT ON COLUMN public."Timesheets".id IS 'идентефикатор табельных номеров';
          public          postgres    false    220            �           0    0 !   COLUMN "Timesheets".controller_tn    COMMENT     k   COMMENT ON COLUMN public."Timesheets".controller_tn IS 'табелный номер контролёра';
          public          postgres    false    220            �           0    0    COLUMN "Timesheets".apparat_tn    COMMENT     j   COMMENT ON COLUMN public."Timesheets".apparat_tn IS 'табелный номер аппаратчика';
          public          postgres    false    220            �           0    0     COLUMN "Timesheets".dispenser_tn    COMMENT     n   COMMENT ON COLUMN public."Timesheets".dispenser_tn IS 'табельный номер дозаторщика';
          public          postgres    false    220            �           0    0    COLUMN "Timesheets".loader_tn    COMMENT     g   COMMENT ON COLUMN public."Timesheets".loader_tn IS 'табельный номер погрузика';
          public          postgres    false    220            �           0    0    COLUMN "Timesheets".weigher_tn    COMMENT     h   COMMENT ON COLUMN public."Timesheets".weigher_tn IS 'табельный номер весовщика';
          public          postgres    false    220            �           0    0    COLUMN "Timesheets".charger_tn    COMMENT     j   COMMENT ON COLUMN public."Timesheets".charger_tn IS 'табельный номер шихтовщика';
          public          postgres    false    220            �           0    0     COLUMN "Timesheets".shift_number    COMMENT     O   COMMENT ON COLUMN public."Timesheets".shift_number IS 'номер смены';
          public          postgres    false    220            �            1259    19621    Users    TABLE     �   CREATE TABLE public."Users" (
    id integer NOT NULL,
    personnel_number integer NOT NULL,
    name character varying,
    password character varying
);
    DROP TABLE public."Users";
       public         heap    postgres    false            �           0    0    COLUMN "Users".id    COMMENT     ^   COMMENT ON COLUMN public."Users".id IS 'идентификатор пользователя';
          public          postgres    false    241            �           0    0    COLUMN "Users".personnel_number    COMMENT     V   COMMENT ON COLUMN public."Users".personnel_number IS 'табельный номер';
          public          postgres    false    241            �           0    0    COLUMN "Users".name    COMMENT     L   COMMENT ON COLUMN public."Users".name IS 'ФИО пользователя';
          public          postgres    false    241            �           0    0    COLUMN "Users".password    COMMENT     V   COMMENT ON COLUMN public."Users".password IS 'пароль пользователя';
          public          postgres    false    241            �            1259    19624    Users_id_seq    SEQUENCE     �   ALTER TABLE public."Users" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    19318    calculations_id_seq    SEQUENCE     �   ALTER TABLE public."Calculations" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.calculations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    19289    charge_marks_id_seq    SEQUENCE     �   ALTER TABLE public."Charge_marks" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.charge_marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    19283    charge_types_id_seq    SEQUENCE     �   ALTER TABLE public."Charge_types" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.charge_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    19352    control_types_id_seq    SEQUENCE     �   ALTER TABLE public."Control_types" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.control_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    19601    electrode_indexes_id_seq    SEQUENCE     �   ALTER TABLE public."Electrode_indexs" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.electrode_indexes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    240            �            1259    19269    electrodes_id_seq    SEQUENCE     �   ALTER TABLE public."Electrodes" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.electrodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    19260    pasports_id_seq    SEQUENCE     �   ALTER TABLE public."Pasports" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pasports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    19279    timesheets_id_seq    SEQUENCE     �   ALTER TABLE public."Timesheets" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.timesheets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            P          0    19697    Appointments 
   TABLE DATA           2   COPY public."Appointments" (id, name) FROM stdin;
    public          postgres    false    243   e�       B          0    19338    Batchs 
   TABLE DATA           ,   COPY public."Batchs" (id, name) FROM stdin;
    public          postgres    false    229   ��       ?          0    19319    Calculations 
   TABLE DATA           �   COPY public."Calculations" (id, al_content, mo_content, v_content, c_content, cr_content, ntc_order_number, directive) FROM stdin;
    public          postgres    false    226   #�       =          0    19290    Charge_marks 
   TABLE DATA           2   COPY public."Charge_marks" (id, name) FROM stdin;
    public          postgres    false    224   ��       ;          0    19284    Charge_types 
   TABLE DATA           2   COPY public."Charge_types" (id, name) FROM stdin;
    public          postgres    false    222   )�       J          0    19435 	   Contracts 
   TABLE DATA           T   COPY public."Contracts" (id, name, attachment, "position", customer_id) FROM stdin;
    public          postgres    false    237   r�       E          0    19353    Control_types 
   TABLE DATA           3   COPY public."Control_types" (id, name) FROM stdin;
    public          postgres    false    232   ��       H          0    19422 	   Customers 
   TABLE DATA           /   COPY public."Customers" (id, name) FROM stdin;
    public          postgres    false    235   ��       M          0    19602    Electrode_indexs 
   TABLE DATA           6   COPY public."Electrode_indexs" (id, name) FROM stdin;
    public          postgres    false    240   ��       7          0    19270 
   Electrodes 
   TABLE DATA           �   COPY public."Electrodes" (id, mass, vshm, nv, place_number, batch_id, fraction_id, pasport_id, manufacturer_id, charge_mark_id, charge_type_id, electrode_index_id, o_content, fe_content) FROM stdin;
    public          postgres    false    218   +�       F          0    19389 	   Fractions 
   TABLE DATA           /   COPY public."Fractions" (id, name) FROM stdin;
    public          postgres    false    233   )�       @          0    19329    Manufacturers 
   TABLE DATA           3   COPY public."Manufacturers" (id, name) FROM stdin;
    public          postgres    false    227   ]�       4          0    19257    Pasports 
   TABLE DATA           �   COPY public."Pasports" (id, calc_id, control_type_id, timesheet_id, request_number, contract_id, press_date, press_time, electrode_number, appointment_id) FROM stdin;
    public          postgres    false    215   ��       9          0    19280 
   Timesheets 
   TABLE DATA           �   COPY public."Timesheets" (id, controller_tn, apparat_tn, dispenser_tn, loader_tn, weigher_tn, charger_tn, shift_number) FROM stdin;
    public          postgres    false    220   �       N          0    19621    Users 
   TABLE DATA           G   COPY public."Users" (id, personnel_number, name, password) FROM stdin;
    public          postgres    false    241   V�       �           0    0    Appointments_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Appointments_id_seq"', 1, true);
          public          postgres    false    244            �           0    0    Batches_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Batches_id_seq"', 14, true);
          public          postgres    false    230            �           0    0    Contracts_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Contracts_id_seq"', 1, true);
          public          postgres    false    238            �           0    0    Customers_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Customers_id_seq"', 1, true);
          public          postgres    false    236            �           0    0    Fractions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Fractions_id_seq"', 3, true);
          public          postgres    false    234            �           0    0    Manufacturers_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Manufacturers_id_seq"', 5, true);
          public          postgres    false    228            �           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 7, true);
          public          postgres    false    242            �           0    0    calculations_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.calculations_id_seq', 10, true);
          public          postgres    false    225            �           0    0    charge_marks_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.charge_marks_id_seq', 13, true);
          public          postgres    false    223            �           0    0    charge_types_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.charge_types_id_seq', 3, true);
          public          postgres    false    221            �           0    0    control_types_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.control_types_id_seq', 1, true);
          public          postgres    false    231            �           0    0    electrode_indexes_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.electrode_indexes_id_seq', 2, true);
          public          postgres    false    239            �           0    0    electrodes_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.electrodes_id_seq', 34, true);
          public          postgres    false    217            �           0    0    pasports_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pasports_id_seq', 1, true);
          public          postgres    false    216            �           0    0    timesheets_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.timesheets_id_seq', 5, true);
          public          postgres    false    219            �           2606    19707    Appointments appointments_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public."Appointments"
    ADD CONSTRAINT appointments_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Appointments" DROP CONSTRAINT appointments_pk;
       public            postgres    false    243            z           2606    19346    Batchs batches_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public."Batchs"
    ADD CONSTRAINT batches_pk PRIMARY KEY (id);
 =   ALTER TABLE ONLY public."Batchs" DROP CONSTRAINT batches_pk;
       public            postgres    false    229            |           2606    19350    Batchs batches_unique 
   CONSTRAINT     R   ALTER TABLE ONLY public."Batchs"
    ADD CONSTRAINT batches_unique UNIQUE (name);
 A   ALTER TABLE ONLY public."Batchs" DROP CONSTRAINT batches_unique;
       public            postgres    false    229            t           2606    19363    Calculations calculations_pk 
   CONSTRAINT     \   ALTER TABLE ONLY public."Calculations"
    ADD CONSTRAINT calculations_pk PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Calculations" DROP CONSTRAINT calculations_pk;
       public            postgres    false    226            �           2606    19443    Contracts contracts_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public."Contracts"
    ADD CONSTRAINT contracts_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Contracts" DROP CONSTRAINT contracts_pk;
       public            postgres    false    237            ~           2606    19359    Control_types control_types_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Control_types"
    ADD CONSTRAINT control_types_pk PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Control_types" DROP CONSTRAINT control_types_pk;
       public            postgres    false    232            �           2606    19361 "   Control_types control_types_unique 
   CONSTRAINT     _   ALTER TABLE ONLY public."Control_types"
    ADD CONSTRAINT control_types_unique UNIQUE (name);
 N   ALTER TABLE ONLY public."Control_types" DROP CONSTRAINT control_types_unique;
       public            postgres    false    232            �           2606    19430    Customers customers_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public."Customers"
    ADD CONSTRAINT customers_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Customers" DROP CONSTRAINT customers_pk;
       public            postgres    false    235            �           2606    19432    Customers customers_unique 
   CONSTRAINT     W   ALTER TABLE ONLY public."Customers"
    ADD CONSTRAINT customers_unique UNIQUE (name);
 F   ALTER TABLE ONLY public."Customers" DROP CONSTRAINT customers_unique;
       public            postgres    false    235            �           2606    19606 %   Electrode_indexs electrode_indexes_pk 
   CONSTRAINT     e   ALTER TABLE ONLY public."Electrode_indexs"
    ADD CONSTRAINT electrode_indexes_pk PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public."Electrode_indexs" DROP CONSTRAINT electrode_indexes_pk;
       public            postgres    false    240            l           2606    19274    Electrodes electrodes_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public."Electrodes"
    ADD CONSTRAINT electrodes_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Electrodes" DROP CONSTRAINT electrodes_pk;
       public            postgres    false    218            �           2606    19397    Fractions fractions_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public."Fractions"
    ADD CONSTRAINT fractions_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Fractions" DROP CONSTRAINT fractions_pk;
       public            postgres    false    233            �           2606    19401    Fractions fractions_unique 
   CONSTRAINT     W   ALTER TABLE ONLY public."Fractions"
    ADD CONSTRAINT fractions_unique UNIQUE (name);
 F   ALTER TABLE ONLY public."Fractions" DROP CONSTRAINT fractions_unique;
       public            postgres    false    233            v           2606    19337    Manufacturers manufacturers_pk 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Manufacturers"
    ADD CONSTRAINT manufacturers_pk PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Manufacturers" DROP CONSTRAINT manufacturers_pk;
       public            postgres    false    227            x           2606    19618 "   Manufacturers manufacturers_unique 
   CONSTRAINT     _   ALTER TABLE ONLY public."Manufacturers"
    ADD CONSTRAINT manufacturers_unique UNIQUE (name);
 N   ALTER TABLE ONLY public."Manufacturers" DROP CONSTRAINT manufacturers_unique;
       public            postgres    false    227            f           2606    19268    Pasports pasports_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public."Pasports"
    ADD CONSTRAINT pasports_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Pasports" DROP CONSTRAINT pasports_pk;
       public            postgres    false    215            h           2606    19434    Pasports pasports_unique 
   CONSTRAINT     _   ALTER TABLE ONLY public."Pasports"
    ADD CONSTRAINT pasports_unique UNIQUE (request_number);
 D   ALTER TABLE ONLY public."Pasports" DROP CONSTRAINT pasports_unique;
       public            postgres    false    215            j           2606    19620    Pasports pasports_unique_1 
   CONSTRAINT     c   ALTER TABLE ONLY public."Pasports"
    ADD CONSTRAINT pasports_unique_1 UNIQUE (electrode_number);
 F   ALTER TABLE ONLY public."Pasports" DROP CONSTRAINT pasports_unique_1;
       public            postgres    false    215            n           2606    19296    Timesheets timesheets_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public."Timesheets"
    ADD CONSTRAINT timesheets_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Timesheets" DROP CONSTRAINT timesheets_pk;
       public            postgres    false    220            �           2606    19629    Users users_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."Users" DROP CONSTRAINT users_pk;
       public            postgres    false    241            r           2606    19300    Charge_marks сharge_marks_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public."Charge_marks"
    ADD CONSTRAINT "сharge_marks_pk" PRIMARY KEY (id);
 K   ALTER TABLE ONLY public."Charge_marks" DROP CONSTRAINT "сharge_marks_pk";
       public            postgres    false    224            p           2606    19298    Charge_types сharge_types_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public."Charge_types"
    ADD CONSTRAINT "сharge_types_pk" PRIMARY KEY (id);
 K   ALTER TABLE ONLY public."Charge_types" DROP CONSTRAINT "сharge_types_pk";
       public            postgres    false    222            �           2606    19522     Contracts contracts_customers_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Contracts"
    ADD CONSTRAINT contracts_customers_fk FOREIGN KEY (customer_id) REFERENCES public."Customers"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public."Contracts" DROP CONSTRAINT contracts_customers_fk;
       public          postgres    false    237    235    4742            �           2606    19502     Electrodes electrodes_batches_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Electrodes"
    ADD CONSTRAINT electrodes_batches_fk FOREIGN KEY (batch_id) REFERENCES public."Batchs"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public."Electrodes" DROP CONSTRAINT electrodes_batches_fk;
       public          postgres    false    229    218    4730            �           2606    19607 *   Electrodes electrodes_electrode_indexes_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Electrodes"
    ADD CONSTRAINT electrodes_electrode_indexes_fk FOREIGN KEY (electrode_index_id) REFERENCES public."Electrode_indexs"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 V   ALTER TABLE ONLY public."Electrodes" DROP CONSTRAINT electrodes_electrode_indexes_fk;
       public          postgres    false    240    218    4748            �           2606    19507 "   Electrodes electrodes_fractions_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Electrodes"
    ADD CONSTRAINT electrodes_fractions_fk FOREIGN KEY (fraction_id) REFERENCES public."Fractions"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public."Electrodes" DROP CONSTRAINT electrodes_fractions_fk;
       public          postgres    false    233    218    4738            �           2606    19586 &   Electrodes electrodes_manufacturers_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Electrodes"
    ADD CONSTRAINT electrodes_manufacturers_fk FOREIGN KEY (manufacturer_id) REFERENCES public."Manufacturers"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public."Electrodes" DROP CONSTRAINT electrodes_manufacturers_fk;
       public          postgres    false    227    218    4726            �           2606    19612 !   Electrodes electrodes_pasports_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Electrodes"
    ADD CONSTRAINT electrodes_pasports_fk FOREIGN KEY (pasport_id) REFERENCES public."Pasports"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public."Electrodes" DROP CONSTRAINT electrodes_pasports_fk;
       public          postgres    false    218    215    4710            �           2606    19591 &   Electrodes electrodes_сharge_marks_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Electrodes"
    ADD CONSTRAINT "electrodes_сharge_marks_fk" FOREIGN KEY (charge_mark_id) REFERENCES public."Charge_marks"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public."Electrodes" DROP CONSTRAINT "electrodes_сharge_marks_fk";
       public          postgres    false    218    4722    224            �           2606    19596 &   Electrodes electrodes_сharge_types_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Electrodes"
    ADD CONSTRAINT "electrodes_сharge_types_fk" FOREIGN KEY (charge_type_id) REFERENCES public."Charge_types"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 T   ALTER TABLE ONLY public."Electrodes" DROP CONSTRAINT "electrodes_сharge_types_fk";
       public          postgres    false    222    218    4720            �           2606    19708 !   Pasports pasports_appointments_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pasports"
    ADD CONSTRAINT pasports_appointments_fk FOREIGN KEY (appointment_id) REFERENCES public."Appointments"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public."Pasports" DROP CONSTRAINT pasports_appointments_fk;
       public          postgres    false    215    4752    243            �           2606    19467 !   Pasports pasports_calculations_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pasports"
    ADD CONSTRAINT pasports_calculations_fk FOREIGN KEY (calc_id) REFERENCES public."Calculations"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public."Pasports" DROP CONSTRAINT pasports_calculations_fk;
       public          postgres    false    215    4724    226            �           2606    19512    Pasports pasports_contracts_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pasports"
    ADD CONSTRAINT pasports_contracts_fk FOREIGN KEY (contract_id) REFERENCES public."Contracts"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 J   ALTER TABLE ONLY public."Pasports" DROP CONSTRAINT pasports_contracts_fk;
       public          postgres    false    215    4746    237            �           2606    19497 "   Pasports pasports_control_types_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pasports"
    ADD CONSTRAINT pasports_control_types_fk FOREIGN KEY (control_type_id) REFERENCES public."Control_types"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public."Pasports" DROP CONSTRAINT pasports_control_types_fk;
       public          postgres    false    215    4734    232            �           2606    19477    Pasports pasports_timesheets_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pasports"
    ADD CONSTRAINT pasports_timesheets_fk FOREIGN KEY (timesheet_id) REFERENCES public."Timesheets"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public."Pasports" DROP CONSTRAINT pasports_timesheets_fk;
       public          postgres    false    220    4718    215            �           2606    19660    Timesheets timesheets_users_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."Timesheets"
    ADD CONSTRAINT timesheets_users_fk FOREIGN KEY (controller_tn) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 J   ALTER TABLE ONLY public."Timesheets" DROP CONSTRAINT timesheets_users_fk;
       public          postgres    false    241    4750    220            �           2606    19665     Timesheets timesheets_users_fk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public."Timesheets"
    ADD CONSTRAINT timesheets_users_fk_1 FOREIGN KEY (apparat_tn) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public."Timesheets" DROP CONSTRAINT timesheets_users_fk_1;
       public          postgres    false    4750    241    220            �           2606    19670     Timesheets timesheets_users_fk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public."Timesheets"
    ADD CONSTRAINT timesheets_users_fk_2 FOREIGN KEY (dispenser_tn) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public."Timesheets" DROP CONSTRAINT timesheets_users_fk_2;
       public          postgres    false    241    220    4750            �           2606    19675     Timesheets timesheets_users_fk_3    FK CONSTRAINT     �   ALTER TABLE ONLY public."Timesheets"
    ADD CONSTRAINT timesheets_users_fk_3 FOREIGN KEY (loader_tn) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public."Timesheets" DROP CONSTRAINT timesheets_users_fk_3;
       public          postgres    false    220    4750    241            �           2606    19680     Timesheets timesheets_users_fk_4    FK CONSTRAINT     �   ALTER TABLE ONLY public."Timesheets"
    ADD CONSTRAINT timesheets_users_fk_4 FOREIGN KEY (weigher_tn) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public."Timesheets" DROP CONSTRAINT timesheets_users_fk_4;
       public          postgres    false    220    4750    241            �           2606    19685     Timesheets timesheets_users_fk_5    FK CONSTRAINT     �   ALTER TABLE ONLY public."Timesheets"
    ADD CONSTRAINT timesheets_users_fk_5 FOREIGN KEY (charger_tn) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public."Timesheets" DROP CONSTRAINT timesheets_users_fk_5;
       public          postgres    false    220    241    4750            �           2606    19690     Timesheets timesheets_users_fk_6    FK CONSTRAINT     �   ALTER TABLE ONLY public."Timesheets"
    ADD CONSTRAINT timesheets_users_fk_6 FOREIGN KEY (charger_tn) REFERENCES public."Users"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public."Timesheets" DROP CONSTRAINT timesheets_users_fk_6;
       public          postgres    false    220    241    4750            P   %   x� ��1	ШТАМПОВКА
\.


�V�      B   y   x�E��1��s�˰�G&�^h
�+%�KJb�Bp��lm⇙�wؖT�&��gE"�1�&zKE1G�͂ѩ�m=��*�U�Fb�4f@�� T�E�>k��v�9m���e����zzu�o >�)�      ?   W   x�3�4�3b#S��i�g�ya΅�Ɩz�z�.�Ɯf\��`hl�kl�e�i�g�F0�1�01ů��ؔ$]d����� 96      =   �   x�u�=
�@��7��R�'�l��2!�Đ��x�F��D/4��Ma)S�|�^3H�'>x�A����/^�bRT��r�F�?�0�<�"�]�k�鐀�76++*�Vm��P��';����Ug��;|�k�I�l������40>�      ;   9   x�. ��1	Лигатура
2	ВШМ
3	Губка
\.


p|n      J   !   x�3�4453230q��42�4�4����� :�      E      x�3估��d]#�=... &�!      H   &   x�3��
V��q�s���s�Qv����� y=0      M      x�3�0��|.#�/������� Nd�      7   �   x����m� �g3��c0K�٩�u���8QUjd�!�� F�ٝj���x�h�g|�^��'9[��<�%tBĂ�T����v,$��qӍ�N�ƻ��/��.��������h���ώ}���&c���p[jn5���������H�4F����l��#�^MZ����,���i�ny�~?�j]����`ٔ����r��v�A���ma�����`�q��g"�Ϥ=��K)?��q�      F   $   x�3�16�2��54�6�2��57�64����� >&&      @   Y   x����0C��0H��a�����R
� f�HX=�N^,�ƛ����|��$�����G��ɀ޴d���|֔��&�*2FS��V��� ���<=      4   :   x����0�ް�GK�Y���aY�L�qP��?Κ��
t��&6`����r�]	      9   6   x�M��  �jg�{Y����:h,9�aI�lL>챜�p�_	��=R�WJgI���
6      N   �   x�%̻�0@���s0#�-�Ua0(��B�D�(>���'_���y���<^UE����&�A��@#��% ���di��h�=�j���TZjo�0.5/�o�A�����-X���c��L?�a���+�G-/�z�jI�y�������'�9�S�S6B��`1�     