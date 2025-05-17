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

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />

	<title>AdminKit Demo - Bootstrap 5 Admin Template</title>

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
						<a class="sidebar-link" href="coordinador_encuestadores.html">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Encuestadores</span>
            </a>
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="coordinador_encuestas.html">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Encuestas</span>
            </a>
					</li>


					<li class="sidebar-header">
						Datos
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="coordinador_dashboard.html">
              <i class="align-middle" data-feather="check-square"></i> <span class="align-middle">Dashboards</span>
            </a>
					</li>

					
				</ul>

				
			</div>
		</nav>

		
		<div class="main">
			<div class="container-fluid p-0">
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
			
			<main class="content">
				<div class="container-fluid p-0">
			<div class="row">
				<!-- Tabla izquierda (Distritos) -->
				<div class="col-12 col-lg-6 d-flex">
					<div class="card flex-fill">
						<div class="card-header">
							<h5 class="card-title mb-0">Distrito</h5>
						</div>
						<table class="table table-hover my-0">
							<thead>
								<tr>
									<th>Nombre</th>
									<th>Acción</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Encuesta A</td>
									<td><button class="btn btn-primary btn-sm" onclick="mostrarTabla('encuestaA')">Ir al distrito</button></td>
								</tr>
								<tr>
									<td>Encuesta B</td>
									<td><button class="btn btn-primary btn-sm" onclick="mostrarTabla('encuestaB')">Ir al distrito</button></td>
								</tr>
								<tr>
									<td>Encuesta C</td>
									<td><button class="btn btn-primary btn-sm" onclick="mostrarTabla('encuestaC')">Ir al distrito</button></td>
								</tr>
								
						</table>
					</div>
				</div>
			
				<!-- Tabla derecha (Dinámica) -->
				<div class="col-12 col-lg-6 d-flex">
					<div class="card flex-fill">
						<div class="card-header d-flex justify-content-between align-items-center">
							<h5 class="card-title mb-0" id="tituloDistrito">Seleccione una Encuesta</h5>
						</div>
						<div id="tablaDinamica">
							<div class="card-body text-center py-5">
								<i class="fas fa-map-marker-alt fa-3x text-muted mb-3"></i>
								<p class="text-muted">Seleccione un encuesta para ver detalles</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Plantillas para las tablas dinámicas -->
			<div id="encuestaA-template" style="display:none;">
				<div class="col-12 col-lg-6">
					<div class="card">
						<div class="chart chart-sm" style="height: 300px;">
							<canvas id="chartjs-pie"></canvas>
						</div>
					</div>
				</div>

				<div class="card-footer text-center">
					<a href="dashboard.html" class="btn btn-outline-primary">Más información</a>
				</div>

			</div>
			
			<div id="encuestaB-template" style="display:none;">
				<div class="col-12 col-md-6 col-xxl-3 d-flex order-2 order-xxl-3">
					<div class="card flex-fill w-100">
						<div class="card-header">

							<h5 class="card-title mb-0">Browser Usage</h5>
						</div>
						<div class="card-body d-flex">
							<div class="align-self-center w-100">
								<div class="py-3">
									<div class="chart chart-xs">
										<canvas id="chartjs-dashboard-pie"></canvas>
									</div>
								</div>

								<table class="table mb-0">
									<tbody>
										<tr>
											<td>Chrome</td>
											<td class="text-end">4306</td>
										</tr>
										<tr>
											<td>Firefox</td>
											<td class="text-end">3801</td>
										</tr>
										<tr>
											<td>IE</td>
											<td class="text-end">1689</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="card-footer text-center">
					<a href="dashboard.html" class="btn btn-outline-primary">Más información</a>
				</div>

			</div>
			
			<div id="encuestaC-template" style="display:none;">
				<div class="col-12 col-md-6 col-xxl-3 d-flex order-2 order-xxl-3">
					<div class="card flex-fill w-100">
						<div class="card-header">

							<h5 class="card-title mb-0">Browser Usage</h5>
						</div>
						<div class="card-body d-flex">
							<div class="align-self-center w-100">
								<div class="py-3">
									<div class="chart chart-xs">
										<canvas id="chartjs-dashboard-pie"></canvas>
									</div>
								</div>

								<table class="table mb-0">
									<tbody>
										<tr>
											<td>Chrome</td>
											<td class="text-end">4306</td>
										</tr>
										<tr>
											<td>Firefox</td>
											<td class="text-end">3801</td>
										</tr>
										<tr>
											<td>IE</td>
											<td class="text-end">1689</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="card-footer text-center">
					<a href="dashboard.html" class="btn btn-outline-primary">Más información</a>
				</div>

			</div>
			
			
			
	</div>
</div>

	<script src="js/app.js"></script>
	
	<script src="js/app.js"></script>

	

	<script>
		function mostrarTabla(distrito) {
			const titulos = {
				'encuestaA': 'Encuesta A',
				'encuestaB': 'Encuesta B',
				'encuestaC': 'Encuesta C',
				
			};
			document.getElementById('tituloDistrito').textContent = titulos[distrito];
			
			const template = document.getElementById(distrito + '-template');
			const clone = template.cloneNode(true);
			clone.style.display = '';
			
			const container = document.getElementById('tablaDinamica');
			container.innerHTML = '';
			container.appendChild(clone);
			
			// Agregar eventos a los botones Banear
			const banearButtons = clone.querySelectorAll('.btn-danger');
			banearButtons.forEach(button => {
				button.addEventListener('click', function() {
					const row = this.closest('tr');
					const checkbox = row.querySelector('input[type="checkbox"]');
					checkbox.checked = !checkbox.checked;
					
					if(checkbox.checked) {
						this.classList.remove('btn-danger');
						this.classList.add('btn-secondary');
						this.textContent = 'Baneado';
					} else {
						this.classList.remove('btn-secondary');
						this.classList.add('btn-danger');
						this.textContent = 'Banear';
					}
				});
			});
		}
		</script>


	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var markers = [{
					coords: [31.230391, 121.473701],
					name: "Shanghai"
				},
				{
					coords: [28.704060, 77.102493],
					name: "Delhi"
				},
				{
					coords: [6.524379, 3.379206],
					name: "Lagos"
				},
				{
					coords: [35.689487, 139.691711],
					name: "Tokyo"
				},
				{
					coords: [23.129110, 113.264381],
					name: "Guangzhou"
				},
				{
					coords: [40.7127837, -74.0059413],
					name: "New York"
				},
				{
					coords: [34.052235, -118.243683],
					name: "Los Angeles"
				},
				{
					coords: [41.878113, -87.629799],
					name: "Chicago"
				},
				{
					coords: [51.507351, -0.127758],
					name: "London"
				},
				{
					coords: [40.416775, -3.703790],
					name: "Madrid "
				}
			];
			var map = new jsVectorMap({
				map: "world",
				selector: "#world_map",
				zoomButtons: true,
				markers: markers,
				markerStyle: {
					initial: {
						r: 9,
						strokeWidth: 7,
						stokeOpacity: .4,
						fill: window.theme.primary
					},
					hover: {
						fill: window.theme.primary,
						stroke: window.theme.primary
					}
				},
				zoomOnScroll: false
			});
			window.addEventListener("resize", () => {
				map.updateSize();
			});
		});
	</script>

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

	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4"></script>

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Definir colores si window.theme no existe
			const colors = {
				primary: '#4e73df',
				warning: '#f6c23e',
				danger: '#e74a3b',
				secondary: '#858796'
			};
			
			// Pie chart
			new Chart(document.getElementById("chartjs-pie"), {
				type: "pie",
				data: {
					labels: ["Social", "Search Engines", "Direct", "Other"],
					datasets: [{
						data: [260, 125, 54, 146],
						backgroundColor: [
							colors.primary,
							colors.warning,
							colors.danger,
							colors.secondary
						],
						borderColor: "transparent",
						borderWidth: 1
					}]
				},
				options: {
					responsive: true,
					maintainAspectRatio: false,
					plugins: {
						legend: {
							position: 'right',
						}
					}
				}
			});
		});
	</script>







</body>

</html>