        </main>
            <footer>
                <p>&copy; <?php echo date("Y"); ?> Condominio Manager. Todos los derechos reservados.</p>
            </footer>

        <!-- Bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <?php if (isset($_SESSION['usuario'])): ?>
            <script>var usuarioLogueado = true;</script>
            <script src="assets/js/notificaciones.js"></script>
        <?php endif; ?>

    </body>
</html>
