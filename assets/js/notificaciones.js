// Revisar DB cada 5 minutos (300000 ms)
setInterval(checkNuevasVisitas, 300000); 
// también al cargar la página
document.addEventListener('DOMContentLoaded', checkNuevasVisitas);

let visitasNotificadas = new Set();

function checkNuevasVisitas() {
    fetch('ajax/check_nuevas_visitas.php')
        .then(response => response.json())
        .then(data => {
            if (data.nuevas && data.nuevas.length > 0) {
                // Filtrar solo las nuevas que aún no hemos notificado
                let nuevasSinNotificar = data.nuevas.filter(v => !visitasNotificadas.has(v.id_visita));
                if(nuevasSinNotificar.length > 0) {
                    alert(`Tienes ${nuevasSinNotificar.length} nueva(s) visita(s) con estacionamiento.`);
                    mostrarNotificacion(nuevasSinNotificar.length);

                    // Marcar como notificadas
                    nuevasSinNotificar.forEach(v => visitasNotificadas.add(v.id_visita));
                }
            }
        })
        .catch(err => console.error('Error al revisar visitas:', err));
}

function mostrarNotificacion(cantidad) {
    let container = document.getElementById('notificacion-visita');
    if (!container) {
        container = document.createElement('div');
        container.id = 'notificacion-visita';
        container.style.position = 'fixed';
        container.style.top = '20px';
        container.style.right = '20px';
        container.style.background = '#ffc107';
        container.style.color = '#333';
        container.style.padding = '12px 20px';
        container.style.borderRadius = '8px';
        container.style.boxShadow = '0 2px 8px rgba(0,0,0,0.2)';
        container.style.zIndex = '9999';
        container.style.cursor = 'pointer';
        container.style.fontWeight = 'bold';
        container.addEventListener('click', () => {
            container.style.display = 'none';
        });
        document.body.appendChild(container);
    }
    container.textContent = `¡Tienes ${cantidad} nueva(s) visita(s) con estacionamiento! (clic para cerrar)`;
    container.style.display = 'block';
}
