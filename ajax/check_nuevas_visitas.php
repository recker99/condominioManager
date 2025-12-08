<?php
// ajax/check_nuevas_visitas.php
include_once '../config/db.php';
header('Content-Type: application/json');

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Selecciona visitas nuevas que todavía no han sido notificadas
    $stmt = $pdo->prepare("SELECT * FROM Visita WHERE estado = 0 AND estacionamiento IS NOT NULL ORDER BY id_visita ASC");
    $stmt->execute();
    $nuevas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['nuevas' => $nuevas]);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
