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
INSERT INTO tableName (codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes) VALUES

INSERT INTO helados (codigo_h, nombre_h, peso_gramos, fecha_vencimiento, precio, cant_ingredientes) VALUES
('H00001','UN GUSTO CHOCOLATE','125','01/12/2023','25','1'),
('H00002','UN GUSTO FRUTILLA','125','01/12/2023','25','1'),
('H00003','UN GUSTO VAINILLA','125','22/11/2023','25','1'),
('H00004','UN GUSTO GRANIZADO','125','01/12/2023','25','1'),
('H00005','UN GUSTO AMERICANA','125','01/12/2023','25','1'),
('H00006','UN GUSTO DULCE DE LECHE','125','27/10/2023','25','1'),
('H00007','UN GUSTO CHOCOLATE','250','01/12/2023','50','1'),
('H00008','UN GUSTO FRUTILLA','250','01/12/2023','50','1'),
('H00009','UN GUSTO VAINILLA','250','22/11/2023','50','1'),
('H00010','UN GUSTO GRANIZADO','250','01/12/2023','50','1'),
('H00011','UN GUSTO AMERICANA','250','01/12/2023','50','1'),
('H00012','UN GUSTO DULCE DE LECHE','250','27/10/2023','50','1'),
('H00013','UN GUSTO CHOCOLATE','500','01/01/2024','100','1'),
('H00014','UN GUSTO FRUTILLA','500','01/12/2023','100','1'),
('H00015','UN GUSTO VAINILLA','500','22/11/2023','100','1'),
('H00016','UN GUSTO GRANIZADO','500','01/01/2024','100','1'),
('H00017','UN GUSTO AMERICANA','500','01/12/2023','100','1'),
('H00018','UN GUSTO DULCE DE LECHE','500','01/12/2023','100','1'),
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