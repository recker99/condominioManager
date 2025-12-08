<?php
    if (session_status() === PHP_SESSION_NONE) session_start();

    // Inicializar
    if (!isset($_SESSION["ocupados"])) $_SESSION["ocupados"] = [];

    // RESERVAR
    if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["reservar"])) {
        $_SESSION["pendiente"] = [
            "nombre" => $_POST["nombre"],
            "patente" => $_POST["patente"],
            "depto"  => $_POST["depto"],
            "numero" => $_POST["numero"],
            "tiempo" => time() + 30
        ];
    }

    // CONFIRMAR
    if (isset($_POST["confirmar"]) && isset($_SESSION["pendiente"])) {
        $_SESSION["ocupados"][] = $_SESSION["pendiente"];
        unset($_SESSION["pendiente"]);
    }

    // CANCELAR
    if (isset($_POST["cancelar"])) unset($_SESSION["pendiente"]);
?>


<section id="reservar-section" class="container mb-4">

    <button class="btn btn-primary" onclick="document.getElementById('formReserva').classList.toggle('hidden')">
        Reservar estacionamiento
    </button>

   <div id="formReserva" class="hidden mt-3">
        <h4>Ingresar datos</h4>

        <form method="POST">
            <label for="nombre">Nombre</label>
            <input name="nombre" id="nombre" required>

            <label for="patente">Patente</label>
            <input name="patente" id="patente" required>

            <label for="depto">Departamento</label>
            <input name="depto" id="depto" required>

            <label for="numero">Seleccionar estacionamiento</label>
            <select name="numero" id="numero" required>
                <?php for ($i=1;$i<=2;$i++){
                    for ($j=1;$j<=20;$j++){
                        $num=$i . "-" . str_pad($j,2,"0",STR_PAD_LEFT);
                        echo "<option>$num</option>";
                    }
                }?>
            </select>

            <button name="reservar">Reservar</button>
        </form>
    </div>


</section>


<?php if (isset($_SESSION["pendiente"])): ?>
<section class="container mb-4">

<?php  
$left = $_SESSION["pendiente"]["tiempo"] - time();
if ($left < 0) $left = 0;
?>

<div class="alert alert-warning">
    <p><b>Estacionamiento:</b> <?= $_SESSION["pendiente"]["numero"] ?></p>
    <p id="contador">Confirmar en: <?= $left ?> segundos...</p>

    <form method="POST">
        <button name="confirmar" class="btn btn-success" id="btnOK" disabled>Confirmar</button>
        <button name="cancelar" class="btn btn-danger">Cancelar</button>
    </form>
</div>


    <script>
        let segundos = <?= $left ?>;
        let btn = document.getElementById("btnOK");

        let t = setInterval(()=>{
            segundos--;
            if(segundos<=0){
                btn.disabled = false;
                clearInterval(t);
                document.getElementById('contador').innerHTML = "Confirmar ahora.";
            }else{
                document.getElementById('contador').innerHTML="Confirmar en: "+segundos+" segundos";
            }
        },1000);
    </script>
<?php endif; ?>

<section id="parking-display" class="wide mt-4">

<h3>Estacionamientos disponibles</h3>

<div class="parking-grid">
    <?php
        $ocupados = array_column($_SESSION["ocupados"], "numero");
        for($i=1;$i<=2;$i++){
            for($j=1;$j<=20;$j++){
                $num=$i."-".str_pad($j,2,"0",STR_PAD_LEFT);
                $class = in_array($num,$ocupados) ? "slot ocupado" : "slot";
                echo "<div class='$class'>$num</div>";
            }
        }
    ?>
</div>

</section>


<section class="container mt-5">

<h3>Ocupados</h3>
<?php if(empty($_SESSION["ocupados"])): ?>
    <p>No hay ocupados.</p>
<?php else: ?>  
<table class="table">
<tr><th>Número</th><th>Nombre</th><th>Patente</th><th>Departamento</th></tr>

<?php foreach($_SESSION["ocupados"] as $o): ?>
<tr>
    <td><?= $o["numero"] ?></td>
    <td><?= $o["nombre"] ?></td>
    <td><?= $o["patente"] ?></td>
    <td><?= $o["depto"] ?></td>
</tr>
<?php endforeach; ?>
</table>
<?php endif; ?>

</section>
