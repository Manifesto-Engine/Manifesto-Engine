#!/bin/bash
# install_service.sh - Deploys the automated Manifesto systemd daemon

SERVICE_FILE="/etc/systemd/system/manifesto-agent.service"
TIMER_FILE="/etc/systemd/system/manifesto-agent.timer"

echo "[INSTALL] Staging the Manifesto Agent Daemon..."

# Create the Service File
sudo tee $SERVICE_FILE > /dev/null << 'EOF'
[Unit]
Description=Manifesto Engine Agent Publisher
After=network.target

[Service]
Type=oneshot
User=frost
WorkingDirectory=/home/frost/Desktop/Valut/Free_Samples
ExecStart=/bin/bash -c './worker-agent.sh && ./librarian.sh && git add . && git commit -m "🤖 auto-sync: agent manuals and readme update" && git push origin main'

[Install]
WantedBy=multi-user.target
EOF

# Create the Timer File
sudo tee $TIMER_FILE > /dev/null << 'EOF'
[Unit]
Description=Run Manifesto Agent every 4 hours

[Timer]
OnBootSec=5min
OnUnitActiveSec=4h
Unit=manifesto-agent.service

[Install]
WantedBy=timers.target
EOF

echo "[INSTALL] Daemon configuration written."
echo "[INSTALL] Reloading Systemd and enabling the timer..."

sudo systemctl daemon-reload
sudo systemctl enable --now manifesto-agent.timer

echo "[INSTALL] Autonomous cycle actively tracking. Next run scheduled in ~4 hours."
echo "You can view the logs anytime with: journalctl -u manifesto-agent.service -f"
