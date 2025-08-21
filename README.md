# PostgreSQL Servidores

Este repositorio contiene la estructura y datos de ejemplo para una base de datos de gestión de servidores, diseñada en PostgreSQL. Incluye el archivo de creación y carga de datos (`database.sql`) y el diagrama entidad-relación (`servidores.pgerd`).

## Estructura del repositorio

- `SQL/database.sql`: Script completo para crear la base de datos, tablas, relaciones y cargar datos de ejemplo.
- `diagrama entidad-relacion/servidores.pgerd`: Diagrama entidad-relación del modelo de datos, útil para visualizar las relaciones entre las tablas.

## Tablas principales

- **almacenamiento**: Información de discos y unidades de almacenamiento.
- **contratista**: Proveedores y servicios externos.
- **gpu**: Información de tarjetas gráficas.
- **lugar**: Ubicación física de los equipos.
- **modelo**: Modelos y especificaciones de los equipos.
- **rack**: Ubicación en racks.
- **ram**: Módulos de memoria RAM.
- **red**: Configuración de redes y VLANs.
- **responsable**: Personas responsables de los equipos.
- **servicios**: Servicios instalados en los servidores.
- **servidores**: Relación principal que une todos los componentes de un servidor.
- **sistemas_operativos**: Sistemas operativos instalados.

## Uso

1. Instala PostgreSQL en tu sistema.
2. Crea una base de datos nueva.
3. Ejecuta el script `SQL/database.sql` para crear la estructura y cargar los datos:
   ```sh
   psql -U <usuario> -d <nombre_db> -f SQL/database.sql
   ```
4. Abre el archivo `diagrama entidad-relacion/servidores.pgerd` con una herramienta compatible (por ejemplo, pgModeler) para visualizar el modelo entidad-relación.

## Licencia

Este proyecto está bajo la licencia MIT.
