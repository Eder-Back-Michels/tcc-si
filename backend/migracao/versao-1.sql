-- Tabela de Usuario

CREATE TABLE IF NOT EXISTS public.usuario
(
    nomeusu character varying(255) COLLATE pg_catalog."default" NOT NULL,
    senhausu character varying(255) COLLATE pg_catalog."default" NOT NULL,
    emailusuario character varying(255),
    "criadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_usuario SERIAL PRIMARY KEY
)
TABLESPACE pg_default;

-- Tabela de Material

CREATE TABLE IF NOT EXISTS public.material
(
    codmat character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "criadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descmat character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id_material SERIAL PRIMARY KEY
)
TABLESPACE pg_default;

-- Tabela de Grupo

CREATE TABLE IF NOT EXISTS public.grupo
(
    codgrp character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "criadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descgrp character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id_grupo SERIAL PRIMARY KEY
)
TABLESPACE pg_default;

-- Tabela de Tipo

CREATE TABLE IF NOT EXISTS public.tipo
(
    codtp character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "criadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    desctp character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id_tipo SERIAL PRIMARY KEY
)
TABLESPACE pg_default;

-- Tabela de Fornecedor

CREATE TABLE IF NOT EXISTS public.fornec
(
    codfor character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "criadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descfor character varying(255) COLLATE pg_catalog."default" NOT NULL,
    id_fornec SERIAL PRIMARY KEY
)
TABLESPACE pg_default;


-- Tabela de Produto

CREATE TABLE IF NOT EXISTS public.produto
(
    codpro character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "criadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descpro character varying(255) COLLATE pg_catalog."default" NOT NULL,
    ativopro CHAR(1) NOT NULL CHECK (ativopro IN ('S', 'N')),
    precopro numeric(10,2) NOT NULL,
    caminhoimagempro character varying(255),
    obspro character varying(255) COLLATE pg_catalog."default",
    qtdpro INTEGER NOT NULL,
    id_usuariopro INTEGER REFERENCES usuario(id_usuario) NOT NULL,
    id_grupopro INTEGER REFERENCES grupo(id_grupo),
    id_materialpro INTEGER REFERENCES material(id_material) NOT NULL,
    id_tipopro INTEGER REFERENCES tipo(id_tipo) NOT NULL,
    id_fornecpro INTEGER REFERENCES fornec(id_fornec) NOT NULL,
    id_produto SERIAL PRIMARY KEY
)
TABLESPACE pg_default;

-- Tabela de Vendedora

CREATE TABLE IF NOT EXISTS public.vendedora 
(
    nomevendedora character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "criadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_vendedora SERIAL PRIMARY KEY
)
TABLESPACE pg_default;

-- Tabela de Venda

CREATE TABLE IF NOT EXISTS public.venda 
(
    codvend character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "criadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "feitaEM" timestamp with time zone NOT NULL,
    id_usuariovend INTEGER REFERENCES usuario(id_usuario) NOT NULL,
    id_vendedoravend INTEGER REFERENCES vendedora(id_vendedora) NOT NULL,
    id_produtovend INTEGER REFERENCES produto(id_produto) NOT NULL,
    id_venda SERIAL PRIMARY KEY
)
TABLESPACE pg_default;

-- Tabela de Compra

CREATE TABLE IF NOT EXISTS public.compra 
(
    codcomp character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "criadoEm" timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "feitaEM" timestamp with time zone NOT NULL,
    id_usuariocomp INTEGER REFERENCES usuario(id_usuario) NOT NULL,
    id_forneccomp INTEGER REFERENCES fornec(id_fornec) NOT NULL,
    id_produtovend INTEGER REFERENCES produto(id_produto) NOT NULL,
    id_compra SERIAL PRIMARY KEY
)
TABLESPACE pg_default;