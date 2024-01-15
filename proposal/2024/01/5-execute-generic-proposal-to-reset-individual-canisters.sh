set -euo pipefail

export IDENTITY_NAME=YOUR_IDENTITY
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"
export CANISTER_IDS_FILE="./sns/sns_canister_ids.json"
export NEURON_ID=YOUR_NEURON_ID

export CANISTER_IDS_FILE="./sns/sns_canister_ids.json"
export APP_URL="https://hotornot.wtf/"
export CANISTER_CANDID="src/canister/user_index/can.did"

export CANISTERS_TO_RESET="${1:-vec {principal PRINCIPAL_ID}

export BLOB="$(didc encode --defs ${CANISTER_CANDID} --method reset_user_individual_canisters --format blob "(${CANISTERS_TO_RESET})")"

quill sns \
   --canister-ids-file "${CANISTER_IDS_FILE}" \
 --pem-file "${PEM_FILE}" \
   make-proposal --proposal "(
    record { 
        title = \"Execute generic functions for reset corrupt canister.\"; 
        url = \"https://github.com/go-bazzinga/hot-or-not-backend-canister/blob/8d0b2ed08657d9e36e311f0d36b7672da340fdda/src/canister/user_index/src/api/canister_management/mod.rs#L84\"; 
        summary = \"This proposal executes generic functions to reset corrupt canisters.\"; 
        action = opt variant {
            ExecuteGenericNervousSystemFunction = record {

                function_id = 4001:nat64; 
                
                payload = ${BLOB}
            }
        }    
    }
)" "${NEURON_ID}" > "./sns/proposal/2024/01/5-execute-generic-proposal-to-reset-individual-canisters.json"

quill send ./sns/proposal/2024/01/5-execute-generic-proposal-to-reset-individual-canisters.json --yes
