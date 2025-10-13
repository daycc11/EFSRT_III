<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Crear Cuenta</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/iconoHospital.png"
	type="image/x-icon">
<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet">

<script>
tailwind.config = {
  darkMode: "class",
  theme: {
    extend: {
      colors: {
        primary: "#13a4ec",
        "background-light": "#f6f7f8",
        "background-dark": "#101c22"
      },
      fontFamily: {
        display: ["Inter", "sans-serif"]
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
	style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.4)), url('<%=request.getContextPath()%>/img/fondoLogin.png');">

	<div
		class="w-full max-w-md bg-white/95 dark:bg-gray-900/90 backdrop-blur-sm rounded-xl shadow-lg p-8 text-center">
		<svg class="w-12 h-12 mx-auto text-primary" fill="none"
			stroke="currentColor" viewBox="0 0 24 24">
      <path d="M12 6v6m0 0v6m0-6h6m-6 0H6" stroke-linecap="round"
				stroke-linejoin="round" stroke-width="2"></path>
    </svg>

		<h1 class="text-3xl font-bold text-gray-800 dark:text-white mt-4">Crear
			Cuenta</h1>
		<p class="text-gray-600 dark:text-gray-400 mt-2">Completa todos
			los campos para registrarte</p>

		<%
		if (request.getAttribute("mensaje") != null) {
		%>
		<div id="mensaje"
			class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4">
			<span class="block sm:inline"><%=request.getAttribute("mensaje")%></span>
		</div>
		<%
		}
		%>

		<%
		if (request.getAttribute("error") != null) {
		%>
		<div id="mensaje"
			class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4">
			<span class="block sm:inline"><%=request.getAttribute("error")%></span>
		</div>
		<%
		}
		%>

		<form class="space-y-5 mt-6"
			action="<%=request.getContextPath()%>/PacienteServlet" method="post"
			onsubmit="return validarFormulario();">
			<input type="hidden" name="accion" value="registrar" />

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">badge</span>
				<input name="dni" id="dni" type="text" placeholder="DNI"
					maxlength="8" required pattern="[0-9]{8}"
					title="Debe ingresar exactamente 8 números"
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white 
                      border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">person</span>
				<input name="nombres" id="nombres" type="text" placeholder="Nombres"
					required pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+"
					title="Solo se permiten letras y espacios"
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white 
                      border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">group</span>
				<input name="apellidos" id="apellidos" type="text"
					placeholder="Apellidos" required pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]+"
					title="Solo se permiten letras y espacios"
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white 
                      border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">mail</span>
				<input name="correo" id="correo" type="email"
					placeholder="Correo electrónico" required
					title="Debe ingresar un correo válido"
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white 
                      border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">call</span>
				<input name="telefono" id="telefono" type="text"
					placeholder="Teléfono" maxlength="9" required pattern="[0-9]{9}"
					title="Debe ingresar exactamente 9 números"
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white 
                      border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">home</span>
				<input name="direccion" id="direccion" type="text"
					placeholder="Dirección" maxlength="150" required
					title="Máximo 150 caracteres"
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white 
                      border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">event</span>
				<input name="fechaNacimiento" id="fechaNacimiento" type="date"
					required title="Debe seleccionar una fecha de nacimiento"
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white 
                      focus:ring-2 focus:ring-primary" />
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">lock</span>
				<input name="password" id="password" type="password"
					placeholder="Contraseña" maxlength="100" required
					title="Máximo 100 caracteres"
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white 
                      border-transparent focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400" />
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

	<script>
  
  const mensajeDiv = document.getElementById("mensaje");
  if (mensajeDiv) {
      setTimeout(() => {
          mensajeDiv.style.display = "none";

          <%if (request.getAttribute("mensaje") != null) {%>
              window.location.href = "<%=request.getContextPath()%>/vistas/paciente/loginPac.jsp";
          <%}%>
      }, 3000);
  }
  
  function validarFormulario() {
    const dni = document.getElementById('dni').value.trim();
    const nombres = document.getElementById('nombres').value.trim();
    const apellidos = document.getElementById('apellidos').value.trim();
    const correo = document.getElementById('correo').value.trim();
    const telefono = document.getElementById('telefono').value.trim();
    const direccion = document.getElementById('direccion').value.trim();
    const fechaNacimiento = document.getElementById('fechaNacimiento').value.trim();
    const password = document.getElementById('password').value.trim();

    if (!dni || !nombres || !apellidos || !correo || !telefono || !direccion || !fechaNacimiento || !password) {
      alert("Por favor, completa todos los campos.");
      return false;
    }

    if (!/^\d{8}$/.test(dni)) {
      alert("El DNI debe tener exactamente 8 dígitos numéricos.");
      return false;
    }
    if (!/^[A-Za-zÁÉÍÓÚáéíóúÑñ ]+$/.test(nombres)) {
      alert("Los nombres solo pueden contener letras y espacios.");
      return false;
    }
    if (!/^[A-Za-zÁÉÍÓÚáéíóúÑñ ]+$/.test(apellidos)) {
      alert("Los apellidos solo pueden contener letras y espacios.");
      return false;
    }
    if (!/^\d{9}$/.test(telefono)) {
      alert("El teléfono debe tener exactamente 9 dígitos numéricos.");
      return false;
    }
    if (direccion.length > 150) {
      alert("La dirección no puede tener más de 150 caracteres.");
      return false;
    }
    if (password.length > 100) {
      alert("La contraseña no puede tener más de 100 caracteres.");
      return false;
    }

    return true;
  }
  </script>
</body>
</html>
