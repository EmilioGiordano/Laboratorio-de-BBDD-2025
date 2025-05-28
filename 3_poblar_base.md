# Ejercicio 3. Poblar la BD. DML/SQL.
1. Poblar la BD con el archivo inserts_heladeria.sql que se encuentra en el Aula Virtual.
2. Completar las sentencias SQL DML que faltan para poblar completamente la BD en base a las tablas que se encuentran a continuación.
3. Actualizar los campos calculados.

## 2. SQL DML

### Gustos
```sql
INSERT INTO gustos(nombre_g,descripcion) VALUES
(' AMERICANA','Helado con sabor a americana'), 
(' DULCE DE LECHE',null),
(' NARANJA',null);
```

### Helados

```sql
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
```

### Compone
```sql
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
(32,4),
```

### Cliente
```sql
INSERT INTO clientes (num_cliente, nombre_c, cuit, email, telefono, direccion, fecha_alta) VALUES
(1,'Rodríguez Ezequiel','20-32147852-3','rodriguez.ezequiel@gmail.com','236-4963214','Francia 25','22/12/2022'),
(2,'Gonzaáez Valeria','27-36521478-2','gonzalezvaleria@gmail.com','236-4631478','Alemania 132','15/6/2022'),
(3,'Peréz Ana Laura','27-14563214-9','analaura.perez@gmail.com','236-4876321','España 303','9/2/2023'),
(4,'García Javier','20-28796124-5','javier.garcia22@hotmail.com','236-4514785','Borges 165','15/3/2023'),
(5,'Benítez Sandra','27-25987145-9','sandrabenitez@gmail.com','236-4551478','Carlos Tejedor 27','21/5/2023');
```

### Empleados
```sql
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
```

### Administrativos
```sql
INSERT INTO administrativos (idadmin, titulo, turno) VALUES
(1,'Contadora Pública','MAÑANA'),
(8,'Contadora Pública','MAÑANA'),
(6,'Título Secundario','MAÑANA'),
(7,'Título Secundario','TARDE ');
```
