#!/usr/bin/env bash
set -euo pipefail

# usage() { 
#   printf "Usage: \n[-s Skip test] \n[-h Display help] \n"; 
#   exit 0; 
# }

# skip_test=false

# while getopts "sh" arg; do
#   case $arg in
#     s)
#       skip_test=true
#       ;;
#     h) 
#       usage
#       ;;
#   esac
# done

cd /dapp

export CANISTER_ID_configuration=$(dfx canister id configuration)
export WASM_LOCATION_configuration="/dapp/target/wasm32-unknown-unknown/release/configuration.wasm"
# export CANISTER_ID_data_backup=$(dfx canister id data_backup)
# export CANISTER_ID_post_cache=$(dfx canister id post_cache)
# export CANISTER_ID_user_index=$(dfx canister id user_index)

# export LOCAL_TOP_POSTS_SYNC_INTERVAL="10000000000"

dfx build configuration
gzip -f -1 "${WASM_LOCATION_configuration}"
# dfx build data_backup
# gzip -f -1 /dapp/target/wasm32-unknown-unknown/release/data_backup.wasm
# dfx build individual_user_template
# gzip -f -1 /dapp/target/wasm32-unknown-unknown/release/individual_user_template.wasm
# dfx build user_index
# gzip -f -1 /dapp/target/wasm32-unknown-unknown/release/user_index.wasm
# dfx build post_cache
# gzip -f -1 /dapp/target/wasm32-unknown-unknown/release/post_cache.wasm

# if [[ $skip_test != true ]] 
# then
#   cargo test
# fi

# dfx canister install configuration --mode upgrade --argument "(record {})"
# dfx canister install data_backup --mode upgrade --argument "(record {})"
# dfx canister install post_cache --mode upgrade --argument "(record {})"
# dfx canister install user_index --mode upgrade --argument "(record {})"
# dfx canister call user_index update_user_index_upgrade_user_canisters_with_latest_wasm

cd ~

. ./constants.sh normal

cd /dapp

export DEVELOPER_NEURON_ID="$(dfx canister call sns_governance list_neurons "(record {of_principal = opt principal\"${DFX_PRINCIPAL}\"; limit = 1})" | grep "^ *id = blob" | sed "s/^ *id = \(.*\);$/'(\1)'/" | xargs didc encode | tail -c +21)"

quill sns  \
   --canister-ids-file ~/sns_canister_ids.json  \
   --pem-file "${PEM_FILE}"  \
   make-upgrade-canister-proposal  \
   --summary "This proposal upgrades configuration canister"  \
   --title "Upgrade configuration canister"  \
   --url "https://example.com/"  \
   --target-canister-id "${CANISTER_ID_configuration}"  \
   --wasm-path "${WASM_LOCATION_configuration}"  \
   --canister-upgrade-arg "(record {})"  \
   "${DEVELOPER_NEURON_ID}" > msg.json
quill --insecure-local-dev-mode send --yes msg.json | grep -v "new_canister_wasm"