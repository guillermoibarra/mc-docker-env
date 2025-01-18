# Contenedor de Docker para el Curso de Monte Carlo

## Instrucciones para Configurar el Entorno

Este proyecto permite configurar y ejecutar un entorno Docker con JupyterLab de forma rápida. Sigue estos pasos para asegurarte de que todo funcione correctamente.

### Requisitos Previos

Antes de comenzar, asegúrate de tener instalados los siguientes programas:

1. **Windows Terminal**: Necesario para ejecutar comandos en la terminal.
2. **Git**: Necesario para clonar el repositorio.
3. **Docker Desktop**: Necesario para ejecutar contenedores Docker.

### Instrucciones de Instalación

1. **Clonar el Repositorio**:
   - Ve al Escritorio, haz clic derecho y selecciona **Abrir en Windows Terminal**.
   - Clonar el repositorio con el siguiente comando:

     ```bash
     git clone https://github.com/guillermoibarra/mc-docker-env.git
     ```

2. **Construir el Contenedor**:
   - Navega al directorio raíz del proyecto recién clonado:

     ```bash
     cd mc-docker-env
     ```

   - Construir el contenedor:

     ```bash
     docker-compose build
     ```

   - Iniciar el contenedor en modo despejado:

     ```bash
     docker-compose up -d
     ```

   - Verificar el contenedor:

     ```bash
     docker ps
     ```

3. **Ejecutar el contenedor**

   - Empezar el proceso `zsh`:

     ```bash
     docker exec -it mc-taller-env-container zsh
     ```


