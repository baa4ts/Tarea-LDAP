## LDAP con phpLDAPadmin

### Acceso
- URL: `https://localhost:8443`
- Aceptar el certificado autofirmado
- **Login DN:** `cn=admin,dc=<parte1>,dc=<parte2>`
- **Password:** valor de `LDAP_ADMIN_PASSWORD` en `.env`

---

### Estructura

#### 1. Crear Unidad Organizativa (OU)
Actúan como carpetas para separar usuarios por rol/acceso.

- Clic derecho en la raíz → **Create a child entry**
- Plantilla: **Generic: Organizational Unit**
- Nombre: `database` / `analytics` / lo que corresponda

#### 2. Crear Grupo (cn)
Necesario para asignar GID a los usuarios.

- Clic derecho en la raíz → **Create a child entry**
- Plantilla: **Generic: Posix Group**
- **Group:** `usuarios`

#### 3. Crear Usuario
- Clic derecho sobre la **OU destino** → **Create a child entry**
- Plantilla: **Generic: User Account**
- **User ID:** uid único (ej. `cmorales`)
- **GID Number:** seleccionar el grupo `usuarios`
- **Common Name:** nombre completo
- **Password:** formato `md5`

---

### Notas
- Los usuarios de `ou=analytics` pueden autenticarse en **Grafana**
- Los usuarios de `ou=database` pueden autenticarse en **PostgreSQL** vía LDAP
- El `uid` del usuario es el nombre de login en ambos servicios