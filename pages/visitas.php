<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
require_once("config/db.php"); // conexión a la DB
?>

<div class="container mt-4">
    <h2>Gestión de Visitas</h2>
    <p>Aquí se muestran las notificaciones de visitas que requieren estacionamiento.</p>

    <section id="visita-list" class="visita-list">
        <?php
        try {
            // Traer visitas activas (estado = 1)
            $sql = "SELECT * FROM visita WHERE estado = 1 ORDER BY fechaIngreso DESC";
            $stmt = $conn->query($sql);
            $visitas = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (empty($visitas)) {
                echo "<p>No hay visitas registradas.</p>";
            } else {
                foreach ($visitas as $v) {
                    echo "<div class='visita-item'>";
                        echo "<div class='visita-info'>";
                            echo "<div class='visita-title'>{$v['nombres']} viene de visita</div>";
                            echo "<div class='visita-meta'>";
                                echo "Aviso: " . date("d/m/Y H:i", strtotime($v['fechaIngreso'])) . 
                                     " — Destino: {$v['destino']} — Patente: {$v['patente']} — Estacionamiento: {$v['estacionamiento']}";
                            echo "</div>";
                        echo "</div>";

                        echo "<div class='visita-actions'>";
                            echo "<a href='index.php?page=estacionamientos' class='btn-est'>Estacionamiento</a>";
                        echo "</div>";
                    echo "</div>";
                }
            }
        } catch (PDOException $e) {
            echo "<p>Error al cargar visitas: " . $e->getMessage() . "</p>";
        }
        ?>
    </section>
</div>
