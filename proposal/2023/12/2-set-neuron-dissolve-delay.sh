set -euo pipefail

export IDENTITY_NAME="hot_or_not_canister_proposal_submitter"
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"
export CANISTER_IDS_FILE="./sns/sns_canister_ids.json"
export NEURON_ID="4de673e9cd7a1339afea6523a5f227d25e9d739ff52635ac86dbdb0447ae106a"

dfx identity use "${IDENTITY_NAME}"

./quill sns \
  --canister-ids-file "${CANISTER_IDS_FILE}"  \
  --pem-file "${PEM_FILE}"  \
  configure-dissolve-delay \
  --additional-dissolve-delay-seconds 8000000 \
  ${NEURON_ID} > "./sns/proposal/2023/12/2-set-neuron-dissolve-delay.json"

./quill send "./sns/proposal/2023/12/2-set-neuron-dissolve-delay.json" --yes