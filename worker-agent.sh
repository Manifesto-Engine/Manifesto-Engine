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

echo "[\033[1;36mWORKER\033[0m] Forging Sequence Completed. Relinquishing control to Librarian."
