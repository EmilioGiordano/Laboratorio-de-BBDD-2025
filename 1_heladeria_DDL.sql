-- Bariloche ya SQL DDL

CREATE TABLE public.empleados
(
    idempleado SERIAL,
    nombre VARCHAR NOT NULL,
    apellido VARCHAR NOT NULL,
    dni VARCHAR (8) NOT NULL,
    cuil VARCHAR(12) UNIQUE NOT NULL,
    fecha_alta DATE NOT NULL,
    fecha_baja DATE,
    telefono VARCHAR NOT NULL,
    direccion VARCHAR NOT NULL,
    jefe integer,
    CONSTRAINT idempleado PRIMARY KEY (idempleado),
    CONSTRAINT empleados_empleados_fk FOREIGN KEY (jefe)
        REFERENCES public.empleados (idempleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.administrativos
(
    idadmin INTEGER NOT NULL,
    titulo VARCHAR NOT NULL,
    turno VARCHAR NOT NULL,
    CONSTRAINT iddamin PRIMARY KEY (idadmin),
    CONSTRAINT empleados_administrativos_fk FOREIGN KEY (idadmin)
        REFERENCES public.empleados (idempleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.planta
(
    idplanta INTEGER NOT NULL,
    turno VARCHAR NOT NULL,
    CONSTRAINT idplanta PRIMARY KEY (idplanta),
    CONSTRAINT empleados_planta_fk FOREIGN KEY (idplanta)
        REFERENCES public.empleados (idempleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.repartidores
(
    idrepartidor INTEGER NOT NULL,
    turno VARCHAR NOT NULL,
    CONSTRAINT idrepartidor PRIMARY KEY (idrepartidor),
    CONSTRAINT empleados_repartidores_fk FOREIGN KEY (idrepartidor)
        REFERENCES public.empleados (idempleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.clientes
(
    idcliente SERIAL,
    num_cliente INTEGER UNIQUE NOT NULL,
    nombre_c VARCHAR NOT NULL,
    cuit VARCHAR UNIQUE NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    telefono VARCHAR NOT NULL,
    direccion VARCHAR NOT NULL,
    fecha_alta DATE NOT NULL,
    CONSTRAINT idcliente PRIMARY KEY (idcliente)
);

CREATE TABLE public.gustos (
    idgusto SERIAL,
    nombre_g VARCHAR UNIQUE NOT NULL ,
    descripcion VARCHAR,
    CONSTRAINT idgustos PRIMARY KEY (idgusto)
);

CREATE TABLE public.helados (
    idhelado SERIAL,
    codigo_h VARCHAR(255) UNIQUE NOT NULL,
    nombre_h VARCHAR(255) NOT NULL,
    peso_gramos CHAR(4) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    precio REAL NOT NULL CHECK (precio >=0),
    cant_ingredientes INTEGER DEFAULT 0 NOT NULL CHECK (cant_ingredientes >=0),
    CONSTRAINT idhelado PRIMARY KEY (idhelado)
);

CREATE UNIQUE INDEX ck_nombre_h_peso_gramos
 ON public.helados
 (nombre_h, peso_gramos);
 
 CREATE TABLE public.compone (
     idcompone SERIAL,
     helado INTEGER NOT NULL,
     gusto INTEGER NOT NULL,
     CONSTRAINT idgusto_idhelado PRIMARY KEY (idcompone)
);

CREATE UNIQUE INDEX ck_compone
 ON public.compone
 (helado, gusto);

ALTER TABLE public.compone ADD CONSTRAINT helados_compone_fk
FOREIGN KEY (helado)
REFERENCES public.helados (idhelado)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE public.compone ADD CONSTRAINT gustos_compone_fk
FOREIGN KEY (gusto)
REFERENCES public.gustos (idgusto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

CREATE TABLE public.pedidos (
    idpedido SERIAL PRIMARY KEY ,
    num_pedido INTEGER NOT NULL UNIQUE,
    fecha DATE NOT NULL,
    total REAL DEFAULT 0 NOT NULL CHECK (total >=0), 
    cliente INTEGER NOT NULL,
    administrativo INTEGER NOT NULL,
    repartidor INTEGER NOT NULL,
    CONSTRAINT cliente_pedidos FOREIGN KEY (cliente) REFERENCES public.clientes (idcliente)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT admin_pedidos FOREIGN KEY (administrativo) REFERENCES public.administrativos (idadmin)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT repartidor_pedidos FOREIGN KEY (repartidor) REFERENCES public.repartidores (idrepartidor)
    ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE public.contiene (
     idcontiene SERIAL,
     helado INTEGER NOT NULL,
     pedido INTEGER NOT NULL,
     cantidad INTEGER DEFAULT 0 NOT NULL CHECK (cantidad >=0),
     precio REAL DEFAULT 0 NOT NULL CHECK (precio >=0),
      CONSTRAINT idcontiene PRIMARY KEY (idcontiene),
      CONSTRAINT helados_contiene_fk FOREIGN KEY (helado) REFERENCES public.helados (idhelado)
                ON DELETE NO ACTION ON UPDATE NO ACTION,
      CONSTRAINT pedidos_contiene_fk FOREIGN KEY (pedido) REFERENCES public.pedidos (idpedido)
                ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE UNIQUE INDEX ck_contiene
 ON public.contiene
 (helado, pedido);
 
 CREATE TABLE public.prepara(
     idprepara SERIAL,
     planta INTEGER NOT NULL,
     gusto INTEGER NOT NULL,
     CONSTRAINT idprepara PRIMARY KEY (idprepara),
     CONSTRAINT prepara_planta_fk FOREIGN KEY (planta) REFERENCES public.planta (idplanta)
                ON DELETE NO ACTION ON UPDATE NO ACTION,
     CONSTRAINT prepara_gustos_fk FOREIGN KEY (gusto) REFERENCES public.gustos (idgusto)
                ON DELETE NO ACTION ON UPDATE NO ACTION
 );
 
 CREATE UNIQUE INDEX ck_prepara
 ON public.prepara
 (planta, gusto);
 

