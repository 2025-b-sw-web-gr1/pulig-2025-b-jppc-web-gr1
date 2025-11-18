// Mensaje accesible al enviar el formulario
document.getElementById('form-contacto').addEventListener('submit', function(e) {
  e.preventDefault();
  const nombre = document.getElementById('nombre').value;
  const mensajeExito = document.getElementById('mensaje-exito');
  mensajeExito.textContent = `Gracias ${nombre}, tu mensaje se ha enviado correctamente.`;
  this.reset();
});
