<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<title>Login</title>
<link rel="icon" href="<%=request.getContextPath()%>/img/iconoHospital.png"
	type="image/x-icon">
<script
	src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com" rel="preconnect" />
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
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
				},
				borderRadius : {
					"DEFAULT" : "0.25rem",
					"lg" : "0.5rem",
					"xl" : "0.75rem",
					"full" : "9999px"
				},
			},
		},
	}
</script>
<style>
body {
	min-height: max(884px, 100dvh);
}

/* Fondo difuminado */
.bg-blur::before {
	content: "";
	position: absolute;
	inset: 0;
	background: url('<%=request.getContextPath()%>/img/fondoInicio.jpeg')
		center/cover no-repeat;
	filter: blur(10px);
	z-index: -1;
}
</style>
</head>
<body
	class="bg-background-light dark:bg-background-dark font-display flex flex-col items-center justify-center min-h-screen p-4 relative bg-blur">

	<div
		class="flex flex-col items-center justify-center min-h-screen p-4 relative z-10">
		<div
			class="w-full md:w-[410px] mx-auto bg-white dark:bg-gray-900 rounded-xl shadow-lg p-8 space-y-10">

			<div class="text-center">
				<svg class="w-12 h-12 mx-auto text-primary" fill="none"
					stroke="currentColor" viewBox="0 0 24 24"
					xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 6v6m0 0v6m0-6h6m-6 0H6"
						stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                </svg>
				<h1 class="text-3xl font-bold text-gray-800 dark:text-white mt-4">Bienvenido</h1>
				<p class="text-gray-600 dark:text-gray-400 mt-2">Selecciona tu
					rol para continuar</p>
			</div>

			<div class="space-y-6">
				<button
					class="w-full flex flex-col items-center justify-center py-6 px-4 bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200"
					onclick="location.href='${pageContext.request.contextPath}/vistas/paciente/loginPac.jsp'">
					<span class="material-symbols-outlined text-primary text-5xl">person</span>
					<span
						class="mt-3 text-xl font-semibold text-gray-800 dark:text-white">Paciente</span>
				</button>

				<button
					class="w-full flex flex-col items-center justify-center py-6 px-4 bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200"
					onclick="location.href='${pageContext.request.contextPath}/vistas/recepcion/loginRec.jsp'">
					<span class="material-symbols-outlined text-primary text-5xl">badge</span>
					<span
						class="mt-3 text-xl font-semibold text-gray-800 dark:text-white">Recepción</span>
				</button>

				<button
					class="w-full flex flex-col items-center justify-center py-6 px-4 bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200"
					onclick="location.href='${pageContext.request.contextPath}/vistas/doctor/loginDoc.jsp'">
					<span class="material-symbols-outlined text-primary text-5xl">medical_services</span>
					<span
						class="mt-3 text-xl font-semibold text-gray-800 dark:text-white">Doctor</span>
				</button>
			</div>

		</div>
	</div>

</body>
</html>
