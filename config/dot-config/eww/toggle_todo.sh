#!/usr/bin/env bash
# Script pour toggle les checkboxes dans TODO.md
# Usage: ./toggle_todo.sh LINE_NUMBER

TODO_FILE="/home/bigouden/TODO.md"
LINE_NUM="$1"

# Vérifier que le fichier existe
if [[ ! -f "$TODO_FILE" ]]; then
    echo "Erreur: $TODO_FILE n'existe pas"
    exit 1
fi

# Vérifier qu'un numéro de ligne est fourni
if [[ -z "$LINE_NUM" ]] || ! [[ "$LINE_NUM" =~ ^[0-9]+$ ]]; then
    echo "Erreur: Numéro de ligne invalide"
    exit 1
fi

# Lire toutes les lignes dans un tableau
mapfile -t lines < "$TODO_FILE"

# Vérifier que le numéro de ligne est valide
if [[ $LINE_NUM -ge ${#lines[@]} ]]; then
    echo "Erreur: Numéro de ligne trop grand"
    exit 1
fi

# Obtenir la ligne à modifier
line="${lines[$LINE_NUM]}"

# Toggle la checkbox selon le format actuel
if [[ "$line" =~ ^[[:space:]]*-[[:space:]]*\[[[:space:]]*\][[:space:]]* ]]; then
    # Checkbox non cochée -> cochée
    new_line=$(echo "$line" | sed 's/\[[[:space:]]*\]/[x]/')
elif [[ "$line" =~ ^[[:space:]]*-[[:space:]]*\[x\][[:space:]]* ]]; then
    # Checkbox cochée -> non cochée
    new_line=$(echo "$line" | sed 's/\[x\]/[ ]/')
else
    # Ligne normale -> transformer en checkbox cochée
    new_line="- [x] $line"
fi

# Remplacer la ligne dans le tableau
lines[$LINE_NUM]="$new_line"

# Réécrire le fichier
printf '%s\n' "${lines[@]}" > "$TODO_FILE"

echo "Ligne $LINE_NUM mise à jour"
