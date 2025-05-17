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

	<link rel="canonical" href="https://demo-basic.adminkit.io/ui-forms.html" />

	<title>Forms | AdminKit Demo</title>

	<link href="css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html">
          <span class="align-middle">ONU Mujeres</span>
        </a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						Encuestas
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="encuestador_encuestadas.html">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Encuestas totales</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="encuestador_encuestas_completadas.html">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Encuestas completadas</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="encuestador_encuestas_progreso.html">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Encuestas en progreso</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="encuestador_encuestas_sin_completar.html">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Encuestas por hacer</span>
            </a>
					</li>

					<li class="sidebar-header">
						Formulario
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="encuestador_formulario.html">
              <i class="align-middle" data-feather="check-square"></i> <span class="align-middle">Forms</span>
            </a>
					</li>

					
				</ul>

				
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown">
							
						
						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                <i class="align-middle" data-feather="settings"></i>
              </a>

							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                <img src="img/avatars/avatar.jpg" class="avatar img-fluid rounded me-1" alt="Charles Hall" /> <span class="text-dark">Charles Hall</span>
              </a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="coordinador_ver_tu_perfil.html"><i class="align-middle me-1" data-feather="pie-chart"></i> Ver Perfil</a>
								<div class="dropdown-divider"></div>
								
								<a class="dropdown-item" href="pagina_inicio.html">Cerrar Sesión</a>


							</div>
						</li>
					</ul>
				</div>
			</nav>

		<div class="main">
			

			<main class="content">
				<div class="container-fluid p-0">
					<div class="row">
						<!-- Columna izquierda (Calendario) -->
						<div class="col-12 col-md-4 col-xxl-3 order-1">
							<div class="card flex-fill">
								<div class="card-header">
									<h5 class="card-title mb-0">Fecha de la entrevista</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										<div class="chart">
											<div id="datetimepicker-dashboard"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
				
						<!-- Columna derecha (Encuesta principal) -->
						<div class="col-12 col-md-8 col-xxl-9 order-2">
							<div class="mb-3">
								<h1 class="h3 d-inline align-middle">Datos generales</h1>
							</div>
							
							<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0">Nombres y apellidos de la persona que encuesta</h5>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" placeholder="Colocar el nombre y apellido de la persona que encuestada">
								</div>

								<div class="card-header">
									<h5 class="card-title mb-0">Nombres del asentamiento humano</h5>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" placeholder="Colocar el nombre del asentamiento humano">
								</div>

								<div class="card-header">
									<h5 class="card-title mb-0">Nombres del sector</h5>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" placeholder="Colocar el nombre del sector">
								</div>
							</div>
				
						</div>
					</div>
				
					<div class="mt-3 ">
						<h1 class="h3 d-inline align-middle">Datos del encuestado</h1>
					</div>

					<!-- Fila para las dos encuestas adicionales -->
					
						<!-- Encuesta Adicional 1 (Izquierda) -->
						<div class="col-12 col-md-6 ">
							
							<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0">Nombres y apellidos del encuestado</h5>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" placeholder="Colocar los nombres y apellidos del encuestado">
								</div>

								<div class="card-header">
									<h5 class="card-title mb-0">Edad del encuestado</h5>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" placeholder="Colocar la edad del encuestado">
								</div>

								<div class="card-header">
									<h5 class="card-title mb-0">Direccion del encuestado</h5>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" placeholder="Colocar la direccion del encuestado">
								</div>

								<div class="card-header">
									<h5 class="card-title mb-0">Numero celular del encuestado (opcional)</h5>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" placeholder="Colocar el numero celular del encuestado">
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0">¿Hay niños/niñas de 0 a 5 años en el hogar?</h5>
								</div>
								<div>
									<label class="form-check ms-3">  <!-- margen izquierdo de 1rem (16px) -->
										<input class="form-check-input" type="radio" value="option1" name="radios-example" checked>
										<span class="form-check-label">
										   Si
										</span>
									</label>
									<label class="form-check ms-3">  <!-- margen izquierdo de 1rem (16px) -->
										<input class="form-check-input" type="radio" value="option1" name="radios-example" checked>
										<span class="form-check-label">
										   No
										</span>
									</label>
																		
								</div>

								<div class="card-header">
									<h5 class="card-title mb-0">¿Cuántos niños/niñas de 0 a 5 años hay en el hogar?
										</h5>
								</div>
								<div class="card-body">
									<input type="text" class="form-control" placeholder="Respuesta">
								</div>

								<div class="card-header">
									<h5 class="card-title mb-0">¿Asisten a una guardería o preescolar?</h5>
								</div>
								<div>
									<label class="form-check ms-3">  <!-- margen izquierdo de 1rem (16px) -->
										<input class="form-check-input" type="radio" value="option1" name="radios-example" checked>
										<span class="form-check-label">
										   Si
										</span>
									</label>
									<label class="form-check ms-3">  <!-- margen izquierdo de 1rem (16px) -->
										<input class="form-check-input" type="radio" value="option1" name="radios-example" checked>
										<span class="form-check-label">
										   No
										</span>
									</label>
								
								</div>
							</div>
							
							
						</div>
				
						<!-- Encuesta Adicional 2 (Derecha) -->
						
					
				</div>

				</div>

				<div class="mt-3 d-flex justify-content-center">
					<button class="btn btn-primary me-2">Entregar</button>
					<button class="btn btn-primary">Guardar</button>
				</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>AdminKit</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="js/app.js"></script>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
			var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
			document.getElementById("datetimepicker-dashboard").flatpickr({
				inline: true,
				prevArrow: "<span title=\"Previous month\">&laquo;</span>",
				nextArrow: "<span title=\"Next month\">&raquo;</span>",
				defaultDate: defaultDate
			});
		});
	</script>

</body>

</html>