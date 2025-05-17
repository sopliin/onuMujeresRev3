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
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/pages-sign-in.html" />

	<title>Sign In | AdminKit Demo</title>

	<link href="css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<style>
		.error-message {
			color: red;
		}
	</style>
</head>

<body>
<main class="d-flex w-100">
	<div class="container d-flex flex-column">
		<div class="row vh-100">
			<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
				<div class="d-table-cell align-middle">

					<div class="text-center mt-4">
						<h1 class="h2">Iniciar Sesion</h1>
						<p class="lead">
							ONU Mujeres
						</p>
					</div>

					<div class="card">
						<div class="card-body">
							<div class="m-sm-4">
								<c:if test="${not empty errorLogin}">
									<div class="alert alert-danger" role="alert">
											${errorLogin}
									</div>
								</c:if>
								<form method="post" action="auth?action=login">
									<div class="mb-3">
										<label class="form-label">Email</label>
										<input class="form-control form-control-lg" type="email" name="correo"
											   placeholder="Ingresa tu correo" required />
									</div>
									<div class="mb-3">
										<label class="form-label">Contraseña</label>
										<input class="form-control form-control-lg" type="password" name="contrasena"
											   placeholder="Ingresa tu contraseña" required />
										<small>
											<a href="index.html">¿Olvidaste tu contraseña?</a>
										</small>
									</div>
									<div>
										<label class="form-check">
										</label>
									</div>
									<div class="card-body text-center">
										<div class="d-flex flex-column align-items-center mt-3">
											<button type="submit" class="btn btn-primary w-75">Iniciar Sesión</button>
										</div>
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

</body>

</html>