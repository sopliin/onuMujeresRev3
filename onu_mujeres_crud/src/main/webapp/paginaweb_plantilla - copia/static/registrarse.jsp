<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords"
		  content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/pages-sign-up.html" />

	<title>Sign Up | AdminKit Demo</title>

	<link href="css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
<main class="d-flex w-100">
	<div class="container d-flex flex-column">
		<div class="row vh-100">
			<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
				<div class="d-table-cell align-middle">

					<div class="text-center mt-4">
						<h1 class="h2">Registrarse</h1>
						<p class="lead">
							ONU Mujeres
						</p>
					</div>

					<div class="card">
						<div class="card-body">
							<div class="m-sm-4">
								<c:if test="${not empty errorRegistro}">
									<div class="alert alert-danger" role="alert">
											${errorRegistro}
									</div>
								</c:if>
								<c:if test="${not empty registroExito}">
									<div class="alert alert-success" role="alert">
											${registroExito}
									</div>
								</c:if>
								<form method="post" action="auth?action=register">
									<div class="mb-3">
										<label class="form-label">Nombre</label>
										<input class="form-control form-control-lg" type="text" name="nombre"
											   placeholder="Ingresa tu nombre" required />
									</div>
									<div class="mb-3">
										<label class="form-label">Correo electronico</label>
										<input class="form-control form-control-lg" type="email" name="correo"
											   placeholder="Ingresa tu correo electronico" required />
									</div>
									<div class="mb-3">
										<label class="form-label">Contraseña</label>
										<input class="form-control form-control-lg" type="password" name="contrasena"
											   placeholder="Ingresa tu contraseña" required />
									</div>
									<div class="mb-3">
										<label class="form-label">Confirmar contraseña</label>
										<input class="form-control form-control-lg" type="password"
											   name="confirmContrasena" placeholder="Vuelve a ingresar tu contraseña"
											   required />
									</div>
									<div class="text-center mt-3">
										<button type="submit" class="btn btn-lg btn-primary">Registrarse</button>
									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</main>

<script src="js/app.js"></script>
<script>
	document.querySelector('form').addEventListener('submit', function (event) {
		const password = document.querySelector('input[name="contrasena"]').value;
		const confirmPassword = document.querySelector('input[name="confirmContrasena"]').value;

		if (password !== confirmPassword) {
			alert('Las contraseñas no coinciden');
			event.preventDefault();
		}
	});
</script>
</body>

</html>