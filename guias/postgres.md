## PostgreSQL con Docker

### Conectarse a PostgreSQL
```bash
docker exec -it postgres_db psql -U <usuario> -d <base_de_datos>
```

### Cargar script SQL externo
```bash
docker exec -i postgres_db psql -U <usuario> -d <base_de_datos> < ./postgres/script.sql

docker exec -i postgres_db bash -c "PGPASSWORD='<password>' psql -h 127.0.0.1 -U <usuario> -d <base_de_datos>" < ./postgres/script.sql
```

---

### Permisos

#### Crear rol/usuario
```sql
CREATE ROLE <usuario> WITH LOGIN;
```

#### Superusuario (acceso total + instalar extensiones)
```sql
ALTER ROLE <usuario> SUPERUSER;
```

#### Permisos individuales
```sql
-- Conectarse a la BD
GRANT CONNECT ON DATABASE <base_de_datos> TO <usuario>;

-- Acceder al schema
GRANT USAGE ON SCHEMA public TO <usuario>;

-- Solo lectura
GRANT SELECT ON ALL TABLES IN SCHEMA public TO <usuario>;

-- Lectura y escritura
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO <usuario>;

-- Todo sobre una tabla específica
GRANT ALL PRIVILEGES ON TABLE <tabla> TO <usuario>;
```

#### Revocar permisos
```sql
REVOKE SELECT ON ALL TABLES IN SCHEMA public FROM <usuario>;
```