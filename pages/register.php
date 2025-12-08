<?php
try {

    require_once __DIR__ . '/../config/db.php';
    $msg = '';
    $error = '';

    if ($_SERVER["REQUEST_METHOD"] === "POST") {

        $user = $_POST['usuario'];
        $email = $_POST['email'];
        $pass  = password_hash($_POST['password'], PASSWORD_DEFAULT);

        $sql = "INSERT INTO usuarios (usuario,email,password) VALUES (:u,:e,:p)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            ':u'=>$user,
            ':e'=>$email,
            ':p'=>$pass
        ]);

        $msg = "Usuario registrado";
    }

} catch(Exception $e) {
    file_put_contents("logs/register_error.log", $e->getMessage(), FILE_APPEND);
    $error = "No se pudo registrar";
}
?>

<h2>Registro de usuario</h2>
<div class="form-box">
    <form method="POST">
        <label for="usuario">Nombre:</label>
        <input type="text" name="usuario" id="usuario" required>

        <label for="email">Correo:</label>
        <input type="email" name="email" id="email" required>

        <label for="password">Contraseña:</label>
        <input type="password" name="password" id="password" required>

        <button type="submit">Registrarse</button>
    </form>
</div>


