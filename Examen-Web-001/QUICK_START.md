# 🚀 GUÍA RÁPIDA DE INICIO

## Paso 1: Instalar dependencias (ya hecho)
```bash
npm install
```

## Paso 2: Compilar el proyecto (ya hecho)
```bash
npm run build
```

## Paso 3: Iniciar el servidor en modo desarrollo
```bash
npm run start:dev
```

El servidor estará disponible en: **http://localhost:3000**

---

## Pruebas Rápidas

Una vez que el servidor está corriendo, puedes probar los endpoints:

### Con cURL (en Terminal/PowerShell):

#### Crear un equipo:
```bash
curl -X POST http://localhost:3000/teams -H "Content-Type: application/json" -d "{\"name\": \"Real Madrid\", \"country\": \"España\"}"
```

#### Obtener todos los equipos:
```bash
curl http://localhost:3000/teams
```

#### Obtener un equipo por ID:
```bash
curl http://localhost:3000/teams/1
```

---

## Scripts de Prueba

### PowerShell (Windows):
```bash
.\test-api.ps1
```

### Bash (Linux/Mac):
```bash
bash test-api.sh
```

---

## Estructura de Carpetas

```
examen-web-002/
├── src/                      # Código fuente
│   ├── controllers/          # Manejadores de rutas
│   ├── entities/             # Modelos de BD
│   ├── services/             # Lógica de negocio
│   ├── dtos/                 # Validación de datos
│   ├── modules/              # Módulos NestJS
│   ├── app.module.ts         # Módulo principal
│   └── main.ts               # Punto de entrada
├── dist/                     # Código compilado
├── package.json              # Dependencias
├── tsconfig.json             # Config TypeScript
├── db.sqlite                 # Base de datos (se crea automáticamente)
└── README.md                 # Documentación completa
```

---

## Endpoints Implementados

### Teams (CRUD completo)
- ✅ GET    /teams                 - Obtener todos
- ✅ GET    /teams/:id             - Obtener uno
- ✅ POST   /teams                 - Crear
- ✅ PUT    /teams/:id             - Actualizar
- ✅ DELETE /teams/:id             - Eliminar
- ✅ GET    /teams/:id/players     - Jugadores del equipo

### Players (CRUD completo)
- ✅ GET    /players               - Obtener todos
- ✅ GET    /players/:id           - Obtener uno
- ✅ POST   /players               - Crear
- ✅ PUT    /players/:id           - Actualizar
- ✅ DELETE /players/:id           - Eliminar

---

## Información de la Entidad

### Team
```json
{
  "id": 1,
  "name": "Real Madrid",
  "country": "España",
  "players": []
}
```

### Player
```json
{
  "id": 1,
  "name": "Cristiano Ronaldo",
  "position": "Delantero",
  "teamId": 1,
  "team": { ... }
}
```

---

## 📝 Notas Importantes

- La base de datos SQLite se crea automáticamente al iniciar el servidor
- Las tablas se sincronizan automáticamente con las entidades
- Todos los datos se validan según los DTOs definidos
- Las relaciones 1 a muchos están correctamente configuradas

---

**¡El proyecto está listo para usar!**
