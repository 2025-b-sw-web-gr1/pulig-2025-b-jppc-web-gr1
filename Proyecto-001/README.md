# 📘 Proyecto 001 – Documentación de Endpoints con Swagger

## 🎯 Objetivo

Documentar automáticamente los endpoints RESTful implementados en el examen (NestJS + TypeORM + SQLite, relación 1 a muchos) usando **Swagger (OpenAPI)** dentro del mismo proyecto.

---

## 📌 Descripción

Este proyecto toma la API de Equipos y Jugadores del Examen 02 y agrega documentación automática con **Swagger**. Todos los endpoints están documentados con:

- ✅ Decoradores `@ApiTags` para agrupar por categoría
- ✅ `@ApiOperation` para describir cada operación
- ✅ `@ApiResponse` para documentar respuestas
- ✅ `@ApiProperty` en DTOs con ejemplos
- ✅ `@ApiParam` para parámetros
- ✅ `@ApiBody` para cuerpos de solicitud

---

## 🚀 Instalación

### 1. Instalar dependencias

```bash
npm install
```

### 2. Dependencias agregadas (Swagger)

```bash
npm install @nestjs/swagger swagger-ui-express
```

El `package.json` ya contiene estas dependencias.

---

## 🏃 Ejecutar el servidor

### Modo desarrollo (recomendado)

```bash
npm run start:dev
```

El servidor se ejecutará en `http://localhost:3000`

### Modo producción

```bash
npm run build
npm run start:prod
```

---

## 📚 Acceder a Swagger

Una vez que el servidor esté corriendo, abre tu navegador:

```
http://localhost:3000/api
```

Allí verás la **interfaz interactiva de Swagger** donde puedes:
- Ver todos los endpoints documentados
- Probar los endpoints directamente
- Ver esquemas de solicitud y respuesta
- Descargar la especificación OpenAPI

---

## 📋 Endpoints Documentados

### Teams (Equipos)

| Método | Ruta | Descripción |
|--------|------|-------------|
| **GET** | `/teams` | Obtener todos los equipos |
| **GET** | `/teams/:id` | Obtener un equipo por ID |
| **GET** | `/teams/:id/players` | Obtener jugadores de un equipo |
| **POST** | `/teams` | Crear un nuevo equipo |
| **PUT** | `/teams/:id` | Actualizar un equipo |
| **DELETE** | `/teams/:id` | Eliminar un equipo |

### Players (Jugadores)

| Método | Ruta | Descripción |
|--------|------|-------------|
| **GET** | `/players` | Obtener todos los jugadores |
| **GET** | `/players/:id` | Obtener un jugador por ID |
| **POST** | `/players` | Crear un nuevo jugador |
| **PUT** | `/players/:id` | Actualizar un jugador |
| **DELETE** | `/players/:id` | Eliminar un jugador |

---

## 💡 Ejemplos de Uso

### Crear un equipo (POST)

**URL:** `http://localhost:3000/teams`

**Body (JSON):**
```json
{
  "name": "Barcelona FC",
  "country": "España"
}
```

**Respuesta (201 Created):**
```json
{
  "id": 1,
  "name": "Barcelona FC",
  "country": "España",
  "players": []
}
```

### Crear un jugador (POST)

**URL:** `http://localhost:3000/players`

**Body (JSON):**
```json
{
  "name": "Lionel Messi",
  "position": "Delantero",
  "teamId": 1
}
```

**Respuesta (201 Created):**
```json
{
  "id": 1,
  "name": "Lionel Messi",
  "position": "Delantero",
  "teamId": 1
}
```

### Obtener jugadores de un equipo (GET)

**URL:** `http://localhost:3000/teams/1/players`

**Respuesta (200 OK):**
```json
[
  {
    "id": 1,
    "name": "Lionel Messi",
    "position": "Delantero",
    "teamId": 1
  }
]
```

---

## 🛠️ Con curl

```bash
# Crear equipo
curl -X POST http://localhost:3000/teams \
  -H "Content-Type: application/json" \
  -d '{"name": "Real Madrid", "country": "España"}'

# Obtener todos los equipos
curl http://localhost:3000/teams

# Obtener un equipo por ID
curl http://localhost:3000/teams/1

# Crear jugador
curl -X POST http://localhost:3000/players \
  -H "Content-Type: application/json" \
  -d '{"name": "Cristiano Ronaldo", "position": "Extremo", "teamId": 1}'

# Obtener todos los jugadores
curl http://localhost:3000/players

# Actualizar equipo
curl -X PUT http://localhost:3000/teams/1 \
  -H "Content-Type: application/json" \
  -d '{"name": "Real Madrid CF"}'

# Eliminar equipo
curl -X DELETE http://localhost:3000/teams/1
```

---

## 📁 Estructura del Proyecto

```
Proyecto-001/
├── src/
│   ├── main.ts                    # Configuración de Swagger
│   ├── app.module.ts              # Módulo principal
│   ├── app.controller.ts          # Controlador de API
│   ├── controllers/
│   │   ├── teams.controller.ts    # Con decoradores Swagger
│   │   └── players.controller.ts  # Con decoradores Swagger
│   ├── services/
│   │   ├── teams.service.ts
│   │   └── players.service.ts
│   ├── dtos/
│   │   ├── team.dto.ts            # Con @ApiProperty
│   │   └── player.dto.ts          # Con @ApiProperty
│   ├── entities/
│   │   ├── team.entity.ts
│   │   ├── player.entity.ts
│   │   └── index.ts
│   └── modules/
│       ├── teams.module.ts
│       └── players.module.ts
├── public/
│   └── index.html                 # Página de inicio
├── package.json
├── tsconfig.json
└── README.md
```

---

## ✅ Checklist de Cumplimiento

- ✔️ Proyecto correctamente subido al repositorio del curso
- ✔️ Swagger instalado y configurado en `main.ts`
- ✔️ Endpoints documentados con decoradores (`@ApiTags`, `@ApiOperation`, `@ApiResponse`)
- ✔️ DTOs documentados con `@ApiProperty`
- ✔️ Documentación accesible en `/api`
- ✔️ README claro y completo

---

## 📝 Decoradores Swagger Utilizados

### En Controladores

```typescript
@ApiTags('teams')                    // Agrupa endpoints por categoría
@ApiOperation({ summary: '...' })    // Describe la operación
@ApiResponse({ status: 200, ... })   // Describe la respuesta
@ApiParam({ name: 'id', ... })       // Describe parámetros
@ApiBody({ type: CreateTeamDto })    // Describe el cuerpo
```

### En DTOs

```typescript
@ApiProperty({
  example: 'Barcelona FC',
  description: 'Nombre del equipo'
})
```

---

## 🔗 Enlaces Útiles

- [Swagger UI](http://localhost:3000/api)
- [NestJS Swagger Docs](https://docs.nestjs.com/openapi/introduction)
- [OpenAPI 3.0 Spec](https://spec.openapis.org/oas/v3.0.3)

---

## 👨‍💻 Autor

Proyecto 001 - Jhonathan Pulig
Curso: Desarrollo Web  
Fecha: 28/01/2026

---

**¡Disfruta explorando tu API documentada con Swagger!** 🚀
