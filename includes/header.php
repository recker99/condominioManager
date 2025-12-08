<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Condominio Manager</title>

    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- ICONS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

    <link rel="stylesheet" href="assets/styles.css">
</head>

<body>

<!-- Barra superior -->
<div class="topbar">
    <?php if (isset($_SESSION['usuario'])): ?>
        <span>Bienvenido, <?php echo htmlspecialchars($_SESSION['usuario']); ?></span>
        <div class="topbar-actions">
            <a href="index.php?page=logout" class="logout-btn">Cerrar sesión</a>
        </div>
    <?php else: ?>
        <div class="topbar-actions">
            <a href="index.php?page=login" class="login-btn">Iniciar sesión</a>
            <a href="index.php?page=register" class="register-btn">Registrarse</a>
        </div>
    <?php endif; ?>
</div>

<?php include(__DIR__ . "/navbar.php"); ?>

<main class="container my-3">
