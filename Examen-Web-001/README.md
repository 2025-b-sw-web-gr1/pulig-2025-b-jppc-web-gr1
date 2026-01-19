# 🏈 Examen 02 - API RESTful de Equipos y Jugadores

API RESTful desarrollada en **NestJS** con **TypeORM** y **SQLite** para gestionar equipos de fútbol y sus jugadores.

## 📋 Requisitos Previos

- Node.js versión 16 o superior
- npm o yarn
- SQLite3 (generalmente incluido)

## 🚀 Instalación

### 1. Clonar o descargar el proyecto

```bash
cd examen-web-002
```

### 2. Instalar dependencias

```bash
npm install
```

### 3. Configurar la base de datos

La base de datos SQLite se crea automáticamente en el primer inicio del servidor.

## ▶️ Ejecutar el Servidor

### Modo desarrollo (con hot reload)

```bash
npm run start:dev
```

### Modo producción

```bash
npm run build
npm run start:prod
```

El servidor se ejecutará en `http://localhost:3000`

## 📚 Estructura del Proyecto

```
examen-web-002/
├── src/
│   ├── controllers/          # Controladores de rutas
│   │   ├── teams.controller.ts
│   │   └── players.controller.ts
│   ├── services/             # Lógica de negocio
│   │   ├── teams.service.ts
│   │   └── players.service.ts
│   ├── entities/             # Modelos de base de datos
│   │   ├── team.entity.ts
│   │   └── player.entity.ts
│   ├── dtos/                 # Data Transfer Objects (validación)
│   │   ├── team.dto.ts
│   │   └── player.dto.ts
│   ├── modules/              # Módulos de NestJS
│   │   ├── teams.module.ts
│   │   └── players.module.ts
│   ├── app.module.ts         # Módulo principal
│   └── main.ts               # Punto de entrada
├── dist/                     # Código compilado
├── node_modules/             # Dependencias
├── db.sqlite                 # Base de datos SQLite
├── package.json
├── tsconfig.json
└── README.md
```

## 🔌 Endpoints Disponibles

### Teams (Equipos)

#### 1. Obtener todos los equipos
```bash
GET /teams
```

**Respuesta (200):**
```json
[
  {
    "id": 1,
    "name": "Real Madrid",
    "country": "España",
    "players": [
      {
        "id": 1,
        "name": "Cristiano Ronaldo",
        "position": "Delantero",
        "teamId": 1
      }
    ]
  }
]
```

#### 2. Obtener un equipo por ID
```bash
GET /teams/1
```

**Respuesta (200):**
```json
{
  "id": 1,
  "name": "Real Madrid",
  "country": "España",
  "players": []
}
```

#### 3. Crear un equipo
```bash
POST /teams
Content-Type: application/json

{
  "name": "Barcelona",
  "country": "España"
}
```

**Respuesta (201):**
```json
{
  "id": 2,
  "name": "Barcelona",
  "country": "España",
  "players": []
}
```

#### 4. Actualizar un equipo
```bash
PUT /teams/1
Content-Type: application/json

{
  "name": "Real Madrid CF",
  "country": "España"
}
```

**Respuesta (200):**
```json
{
  "id": 1,
  "name": "Real Madrid CF",
  "country": "España",
  "players": []
}
```

#### 5. Eliminar un equipo
```bash
DELETE /teams/1
```

**Respuesta (200):**
```json
{
  "message": "Team with ID 1 has been deleted"
}
```

#### 6. Obtener jugadores de un equipo específico
```bash
GET /teams/1/players
```

**Respuesta (200):**
```json
[
  {
    "id": 1,
    "name": "Cristiano Ronaldo",
    "position": "Delantero",
    "teamId": 1,
    "team": {
      "id": 1,
      "name": "Real Madrid",
      "country": "España"
    }
  }
]
```

---

### Players (Jugadores)

#### 1. Obtener todos los jugadores
```bash
GET /players
```

**Respuesta (200):**
```json
[
  {
    "id": 1,
    "name": "Cristiano Ronaldo",
    "position": "Delantero",
    "teamId": 1,
    "team": {
      "id": 1,
      "name": "Real Madrid",
      "country": "España"
    }
  }
]
```

#### 2. Obtener un jugador por ID
```bash
GET /players/1
```

**Respuesta (200):**
```json
{
  "id": 1,
  "name": "Cristiano Ronaldo",
  "position": "Delantero",
  "teamId": 1,
  "team": {
    "id": 1,
    "name": "Real Madrid",
    "country": "España"
  }
}
```

#### 3. Crear un jugador
```bash
POST /players
Content-Type: application/json

{
  "name": "Cristiano Ronaldo",
  "position": "Delantero",
  "teamId": 1
}
```

**Respuesta (201):**
```json
{
  "id": 1,
  "name": "Cristiano Ronaldo",
  "position": "Delantero",
  "teamId": 1,
  "team": {
    "id": 1,
    "name": "Real Madrid",
    "country": "España"
  }
}
```

#### 4. Actualizar un jugador
```bash
PUT /players/1
Content-Type: application/json

{
  "name": "Cristiano Ronaldo",
  "position": "Extremo Derecho",
  "teamId": 1
}
```

**Respuesta (200):**
```json
{
  "id": 1,
  "name": "Cristiano Ronaldo",
  "position": "Extremo Derecho",
  "teamId": 1,
  "team": {
    "id": 1,
    "name": "Real Madrid",
    "country": "España"
  }
}
```

#### 5. Eliminar un jugador
```bash
DELETE /players/1
```

**Respuesta (200):**
```json
{
  "message": "Player with ID 1 has been deleted"
}
```

---

## 🧪 Ejemplos de Uso con cURL

### Crear un equipo

```bash
curl -X POST http://localhost:3000/teams \
  -H "Content-Type: application/json" \
  -d "{\"name\": \"Manchester United\", \"country\": \"Inglaterra\"}"
```

### Crear un jugador

```bash
curl -X POST http://localhost:3000/players \
  -H "Content-Type: application/json" \
  -d "{\"name\": \"Bruno Fernandes\", \"position\": \"Centrocampista\", \"teamId\": 1}"
```

### Obtener todos los equipos

```bash
curl http://localhost:3000/teams
```

### Obtener jugadores del equipo 1

```bash
curl http://localhost:3000/teams/1/players
```

### Actualizar un equipo

```bash
curl -X PUT http://localhost:3000/teams/1 \
  -H "Content-Type: application/json" \
  -d "{\"name\": \"Manchester United FC\"}"
```

### Eliminar un jugador

```bash
curl -X DELETE http://localhost:3000/players/1
```

---

## 🧪 Ejemplos de Uso con HTTPie

### Crear un equipo

```bash
http POST http://localhost:3000/teams \
  name="Liverpool" \
  country="Inglaterra"
```

### Crear un jugador

```bash
http POST http://localhost:3000/players \
  name="Mohamed Salah" \
  position="Extremo" \
  teamId=1
```

### Obtener todos los equipos

```bash
http GET http://localhost:3000/teams
```

### Obtener un equipo específico

```bash
http GET http://localhost:3000/teams/1
```

### Obtener jugadores de un equipo

```bash
http GET http://localhost:3000/teams/1/players
```

### Actualizar un equipo

```bash
http PUT http://localhost:3000/teams/1 \
  name="Liverpool FC"
```

### Eliminar un jugador

```bash
http DELETE http://localhost:3000/players/1
```

---

## 📊 Entidades

### Team (Equipo)

| Campo   | Tipo    | Descripción         |
|---------|---------|---------------------|
| id      | number  | Identificador único |
| name    | string  | Nombre del equipo   |
| country | string  | País del equipo     |
| players | Player[]| Jugadores del equipo|

### Player (Jugador)

| Campo  | Tipo   | Descripción           |
|--------|--------|----------------------|
| id     | number | Identificador único   |
| name   | string | Nombre del jugador    |
| position| string| Posición en el campo  |
| teamId | number | ID del equipo al que pertenece |
| team   | Team   | Referencia al equipo  |

---

## 🔗 Relaciones

**Relación 1 a Muchos:** Un equipo (Team) tiene muchos jugadores (Players)

```
Team (1) ──────┐
                ├─── (N) Players
```

---

## ✅ Validaciones

- **Team:**
  - `name`: Requerido, string, mínimo 1 carácter
  - `country`: Requerido, string, mínimo 1 carácter

- **Player:**
  - `name`: Requerido, string, mínimo 1 carácter
  - `position`: Requerido, string, mínimo 1 carácter
  - `teamId`: Requerido, número entero

---

## 🛠️ Tecnologías Utilizadas

- **NestJS** v10.0.0 - Framework Node.js
- **TypeORM** v0.3.17 - ORM para base de datos
- **SQLite3** v5.1.6 - Base de datos
- **TypeScript** v5.1.3 - Lenguaje de programación
- **Express** v4.17 - Motor HTTP
- **class-validator** v0.14.0 - Validación de datos
- **class-transformer** v0.5.1 - Transformación de datos

---

## 📝 Scripts Disponibles

```bash
# Iniciar servidor en modo desarrollo
npm run start:dev

# Iniciar servidor en modo producción
npm start

# Compilar el código TypeScript
npm run build

# Ejecutar la aplicación compilada
npm run start:prod

# Ejecutar linter
npm run lint

# Formatear código con Prettier
npm run format

# Ejecutar pruebas
npm test

# Ejecutar pruebas en modo watch
npm run test:watch

# Ejecutar pruebas con cobertura
npm run test:cov
```

---

## 🐛 Solución de Problemas

### Puerto 3000 en uso

Si el puerto 3000 está en uso, cambia el puerto en el archivo `.env`:

```
PORT=3001
```

### Base de datos corrupta

Elimina el archivo `db.sqlite` y reinicia el servidor:

```bash
rm db.sqlite
npm run start:dev
```

### Problemas con módulos

Reinstala las dependencias:

```bash
rm -rf node_modules package-lock.json
npm install
```

---

## 📧 Contacto

Para preguntas o sugerencias sobre este proyecto, contacta con el instructor del curso.

---

**Última actualización:** 19 de enero de 2026
