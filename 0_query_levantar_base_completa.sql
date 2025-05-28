
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

--MODIFICACION
ALTER TABLE public.gustos ALTER COLUMN descripcion DROP NOT NULL;

-- Sentencias de INSERTS

-- 2_inserts.sql

-- Sentencias de INSERTS

-- Tabla gustos
INSERT INTO gustos(nombre_g,descripcion)
VALUES ('CHOCOLATE','Helado con sabor a chocolate');

INSERT INTO gustos(nombre_g,descripcion)
VALUES ('FRUTILLA','Helado con sabor a frutilla');

INSERT INTO gustos(nombre_g)
VALUES ('VAINILLA');

INSERT INTO gustos(nombre_g,descripcion)
VALUES ('GRANIZADO','Helado con sabor a granizado');

-- Tabla helados

-- UN GUSTO 125

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00001', 'UN GUSTO CHOCOLATE', '125', '2023-12-01', 25.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00002', 'UN GUSTO FRUTILLA', '125', '2023-12-01', 25.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00003', 'UN GUSTO VAINILLA', '125', '2023-11-22', 25.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00004', 'UN GUSTO GRANIZADO', '125', '2023-12-01', 25.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00005', 'UN GUSTO AMERICANA', '125', '2023-12-01', 25.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00006', 'UN GUSTO DULCE DE LECHE', '125', '2023-10-27', 25.00, 1);

-- UN GUSTO 250

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00007', 'UN GUSTO CHOCOLATE', '250', '2023-12-01', 50.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00008', 'UN GUSTO FRUTILLA', '250', '2023-12-01', 50.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00009', 'UN GUSTO VAINILLA', '250', '2023-11-22', 50.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00010', 'UN GUSTO GRANIZADO', '250', '2023-12-01', 50.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00011', 'UN GUSTO AMERICANA', '250', '2023-12-01', 50.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00012', 'UN GUSTO DULCE DE LECHE', '250', '2023-10-27', 50.00, 1);

-- UN GUSTO 500

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00013', 'UN GUSTO CHOCOLATE', '500', '2024-01-01', 100.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00014', 'UN GUSTO FRUTILLA', '500', '2023-12-01', 100.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00015', 'UN GUSTO VAINILLA', '500', '2023-11-22', 100.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00016', 'UN GUSTO GRANIZADO', '500', '2024-01-01', 100.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00017', 'UN GUSTO AMERICANA', '500', '2023-12-01', 100.00, 1);

INSERT INTO helados(codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes)
VALUES ('H00018', 'UN GUSTO DULCE DE LECHE', '500', '2023-12-01', 100.00, 1);


-- 3_poblar_base.sql

-- Tabla gustos
INSERT INTO gustos(nombre_g,descripcion) VALUES
(' AMERICANA','Helado con sabor a americana'), 
(' DULCE DE LECHE',null),
(' NARANJA',null);

-- Tabla helados
INSERT INTO helados (codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes) VALUES
('H00019','UN GUSTO CHOCOLATE','1000','01/12/2023','150','1'),
('H00020','UN GUSTO FRUTILLA','1000','01/01/2024','150','1'),
('H00021','UN GUSTO VAINILLA','1000','01/12/2023','150','1'),
('H00022','UN GUSTO GRANIZADO','1000','27/10/2023','150','1'),
('H00023','UN GUSTO AMERICANA','1000','01/12/2023','150','1'),
('H00024','UN GUSTO DULCE DE LECHE','1000','01/12/2023','150','1'),
('H00025','DOS GUSTOS CHOCO-FRUTI','250','27/10/2023','60','2'),
('H00026','DOS GUSTOS DULCE-AMERICANA','250','01/12/2023','60','2'),
('H00027','DOS GUSTOS CHOCO-GRANI','500','01/12/2023','120','2'),
('H00028','DOS GUSTOS DULCE-FRUTI','500','01/12/2023','120','2'),
('H00029','DOS GUSTOS CHOCO-GRANI','1000','01/01/2024','240','2'),
('H00030','DOS GUSTOS DULCE-FRUTI','1000','01/12/2023','240','2'),
('H00031','CUATRO GUSTOS DULCE-FRUTI-CHOCO-VAINILLA','1000','01/12/2023','240','4'),
('H00032','CUATRO GUSTOS DULCE-FRUTI-CHOCO-GRANI','1000','01/12/2023','240','4');

-- Tabla compone
INSERT INTO compone(helado, gusto) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,1),
(8,2),
(9,3),
(10,4),
(11,5),
(12,6),
(13,1),
(14,2),
(15,3),
(16,4),
(17,5),
(18,6),
(19,1),
(20,2),
(21,3),
(22,4),
(23,5),
(24,6),
(25,1),
(25,2),
(26,5),
(26,6),
(27,1),
(27,4),
(28,6),
(28,2),
(29,1),
(29,4),
(30,6),
(30,2),
(31,1),
(31,2),
(31,3),
(31,6),
(32,6),
(32,2),
(32,1),
(32,4);

-- Tabla clientes
INSERT INTO clientes (num_cliente, nombre_c, cuit, email, telefono, direccion, fecha_alta) VALUES
(1,'Rodríguez Ezequiel','20-32147852-3','rodriguez.ezequiel@gmail.com','236-4963214','Francia 25','22/12/2022'),
(2,'Gonzaáez Valeria','27-36521478-2','gonzalezvaleria@gmail.com','236-4631478','Alemania 132','15/6/2022'),
(3,'Peréz Ana Laura','27-14563214-9','analaura.perez@gmail.com','236-4876321','España 303','9/2/2023'),
(4,'García Javier','20-28796124-5','javier.garcia22@hotmail.com','236-4514785','Borges 165','15/3/2023'),
(5,'Benítez Sandra','27-25987145-9','sandrabenitez@gmail.com','236-4551478','Carlos Tejedor 27','21/5/2023');

-- Tabla empleados
INSERT INTO empleados (nombre, apellido, dni, cuil, fecha_alta, fecha_baja, telefono, direccion, jefe) VALUES
('Valeria', 'Pérez', 26314258, '27263142586', '2022-03-01', '2022-12-01', '236-4578965', 'Winter 314', NULL),
('Germán', 'Rodríguez', 22147852, '20221478525', '2022-02-12', NULL, '236-4698512', 'España 625', NULL),
('Lucas', 'Méndez', 32698741, '20326987412', '2022-02-27', NULL, '236-4635471', 'Alem 22', 2),
('Soledad', 'García', 29659874, '27296598746', '2022-06-14', NULL, '236-4528745', 'Francia 127', 2),
('Julián', 'Martínez', 26123987, '20261239877', '2022-09-22', NULL, '236-4528745', 'Francia 127', 2),
('Diego Martín', 'González', 30968741, '20309687418', '2022-03-23', NULL, '236-4478152', 'Chacabuco 47', 1),
('Manuel', 'Echeverría', 25985632, '20259856323', '2023-06-14', NULL, '236-4231147', 'Necochea 1025', 1),
('Ana Paula', 'Giménez', 24632147, '27246321473', '2023-02-14', NULL, '236-4548962', 'Aparicio 632', NULL),
('Gabriel', 'Hernández', 23569741, '20235697419', '2022-05-23', NULL, '236-4741563', 'Paso 1440', 8),
('Mariano', 'Petraglia', 36587412, '27365874123', '2022-02-14', NULL, '236-4628963', 'Pellegrini 252', 8),
('Carolina', 'Giménez', 40968741, '27409687413', '2023-02-14', NULL, '236-4589675', 'Arias 1547', 8);

-- Tabla administrativos
INSERT INTO administrativos (idadmin, titulo, turno) VALUES
(1,'Contadora Pública','MAÑANA'),
(8,'Contadora Pública','MAÑANA'),
(6,'Título Secundario','MAÑANA'),
(7,'Título Secundario','TARDE ');

-- Tabla repartidores
INSERT INTO repartidores(idrepartidor, turno) VALUES
(9,'MAÑANA'),
(10, 'TARDE'),
(11, 'TARDE');

-- Tabla planta
INSERT INTO planta (idplanta, turno) VALUES
(2,'MAÑANA'),
(3,'MAÑANA'),
(4,'TARDE'),
(5,'NOCHE');

-- Tabla pedidos
INSERT INTO pedidos (num_pedido, fecha, total, cliente, administrativo, repartidor) VALUES
(1, '2022-03-01', 100, 1, 6, 10),
(2, '2022-03-12', 240, 2, 7, 10),
(3, '2022-06-25', 125, 1, 7, 11),
(4, '2022-12-03', 110, 3, 6, 9),
(5, '2022-12-10', 2400, 2, 6, 9),
(6, '2023-01-18', 1500, 3, 7, 11),
(7, '2023-01-31', 4800, 4, 7, 10),
(8, '2023-02-25', 600, 5, 6, 9),
(9, '2023-02-27', 500, 4, 6, 10),
(10, '2023-03-01', 240, 3, 7, 9);

-- Tabla contiene
INSERT INTO contiene (helado, pedido, cantidad, precio) VALUES
(1, 1, 2, 25),
(2, 1, 2, 25),
(32, 2, 1, 240),
(1, 3, 1, 25),
(2, 3, 1, 25),
(3, 3, 1, 25),
(8, 3, 1, 50),
(8, 4, 1, 50),
(25, 4, 1, 60),
(32, 5, 10, 240),
(1, 6, 10, 25),
(2, 6, 10, 25),
(3, 6, 10, 25),
(4, 6, 10, 25),
(5, 6, 10, 25),
(6, 6, 10, 25),
(31, 7, 10, 240),
(32, 7, 10, 240),
(25, 8, 5, 60),
(26, 8, 5, 60),
(1, 9, 20, 25),
(27, 10, 1, 120),
(28, 10, 1, 120);

-- Tabla prepara
INSERT INTO prepara (planta, gusto) VALUES
(3, 1),
(3, 2),
(4, 3),
(4, 4),
(5, 5),
(5, 6);



