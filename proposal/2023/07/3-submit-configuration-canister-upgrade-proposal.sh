#!/usr/bin/env bash
set -euo pipefail

export IDENTITY_NAME="hot_or_not_sns"
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"
dfx identity use "${IDENTITY_NAME}"

dfx build --network=ic individual_user_template
gzip -f -1 ./target/wasm32-unknown-unknown/release/individual_user_template.wasm
dfx build --network=ic user_index
dfx build --network=ic configuration
dfx build --network=ic data_backup
dfx build --network=ic post_cache

export CANISTER_IDS_FILE="./sns/sns_canister_ids.json"
export APP_URL="https://hotornot.wtf/"

export CANISTER_NAME="configuration"
./quill sns \
  --canister-ids-file "${CANISTER_IDS_FILE}"  \
  --pem-file "${PEM_FILE}"  \
  make-upgrade-canister-proposal \
  --title "Upgrade ${CANISTER_NAME} canister"  \
  --summary "This proposal includes Step 1 for removing a legacy access_control field from the canister internal storage"  \
  --url "${APP_URL}"  \
  --target-canister-id "$(dfx canister id ${CANISTER_NAME} --network ic)" \
  --wasm-path "./.dfx/ic/canisters/${CANISTER_NAME}/${CANISTER_NAME}.wasm.gz" \
  --canister-upgrade-arg "(record {})" \
"54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d" > "./sns/proposal/2023/07/upgrade_${CANISTER_NAME}_canister_message.json"
./quill send "./sns/proposal/2023/07/upgrade_${CANISTER_NAME}_canister_message.json" --yes

# sleep 300

# export CANISTER_NAME="data_backup"
# ./quill sns \
#   --canister-ids-file "${CANISTER_IDS_FILE}"  \
#   --pem-file "${PEM_FILE}"  \
#   make-upgrade-canister-proposal \
#   --title "Upgrade ${CANISTER_NAME} canister"  \
#   --summary "This proposal upgrades ${CANISTER_NAME} canister"  \
#   --url "${APP_URL}"  \
#   --target-canister-id "$(dfx canister id ${CANISTER_NAME} --network ic)" \
#   --wasm-path "./.dfx/ic/canisters/${CANISTER_NAME}/${CANISTER_NAME}.wasm.gz" \
#   --canister-upgrade-arg "(record {})" \
# "54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d" > "./sns/proposal/2023/07/upgrade_${CANISTER_NAME}_canister_message.json"
# ./quill send "./sns/proposal/2023/07/upgrade_${CANISTER_NAME}_canister_message.json" --yes

# sleep 300

# export CANISTER_NAME="post_cache"
# ./quill sns \
#   --canister-ids-file "${CANISTER_IDS_FILE}"  \
#   --pem-file "${PEM_FILE}"  \
#   make-upgrade-canister-proposal \
#   --title "Upgrade ${CANISTER_NAME} canister"  \
#   --summary "This proposal upgrades ${CANISTER_NAME} canister"  \
#   --url "${APP_URL}"  \
#   --target-canister-id "$(dfx canister id ${CANISTER_NAME} --network ic)" \
#   --wasm-path "./.dfx/ic/canisters/${CANISTER_NAME}/${CANISTER_NAME}.wasm.gz" \
#   --canister-upgrade-arg "(record {})" \
# "54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d" > "./sns/proposal/2023/07/upgrade_${CANISTER_NAME}_canister_message.json"
# ./quill send "./sns/proposal/2023/07/upgrade_${CANISTER_NAME}_canister_message.json" --yes

# sleep 300

# export CANISTER_NAME="user_index"
# ./quill sns \
#   --canister-ids-file "${CANISTER_IDS_FILE}"  \
#   --pem-file "${PEM_FILE}"  \
#   make-upgrade-canister-proposal \
#   --title "Upgrade ${CANISTER_NAME} canister"  \
#   --summary "This proposal upgrades ${CANISTER_NAME} canister"  \
#   --url "${APP_URL}"  \
#   --target-canister-id "$(dfx canister id ${CANISTER_NAME} --network ic)" \
#   --wasm-path "./.dfx/ic/canisters/${CANISTER_NAME}/${CANISTER_NAME}.wasm.gz" \
#   --canister-upgrade-arg "(record {})" \
# "54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d" > "./sns/proposal/2023/07/upgrade_${CANISTER_NAME}_canister_message.json"
# ./quill send "./sns/proposal/2023/07/upgrade_${CANISTER_NAME}_canister_message.json" --yes
