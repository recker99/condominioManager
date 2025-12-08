<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>

<h1>Bienvenido a Condominio Manager</h1>
    <p>Tu sistema de administración de condominio, seguro y fácil de usar.</p>
    <p>Selecciona una de las opciones disponibles para comenzar:</p>
<div class="cards-container">
    <div class="card">
        <img src="assets/img/quin.jpeg" alt="Quincho">
        <h3>Quincho</h3>
    </div>
        <div class="card">
            <a href="index.php?page=lavanderia">
                <img src="assets/img/lav.jpg" alt="Lavandería">
            </a>
            <h3>Lavandería</h3>
        </div>
            <div class="card">
                <a href="index.php?page=estacionamientos">
                    <img src="assets/img/est.png" alt="Estacionamientos">
                </a>
                <h3>Estacionamientos</h3>
            </div>
                <div class="card">
                     <a href="index.php?page=encomiendas">
                        <img src="assets/img/enco.jpg" alt="Encomiendas">
                    </a>
                    <h3>Encomiendas</h3>
                </div>
        <div class="card">
            <a href="index.php?page=visitas">
                <img src="assets/img/vis.jpg" alt="Visitas">
            </a>
            <h3>Visitas</h3>
        </div>

    <div class="card">
        <img src="assets/img/smu.png" alt="Sala Multiuso">
        <h3>Sala Multiuso</h3>
    </div>
</div>

<?php include(__DIR__ . "/../includes/footer.php"); ?>
