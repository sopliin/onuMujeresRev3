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

	<link rel="canonical" href="https://demo-basic.adminkit.io/pages-profile.html" />

	<title>Profile | AdminKit Demo</title>

	<link href="css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="pagina_inicio.html">
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

					<li class="sidebar-item">
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

					<div class="mb-3">
						<h1 class="h3 d-inline align-middle">Perfil</h1>
						<!--
						<a class="badge bg-dark text-white ms-2" href="upgrade-to-pro.html">
      Get more page examples
  </a>
					</div>
				-->
					<div class="row">
						<div class="col-md-4 col-xl-3">
							<div class="card mb-3">
								<!--
								<div class="card-header">
									<h5 class="card-title mb-0">Profile Details</h5>
								</div>
								-->
								<div class="card-body text-center">
									<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0wJdLOzpqq8A0RDKqPmxBQ1On12XYtQ1OnQ&s" alt="Christina Mason" class="img-fluid rounded-circle mb-2" width="128" height="128" />
									<h5 class="card-title mb-0">Menganito</h5>
									<div class="text-muted mb-2">Administrador</div>
									<!--
									<div>
										<a class="btn btn-primary btn-sm" href="#">Follow</a>
										<a class="btn btn-primary btn-sm" href="#"><span data-feather="message-square"></span> Message</a>
									</div>
									-->
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Habilidades</h5>
									<a href="#" class="badge bg-primary me-1 my-1">HTML</a>
									<a href="#" class="badge bg-primary me-1 my-1">Base de Datos</a>
									<a href="#" class="badge bg-primary me-1 my-1">Comunicacion</a>
									<a href="#" class="badge bg-primary me-1 my-1">Liderazgo</a>
									<a href="#" class="badge bg-primary me-1 my-1">Java</a>

								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Acerca de mi</h5>
									<ul class="list-unstyled mb-0">
										<li class="mb-1"><span data-feather="home" class="feather-sm me-1"></span> Vive en <a href="#">Zona norte - Chorrillos</a></li>
								
										<li class="mb-1"><span data-feather="briefcase" class="feather-sm me-1"></span> Trabaja en<a href="#"> Administrador de Clubes Deportivos </a></li>
										<li class="mb-1"><span data-feather="map-pin" class="feather-sm me-1"></span> De <a href="#">Lima</a></li>
									</ul>
								</div>
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Otras Opciones</h5>
									<ul class="list-unstyled mb-0">

									  <li class="mb-2 position-relative">
										<a href="cambiar-contraseña-administrador.html" class="btn btn-secondary w-100 position-relative text-center">
											<i class="position-absolute start-0 ms-3 top-50 translate-middle-y" data-feather="edit"></i>
											Cambiar contraseña</a>
									  </li>
	
									
									  <li class="mb-2 position-relative">
										<a href="#" class="btn btn-secondary w-100 position-relative text-center">
										  <i class="position-absolute start-0 ms-3 top-50 translate-middle-y" data-feather="image"></i>
										  Cambiar foto
										</a>
									  </li>
									  
									  

									  <li class="mb-2">
										<a href="crearCoordinador.html" class="btn btn-success w-100">
										  <i class="align-middle me-2" data-feather="user-plus"></i>
										  Crear Usuario-coordinador
										</a>
									  </li>
									  
									</ul>
									
								</div>
							</div>
						</div>

						<div class="col-md-8 col-xl-9">
							<div class="card">
								<div class="card-header">

									<h5 class="card-title mb-0">Actividades Recientes</h5>
								</div>
								<div class="card-body h-100">

									<div class="d-flex align-items-start">
										<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0wJdLOzpqq8A0RDKqPmxBQ1On12XYtQ1OnQ&s" width="36" height="36" class="rounded-circle me-2" alt="Vanessa Tucker">
										<div class="flex-grow-1">
											<small class="float-end text-navy">5m ago</small>
											<strong>Menganito</strong> ha  <strong> desbaneado a fulanito </strong><br />
											<small class="text-muted">Today 7:51 pm</small><br />

										</div>
									</div>

									<hr />
									<div class="d-flex align-items-start">
										<img src="https://www.jammable.com/cdn-cgi/image/width=3840,quality=25,format=webp/https://imagecdn.voicify.ai/models/2a708d1b-2bd8-444d-b9d2-14e9d8e3ce27.png" width="36" height="36" class="rounded-circle me-2" alt="Charles Hall">
										<div class="flex-grow-1">
											<small class="float-end text-navy">30m ago</small>
											<strong>Fulanito</strong> requiere tu permiso para cambiar de direccion <strong></strong><br />
											<small class="text-muted">Today 7:21 pm</small>

											<!--
											<div class="border text-sm text-muted p-2 mt-1">
												Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus
												pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.
											</div>
											-->
											<!--img/avatars/avatar-4.jpg
											<a href="#" class="btn btn-sm btn-danger mt-1"><i class="feather-sm" data-feather="heart"></i> Like</a>
										-->
										</div>
									</div>

									<hr />
									<div class="d-flex align-items-start">
										<img src="https://www.jammable.com/cdn-cgi/image/width=3840,quality=25,format=webp/https://imagecdn.voicify.ai/models/2a708d1b-2bd8-444d-b9d2-14e9d8e3ce27.png" width="36" height="36" class="rounded-circle me-2" alt="Christina Mason">
										<div class="flex-grow-1">
											<small class="float-end text-navy">1h ago</small>
											<strong>Fulanito</strong> ha logrado descargar los reportes de la Zona Norte<br />

											<small class="text-muted">Today 6:35 pm</small>
										</div>
									</div>

									<hr />
									<div class="d-flex align-items-start">
										<img src="https://www.jammable.com/cdn-cgi/image/width=3840,quality=25,format=webp/https://imagecdn.voicify.ai/models/2a708d1b-2bd8-444d-b9d2-14e9d8e3ce27.png" width="36" height="36" class="rounded-circle me-2" alt="William Harris">
										<div class="flex-grow-1">
											<small class="float-end text-navy">3h ago</small>
											<strong>fulanito</strong> ha tomado las fotos de su encuestas realizadas a mano <strong></strong>	<br />
											<small class="text-muted">Today 5:12 pm</small>

											<div class="row g-0 mt-1">
												<div class="col-6 col-md-4 col-lg-4 col-xl-3">
													<img src="https://imgv2-2-f.scribdassets.com/img/document/39740993/original/fa704adf3a/1?v=1" class="img-fluid pe-2" alt="Unsplash">
												</div>
												<div class="col-6 col-md-4 col-lg-4 col-xl-3">
													<img src="https://imgv2-2-f.scribdassets.com/img/document/385374297/original/e476aa6ad9/1?v=1" class="img-fluid pe-2" alt="Unsplash">
												</div>
											</div>

											<a href="#" class="btn btn-sm btn-danger mt-1"><i class="feather-sm" data-feather="heart"></i> Like</a>
										</div>
									</div>

									<hr />
									<!--
									<div class="d-flex align-items-start">
										<img src="img/avatars/avatar-2.jpg" width="36" height="36" class="rounded-circle me-2" alt="William Harris">
										<div class="flex-grow-1">
											<small class="float-end text-navy">1d ago</small>
											<strong>William Harris</strong> started following <strong>Christina Mason</strong><br />
											<small class="text-muted">Yesterday 3:12 pm</small>

											<div class="d-flex align-items-start mt-1">
												<a class="pe-3" href="#">
                <img src="img/avatars/avatar-4.jpg" width="36" height="36" class="rounded-circle me-2" alt="Christina Mason">
              </a>
												<div class="flex-grow-1">
													<div class="border text-sm text-muted p-2 mt-1">
														Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus.
													</div>
												</div>
											</div>
										</div>
									</div>
									-->
									<!--
									<hr />
									<div class="d-flex align-items-start">
										<img src="img/avatars/avatar-4.jpg" width="36" height="36" class="rounded-circle me-2" alt="Christina Mason">
										<div class="flex-grow-1">
											<small class="float-end text-navy">1d ago</small>
											<strong>Christina Mason</strong> posted a new blog<br />
											<small class="text-muted">Yesterday 2:43 pm</small>
										</div>
									</div>

									<hr />
									<div class="d-flex align-items-start">
										<img src="img/avatars/avatar.jpg" width="36" height="36" class="rounded-circle me-2" alt="Charles Hall">
										<div class="flex-grow-1">
											<small class="float-end text-navy">1d ago</small>
											<strong>Charles Hall</strong> started following <strong>Christina Mason</strong><br />
											<small class="text-muted">Yesterdag 1:51 pm</small>
										</div>
									</div>

									<hr />
									-->
									<div class="d-grid">
										<a href="#" class="btn btn-primary">Cargar mas</a>
									</div>
								</div>
							</div>
						</div>
					</div>

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

</body>

</html>