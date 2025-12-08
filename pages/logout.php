<?php

//  que la sesión esté iniciada 
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Limpia todas las variables de sesión
$_SESSION = [];

//  eliminar la cookie de sesión en el cliente
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(
        session_name(),
        '',
        time() - 42000,
        $params["path"],
        $params["domain"],
        $params["secure"] ?? false,
        $params["httponly"] ?? true
    );
}

// Destruye la sesión en el servidor
session_unset();
session_destroy();

// Redirigir al login 
header("Location: index.php?page=login");
exit();
