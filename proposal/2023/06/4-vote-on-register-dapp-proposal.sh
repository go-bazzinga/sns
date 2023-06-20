#!/usr/bin/env bash

export PROPOSAL="${1:-3}"
export VOTE="${2:-y}"

export PEM_FILE="$(readlink -f ~/.config/dfx/identity/utkarsh_sns/identity.pem)"
dfx identity use "utkarsh_sns"
export DX_PRINCIPAL="$(dfx identity get-principal)"

export JSON="$(dfx canister --network ic call 6wcax-haaaa-aaaaq-aaava-cai list_neurons "(record {of_principal = opt principal\"${DX_PRINCIPAL}\"; limit = 0})" --output idl --candid ./candid/sns_governance.did | sed "s/principal *=/\"principal\"=/g" | idl2json | jq -r ".neurons")"

for((i=0; i<"$(echo $JSON | jq length)"; i++))
do
    export NEURON_ID="$(echo $JSON | jq -r ".[${i}].id[0].id" | python3 -c "import sys; ints=sys.stdin.readlines(); sys.stdout.write(bytearray(eval(''.join(ints))).hex())")"
    echo $NEURON_ID
    # ./sns-testing/bin/quill sns --canister-ids-file ./sns/sns_canister_ids.json --pem-file "${PEM_FILE}" register-vote --proposal-id ${PROPOSAL} --vote ${VOTE} ${NEURON_ID} > ./sns/proposal/2023/06/add_prepare_permission_vote.json
    
    # ./sns-testing/bin/quill send --yes ./sns/proposal/2023/06/add_prepare_permission_vote.json
done