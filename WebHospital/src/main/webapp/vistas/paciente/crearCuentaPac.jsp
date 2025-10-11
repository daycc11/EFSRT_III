<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Crear Cuenta</title>
<link href="data:image/x-icon;base64," rel="icon" type="image/x-icon"/>
<script src="https://cdn.tailwindcss.com?plugins=forms"></script>
<link href="https://fonts.googleapis.com" rel="preconnect"/>
<link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&amp;display=swap" rel="stylesheet"/>
<script>
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#13a4ec",
                        "background-light": "#f6f7f8",
                        "background-dark": "#101c22",
                        "foreground-light": "#111618",
                        "foreground-dark": "#f0f3f4",
                        "subtle-light": "#617c89",
                        "subtle-dark": "#a0b1b9"
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                },
            },
        }
    </script>
<style>
        .form-input {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }
    </style>
<style>
    body {
      min-height: max(884px, 100dvh);
    }
  </style>
  </head>
<body class="font-display bg-background-light dark:bg-background-dark">
<div class="relative flex h-auto min-h-screen w-full flex-col justify-between overflow-x-hidden">
<div>
<header class="flex items-center bg-background-light dark:bg-background-dark p-4 pb-2 justify-between sticky top-0 z-10">
<button class="text-foreground-light dark:text-foreground-dark flex size-10 shrink-0 items-center justify-center rounded-full hover:bg-primary/10 dark:hover:bg-primary/20">
<svg fill="currentColor" height="24" viewBox="0 0 256 256" width="24" xmlns="http://www.w3.org/2000/svg">
<path d="M224,128a8,8,0,0,1-8,8H59.31l58.35,58.34a8,8,0,0,1-11.32,11.32l-72-72a8,8,0,0,1,0-11.32l72-72a8,8,0,0,1,11.32,11.32L59.31,120H216A8,8,0,0,1,224,128Z"></path>
</svg>
</button>
<h1 class="text-foreground-light dark:text-foreground-dark text-lg font-bold flex-1 text-center pr-10">Crear cuenta</h1>
</header>
<main class="flex-grow p-4">
<form class="space-y-4">
<div>
<label class="text-foreground-light dark:text-foreground-dark text-sm font-medium" for="dni">DNI</label>
<input class="form-input mt-1 w-full rounded-lg border-0 bg-white dark:bg-background-dark/50 text-foreground-light dark:text-foreground-dark h-12 px-4 placeholder:text-subtle-light dark:placeholder:text-subtle-dark focus:ring-2 focus:ring-primary" id="dni" placeholder="Ingresa tu DNI" type="text"/>
</div>
<div>
<label class="text-foreground-light dark:text-foreground-dark text-sm font-medium" for="nombres">Nombres</label>
<input class="form-input mt-1 w-full rounded-lg border-0 bg-white dark:bg-background-dark/50 text-foreground-light dark:text-foreground-dark h-12 px-4 placeholder:text-subtle-light dark:placeholder:text-subtle-dark focus:ring-2 focus:ring-primary" id="nombres" placeholder="Ingresa tus nombres" type="text"/>
</div>
<div>
<label class="text-foreground-light dark:text-foreground-dark text-sm font-medium" for="apellidos">Apellidos</label>
<input class="form-input mt-1 w-full rounded-lg border-0 bg-white dark:bg-background-dark/50 text-foreground-light dark:text-foreground-dark h-12 px-4 placeholder:text-subtle-light dark:placeholder:text-subtle-dark focus:ring-2 focus:ring-primary" id="apellidos" placeholder="Ingresa tus apellidos" type="text"/>
</div>
<div>
<label class="text-foreground-light dark:text-foreground-dark text-sm font-medium" for="email">Correo electrónico</label>
<input class="form-input mt-1 w-full rounded-lg border-0 bg-white dark:bg-background-dark/50 text-foreground-light dark:text-foreground-dark h-12 px-4 placeholder:text-subtle-light dark:placeholder:text-subtle-dark focus:ring-2 focus:ring-primary" id="email" placeholder="Ingresa tu correo electrónico" type="email"/>
</div>
<div>
<label class="text-foreground-light dark:text-foreground-dark text-sm font-medium" for="telefono">Teléfono</label>
<input class="form-input mt-1 w-full rounded-lg border-0 bg-white dark:bg-background-dark/50 text-foreground-light dark:text-foreground-dark h-12 px-4 placeholder:text-subtle-light dark:placeholder:text-subtle-dark focus:ring-2 focus:ring-primary" id="telefono" placeholder="Ingresa tu teléfono" type="tel"/>
</div>
<div>
<label class="text-foreground-light dark:text-foreground-dark text-sm font-medium" for="direccion">Dirección</label>
<input class="form-input mt-1 w-full rounded-lg border-0 bg-white dark:bg-background-dark/50 text-foreground-light dark:text-foreground-dark h-12 px-4 placeholder:text-subtle-light dark:placeholder:text-subtle-dark focus:ring-2 focus:ring-primary" id="direccion" placeholder="Ingresa tu dirección" type="text"/>
</div>
<div>
<label class="text-foreground-light dark:text-foreground-dark text-sm font-medium" for="fecha-nacimiento">Fecha de nacimiento</label>
<input class="form-input mt-1 w-full rounded-lg border-0 bg-white dark:bg-background-dark/50 text-foreground-light dark:text-foreground-dark h-12 px-4 placeholder:text-subtle-light dark:placeholder:text-subtle-dark focus:ring-2 focus:ring-primary" id="fecha-nacimiento" type="date"/>
</div>
<div>
<label class="text-foreground-light dark:text-foreground-dark text-sm font-medium" for="password">Contraseña</label>
<input class="form-input mt-1 w-full rounded-lg border-0 bg-white dark:bg-background-dark/50 text-foreground-light dark:text-foreground-dark h-12 px-4 placeholder:text-subtle-light dark:placeholder:text-subtle-dark focus:ring-2 focus:ring-primary" id="password" placeholder="Ingresa tu contraseña" type="password"/>
</div>
</form>
</main>
</div>
<footer class="p-4 pt-2">
<button class="w-full rounded-xl bg-primary text-white text-base font-bold h-12">
                Crear cuenta
            </button>
<p class="text-subtle-light dark:text-subtle-dark text-sm text-center pt-4">
                ¿Ya tienes una cuenta? <a class="font-bold text-primary" href="#">Inicia sesión</a>
</p>
</footer>
</div>

</body></html>