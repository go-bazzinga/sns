set -euo pipefail

export IDENTITY_NAME=YOUR_IDENTITY
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"
export CANISTER_IDS_FILE="./sns/sns_canister_ids.json"
export NEURON_ID=YOUR_NEURON_ID

export CANISTER_IDS_FILE="./sns/sns_canister_ids.json"
export APP_URL="https://hotornot.wtf/"
export CANISTER_NAME="user_index"

quill sns \
 --canister-ids-file "${CANISTER_IDS_FILE}" \
 --pem-file "${PEM_FILE}" \
  make-proposal \
  --proposal "(
    record {
        title = \"Add a new custom SNS function to Reset Individual User Canisters\";          
        url = \"https://github.com/go-bazzinga/hot-or-not-backend-canister/blob/8d0b2ed08657d9e36e311f0d36b7672da340fdda/src/canister/user_index/src/api/canister_management/mod.rs#L84\";
        summary = \"This will reset given canisters and install the latest wasm module\";
        action = opt variant {
            AddGenericNervousSystemFunction = record {
                id = 4_001 : nat64;
                name = \"Reset Individual User Canisters\";
                description = opt \"Generic proposal to reset indiviudal user canisters\";
                function_type = opt variant { 
                    GenericNervousSystemFunction = record { 

                        validator_canister_id = opt principal \"$(dfx canister id ${CANISTER_NAME} --network=ic)\"; 

                        target_canister_id = opt principal \"$(dfx canister id ${CANISTER_NAME} --network=ic)\"; 
                        
                        validator_method_name = opt \"validate_reset_user_individual_canisters\"; 
                        
                        target_method_name = opt \"reset_user_individual_canisters\";
                    } 
                };
            }
        };
    }
)" "${NEURON_ID}" > "./sns/proposal/2024/01/4-add-generic-proposal-to-reset-individual-canisters.json"

quill send ./sns/proposal/2024/01/44-add-generic-proposal-to-reset-individual-canisters.json --yes
