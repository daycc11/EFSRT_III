<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String errorLogin = (String) request.getAttribute("errorLogin");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login Doctor</title>
<link rel="icon"
	href="<%=request.getContextPath()%>/img/iconoHospital.png"
	type="image/x-icon">
<script
	src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com" rel="preconnect" />
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script id="tailwind-config">
	tailwind.config = {
		darkMode : "class",
		theme : {
			extend : {
				colors : {
					"primary" : "#13a4ec",
					"background-light" : "#f6f7f8",
					"background-dark" : "#101c22",
				},
				fontFamily : {
					"display" : [ "Inter" ]
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
	transition: transform 0.3s ease, color 0.3s ease;
}

#toggler.active i {
	transform: scale(1.2) rotate(180deg);
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

		<h1 class="text-3xl font-bold text-gray-800 dark:text-white mt-4">Bienvenido
			Doctor</h1>
		<p class="text-gray-600 dark:text-gray-400 mt-2">Inicia sesión
			para continuar</p>

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
			action="<%=request.getContextPath()%>/vistas/logeo/validarDoc.jsp"
			method="post">

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500">badge</span>
				<input id="dni" name="dni" type="text" maxlength="8" required
					placeholder="Ingrese su DNI"
					oninput="this.value=this.value.replace(/[^0-9]/g,'')"
					value="<%=request.getAttribute("filtro") != null ? request.getAttribute("filtro") : ""%>"
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 dark:text-gray-500">lock</span>

				<input id="clave" name="clave" type="password" required
					placeholder="Ingrese su contraseña"
					class="w-full pl-10 pr-12 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white 
      border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />

				<span id="toggler"
					class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 cursor-pointer transition-transform duration-200 ease-in-out transform hover:scale-110">
					<i class="far fa-eye-slash"></i>
				</span>
			</div>

			<div class="flex gap-3">
				<input type="submit" value="Ingresar"
					class="w-1/2 py-3 rounded-lg text-white bg-primary hover:bg-primary/90 transition" />
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
		const password = document.getElementById('clave');
		const toggler = document.getElementById('toggler');

		toggler.addEventListener('click', function() {
			const icon = toggler.querySelector('i');
			const isHidden = password.type === 'password';

			password.type = isHidden ? 'text' : 'password';
			icon.classList.toggle('fa-eye-slash', !isHidden);
			icon.classList.toggle('fa-eye', isHidden);
			toggler.classList.toggle('active', isHidden);
		});
	</script>
</body>
</html>
