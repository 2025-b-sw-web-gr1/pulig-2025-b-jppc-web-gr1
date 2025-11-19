# 📖 Documentación de API: Taller OpenAPI con JSONPlaceholder

**Curso:** Aplicaciones Web - EPN 2025
**Estudiante:** Jhonathan Pulig
**Fecha:** 18 de Noviembre de 2025

-----

## 🎯 Objetivo

Este taller se enfoca en la **implementación de documentación estandarizada** para APIs REST. Utilizando la especificación **OpenAPI 3.0 (Swagger)**, transformaremos el conocimiento práctico obtenido en las pruebas de Bruno (`Clase 008-009`) en un archivo `swagger.yaml` que genera una interfaz de documentación interactiva y auto-probatoria.

-----

## 📦 Contenido

  - **`swagger.yaml`**: Archivo de especificación que contiene la descripción completa de los *endpoints* de JSONPlaceholder, listo para ser consumido por herramientas como Swagger UI.

-----

## 🚀 Guía de Visualización (Cómo Usar la Documentación)

La especificación OpenAPI puede visualizarse interactivamente usando varias herramientas:

### Opción 1: Visor Online (Recomendado)

1.  Abre el **Swagger Editor** oficial: [https://editor.swagger.io/](https://editor.swagger.io/)
2.  Elimina el contenido de demostración.
3.  Copia y pega el texto íntegro de tu archivo `swagger.yaml`.
4.  La documentación renderizada aparecerá inmediatamente en el panel derecho.

### Opción 2: Entorno Local con Node.js

Ideal para desarrollo local o entornos sin conexión:

```bash
# 1. Instala el visor de Swagger (si no lo tienes)
npm install -g swagger-ui-watcher

# 2. Ejecuta el visor desde la carpeta que contiene tu swagger.yaml
swagger-ui-watcher swagger.yaml
```

### Opción 3: Extensión de Visual Studio Code

Si usas VS Code:

1.  Instala la extensión **"Swagger Viewer"**.
2.  Abre el archivo `swagger.yaml`.
3.  Utiliza el comando `Shift + Alt + P` para obtener una vista previa interactiva dentro del editor.

-----

## 📋 Resumen de la Cobertura de Endpoints

La documentación cubre todos los recursos principales de JSONPlaceholder probados en la colección Bruno:

| Recurso | Método | Ruta | Descripción |
| :--- | :--- | :--- | :--- |
| **Posts** | 6 | `/posts`, `/posts/{id}` | Cobertura CRUD completa y listado de comentarios. |
| **Comments** | 3 | `/comments`, `/comments/{id}` | Recuperación y filtrado por `postId`. |
| **Albums** | 3 | `/albums`, `/albums/{id}` | Listado y obtención de fotos de un álbum. |
| **Photos** | 2 | `/photos`, `/photos/{id}` | Recuperación y filtrado por `albumId`. |
| **Todos** | 2 | `/todos`, `/todos/{id}` | Listado y obtención de tareas. |
| **Users** | 5 | `/users`, `/users/{id}` | Recuperación y listado de recursos asociados (posts, albums, todos). |

**Total de Endpoints Documentados: 21** (Excluyendo los 6 endpoints anidados de Users para evitar duplicación con Query Params).

-----

## 🎨 Características Implementadas en la Especificación

### 1\. ⚙️ Metadatos y Estructura Base

  * **Versión OpenAPI:** `3.0.0`
  * **Información (`info`):** Título, descripción clara, versión `1.0.0`.
  * **Servidores (`servers`):** URL base configurada (`https://jsonplaceholder.typicode.com`).
  * **Licencia y Contacto:** Incluidas para fines formales.

### 2\. 🧩 Organización y Etiquetado

  * **Etiquetas (`tags`):** Los *endpoints* están agrupados en **6 categorías** distintas para facilitar la navegación en Swagger UI:
      * `Posts`
      * `Comments`
      * `Albums`
      * `Photos`
      * `Todos`
      * `Users`

### 3\. 📄 Documentación Detallada de `paths`

  * **Parámetros de Ruta:** Definición de parámetros obligatorios (`{id}`) con `in: path`.
  * **Parámetros de Consulta:** Definición de parámetros de filtro opcionales (`?postId=1`) con `in: query`.
  * **Cuerpos de Solicitud:** Definición de `requestBody` con `content` y ejemplos para los métodos `POST`, `PUT`, y `PATCH`.
  * **Respuestas:** Definición de códigos de estado esenciales (`200 OK`, `201 Created`, `404 Not Found`).

### 4\. 🧱 Componentes y Esquemas Reutilizables

Todos los modelos de datos complejos se han definido en la sección `components/schemas` para **reutilización y consistencia**:

  * **Modelos de Recurso:** `Post`, `Comment`, `Album`, `Photo`, `Todo`, `User`.
  * **Modelos Anidados:** `Address`, `Geo`, `Company` (para la estructura compleja del objeto `User`).
  * **Modelos de Entrada:** `PostInput` (diferenciando la creación/actualización del objeto de respuesta).

-----

## 🧪 Pruebas Interactivas (Try it out)

El poder de Swagger UI radica en la capacidad de probar la API directamente desde la documentación.

1.  **Selecciona un Método:** Haz clic en un recurso, por ejemplo, **`POST /posts`**.
2.  **Habilitar Pruebas:** Haz clic en el botón **"Try it out"**.
3.  **Ejecutar:** El *Request Body* se auto-rellenará con un ejemplo. Haz clic en **"Execute"**.
4.  **Verificación:** Confirma que el **Código de Respuesta** coincida con el esperado (`201 Created`) y que el `Response Body` contenga los datos enviados.

### Ejemplo de Prueba: Creación de un Recurso

**POST /posts**

  * **URL:** `https://jsonplaceholder.typicode.com/posts`
  * **Cuerpo (Ejemplo):**
    ```json
    {
      "title": "Documentación terminada",
      "body": "Revisando el taller de Bruno y Swagger.",
      "userId": 1
    }
    ```
  * **Respuesta Esperada:** Código `201 Created` y el objeto `Post` completo con un `id` asignado.

-----

## 🎓 Lecciones Aprendidas de la Especificación

| Concepto | Uso en el Taller | Importancia |
| :--- | :--- | :--- |
| **`$ref`** | Para referenciar el `Post` schema dentro de las respuestas 200/201. | Previene la duplicación y garantiza la consistencia del esquema. |
| **`in: path`** | Usado en `/posts/{id}`. | Indica que el parámetro debe ir obligatoriamente en la URL. |
| **`in: query`** | Usado en `/comments?postId=1`. | Define parámetros opcionales para filtrar resultados. |
| **Tags** | Agrupación de `Posts`, `Comments`, etc. | Mejora la navegabilidad y experiencia de usuario en Swagger UI. |
| **Esquemas Complejos** | Estructura del objeto `User` con anidamiento de `Address` y `Company`. | Demuestra la capacidad de documentar estructuras de datos complejas. |

-----

**¡Documentación completa y lista para la revisión\!**

Tu archivo `swagger.yaml` debe reflejar esta información para que la interfaz interactiva se genere correctamente.
