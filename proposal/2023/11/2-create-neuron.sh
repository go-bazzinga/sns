set -euo pipefail

export IDENTITY_NAME="hot_or_not_canister_proposal_submitter"
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"
export CANISTER_IDS_FILE="./sns/sns_canister_ids.json"
export AMOUNT=1900

dfx identity use "${IDENTITY_NAME}"

./quill sns \
  --canister-ids-file "${CANISTER_IDS_FILE}"  \
  --pem-file "${PEM_FILE}"  \
  stake-neuron \
  --amount ${AMOUNT} \
  --memo 1 > "./sns/proposal/2023/11/2-create-neuron.json"

./quill send "./sns/proposal/2023/11/2-create-neuron.json" --yes