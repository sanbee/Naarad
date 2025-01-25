
wpa_cli -i wlan0 select_network $(wpa_cli -i wlan0 list_networks | grep $1 | cut -f 1)
