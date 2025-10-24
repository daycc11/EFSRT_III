<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Modelo.Doctor"%>
<%@ page import="Modelo.Paciente"%>
<%
List<Doctor> listaDoctores = (List<Doctor>) request.getAttribute("listaDoctores");
List<Paciente> listaPacientes = (List<Paciente>) request.getAttribute("listaPacientes");
String mensajeExito = (String) request.getAttribute("mensajeExito");
String mensajeError = (String) request.getAttribute("mensajeError");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Registrar Cita</title>
<link rel="icon"
	href="<%=request.getContextPath()%>/img/iconoHospital.png"
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
	style="background-image: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.5)), url('<%=request.getContextPath()%>/img/fondoLogin.png');">

	<div
		class="w-full max-w-lg bg-white/95 dark:bg-gray-900/90 backdrop-blur-sm rounded-xl shadow-lg p-8">
		<div class="text-center">
			<svg class="w-12 h-12 mx-auto text-primary" fill="none"
				stroke="currentColor" viewBox="0 0 24 24">
        <path d="M12 6v6m0 0v6m0-6h6m-6 0H6" stroke-linecap="round"
					stroke-linejoin="round" stroke-width="2" />
      </svg>
			<h1 class="text-3xl font-bold text-gray-800 dark:text-white mt-4">Registrar
				Cita Médica</h1>
			<p class="text-gray-600 dark:text-gray-400 mt-2">Complete los
				datos para agendar una nueva cita</p>
		</div>

		<%
		if (mensajeExito != null) {
		%>
		<div id="mensajeExito"
			class="mt-4 p-3 bg-green-100 text-green-800 rounded-lg"><%=mensajeExito%></div>
		<%
		}
		%>
		<%
		if (mensajeError != null) {
		%>
		<div id="mensajeError"
			class="mt-4 p-3 bg-red-100 text-red-800 rounded-lg"><%=mensajeError%></div>
		<%
		}
		%>

		<form id="formCita" class="space-y-5 mt-6"
			action="<%=request.getContextPath()%>/CitaServlet" method="post">
			<input type="hidden" name="accion" value="Guardar">

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">person</span>
				<select name="idPaciente" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary">
					<option value="">Seleccione un paciente</option>
					<%
					if (listaPacientes != null) {
						for (Paciente p : listaPacientes) {
					%>
					<option value="<%=p.getIdPaciente()%>"><%=p.getNombres()%>
						<%=p.getApellidos()%></option>
					<%
					}
					}
					%>
				</select>
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">stethoscope</span>
				<select name="idDoctor" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary">
					<option value="">Seleccione un doctor</option>
					<%
					if (listaDoctores != null) {
						for (Doctor d : listaDoctores) {
					%>
					<option value="<%=d.getIdDoctor()%>"><%=d.getNombres()%>
						<%=d.getApellidos()%></option>
					<%
					}
					}
					%>
				</select>
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">event</span>
				<input name="fechaProgramada" type="date" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary">
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">schedule</span>
				<input name="horaProgramada" type="time" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary">
			</div>

			<div class="relative">
				<span
					class="material-symbols-outlined absolute left-3 top-4 text-gray-400">description</span>
				<textarea name="descripcion" rows="3"
					placeholder="Motivo de la cita o detalles adicionales" required
					class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary"></textarea>
			</div>

			<div class="flex gap-3">
				<button type="submit"
					class="w-1/2 py-3 rounded-lg bg-primary text-white font-semibold hover:bg-primary/90 transition">
					Registrar Cita</button>
				<button type="button"
					onclick="window.location.href='<%=request.getContextPath()%>/vistas/recepcion/recepcion.jsp'"
					class="w-1/2 py-3 rounded-lg bg-gray-600 text-white font-semibold hover:bg-gray-700 transition flex items-center justify-center gap-2">
					<span class="material-symbols-outlined">arrow_back</span> Regresar
				</button>

			</div>
		</form>
	</div>

	<script>
    window.onload = function() {
      const mensajeExito = document.getElementById("mensajeExito");
      const mensajeError = document.getElementById("mensajeError");
      const form = document.getElementById("formCita");

      if (mensajeExito) {
        setTimeout(() => {
          mensajeExito.style.display = "none";
          form.reset();
        }, 5000);
      }

      if (mensajeError) {
        setTimeout(() => {
          mensajeError.style.display = "none";
        }, 5000);
      }
    }
  </script>

</body>
</html>
