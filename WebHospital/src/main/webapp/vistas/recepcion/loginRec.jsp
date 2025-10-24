<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String errorLogin = (String) request.getAttribute("errorLogin");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Recepcionista</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/iconoHospital.png"
	type="image/x-icon">
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com" rel="preconnect" />
<link crossorigin href="https://fonts.gstatic.com" rel="preconnect" />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<script id="tailwind-config">
	tailwind.config = {
		darkMode: "class",
		theme: {
			extend: {
				colors: {
					"primary": "#13a4ec",
					"background-light": "#f6f7f8",
					"background-dark": "#101c22",
				},
				fontFamily: {
					"display": ["Inter"]
				}
			},
		},
	}
</script>
<style>
body {
	min-height: max(884px, 100dvh);
}

#toggler i {
	transition: transform 0.25s ease, color 0.25s ease;
}

#toggler.active i {
	transform: rotate(180deg);
	color: #13a4ec;
}
</style>
</head>
<body
	class="bg-background-light dark:bg-background-dark font-display flex flex-col items-center justify-center min-h-screen p-4 bg-cover bg-center"
	style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('<%=request.getContextPath()%>/img/fondoLogin.png');">

	<div
		class="w-full max-w-md mx-auto bg-white/95 dark:bg-gray-900/90 backdrop-blur-sm rounded-xl shadow-lg p-8 text-center">

		<svg class="w-12 h-12 mx-auto text-primary" fill="none"
			stroke="currentColor" viewBox="0 0 24 24"
			xmlns="http://www.w3.org/2000/svg">
			<path d="M12 6v6m0 0v6m0-6h6m-6 0H6" stroke-linecap="round"
				stroke-linejoin="round" stroke-width="2"></path>
		</svg>

		<h1 class="text-3xl font-bold text-gray-800 dark:text-white mt-4">
			Bienvenido Recepcionista</h1>
		<p class="text-gray-600 dark:text-gray-400 mt-2">Inicia sesión para continuar</p>

		<%
		if (errorLogin != null) {
		%>
		<p
			class="text-red-600 font-semibold mt-4 flex items-center justify-center gap-2">
			<span class="material-symbols-outlined text-red-600">error</span>
			<%=errorLogin%>
		</p>
		<%
		}
		%>

		<form class="space-y-6 mt-6"
			action="<%=request.getContextPath()%>/vistas/logeo/validarRec.jsp"
			method="post">
			
			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500">badge</span>
				<input type="text" name="dni" id="dni" maxlength="8" required
					placeholder="Ingrese su DNI"
					oninput="this.value=this.value.replace(/[^0-9]/g,'')"
					value="<%=request.getAttribute("filtro") != null ? request.getAttribute("filtro") : ""%>"
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400">
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500">lock</span>
				<input id="clave" name="clave" type="password" required
					placeholder="Ingrese su contraseña"
					class="w-full pl-10 pr-10 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
				
				<button type="button" id="toggler"
					class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500">
					<i class="material-symbols-outlined">visibility_off</i>
				</button>
			</div>

			<div class="flex gap-3">
				<input type="submit" value="Ingresar"
					class="w-1/2 py-3 rounded-lg text-white bg-primary hover:bg-primary/90 transition">
				
				<button type="button"
					onclick="window.location.href='<%=request.getContextPath()%>/vistas/logeo/login.jsp'"
					class="w-1/2 py-3 rounded-lg text-white bg-gray-600 hover:bg-gray-700 transition flex items-center justify-center gap-2">
					<span class="material-symbols-outlined text-white">arrow_back</span>
					Regresar
				</button>
			</div>

		</form>
	</div>

	<script>
		const toggler = document.getElementById("toggler");
		const claveInput = document.getElementById("clave");
		const icon = toggler.querySelector("i");

		toggler.addEventListener("click", () => {
			const isPassword = claveInput.type === "password";
			claveInput.type = isPassword ? "text" : "password";
			icon.textContent = isPassword ? "visibility" : "visibility_off";
			toggler.classList.toggle("active");
		});
	</script>

</body>
</html>
