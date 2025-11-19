const express = require('express');
const path = require('path');

const app = express();
const PORT = 3000;

// Configurar Pug como motor de plantillas
app.set('view engine', 'pug');
app.set('views', path.join(__dirname, 'views'));

// Servir archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Rutas
app.get('/', (req, res) => {
  res.render('index', {
    title: 'Inicio',
    nombre: 'Mi Sitio Web',
    descripcion: 'Bienvenido a mi página creada con Pug',
    servicios: [
      { icono: '🎨', titulo: 'Diseño', descripcion: 'Diseños modernos y atractivos' },
      { icono: '💻', titulo: 'Desarrollo', descripcion: 'Código limpio y eficiente' },
      { icono: '🚀', titulo: 'Optimización', descripcion: 'Rendimiento excepcional' }
    ]
  });
});

app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});