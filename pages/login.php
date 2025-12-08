<?php
try {

    require_once __DIR__ . '/../config/db.php';

    $error = '';

    if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $email = trim($_POST['email']);
    $password = $_POST['password'];

    $sql = "SELECT * FROM usuarios WHERE email = :email LIMIT 1";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':email', $email);
    $stmt->execute();

    $user = $stmt->fetch();

    if ($user && $password == $user['password']) {

        $_SESSION['usuario'] = $user['usuario'];
        $_SESSION['rol'] = $user['rol'];

        header("Location: index.php?page=home");
        exit;
    } else {
        echo "<div class='error-msg'>Correo o contraseña incorrectos.</div>";
    }
}


} catch(Exception $e) {

    file_put_contents("logs/login_error.log", $e->getMessage(), FILE_APPEND);
    $error = "Ha ocurrido un error iniciando sesión";
}
?>

<h2>Iniciar sesión</h2>

<div class="form-box">
    <?php if(!empty($error)) echo "<p class='error-msg'>$error</p>"; ?>

    <form method="POST">
        <label>Email</label>
        <input type="email" name="email" required>

        <label>Contraseña</label>
        <input type="password" name="password" required>

        <button type="submit">Entrar</button>
    </form>
</div>
