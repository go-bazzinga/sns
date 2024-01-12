#!/usr/bin/env bash

export IDENTITY_NAME="hot_or_not_sns"
export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"
dfx identity use "${IDENTITY_NAME}"
export CANISTER_IDS_FILE="./sns/sns_canister_ids.json"
export PROPOSAL_ID="65"
export VOTE="y"
export NEURON_ID="54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d"

./quill sns \
    --canister-ids-file "${CANISTER_IDS_FILE}" \
    --pem-file "${PEM_FILE}" \
    register-vote \
    --proposal-id ${PROPOSAL_ID} \
    --vote ${VOTE} \
    ${NEURON_ID} > ./sns/proposal/2024/01/2-vote-on-proposal.json

./quill send --yes ./sns/proposal/2024/01/2-vote-on-proposal.json