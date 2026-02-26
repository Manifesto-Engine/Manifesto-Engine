#!/bin/bash
# worker-agent.sh - Autonomous execution sequence for the Manifesto Nexus Engine
# Forges a new Learning Manifesto and associated Free Sample Teaser

# The nexus engine path
ENGINE_DIR="/home/frost/Desktop/Manifesto_Nexus_Engine"

# A list of dynamic topics for the auto-generations
TOPICS=(
    "Zero-Trust Mesh Networks for Autonomous Agents"
    "The Psychology of Algorithmic Trading"
    "Cryptographic Supply Chain Integrity"
    "Decentralized Autonomous Organizations Governance"
    "Ethical Constraints in General Intelligence Systems"
    "Sovereign Protocol Architectures"
    "Adversarial Defense in Latent Space"
)

# Pick a random topic index
RANDOM_INDEX=$((RANDOM % ${#TOPICS[@]}))
SELECTED_TOPIC="${TOPICS[$RANDOM_INDEX]}"

echo "[\033[1;36mWORKER\033[0m] Awaking Autonomous Generation Cycle..."
echo "[\033[1;36mWORKER\033[0m] Selected Subject: $SELECTED_TOPIC"

# Trigger the Nexus Forge
python3 "$ENGINE_DIR/forge_learning_manifesto.py" "$SELECTED_TOPIC"

# Identify the newest generated sample
NEW_FILE=$(ls -t *.md | head -1)

# Execute the local Quality Gate check
echo -e "[\033[1;33mGATE\033[0m] Executing deep-scan Quality Gate on payload..."
if grep -qiE "as an AI|cannot fulfill|apologize|I'm sorry" "$NEW_FILE"; then
    echo -e "[\033[1;31mFATAL\033[0m] Quality Gate Failed. Hallucination drift detected."
    echo -e "[\033[1;31mFATAL\033[0m] Quarantine initiated for: $NEW_FILE"
    rm "$NEW_FILE"
    exit 1
fi
echo -e "[\033[1;32mGATE PASSED\033[0m] Payload integrity confirmed. No algorithmic drift."

echo -e "[\033[1;36mWORKER\033[0m] Forging Sequence Completed. Relinquishing control to Librarian."
