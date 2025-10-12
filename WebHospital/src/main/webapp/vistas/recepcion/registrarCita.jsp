<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Doctor" %>
<%@ page import="Modelo.Paciente" %>
<%
    List<Doctor> listaDoctores = (List<Doctor>) request.getAttribute("listaDoctores");
    List<Paciente> listaPacientes = (List<Paciente>) request.getAttribute("listaPacientes");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Registrar Cita</title>

<link href="<%=request.getContextPath()%>/img/icono.png" rel="icon" type="image/x-icon"/>
<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">

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

<body class="bg-background-light dark:bg-background-dark font-display flex items-center justify-center min-h-screen bg-cover bg-center"
      style="background-image: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.5)), url('<%=request.getContextPath()%>/img/fondoLogin.png');">

  <div class="w-full max-w-lg bg-white/95 dark:bg-gray-900/90 backdrop-blur-sm rounded-xl shadow-lg p-8">
    <div class="text-center">
      <svg class="w-12 h-12 mx-auto text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path d="M12 6v6m0 0v6m0-6h6m-6 0H6" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
      </svg>
      <h1 class="text-3xl font-bold text-gray-800 dark:text-white mt-4">Registrar Cita Médica</h1>
      <p class="text-gray-600 dark:text-gray-400 mt-2">Complete los datos para agendar una nueva cita</p>
    </div>

    <form class="space-y-5 mt-6" action="<%=request.getContextPath()%>/CitaServlet" method="post">
      <input type="hidden" name="accion" value="Registrar">

      <!-- Paciente -->
      <div class="relative">
        <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">person</span>
        <select name="idPaciente" required
                class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary">
          <option value="">Seleccione un paciente</option>
          <% if (listaPacientes != null) {
               for (Paciente p : listaPacientes) { %>
                 <option value="<%=p.getIdPaciente()%>"><%=p.getNombres()%> <%=p.getApellidos()%></option>
          <%   }
             } %>
        </select>
      </div>

      <!-- Doctor -->
      <div class="relative">
        <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">stethoscope</span>
        <select name="idDoctor" required
                class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white border-transparent focus:ring-2 focus:ring-primary">
          <option value="">Seleccione un doctor</option>
          <% if (listaDoctores != null) {
               for (Doctor d : listaDoctores) { %>
                 <option value="<%=d.getIdDoctor()%>"><%=d.getNombres()%> <%=d.getApellidos()%></option>
          <%   }
             } %>
        </select>
      </div>

      <!-- Fecha programada -->
      <div class="relative">
        <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">event</span>
        <input name="fechaProgramada" type="date" required
               class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white focus:ring-2 focus:ring-primary"/>
      </div>

      <!-- Hora programada -->
      <div class="relative">
        <span class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">schedule</span>
        <input name="horaProgramada" type="time" required
               class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white focus:ring-2 focus:ring-primary"/>
      </div>

      <!-- Descripción -->
      <div class="relative">
        <span class="material-symbols-outlined absolute left-3 top-4 text-gray-400">description</span>
        <textarea name="descripcion" rows="3" placeholder="Motivo de la cita o detalles adicionales" required
                  class="w-full pl-10 pr-4 py-3 rounded-lg bg-gray-100 dark:bg-gray-800 text-gray-800 dark:text-white focus:ring-2 focus:ring-primary placeholder-gray-500 dark:placeholder-gray-400"></textarea>
      </div>

      <button type="submit"
              class="w-full py-3 mt-2 rounded-lg bg-primary text-white font-semibold hover:bg-primary/90 transition">
        Registrar Cita
      </button>
    </form>
  </div>
</body>
</html>
