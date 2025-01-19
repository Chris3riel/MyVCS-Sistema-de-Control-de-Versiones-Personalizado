

# MyVCS: Sistema de Control de Versiones Personalizado
![image](https://github.com/user-attachments/assets/651e50dd-cf04-4e17-b8d0-11c164d2a3c4)

MyVCS es un sistema ligero de control de versiones para proyectos pequeños, implementado en shell script. Proporciona comandos básicos para `commit`, `branch`, `merge` y `revert`.

## Características

- **init**: Inicializa un nuevo repositorio.
- **commit**: Realiza un commit de los cambios actuales.
- **branch**: Crea una nueva rama.
- **checkout**: Cambia a una rama diferente.
- **merge**: Fusiona cambios de una rama fuente a la rama actual.
- **revert**: Revierte el proyecto a un commit anterior.

## Instalación

1. Clona este repositorio o descarga el archivo `vcs.sh`.
2. Dale permisos de ejecución al script:

    ```sh
    chmod +x vcs.sh
    ```

## Uso

### Inicializar el Repositorio

Para inicializar un nuevo repositorio, usa el comando `init`:

```sh
./vcs.sh init
```

### Realizar un Commit

Para realizar un commit de los cambios actuales, usa el comando `commit` seguido de un mensaje de commit:

```sh
./vcs.sh commit "Mensaje de commit"
```

### Crear una Nueva Rama

Para crear una nueva rama, usa el comando `branch` seguido del nombre de la nueva rama:

```sh
./vcs.sh branch nombre_de_rama
```

### Cambiar de Rama

Para cambiar a una rama diferente, usa el comando `checkout` seguido del nombre de la rama:

```sh
./vcs.sh checkout nombre_de_rama
```

### Fusionar Ramas

Para fusionar los cambios de una rama fuente en la rama actual, usa el comando `merge` seguido del nombre de la rama fuente:

```sh
./vcs.sh merge nombre_de_rama_fuente
```

### Revertir a un Commit Anterior

Para revertir el proyecto a un commit anterior, usa el comando `revert` seguido del ID del commit:

```sh
./vcs.sh revert commit_id
```

## Notas

- Este script es básico y no maneja conflictos de fusión ni proporciona un historial de commits detallado.
- El almacenamiento de commits y ramas se realiza en directorios y archivos de texto, lo que no es eficiente para proyectos grandes.
- Puedes expandir y mejorar este script agregando más funcionalidades como un historial de commits, resolución de conflictos, etc.

## Contribuir

Si deseas contribuir a este proyecto, siéntete libre de abrir un issue o enviar un pull request.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles.

