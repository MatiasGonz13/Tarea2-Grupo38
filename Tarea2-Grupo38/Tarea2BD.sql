PGDMP                         {         	   MarioBros    15.2    15.2 B    P           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            R           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            S           1262    16475 	   MarioBros    DATABASE     ~   CREATE DATABASE "MarioBros" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "MarioBros";
                postgres    false                        2615    18571    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            T           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5            U           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    5            �            1259    18608    Defensas    TABLE     h   CREATE TABLE public."Defensas" (
    id integer NOT NULL,
    defensa character varying(45) NOT NULL
);
    DROP TABLE public."Defensas";
       public         heap    postgres    false    5            �            1259    18681    Defensas_en_reinos    TABLE     �   CREATE TABLE public."Defensas_en_reinos" (
    id_reino integer NOT NULL,
    id_defensa integer NOT NULL,
    meses_de_uso integer NOT NULL
);
 (   DROP TABLE public."Defensas_en_reinos";
       public         heap    postgres    false    5            �            1259    18607    Defensas_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Defensas_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Defensas_id_seq";
       public          postgres    false    5    223            V           0    0    Defensas_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Defensas_id_seq" OWNED BY public."Defensas".id;
          public          postgres    false    222            �            1259    18626    Diplomacias    TABLE     �   CREATE TABLE public."Diplomacias" (
    id_reino_1 integer NOT NULL,
    id_reino_2 integer NOT NULL,
    es_aliado boolean NOT NULL
);
 !   DROP TABLE public."Diplomacias";
       public         heap    postgres    false    5            �            1259    18589    Karts    TABLE     �   CREATE TABLE public."Karts" (
    id integer NOT NULL,
    modelo character varying(45) NOT NULL,
    color character varying(45) NOT NULL,
    velocidad_maxima integer,
    id_personaje integer NOT NULL
);
    DROP TABLE public."Karts";
       public         heap    postgres    false    5            �            1259    18588    Karts_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Karts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Karts_id_seq";
       public          postgres    false    5    218            W           0    0    Karts_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Karts_id_seq" OWNED BY public."Karts".id;
          public          postgres    false    217            �            1259    18631    Personaje_habita_reino    TABLE     �   CREATE TABLE public."Personaje_habita_reino" (
    id_personaje integer NOT NULL,
    id_reino integer NOT NULL,
    fecha_registro timestamp without time zone NOT NULL,
    es_gobernante boolean NOT NULL
);
 ,   DROP TABLE public."Personaje_habita_reino";
       public         heap    postgres    false    5            �            1259    18602    Personaje_tiene_trabajo    TABLE     �   CREATE TABLE public."Personaje_tiene_trabajo" (
    id_trabajo integer NOT NULL,
    id_personaje integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_termino date
);
 -   DROP TABLE public."Personaje_tiene_trabajo";
       public         heap    postgres    false    5            �            1259    18582 
   Personajes    TABLE     �   CREATE TABLE public."Personajes" (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    fuerza integer NOT NULL,
    fecha_nacimiento date NOT NULL,
    objeto character varying(30)
);
     DROP TABLE public."Personajes";
       public         heap    postgres    false    5            �            1259    18581    Personajes_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Personajes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Personajes_id_seq";
       public          postgres    false    216    5            X           0    0    Personajes_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Personajes_id_seq" OWNED BY public."Personajes".id;
          public          postgres    false    215            �            1259    18615    Reinos    TABLE     �   CREATE TABLE public."Reinos" (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    ubicacion character varying(45) NOT NULL,
    superficie integer NOT NULL
);
    DROP TABLE public."Reinos";
       public         heap    postgres    false    5            �            1259    18614    Reinos_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reinos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public."Reinos_id_seq";
       public          postgres    false    225    5            Y           0    0    Reinos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public."Reinos_id_seq" OWNED BY public."Reinos".id;
          public          postgres    false    224            �            1259    18596    Trabajos    TABLE     �   CREATE TABLE public."Trabajos" (
    id integer NOT NULL,
    descripcion character varying(45),
    sueldo integer NOT NULL
);
    DROP TABLE public."Trabajos";
       public         heap    postgres    false    5            �            1259    18595    Trabajos_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Trabajos_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Trabajos_id_seq";
       public          postgres    false    5    220            Z           0    0    Trabajos_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Trabajos_id_seq" OWNED BY public."Trabajos".id;
          public          postgres    false    219            �            1259    18572    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false    5            �           2604    18611    Defensas id    DEFAULT     n   ALTER TABLE ONLY public."Defensas" ALTER COLUMN id SET DEFAULT nextval('public."Defensas_id_seq"'::regclass);
 <   ALTER TABLE public."Defensas" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    18592    Karts id    DEFAULT     h   ALTER TABLE ONLY public."Karts" ALTER COLUMN id SET DEFAULT nextval('public."Karts_id_seq"'::regclass);
 9   ALTER TABLE public."Karts" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    18585    Personajes id    DEFAULT     r   ALTER TABLE ONLY public."Personajes" ALTER COLUMN id SET DEFAULT nextval('public."Personajes_id_seq"'::regclass);
 >   ALTER TABLE public."Personajes" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    18618 	   Reinos id    DEFAULT     j   ALTER TABLE ONLY public."Reinos" ALTER COLUMN id SET DEFAULT nextval('public."Reinos_id_seq"'::regclass);
 :   ALTER TABLE public."Reinos" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    18599    Trabajos id    DEFAULT     n   ALTER TABLE ONLY public."Trabajos" ALTER COLUMN id SET DEFAULT nextval('public."Trabajos_id_seq"'::regclass);
 <   ALTER TABLE public."Trabajos" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            H          0    18608    Defensas 
   TABLE DATA           1   COPY public."Defensas" (id, defensa) FROM stdin;
    public          postgres    false    223   EQ       M          0    18681    Defensas_en_reinos 
   TABLE DATA           R   COPY public."Defensas_en_reinos" (id_reino, id_defensa, meses_de_uso) FROM stdin;
    public          postgres    false    228   �Q       K          0    18626    Diplomacias 
   TABLE DATA           J   COPY public."Diplomacias" (id_reino_1, id_reino_2, es_aliado) FROM stdin;
    public          postgres    false    226   MR       C          0    18589    Karts 
   TABLE DATA           T   COPY public."Karts" (id, modelo, color, velocidad_maxima, id_personaje) FROM stdin;
    public          postgres    false    218   �R       L          0    18631    Personaje_habita_reino 
   TABLE DATA           i   COPY public."Personaje_habita_reino" (id_personaje, id_reino, fecha_registro, es_gobernante) FROM stdin;
    public          postgres    false    227   yS       F          0    18602    Personaje_tiene_trabajo 
   TABLE DATA           j   COPY public."Personaje_tiene_trabajo" (id_trabajo, id_personaje, fecha_inicio, fecha_termino) FROM stdin;
    public          postgres    false    221   T       A          0    18582 
   Personajes 
   TABLE DATA           T   COPY public."Personajes" (id, nombre, fuerza, fecha_nacimiento, objeto) FROM stdin;
    public          postgres    false    216   �T       J          0    18615    Reinos 
   TABLE DATA           E   COPY public."Reinos" (id, nombre, ubicacion, superficie) FROM stdin;
    public          postgres    false    225   �U       E          0    18596    Trabajos 
   TABLE DATA           =   COPY public."Trabajos" (id, descripcion, sueldo) FROM stdin;
    public          postgres    false    220   *V       ?          0    18572    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   �V       [           0    0    Defensas_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Defensas_id_seq"', 1, false);
          public          postgres    false    222            \           0    0    Karts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Karts_id_seq"', 1, false);
          public          postgres    false    217            ]           0    0    Personajes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Personajes_id_seq"', 2, true);
          public          postgres    false    215            ^           0    0    Reinos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Reinos_id_seq"', 1, false);
          public          postgres    false    224            _           0    0    Trabajos_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Trabajos_id_seq"', 1, false);
          public          postgres    false    219            �           2606    18685 *   Defensas_en_reinos Defensas_en_reinos_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public."Defensas_en_reinos"
    ADD CONSTRAINT "Defensas_en_reinos_pkey" PRIMARY KEY (id_reino, id_defensa);
 X   ALTER TABLE ONLY public."Defensas_en_reinos" DROP CONSTRAINT "Defensas_en_reinos_pkey";
       public            postgres    false    228    228            �           2606    18613    Defensas Defensas_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Defensas"
    ADD CONSTRAINT "Defensas_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Defensas" DROP CONSTRAINT "Defensas_pkey";
       public            postgres    false    223            �           2606    18630    Diplomacias Diplomacias_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."Diplomacias"
    ADD CONSTRAINT "Diplomacias_pkey" PRIMARY KEY (id_reino_1, id_reino_2);
 J   ALTER TABLE ONLY public."Diplomacias" DROP CONSTRAINT "Diplomacias_pkey";
       public            postgres    false    226    226            �           2606    18594    Karts Karts_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Karts"
    ADD CONSTRAINT "Karts_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Karts" DROP CONSTRAINT "Karts_pkey";
       public            postgres    false    218            �           2606    18635 2   Personaje_habita_reino Personaje_habita_reino_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_habita_reino"
    ADD CONSTRAINT "Personaje_habita_reino_pkey" PRIMARY KEY (id_personaje, id_reino);
 `   ALTER TABLE ONLY public."Personaje_habita_reino" DROP CONSTRAINT "Personaje_habita_reino_pkey";
       public            postgres    false    227    227            �           2606    18606 4   Personaje_tiene_trabajo Personaje_tiene_trabajo_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_tiene_trabajo"
    ADD CONSTRAINT "Personaje_tiene_trabajo_pkey" PRIMARY KEY (id_trabajo, id_personaje);
 b   ALTER TABLE ONLY public."Personaje_tiene_trabajo" DROP CONSTRAINT "Personaje_tiene_trabajo_pkey";
       public            postgres    false    221    221            �           2606    18587    Personajes Personajes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Personajes"
    ADD CONSTRAINT "Personajes_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Personajes" DROP CONSTRAINT "Personajes_pkey";
       public            postgres    false    216            �           2606    18620    Reinos Reinos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Reinos"
    ADD CONSTRAINT "Reinos_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Reinos" DROP CONSTRAINT "Reinos_pkey";
       public            postgres    false    225            �           2606    18601    Trabajos Trabajos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Trabajos"
    ADD CONSTRAINT "Trabajos_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Trabajos" DROP CONSTRAINT "Trabajos_pkey";
       public            postgres    false    220            �           2606    18580 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    214            �           2606    18691 5   Defensas_en_reinos Defensas_en_reinos_id_defensa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Defensas_en_reinos"
    ADD CONSTRAINT "Defensas_en_reinos_id_defensa_fkey" FOREIGN KEY (id_defensa) REFERENCES public."Defensas"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 c   ALTER TABLE ONLY public."Defensas_en_reinos" DROP CONSTRAINT "Defensas_en_reinos_id_defensa_fkey";
       public          postgres    false    223    3231    228            �           2606    18686 3   Defensas_en_reinos Defensas_en_reinos_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Defensas_en_reinos"
    ADD CONSTRAINT "Defensas_en_reinos_id_reino_fkey" FOREIGN KEY (id_reino) REFERENCES public."Reinos"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 a   ALTER TABLE ONLY public."Defensas_en_reinos" DROP CONSTRAINT "Defensas_en_reinos_id_reino_fkey";
       public          postgres    false    225    3233    228            �           2606    18661 '   Diplomacias Diplomacias_id_reino_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Diplomacias"
    ADD CONSTRAINT "Diplomacias_id_reino_1_fkey" FOREIGN KEY (id_reino_1) REFERENCES public."Reinos"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public."Diplomacias" DROP CONSTRAINT "Diplomacias_id_reino_1_fkey";
       public          postgres    false    226    225    3233            �           2606    18666 '   Diplomacias Diplomacias_id_reino_2_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Diplomacias"
    ADD CONSTRAINT "Diplomacias_id_reino_2_fkey" FOREIGN KEY (id_reino_2) REFERENCES public."Reinos"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public."Diplomacias" DROP CONSTRAINT "Diplomacias_id_reino_2_fkey";
       public          postgres    false    225    226    3233            �           2606    18636    Karts Karts_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Karts"
    ADD CONSTRAINT "Karts_id_personaje_fkey" FOREIGN KEY (id_personaje) REFERENCES public."Personajes"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public."Karts" DROP CONSTRAINT "Karts_id_personaje_fkey";
       public          postgres    false    218    216    3223            �           2606    18671 ?   Personaje_habita_reino Personaje_habita_reino_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_habita_reino"
    ADD CONSTRAINT "Personaje_habita_reino_id_personaje_fkey" FOREIGN KEY (id_personaje) REFERENCES public."Personajes"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 m   ALTER TABLE ONLY public."Personaje_habita_reino" DROP CONSTRAINT "Personaje_habita_reino_id_personaje_fkey";
       public          postgres    false    3223    216    227            �           2606    18676 ;   Personaje_habita_reino Personaje_habita_reino_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_habita_reino"
    ADD CONSTRAINT "Personaje_habita_reino_id_reino_fkey" FOREIGN KEY (id_reino) REFERENCES public."Reinos"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 i   ALTER TABLE ONLY public."Personaje_habita_reino" DROP CONSTRAINT "Personaje_habita_reino_id_reino_fkey";
       public          postgres    false    3233    225    227            �           2606    18646 A   Personaje_tiene_trabajo Personaje_tiene_trabajo_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_tiene_trabajo"
    ADD CONSTRAINT "Personaje_tiene_trabajo_id_personaje_fkey" FOREIGN KEY (id_personaje) REFERENCES public."Personajes"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 o   ALTER TABLE ONLY public."Personaje_tiene_trabajo" DROP CONSTRAINT "Personaje_tiene_trabajo_id_personaje_fkey";
       public          postgres    false    3223    221    216            �           2606    18641 ?   Personaje_tiene_trabajo Personaje_tiene_trabajo_id_trabajo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Personaje_tiene_trabajo"
    ADD CONSTRAINT "Personaje_tiene_trabajo_id_trabajo_fkey" FOREIGN KEY (id_trabajo) REFERENCES public."Trabajos"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 m   ALTER TABLE ONLY public."Personaje_tiene_trabajo" DROP CONSTRAINT "Personaje_tiene_trabajo_id_trabajo_fkey";
       public          postgres    false    220    3227    221            H   �   x�%�;�@��:{
N��X|�:j��Q��h���d��[q.f����K�
|2:���WS�����y'l��S�v�EV[���&���iz����B��2+��X�M�)�*M�*��=\$�t���8�*)N�*�T�K(���MLT+uӕ��5������9��BA�      M   E   x����0��=L�`h�.������p��2�FY%�REBlJMʡ�3N����*�Cu\��?���      K   '   x�36�46�,���Pڄ3�ȁӆ q���� �T�      C   �   x�-��j�0E端�����1&�KJ2uQla�Q��,S���]�r�p.����<��2���C+�F��y�k��w���a�}�
A%��F�Kbw�86�;�Z�T�b}\zȋ�g�).f�Ѕ�T��G���G�Rՠ�C���,3��-�F�5�̒��pC�M�Qo=y>�eٯ<�;��R��α��e��#��h�Im�����\�d}ʡ����!��R      L   �   x�E��1c�
6@c��{�8v��Y`���&g2p(��
��K�<���J(��}rKn�j*\m
j ;h	���Г�F�_h��ΰ��J�rg�®6-V��(jMh�
Ǹ�m��y:�b�Q0c�~��b1      F   �   x�EO��0��]�!���� �����O:�.:a�o7?��OG�>��)Gq�/�*��0��<, �OAyܕ��.�Cviަ9;tfh�t?h9���m�1:�:S�a> *�����^2w]>��?��"��X5�Ѫ��Q��>2�      A   �   x�U��N�@����r��\��� `�T�ec����ԐT� ��1AX<����ا[��aõ���}����s߰�cئ�+c-��t���!��b��hC>-T��Iw=o�����ڥJ���i��\��ӴP��-]#���j���p���%LW��wk6V��}���A;�eU�»�Vi��N���6�_��jd��c���B�n�kZt@�^���0Ƒ�s:ͫ���tq#�=�4�R�      J   f   x�36����/H��L�K��4206�26��/��������42���p���+���e;g�T�9��Eٜ��\Ɔ������7��q:'&5�p��qqq ��      E   �   x�U����@E�NSJ 	pD�	.��A�0f=eQ�1\8���/��Ö#��؉��b�^�.˲��	8pL�z<�
��a����)���#,'��=)�D�#wUy�O�^la����-���;����[�av+c�\S����$�v;�g�u��@L:z�խ�l)��Ô�}Q�tG��ǇYQo.�T8      ?   �  x���[J0F�W�D方���@�I&A_��c-��Z��L���	)j}$5Q�6ʨ��R�)����;��ʵ��nC!s�$��=��F��kp��L�q���!� �0\�����[8�
��=<>�\n����4�5^��Х��mA�ڻ i�3G��օj���J���:Ym�y��vQ�؉3�H���о�I�ӆB�g�Co(��Go&�F�d�ꖭ�����~7:惂�B��Vb�1�Gф�},f�S��y���MR�Xn�O���(?q�P{p��X�鱾��?�\�8�IMfFs�ղ� Oò<�{�	C��.��kǮ�.�VSɉ&�WjtH�­}b̏)»�;~�#������K�����]S����R=ZJ����3�.�F��Z��,;���]��kN,���I�9c��i���v��*���n?�|~������X��������u�     