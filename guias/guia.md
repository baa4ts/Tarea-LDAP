## Web

- phpLDAPadmin: `https://localhost:8443`
- Aceptar el certificado autofirmado
> Usa el index.html junto al .env para el login

## Credenciales

- Login DN: `cn=admin,dc=<parte1 de LDAP_DOMAIN>,dc=<parte2 de LDAP_DOMAIN>`
- Password: valor de `LDAP_ADMIN_PASSWORD` en `.env`
> Usa el index.html junto al .env para el login

### Ejemplo con casa.casa
- Login DN: `cn=admin,dc=casa,dc=casa`
- Password: `12345678`

### Gestión de Estructura y Usuarios en LDAP

#### 1. Crear las Unidades Organizativas (ou)
Estas actúan como contenedores para separar los privilegios de acceso a nivel de red.
- **Para Postgres:** Crear un `Child Entry` en la raíz (`dc=Melo,dc=consulting`) -> **Generic: Organizational Unit** -> Nombre: `database`.
- **Para Análisis (Grafana):** Crear un `Child Entry` en la raíz -> **Generic: Organizational Unit** -> Nombre: `analytics`.

#### 2. Crear el Grupo de Usuarios (cn)
Se utiliza un grupo único para que todos los usuarios tengan una identidad técnica válida en el sistema.
- Crear un `Child Entry` en la raíz.
- Seleccionar la plantilla **Generic: Posix Group**.
- **Group:** `usuarios`.

#### 3. Crear el Usuario de Base de Datos (en ou=database)
- **Ubicación:** Hacer clic sobre la carpeta **`ou=database`**.
- **User ID:** `carlos_db` (Nombre único para acceder a PostgreSQL).
- **GID Number:** Seleccionar el grupo `usuarios`.
- **Common Name:** Carlos Morales.
- **Password:** Definir contraseña en formato `md5`.

#### 4. Crear el Usuario de Análisis (en ou=analytics)
- **Ubicación:** Hacer clic sobre la carpeta **`ou=analytics`**.
- **User ID:** `marcos_grafana` (Nombre único para acceder a Grafana).
- **GID Number:** Seleccionar el mismo grupo `usuarios`.
- **Common Name:** Marcos Analista.
- **Password:** Definir contraseña en formato `md5`.