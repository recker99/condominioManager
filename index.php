<?php
session_start();

try {
    require_once "config/db.php";
    require_once "includes/header.php";

    $page = $_GET['page'] ?? 'login';

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

} catch(Exception $e) {

    file_put_contents("logs/index_error.log", $e->getMessage(), FILE_APPEND);
    echo "<h2>Error cargando la página.</h2>";
}
