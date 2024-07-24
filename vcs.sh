#!/bin/bash

# Directorio de almacenamiento de datos del sistema de control de versiones
VCS_DIR=".myvcs"

# Función para inicializar el repositorio
vcs_init() {
    mkdir -p "$VCS_DIR/commits"
    mkdir -p "$VCS_DIR/branches"
    echo "main" > "$VCS_DIR/HEAD"
    echo "Repositorio inicializado en $PWD"
}

# Función para hacer un commit
vcs_commit() {
    message=$1
    if [ -z "$message" ]; then
        echo "Debe proporcionar un mensaje de commit"
        return 1
    fi
    
    timestamp=$(date +"%Y%m%d%H%M%S")
    commit_id="${timestamp}_commit"
    branch=$(cat "$VCS_DIR/HEAD")

    mkdir -p "$VCS_DIR/commits/$commit_id"
    cp -r * "$VCS_DIR/commits/$commit_id/"
    echo "$message" > "$VCS_DIR/commits/$commit_id/message"
    echo "$commit_id" > "$VCS_DIR/branches/$branch"
    echo "Commit $commit_id creado en branch $branch con mensaje: $message"
}

# Función para crear una rama (branch)
vcs_branch() {
    branch_name=$1
    if [ -z "$branch_name" ]; then
        echo "Debe proporcionar un nombre para la rama"
        return 1
    fi

    current_branch=$(cat "$VCS_DIR/HEAD")
    current_commit=$(cat "$VCS_DIR/branches/$current_branch")

    echo "$current_commit" > "$VCS_DIR/branches/$branch_name"
    echo "Rama $branch_name creada basada en $current_commit"
}

# Función para cambiar de rama
vcs_checkout() {
    branch_name=$1
    if [ -z "$branch_name" ]; then
        echo "Debe proporcionar un nombre de rama para cambiar"
        return 1
    fi

    if [ ! -f "$VCS_DIR/branches/$branch_name" ]; then
        echo "Rama $branch_name no existe"
        return 1
    fi

    echo "$branch_name" > "$VCS_DIR/HEAD"
    echo "Cambiado a la rama $branch_name"
}

# Función para fusionar ramas
vcs_merge() {
    source_branch=$1
    target_branch=$(cat "$VCS_DIR/HEAD")

    if [ -z "$source_branch" ]; then
        echo "Debe proporcionar una rama fuente para fusionar"
        return 1
    fi

    if [ ! -f "$VCS_DIR/branches/$source_branch" ]; then
        echo "Rama $source_branch no existe"
        return 1
    fi

    source_commit=$(cat "$VCS_DIR/branches/$source_branch")
    target_commit=$(cat "$VCS_DIR/branches/$target_branch")

    cp -r "$VCS_DIR/commits/$source_commit/"* ./
    echo "Fusionado commit $source_commit de la rama $source_branch en la rama $target_branch"
}

# Función para revertir a un commit anterior
vcs_revert() {
    commit_id=$1
    if [ -z "$commit_id" ]; then
        echo "Debe proporcionar un ID de commit para revertir"
        return 1
    fi

    if [ ! -d "$VCS_DIR/commits/$commit_id" ]; then
        echo "Commit $commit_id no existe"
        return 1
    fi

    cp -r "$VCS_DIR/commits/$commit_id/"* ./
    branch=$(cat "$VCS_DIR/HEAD")
    echo "$commit_id" > "$VCS_DIR/branches/$branch"
    echo "Revertido al commit $commit_id en la rama $branch"
}

# Verificación de comando y ejecución
case $1 in
    init)
        vcs_init
        ;;
    commit)
        vcs_commit "$2"
        ;;
    branch)
        vcs_branch "$2"
        ;;
    checkout)
        vcs_checkout "$2"
        ;;
    merge)
        vcs_merge "$2"
        ;;
    revert)
        vcs_revert "$2"
        ;;
    *)
        echo "Uso: $0 {init|commit|branch|checkout|merge|revert}"
        ;;
esac
