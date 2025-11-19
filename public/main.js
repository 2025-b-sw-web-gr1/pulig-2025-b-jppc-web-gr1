// Animación suave al hacer scroll
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    e.preventDefault();
    const target = document.querySelector(this.getAttribute('href'));
    if (target) {
      target.scrollIntoView({
        behavior: 'smooth',
        block: 'start'
      });
    }
  });
});

// Header con efecto al hacer scroll
let lastScroll = 0;
const header = document.querySelector('.header');

window.addEventListener('scroll', () => {
  const currentScroll = window.pageYOffset;
  
  if (currentScroll <= 0) {
    header.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.08)';
  } else {
    header.style.boxShadow = '0 4px 20px rgba(0, 0, 0, 0.1)';
  }
  
  lastScroll = currentScroll;
});

// Manejo del formulario con validación
const formulario = document.querySelector('.formulario');
if (formulario) {
  formulario.addEventListener('submit', function(e) {
    e.preventDefault();
    
    const nombre = document.getElementById('nombre').value.trim();
    const email = document.getElementById('email').value.trim();
    const mensaje = document.getElementById('mensaje').value.trim();
    
    if (!nombre || !email || !mensaje) {
      mostrarNotificacion('Por favor completa todos los campos', 'error');
      return;
    }
    
    if (!validarEmail(email)) {
      mostrarNotificacion('Por favor ingresa un email válido', 'error');
      return;
    }
    
    // Animación de envío
    const btnSubmit = formulario.querySelector('.btn');
    const textoOriginal = btnSubmit.textContent;
    btnSubmit.textContent = 'Enviando...';
    btnSubmit.disabled = true;
    
    setTimeout(() => {
      mostrarNotificacion('¡Mensaje enviado exitosamente!', 'success');
      formulario.reset();
      btnSubmit.textContent = textoOriginal;
      btnSubmit.disabled = false;
    }, 1500);
  });
}

// Validar email
function validarEmail(email) {
  const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return re.test(email);
}

// Sistema de notificaciones
function mostrarNotificacion(mensaje, tipo = 'info') {
  const notificacion = document.createElement('div');
  notificacion.className = `notificacion notificacion-${tipo}`;
  notificacion.textContent = mensaje;
  
  notificacion.style.cssText = `
    position: fixed;
    top: 20px;
    right: 20px;
    padding: 1rem 1.5rem;
    border-radius: 12px;
    color: white;
    font-weight: 500;
    z-index: 10000;
    animation: slideIn 0.3s ease-out;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
  `;
  
  if (tipo === 'success') {
    notificacion.style.background = 'linear-gradient(135deg, #10b981, #059669)';
  } else if (tipo === 'error') {
    notificacion.style.background = 'linear-gradient(135deg, #ef4444, #dc2626)';
  } else {
    notificacion.style.background = 'linear-gradient(135deg, #667eea, #764ba2)';
  }
  
  document.body.appendChild(notificacion);
  
  setTimeout(() => {
    notificacion.style.animation = 'slideOut 0.3s ease-in';
    setTimeout(() => {
      notificacion.remove();
    }, 300);
  }, 3000);
}

// Agregar estilos de animación para notificaciones
const style = document.createElement('style');
style.textContent = `
  @keyframes slideIn {
    from {
      transform: translateX(400px);
      opacity: 0;
    }
    to {
      transform: translateX(0);
      opacity: 1;
    }
  }
  
  @keyframes slideOut {
    from {
      transform: translateX(0);
      opacity: 1;
    }
    to {
      transform: translateX(400px);
      opacity: 0;
    }
  }
`;
document.head.appendChild(style);

// Animación de aparición con Intersection Observer
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry, index) => {
    if (entry.isIntersecting) {
      setTimeout(() => {
        entry.target.style.opacity = '1';
        entry.target.style.transform = 'translateY(0)';
      }, index * 100);
      observer.unobserve(entry.target);
    }
  });
}, observerOptions);

// Animar cards cuando aparecen
document.querySelectorAll('.card').forEach(card => {
  card.style.opacity = '0';
  card.style.transform = 'translateY(30px)';
  card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
  observer.observe(card);
});

// Animar formulario
const form = document.querySelector('.formulario');
if (form) {
  form.style.opacity = '0';
  form.style.transform = 'translateY(30px)';
  form.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
  observer.observe(form);
}

// Efecto parallax suave en hero
window.addEventListener('scroll', () => {
  const hero = document.querySelector('.hero');
  if (hero) {
    const scrolled = window.pageYOffset;
    hero.style.transform = `translateY(${scrolled * 0.5}px)`;
  }
});

// Agregar efecto de hover mejorado a los inputs
document.querySelectorAll('input, textarea').forEach(input => {
  input.addEventListener('focus', function() {
    this.parentElement.style.transform = 'translateY(-2px)';
    this.parentElement.style.transition = 'transform 0.3s ease';
  });
  
  input.addEventListener('blur', function() {
    this.parentElement.style.transform = 'translateY(0)';
  });
});

console.log('✨ Sitio web cargado correctamente');