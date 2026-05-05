# LDAP Docker

## Comandos

### Levantar
```bash
docker compose up -d
```

### Bajar
```bash
docker compose down
```

### Bajar y borrar volúmenes (conserva las imágenes)
```bash
docker compose down -v
```

### Borrar imágenes
```bash
docker rmi osixia/openldap:latest
docker rmi osixia/phpldapadmin:latest
docker rmi grafana/grafana-oss:latest
docker rmi postgres:16-alpine
```

### Limpiar todo
```bash
docker system prune -a
```

### Reiniciar un contenedor
```bash
docker restart <nombre_contenedor>
```

### Ver logs
```bash
docker logs <nombre_contenedor>
```