<?php

require_once __DIR__ . '/../config/db.php'; // conexión PDO a DB

// Guardamos la última visita conocida en sesión
session_start();
if (!isset($_SESSION['last_visit_id'])) {
    $_SESSION['last_visit_id'] = 0; // si no hay, comenzamos desde 0
}

try {
    // Selecciona visitas nuevas
    $stmt = $conn->prepare("SELECT * FROM Visita WHERE id_visita > :last_id ORDER BY id_visita ASC");
    $stmt->execute(['last_id' => $_SESSION['last_visit_id']]);
    $new_visits = $stmt->fetchAll();

    // Actualiza el último id conocido
    if (!empty($new_visits)) {
        $last_id = end($new_visits)['id_visita'];
        $_SESSION['last_visit_id'] = $last_id;
    }

    // Devuelve JSON
    header('Content-Type: application/json');
    echo json_encode(['new_visits' => $new_visits]);
} catch (PDOException $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
