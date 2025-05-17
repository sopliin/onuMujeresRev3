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

					<li class="sidebar-item active">
						<a class="sidebar-link" href="administrador_coordinadores.html">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Coordinadores</span>
            </a>
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="administrador_encuestas.html">
              <i class="align-middle" data-feather="book"></i> <span class="align-middle">Encuestas</span>
            </a>
					</li>


					<li class="sidebar-header">
						Datos
					</li>

					<li class="sidebar-item">
						<a class="sidebar-link" href="administrador_dashboard.html">
              <i class="align-middle" data-feather="check-square"></i> <span class="align-middle">Dashboards</span>
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
								<a class="dropdown-item" href="administrador_ver_tu_perfil.html"><i class="align-middle me-1" data-feather="pie-chart"></i> Ver Perfil</a>
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
									<td>Coordinador A</td>
									<td><button class="btn btn-primary btn-sm" onclick="mostrarTabla('sanMartin')">Ir al coordinador</button></td>
								</tr>
								<tr>
									<td>Cordinador B</td>
									<td><button class="btn btn-primary btn-sm" onclick="mostrarTabla('laLibertad')">Ir al coordinador</button></td>
								</tr>
							
							</tbody>
						</table>
					</div>
				</div>
			
				<!-- Tabla derecha (Dinámica) -->
				<div class="col-12 col-lg-6 d-flex">
					<div class="card flex-fill">
						<div class="card-header d-flex justify-content-between align-items-center">
							<h5 class="card-title mb-0" id="tituloDistrito">Seleccione un distrito</h5>
						</div>
						<div id="tablaDinamica">
							<div class="card-body text-center py-5">
								<i class="fas fa-map-marker-alt fa-3x text-muted mb-3"></i>
								<p class="text-muted">Seleccione un distrito para ver detalles</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Plantillas para las tablas dinámicas -->
			<div id="sanMartin-template" style="display:none;">
				<table class="table table-hover my-0">
					<thead>
						<tr>
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Estado</th>
							<td><button class="btn btn-danger btn-sm">Banear</button></td>
							<td><button class="btn btn-danger btn-sm">Banear Coordinador</button></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>52455</td>
							<td>Jaun</td>
							<td>13/43</td>
							<td><input type="checkbox" class="form-check-input"></td>
							<td>
								<a class="btn btn-primary btn-sm" href="coordinador_ver_otro_perfil.html">
								  Ir a su perfil
								</a>
							  </td>
						
						</tr>
						<tr>
							<td>545234</td>
							<td>Matias</td>
							<td>50/50</td>
							
							<td><input type="checkbox" class="form-check-input"></td>
							
						</tr>
					</tbody>
				</table>
			</div>
			
			<div id="laLibertad-template" style="display:none;">
				<table class="table table-hover my-0">
					<thead>
						<tr>
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Estado</th>
							<td><button class="btn btn-danger btn-sm">Banear</button></td>
							<td><button class="btn btn-danger btn-sm">Banear coordinador</button></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>52434</td>
							<td>Hernandez</td>
							<td>24/43</td>
							<td><input type="checkbox" class="form-check-input"></td>
							
						</tr>
						<tr>
							<td>75345</td>
							<td>Gabriel</td>
							<td>10/50</td>
							
							<td><input type="checkbox" class="form-check-input"></td>
							
						</tr>
					</tbody>
				</table>
			</div>
			
			<div id="comas-template" style="display:none;">
				<table class="table table-hover my-0">
					<thead>
						<tr>
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Estado</th>
							<td><button class="btn btn-danger btn-sm">Banear</button></td>
							<td><button class="btn btn-danger btn-sm">Asignar</button></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>8657654</td>
							<td>Lupe</td>
							<td>40/40</td>
							<td><input type="checkbox" class="form-check-input"></td>
							<td><input type="checkbox" class="form-check-input"></td>
						</tr>
						<tr>
							<td>51245234</td>
							<td>Nestoy</td>
							<td>50/50</td>
							
							<td><input type="checkbox" class="form-check-input"></td>
							<td><input type="checkbox" class="form-check-input"></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div id="independencia-template" style="display:none;">
				<table class="table table-hover my-0">
					<thead>
						<tr>
							<th>Codigo</th>
							<th>Nombre</th>
							<th>Estado</th>
							<td><button class="btn btn-danger btn-sm">Banear</button></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>12332</td>
							<td>Jaun</td>
							<td>13/43</td>
							<td><input type="checkbox" class="form-check-input"></td>
						</tr>
						<tr>
							<td>545234</td>
							<td>Matias</td>
							<td>50/50</td>
							
							<td><input type="checkbox" class="form-check-input"></td>
						</tr>
					</tbody>
				</table>
			</div>
			
	</div>

	<script src="js/app.js"></script>
	

	<script>
		function mostrarTabla(distrito) {
			const titulos = {
				'sanMartin': 'Coordinador A, encuestadores a cargo', 
				'laLibertad': 'Coordinador B, encuestadores a cargo',
				'comas': 'Comas',
				'independencia': 'Independencia'
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
			var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
			var gradient = ctx.createLinearGradient(0, 0, 0, 225);
			gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
			gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
			// Line chart
			new Chart(document.getElementById("chartjs-dashboard-line"), {
				type: "line",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "Sales ($)",
						fill: true,
						backgroundColor: gradient,
						borderColor: window.theme.primary,
						data: [
							2115,
							1562,
							1584,
							1892,
							1587,
							1923,
							2566,
							2448,
							2805,
							3438,
							2917,
							3327
						]
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					tooltips: {
						intersect: false
					},
					hover: {
						intersect: true
					},
					plugins: {
						filler: {
							propagate: false
						}
					},
					scales: {
						xAxes: [{
							reverse: true,
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}],
						yAxes: [{
							ticks: {
								stepSize: 1000
							},
							display: true,
							borderDash: [3, 3],
							gridLines: {
								color: "rgba(0,0,0,0.0)"
							}
						}]
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-dashboard-pie"), {
				type: "pie",
				data: {
					labels: ["Chrome", "Firefox", "IE"],
					datasets: [{
						data: [4306, 3801, 1689],
						backgroundColor: [
							window.theme.primary,
							window.theme.warning,
							window.theme.danger
						],
						borderWidth: 5
					}]
				},
				options: {
					responsive: !window.MSInputMethodContext,
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					cutoutPercentage: 75
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Bar chart
			new Chart(document.getElementById("chartjs-dashboard-bar"), {
				type: "bar",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "This year",
						backgroundColor: window.theme.primary,
						borderColor: window.theme.primary,
						hoverBackgroundColor: window.theme.primary,
						hoverBorderColor: window.theme.primary,
						data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
						barPercentage: .75,
						categoryPercentage: .5
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					scales: {
						yAxes: [{
							gridLines: {
								display: false
							},
							stacked: false,
							ticks: {
								stepSize: 20
							}
						}],
						xAxes: [{
							stacked: false,
							gridLines: {
								color: "transparent"
							}
						}]
					}
				}
			});
		});
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

</body>

</html>