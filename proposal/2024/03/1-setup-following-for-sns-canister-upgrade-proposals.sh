set -euo pipefail

export IDENTITY_NAME="hot_or_not_sns"
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"
export CANISTER_IDS_FILE="./sns/sns_canister_ids.json"
export NEURON_ID="54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d"

dfx identity use "${IDENTITY_NAME}"

./quill sns \
  --canister-ids-file "${CANISTER_IDS_FILE}"  \
  --pem-file "${PEM_FILE}"  \
  follow-neuron \
  --followees a133890831635bad4b955327fba37d91759fa1d1c4971503cf4670ea630e9a18 \
  --type upgrade-sns-to-next-version \
  ${NEURON_ID} > "./sns/proposal/2024/03/1-setup-following-for-sns-canister-upgrade-proposals.json"

./quill send "./sns/proposal/2024/03/1-setup-following-for-sns-canister-upgrade-proposals.json" --yes