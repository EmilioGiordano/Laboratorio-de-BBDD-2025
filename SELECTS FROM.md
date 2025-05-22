# SELECT * FROM de todas las tablas
```sql
-- Seleccionar todos los empleados
SELECT * FROM public.empleados;

-- Seleccionar todos los empleados de planta
SELECT * FROM public.planta;

-- Seleccionar todos los repartidores
SELECT * FROM public.repartidores;

-- Seleccionar todos los administrativos
SELECT * FROM public.administrativos;

-- Seleccionar todos los clientes
SELECT * FROM public.clientes;

-- Seleccionar todos los pedidos
SELECT * FROM public.pedidos;

-- Seleccionar todos los helados
SELECT * FROM public.helados;

-- Seleccionar todos los gustos
SELECT * FROM public.gustos;

-- Seleccionar todas las relaciones contiene (helados en pedidos)
SELECT * FROM public.contiene;

-- Seleccionar todas las relaciones prepara (gustos en planta)
SELECT * FROM public.prepara;

-- Seleccionar todas las relaciones compone (gustos en helados)
SELECT * FROM public.compone;
```