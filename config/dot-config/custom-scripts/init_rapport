#!/usr/bin/env bash

# === Couleurs ===
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

# === Aide ===
print_help() {
  echo -e "${YELLOW}Usage:${RESET} $0 <nom_dossier> <nom_template> [--repo <url_git>]"
  echo
  echo "Ce script clone un dépôt centralisé contenant un sous-module de templates,"
  echo "et initialise un nouveau dossier de travail à partir du template choisi."
  echo
  echo -e "${YELLOW}Arguments:${RESET}"
  echo "  <nom_dossier>     Nom du dossier de travail à créer (ex: rapport2025)"
  echo "  <nom_template>    Nom du template dans le sous-module 'template/' (ex: iie-rapport)"
  echo "  --repo <url>      (optionnel) URL du dépôt principal à cloner"
  echo
  echo -e "${YELLOW}Exemple:${RESET}"
  echo "  $0 rapport2025 iie-rapport --repo git@github.com:Big-Ouden/all-reports.git"
}

# === Variables par défaut ===
REPO_URL="git@github.com:Big-Ouden/all-reports.git"  
REPO_DIR="all-reports"
RAPPORT_NAME="rapport-$(date '+%d-%m-%Y')"
TEMPLATE_NAME="iie-rapport"

# === Parsing des arguments ===
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      print_help
      exit 0
      ;;
    --repo)
      shift
      if [ -z "$1" ]; then
        echo -e "${RED}Erreur:${RESET} L'option --repo nécessite une URL."
        exit 1
      fi
      REPO_URL="$1"
      ;;
    *)
      if [ -z "$RAPPORT_NAME" ]; then
        RAPPORT_NAME="$1"
      elif [ -z "$TEMPLATE_NAME" ]; then
        TEMPLATE_NAME="$1"
      else
        echo -e "${RED}Erreur:${RESET} Argument inattendu: $1"
        exit 1
      fi
      ;;
  esac
  shift
done

# === Vérification des paramètres ===
if [ -z "$RAPPORT_NAME" ] || [ -z "$TEMPLATE_NAME" ]; then
  echo -e "${RED}Erreur:${RESET} Il faut fournir un nom de dossier ET un nom de template."
  print_help
  exit 1
fi

# === Clonage du dépôt principal ===
echo -e "${YELLOW}Clonage du dépôt principal (shallow)...${RESET}"
git clone --depth 1 "$REPO_URL" "$REPO_DIR"

cd "$REPO_DIR" || exit 1

# === Initialisation des sous-modules ===
echo -e "${YELLOW}Initialisation du sous-module 'template/'...${RESET}"
git submodule update --init --depth 1 template

TEMPLATE_PATH="template/$TEMPLATE_NAME"

# === Vérification de l’existence du template ===
if [ ! -d "$TEMPLATE_PATH" ]; then
  echo -e "${RED}Le template '$TEMPLATE_NAME' n'existe pas dans template/.${RESET}"
  echo -e "${YELLOW}Templates disponibles :${RESET}"
  ls template/
  exit 2
fi

# === Création du dossier de travail ===
if [ -d "$RAPPORT_NAME" ]; then
  echo -e "${RED}Le dossier '$RAPPORT_NAME' existe déjà.${RESET}"
  exit 3
fi

echo -e "${GREEN}Création du dossier '$RAPPORT_NAME' à partir de '$TEMPLATE_NAME'...${RESET}"
cp -r "$TEMPLATE_PATH" "$RAPPORT_NAME"

echo -e "${GREEN}Rapport initialisé dans: $REPO_DIR/$RAPPORT_NAME${RESET}"
echo -e "${YELLOW}Tu peux maintenant faire :${RESET}"
echo "   cd $REPO_DIR"
echo "   git add $RAPPORT_NAME"
echo "   git commit -m \"Ajout du rapport $RAPPORT_NAME basé sur $TEMPLATE_NAME\""
echo "   git push"


