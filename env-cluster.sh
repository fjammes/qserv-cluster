# Directory containing infrastructure specification
# (ssh credentials, machine names)
CLUSTER_CONFIG_DIR="$HOME/.lsst/qserv-cluster"

# Machine names
ENV_INFRASTRUCTURE_FILE="$CLUSTER_CONFIG_DIR/env-infrastructure.sh"
. "$ENV_INFRASTRUCTURE_FILE"

