<?php
try {

    if(!isset($_SESSION['usuario'])){
        header("Location: index.php?page=login");
        exit;
    }

} catch(Exception $e) {
    file_put_contents("logs/welcome_error.log", $e->getMessage(), FILE_APPEND);
    echo "Error verificando sesión";
}
?>

    <h1>Bienvenido, <?php echo htmlspecialchars($_SESSION['usuario']); ?> </h1>
        <p>Has iniciado sesión correctamente en <strong>Condominio Manager</strong>.</p>
        <p>Desde aquí podrás administrar tu condominio.</p>

    <a href="index.php?page=logout">Cerrar sesión</a>


