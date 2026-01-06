#!/bin/bash
read -p "Enter the remote host <user@ip>: " REMOTEHOST
USERR="$USER"
HOMEDIR="$HOME"
RESTIC_BIN=$(command -v restic)
RESTIC_REPO="sftp://$REMOTEHOST:/home/$USERR/BACKIES"
read -p "Enter password please and do not forget: " RESTICPASS
export RESTIC_PASSWORD="$RESTICPASS"
#-ssh-#

if [ ! -f "$HOMEDIR/.ssh/id_ed25519" ]; then
ssh-keygen -t ed25519 -f "$HOMEDIR/.ssh/id_ed25519" -N ""
fi
ssh-copy-id "$REMOTEHOST"
#-----#

#-restic-cfg-#
if ! $RESTIC_BIN -r "$RESTIC_REPO" snapshots; then
echo "restic repository."
$RESTIC_BIN -r "$RESTIC_REPO" init
fi
#---#

#-systemd-#
sudo tee /etc/systemd/system/restic.service <<DOS
[Unit]
Description=Restic backup
[Service]
Type=oneshot
User=$USERR
WorkingDirectory=$HOMEDIR
Environment="RESTIC_PASSWORD=$RESTICPASS"
ExecStart=$RESTIC_BIN -r $RESTIC_REPO backup .
DOS
sudo tee /etc/systemd/system/restic.timer <<DIS
[Unit]
Description=Run restic backup every 5 minutes
[Timer]
Unit=restic.service
OnBootSec=5min
OnUnitActiveSec=5min
Persistent=true
[Install]
WantedBy=timers.target
DIS
#----#
sudo systemctl daemon-reload
sudo systemctl enable --now restic.timer
