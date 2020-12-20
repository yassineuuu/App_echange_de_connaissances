PGDMP         +                x           brief3    13.1    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    brief3    DATABASE     j   CREATE DATABASE brief3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE brief3;
                postgres    false            �            1259    16401    user    TABLE     �   CREATE TABLE public."user" (
    username text NOT NULL,
    fullname text,
    password text,
    phone text,
    adresse text
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16425    admin    TABLE     Z   CREATE TABLE public.admin (
    email text,
    solde integer
)
INHERITS (public."user");
    DROP TABLE public.admin;
       public         heap    postgres    false    200            �            1259    16537 
   evaluation    TABLE     i   CREATE TABLE public.evaluation (
    question_id integer,
    reponse_id integer,
    note_id integer
);
    DROP TABLE public.evaluation;
       public         heap    postgres    false            �            1259    16413    intervenant    TABLE     i   CREATE TABLE public.intervenant (
    id integer NOT NULL,
    solde integer
)
INHERITS (public."user");
    DROP TABLE public.intervenant;
       public         heap    postgres    false    200            �            1259    16488    note    TABLE     N   CREATE TABLE public.note (
    note_id integer NOT NULL,
    value integer
);
    DROP TABLE public.note;
       public         heap    postgres    false            �            1259    16522    question    TABLE     �   CREATE TABLE public.question (
    question_id integer NOT NULL,
    prix double precision,
    introduction character varying,
    description character varying,
    formule character varying,
    tags character varying
);
    DROP TABLE public.question;
       public         heap    postgres    false            �            1259    16419 	   redacteur    TABLE     �   CREATE TABLE public.redacteur (
    redacteur_id integer NOT NULL,
    domaineconnaissance text,
    niveuconnaissance text,
    solde integer
)
INHERITS (public."user");
    DROP TABLE public.redacteur;
       public         heap    postgres    false    200            �            1259    16514    reponse    TABLE     �   CREATE TABLE public.reponse (
    reponse_id integer NOT NULL,
    question_id integer,
    redacteur_id integer,
    notation character varying
);
    DROP TABLE public.reponse;
       public         heap    postgres    false            �          0    16425    admin 
   TABLE DATA           [   COPY public.admin (username, fullname, password, phone, adresse, email, solde) FROM stdin;
    public          postgres    false    203   �       �          0    16537 
   evaluation 
   TABLE DATA           F   COPY public.evaluation (question_id, reponse_id, note_id) FROM stdin;
    public          postgres    false    207          �          0    16413    intervenant 
   TABLE DATA           ^   COPY public.intervenant (username, fullname, password, phone, adresse, id, solde) FROM stdin;
    public          postgres    false    201   -       �          0    16488    note 
   TABLE DATA           .   COPY public.note (note_id, value) FROM stdin;
    public          postgres    false    204   J       �          0    16522    question 
   TABLE DATA           _   COPY public.question (question_id, prix, introduction, description, formule, tags) FROM stdin;
    public          postgres    false    206   g       �          0    16419 	   redacteur 
   TABLE DATA           �   COPY public.redacteur (username, fullname, password, phone, adresse, redacteur_id, domaineconnaissance, niveuconnaissance, solde) FROM stdin;
    public          postgres    false    202   �       �          0    16514    reponse 
   TABLE DATA           R   COPY public.reponse (reponse_id, question_id, redacteur_id, notation) FROM stdin;
    public          postgres    false    205   �       �          0    16401    user 
   TABLE DATA           N   COPY public."user" (username, fullname, password, phone, adresse) FROM stdin;
    public          postgres    false    200   �       E           2606    16536    note note_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (note_id);
 8   ALTER TABLE ONLY public.note DROP CONSTRAINT note_pkey;
       public            postgres    false    204            I           2606    16529    question question_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (question_id);
 @   ALTER TABLE ONLY public.question DROP CONSTRAINT question_pkey;
       public            postgres    false    206            C           2606    16457    redacteur redacteur_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.redacteur
    ADD CONSTRAINT redacteur_pkey PRIMARY KEY (redacteur_id);
 B   ALTER TABLE ONLY public.redacteur DROP CONSTRAINT redacteur_pkey;
       public            postgres    false    202            G           2606    16521    reponse reponse_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reponse
    ADD CONSTRAINT reponse_pkey PRIMARY KEY (reponse_id);
 >   ALTER TABLE ONLY public.reponse DROP CONSTRAINT reponse_pkey;
       public            postgres    false    205            K           2606    16540    evaluation note_id    FK CONSTRAINT     u   ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT note_id FOREIGN KEY (note_id) REFERENCES public.note(note_id);
 <   ALTER TABLE ONLY public.evaluation DROP CONSTRAINT note_id;
       public          postgres    false    204    2885    207            J           2606    16530    reponse question_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reponse
    ADD CONSTRAINT question_id FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 =   ALTER TABLE ONLY public.reponse DROP CONSTRAINT question_id;
       public          postgres    false    2889    206    205            L           2606    16545    evaluation question_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT question_id FOREIGN KEY (question_id) REFERENCES public.question(question_id);
 @   ALTER TABLE ONLY public.evaluation DROP CONSTRAINT question_id;
       public          postgres    false    207    206    2889            M           2606    16550    evaluation reponse_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT reponse_id FOREIGN KEY (reponse_id) REFERENCES public.reponse(reponse_id);
 ?   ALTER TABLE ONLY public.evaluation DROP CONSTRAINT reponse_id;
       public          postgres    false    205    207    2887            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     