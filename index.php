<?php
session_start();

try {
    require_once "config/db.php";

    $page = $_GET['page'] ?? 'login';

    require_once "includes/header.php";

    switch ($page) {
        case 'login':
            require "pages/login.php";
            break;
        case 'register':
            require "pages/register.php";
            break;
        case 'welcome':
            require "pages/welcome.php";
            break;
        case 'visitas':
            require "pages/visitas.php";
            break;
        case 'estacionamientos':
            require "pages/estacionamientos.php";
            break;
        case 'logout':
            require "pages/logout.php";
            break;
        default:
            require "pages/home.php";
            break;
    }

    require_once "includes/footer.php";

    // 👇 si está logueado y NO es login/register:
    if (isset($_SESSION['usuario']) && !in_array($page, ['login','register'])) {
        echo '<script src="assets/js/notificaciones.js"></script>';
    }

} catch(Exception $e) {
    file_put_contents("logs/index_error.log", $e->getMessage(), FILE_APPEND);
    echo "<h2>Error cargando la página.</h2>";
}
