# Proyecto 001 - API RESTful de Equipos y Jugadores

## Descripción
Este proyecto implementa una API RESTful para gestionar equipos de fútbol y jugadores, estableciendo una relación **1 a muchos** (un equipo tiene muchos jugadores). La API está documentada con Swagger y probada mediante Bruno.

## Objetivo
Diseñar una API completa que permita realizar operaciones CRUD sobre las entidades `Equipo` y `Jugador`, aplicando principios RESTful y utilizando herramientas modernas para su documentación y prueba.

## Relación entre Entidades

```
┌─────────────┐
│   EQUIPO    │ 1
│             │───┐
│ - id        │   │
│ - name      │   │
│ - country   │   │
└─────────────┘   │
                  │ tiene
                  │
                  │ N
                ┌─▼──────────┐
                │  JUGADOR   │
                │            │
                │ - id       │
                │ - name     │
                │ - position │
                │ - teamId   │
                └────────────┘
```

## Estructura del Proyecto

```
Proyecto 001/
│
├── swagger/
│   └── football-api.yaml          # Documentación OpenAPI
│
├── bruno/
│   ├── create-team.bru            # Crear equipo
│   ├── get-teams.bru              # Obtener equipos
│   ├── get-players.bru            # Obtener jugadores
│   ├── get-players-by-team.bru    # Obtener jugadores por equipo
│   ├── create-player.bru          # Crear jugador
│   ├── update-team.bru            # Actualizar equipo
│   ├── delete-team.bru            # Eliminar equipo
│   ├── update-player.bru          # Actualizar jugador
│   └── delete-player.bru          # Eliminar jugador
│
└── README.md                      # Documentación del proyecto
```

## Endpoints

### Equipos (`/teams`)
- **GET /teams**: Listar todos los equipos.
- **GET /teams/{id}**: Obtener equipo por ID.
- **POST /teams**: Crear un nuevo equipo.
- **PUT /teams/{id}**: Actualizar un equipo.
- **DELETE /teams/{id}**: Eliminar un equipo.

### Jugadores (`/players`)
- **GET /players**: Listar todos los jugadores.
- **GET /players/{id}**: Obtener jugador por ID.
- **POST /players**: Crear un nuevo jugador.
- **PUT /players/{id}**: Actualizar un jugador.
- **DELETE /players/{id}**: Eliminar un jugador.
- **GET /teams/{id}/players**: Listar jugadores de un equipo.

## Modelos de Datos

### Equipo
```json
{
  "id": 1,
  "name": "Barcelona FC",
  "country": "España"
}
```

### Jugador
```json
{
  "id": 1,
  "name": "Lionel Messi",
  "position": "Delantero",
  "teamId": 1
}
```

## Pruebas

### Con Swagger
1. Abre [Swagger Editor](https://editor.swagger.io/).
2. Carga el archivo `football-api.yaml`.
3. Prueba los endpoints interactivamente.

### Con Bruno
1. Instala [Bruno](https://www.usebruno.com/).
2. Importa los archivos `.bru` desde la carpeta `bruno`.
3. Ejecuta las solicitudes para probar los endpoints.

## Tecnologías Utilizadas
- **Swagger/OpenAPI**: Documentación de la API.
- **Bruno**: Pruebas de endpoints.
- **JSON**: Formato de intercambio de datos.
- **HTTP**: Protocolo de comunicación.

## Autores
- [Nombre del Estudiante 1]
- [Nombre del Estudiante 2]

---
Proyecto desarrollado para el curso de Desarrollo Web.