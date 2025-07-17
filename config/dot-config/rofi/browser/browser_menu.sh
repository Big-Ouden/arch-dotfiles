#!/usr/bin/env bash

# Configuration
browser="firefox"
config="$HOME/.config/rofi/config.rasi"

# Obtenir l'adresse IP locale
local_ip=$(ip addr | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | head -n 1)

# Déclarer les bookmarks dans l'ordre souhaité
bookmark_names=(
		"New window"
    "Github"
    "iiens.net"
    "bigouden.org"
    "Mail"
    "Youtube"
    "WhatsApp web"
    "network 4173"
    "network 5173"
    "network 8000"
)

declare -A bookmarks=(
		["New window"]="home"
    ["Youtube"]="youtube.com/feed/subscriptions"
    ["iiens.net"]="iiens.net"
    ["bigouden.org"]="dashy.bigouden.org"
    ["Github"]="github.com/Big-Ouden"
    ["Mail"]="mail.google.com"
    ["WhatsApp web"]="web.whatsapp.com"
    ["network 4173"]="http://$local_ip:4173"
    ["network 5173"]="http://$local_ip:5173"
    ["network 8000"]="http://$local_ip:8000"
)

# Créer une liste des options pour rofi dans l'ordre du tableau indexé
options=""
for name in "${bookmark_names[@]}"; do
    options+="$name\n"
done

# Utiliser rofi pour sélectionner une option
chosen=$(echo -e "$options" | rofi -dmenu -i -config "$config" -p "Browser:")

# Vérifier si une option a été sélectionnée
if [[ -z "$chosen" ]]; then
    exit
fi

# Déterminer l'URL et le message en fonction de l'option choisie
if [[ "${bookmarks[$chosen]}"  = "home"  ]] ; then
	message="Opening the browser"
	notify-send "$message"
	"$browser"
elif [[ -n "${bookmarks[$chosen]}" ]]; then
  url="${bookmarks[$chosen]}"
  message="$chosen"
	# Envoyer une notification et ouvrir l'URL dans le navigateur
	notify-send "$message"
	"$browser" "$url"

else
	# Gérer les recherches avec des "bang"
	url="search.google.com/search?q=$chosen"
  message="Searching google for $chosen"
	# Envoyer une notification et ouvrir l'URL dans le navigateur
	notify-send "$message"
	"$browser" "$url"
fi

