<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<title>Crear Cuenta</title>
<link href="<%=request.getContextPath()%>/img/icono.png" rel="icon"
	type="image/x-icon" />
<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
<link href="https://fonts.googleapis.com" rel="preconnect" />
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<script>
	tailwind.config = {
		darkMode : "class",
		theme : {
			extend : {
				colors : {
					primary : "#13a4ec",
					"background-light" : "#f6f7f8",
					"background-dark" : "#101c22"
				},
				fontFamily : {
					display : [ "Inter", "sans-serif" ]
				}
			}
		}
	}
</script>
<style>
body {
	min-height: max(884px, 100dvh);
}
</style>
</head>
<body
	class="bg-background-light dark:bg-background-dark font-display flex items-center justify-center min-h-screen bg-cover bg-center"
	style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('<%=request.getContextPath()%>/img/fondo.png');">
	<div
		class="w-full max-w-md bg-white/95 dark:bg-gray-900/90 backdrop-blur-sm rounded-xl shadow-lg p-8 text-center">
		<svg class="w-12 h-12 mx-auto text-primary" fill="none"
			stroke="currentColor" viewBox="0 0 24 24">
<path d="M12 6v6m0 0v6m0-6h6m-6 0H6" stroke-linecap="round"
				stroke-linejoin="round" stroke-width="2"></path>
</svg>
		<h1 class="text-3xl font-bold text-gray-800 dark:text-white mt-4">Crear
			Cuenta</h1>
		<p class="text-gray-600 dark:text-gray-400 mt-2">Completa tus
			datos para registrarte</p>

		<form class="space-y-5 mt-6" action="#" method="post">
			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">badge</span>
				<input id="dni" type="text" placeholder="DNI" maxlength="8" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">person</span>
				<input id="nombres" type="text" placeholder="Nombres" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">group</span>
				<input id="apellidos" type="text" placeholder="Apellidos" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">mail</span>
				<input id="email" type="email" placeholder="Correo electrónico"
					required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">call</span>
				<input id="telefono" type="tel" placeholder="Teléfono" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">home</span>
				<input id="direccion" type="text" placeholder="Dirección" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">event</span>
				<input id="fecha-nacimiento" type="date" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">lock</span>
				<input id="password" type="password" placeholder="Contraseña"
					required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<button type="submit"
				class="w-full py-3 mt-2 rounded-lg bg-primary text-white font-semibold hover:bg-primary/90 transition">
				Crear cuenta</button>

			<p class="text-sm text-gray-600 dark:text-gray-400 mt-4">
				¿Ya tienes una cuenta? <a
					href="<%=request.getContextPath()%>/vistas/paciente/loginPac.jsp"
					class="text-primary font-medium hover:underline">Inicia sesión</a>
			</p>
		</form>
	</div>
</body>
</html>
