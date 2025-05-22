
CREATE SEQUENCE public.empleados_idempleado_seq1;

CREATE TABLE public.empleados (
                idempleado INTEGER NOT NULL DEFAULT nextval('public.empleados_idempleado_seq1'),
                nombre VARCHAR(255) NOT NULL,
                apellido VARCHAR(255) NOT NULL,
                dni VARCHAR(8) NOT NULL,
                cuil VARCHAR(12) NOT NULL,
                direccion VARCHAR(255) NOT NULL,
                telefono VARCHAR(255) NOT NULL,
                fecha_alta DATE NOT NULL,
                fecha_baja DATE,
                jefe INTEGER,
                CONSTRAINT idempleado PRIMARY KEY (idempleado)
);


ALTER SEQUENCE public.empleados_idempleado_seq1 OWNED BY public.empleados.idempleado;

CREATE UNIQUE INDEX ck_empleados_cuil
 ON public.empleados
 ( cuil );

CREATE TABLE public.planta (
                idplanta INTEGER NOT NULL,
                turno VARCHAR(6) NOT NULL,
                CONSTRAINT idplanta PRIMARY KEY (idplanta)
);


CREATE TABLE public.repartidores (
                idrepartidor INTEGER NOT NULL,
                turno VARCHAR NOT NULL,
                CONSTRAINT idrepartidor PRIMARY KEY (idrepartidor)
);


CREATE TABLE public.administrativos (
                idadmin INTEGER NOT NULL,
                titulo VARCHAR(255) NOT NULL,
                turno VARCHAR(6) NOT NULL,
                CONSTRAINT iddamin PRIMARY KEY (idadmin)
);


CREATE SEQUENCE public.clientes_idcliente_seq;

CREATE TABLE public.clientes (
                idcliente INTEGER NOT NULL DEFAULT nextval('public.clientes_idcliente_seq'),
                num_cliente INTEGER NOT NULL,
                nombre_c VARCHAR NOT NULL,
                cuit VARCHAR(13) NOT NULL,
                email VARCHAR(255) NOT NULL,
                telefon VARCHAR(255) NOT NULL,
                direccion VARCHAR(255) NOT NULL,
                fecha_alta DATE NOT NULL,
                CONSTRAINT idcliente PRIMARY KEY (idcliente)
);


ALTER SEQUENCE public.clientes_idcliente_seq OWNED BY public.clientes.idcliente;

CREATE UNIQUE INDEX ck_clientes_email
 ON public.clientes USING BTREE
 ( email );

CREATE UNIQUE INDEX clk_clientes_num_cliente
 ON public.clientes
 ( num_cliente );

CREATE UNIQUE INDEX ck_cuit_clientes
 ON public.clientes
 ( cuit );

CREATE SEQUENCE public.pedidos_idpedido_seq;

CREATE TABLE public.pedidos (
                idpedido INTEGER NOT NULL DEFAULT nextval('public.pedidos_idpedido_seq'),
                num_pedido INTEGER NOT NULL,
                fecha DATE NOT NULL,
                total NUMERIC(10,2) DEFAULT 0 NOT NULL,
                cliente INTEGER NOT NULL,
                administrativo INTEGER NOT NULL,
                repartidor INTEGER NOT NULL,
                CONSTRAINT pedidos_pkey PRIMARY KEY (idpedido)
);


ALTER SEQUENCE public.pedidos_idpedido_seq OWNED BY public.pedidos.idpedido;

CREATE UNIQUE INDEX pedidos_num_pedido_key
 ON public.pedidos
 ( num_pedido ASC );

CREATE SEQUENCE public.helados_idhelado_seq;

CREATE TABLE public.helados (
                idhelado INTEGER NOT NULL DEFAULT nextval('public.helados_idhelado_seq'),
                codigo_h VARCHAR(255) NOT NULL,
                nombre_h VARCHAR(255) NOT NULL,
                peso_gramos CHAR(4) NOT NULL,
                fecha_vencimiento DATE NOT NULL,
                precio NUMERIC(10,2) DEFAULT 0 NOT NULL,
                cant_ingredientes INTEGER DEFAULT 0 NOT NULL,
                CONSTRAINT idhelado PRIMARY KEY (idhelado)
);


ALTER SEQUENCE public.helados_idhelado_seq OWNED BY public.helados.idhelado;

CREATE UNIQUE INDEX ck_codigo
 ON public.helados
 ( codigo_h ASC );

CREATE UNIQUE INDEX ck_nombre_h_peso_gramos
 ON public.helados
 ( nombre_h ASC, peso_gramos ASC );

CREATE SEQUENCE public.contiene_idcontiene_seq;

CREATE TABLE public.contiene (
                idcontiene INTEGER NOT NULL DEFAULT nextval('public.contiene_idcontiene_seq'),
                helado INTEGER NOT NULL,
                pedido INTEGER NOT NULL,
                cantidad INTEGER DEFAULT 0 NOT NULL,
                precio NUMERIC(10,2) DEFAULT 0 NOT NULL,
                CONSTRAINT idcontiene PRIMARY KEY (idcontiene)
);


ALTER SEQUENCE public.contiene_idcontiene_seq OWNED BY public.contiene.idcontiene;

CREATE UNIQUE INDEX ck_contiene
 ON public.contiene
 ( helado, pedido );

CREATE SEQUENCE public.gustos_idgusto_seq;

CREATE TABLE public.gustos (
                idgusto INTEGER NOT NULL DEFAULT nextval('public.gustos_idgusto_seq'),
                nombre_g VARCHAR(255) NOT NULL,
                descripcion TEXT NOT NULL,
                CONSTRAINT idgustos PRIMARY KEY (idgusto)
);


ALTER SEQUENCE public.gustos_idgusto_seq OWNED BY public.gustos.idgusto;

CREATE UNIQUE INDEX gustos_nombre_g_key
 ON public.gustos
 ( nombre_g ASC );

CREATE SEQUENCE public.prepara_idprepara_seq;

CREATE TABLE public.prepara (
                idprepara INTEGER NOT NULL DEFAULT nextval('public.prepara_idprepara_seq'),
                gusto INTEGER NOT NULL,
                planta INTEGER NOT NULL,
                CONSTRAINT idprepara PRIMARY KEY (idprepara)
);


ALTER SEQUENCE public.prepara_idprepara_seq OWNED BY public.prepara.idprepara;

CREATE UNIQUE INDEX ck_prepara
 ON public.prepara
 ( gusto, planta );

CREATE SEQUENCE public.compone_idcompone_seq;

CREATE TABLE public.compone (
                idcompone INTEGER NOT NULL DEFAULT nextval('public.compone_idcompone_seq'),
                helado INTEGER NOT NULL,
                gusto INTEGER NOT NULL,
                CONSTRAINT idgusto_idhelado PRIMARY KEY (idcompone)
);


ALTER SEQUENCE public.compone_idcompone_seq OWNED BY public.compone.idcompone;

CREATE UNIQUE INDEX ck_compone
 ON public.compone USING BTREE
 ( helado, gusto );

ALTER TABLE public.administrativos ADD CONSTRAINT empleados_administrativos_fk
FOREIGN KEY (idadmin)
REFERENCES public.empleados (idempleado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.empleados ADD CONSTRAINT empleados_empleados_fk
FOREIGN KEY (jefe)
REFERENCES public.empleados (idempleado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.repartidores ADD CONSTRAINT empleados_repartidores_fk
FOREIGN KEY (idrepartidor)
REFERENCES public.empleados (idempleado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.planta ADD CONSTRAINT empleados_planta_fk
FOREIGN KEY (idplanta)
REFERENCES public.empleados (idempleado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.prepara ADD CONSTRAINT planta_prepara_fk
FOREIGN KEY (planta)
REFERENCES public.planta (idplanta)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos ADD CONSTRAINT repartidores_pedidos_fk
FOREIGN KEY (repartidor)
REFERENCES public.repartidores (idrepartidor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos ADD CONSTRAINT administrativos_pedidos_fk
FOREIGN KEY (administrativo)
REFERENCES public.administrativos (idadmin)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente)
REFERENCES public.clientes (idcliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.contiene ADD CONSTRAINT pedidos_contiene_fk
FOREIGN KEY (pedido)
REFERENCES public.pedidos (idpedido)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.compone ADD CONSTRAINT helados_compone_fk
FOREIGN KEY (helado)
REFERENCES public.helados (idhelado)
ON DELETE CASCADE
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.contiene ADD CONSTRAINT helados_contiene_fk
FOREIGN KEY (helado)
REFERENCES public.helados (idhelado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.compone ADD CONSTRAINT gustos_compone_fk
FOREIGN KEY (gusto)
REFERENCES public.gustos (idgusto)
ON DELETE CASCADE
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.prepara ADD CONSTRAINT gustos_prepara_fk
FOREIGN KEY (gusto)
REFERENCES public.gustos (idgusto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


MODIFICACION
ALTER TABLE public.gustos ALTER COLUMN descripcion DROP NOT NULL;