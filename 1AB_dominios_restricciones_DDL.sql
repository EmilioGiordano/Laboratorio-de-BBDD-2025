-- Corrijo dominio: Pasó de ('125','250', '500', '750', '1000') a ('125','250', '500', '1000')
-- La consigna de no incluye al 750 en el dominio
CREATE DOMAIN gramos AS CHAR(4)
CHECK(
   VALUE IN ('125','250', '500', '1000')
);

ALTER TABLE helados ALTER COLUMN peso_gramos TYPE gramos;


-- Corrijo dominio: Pasó de (1,2,3,4) a (0,1,2,3,4)
-- La consigna incluye al 0
CREATE DOMAIN ingredientes AS INTEGER
CHECK(
   VALUE IN (0,1,2,3,4)
);


ALTER TABLE helados ALTER COLUMN cant_ingredientes TYPE ingredientes;

CREATE DOMAIN turnos_planta AS CHAR(6)
CHECK(
   VALUE IN ('MAÑANA','TARDE', 'NOCHE')
);

ALTER TABLE planta ALTER COLUMN turno TYPE turnos_planta;

CREATE DOMAIN turnos_emp AS CHAR(6)
CHECK(
   VALUE IN ('MAÑANA','TARDE')
);

ALTER TABLE administrativos ALTER COLUMN turno TYPE turnos_emp;
ALTER TABLE repartidores ALTER COLUMN turno TYPE turnos_emp;