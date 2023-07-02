#!/usr/bin/env bash

export IDENTITY_NAME="utkarsh_sns"

export GOVERNANCE_CANISTER="6wcax-haaaa-aaaaq-aaava-cai"

export PEM_FILE="$(readlink -f ~/.config/dfx/identity/${IDENTITY_NAME}/identity.pem)"
dfx identity use "${IDENTITY_NAME}"
export DX_PRINCIPAL="$(dfx identity get-principal)"

export JSON="$(dfx canister --network ic call ${GOVERNANCE_CANISTER} list_neurons "(record {of_principal = opt principal\"${DX_PRINCIPAL}\"; limit = 0})" --output idl --candid ./candid/sns_governance.did | sed "s/principal *=/\"principal\"=/g" | idl2json | jq -r ".neurons")"

for((i=0; i<"$(echo $JSON | jq length)"; i++))
do
    export NEURON_ID="$(echo $JSON | jq -r ".[${i}].id[0].id" | python3 -c "import sys; ints=sys.stdin.readlines(); sys.stdout.write(bytearray(eval(''.join(ints))).hex())")"
    echo $NEURON_ID

    export ESCAPED_NEURON_ID="$(echo $NEURON_ID | sed "s/\(..\)/\\\\\1/g")"
    # echo $ESCAPED_NEURON_ID

    ./quill sns --canister-ids-file ./sns/sns_canister_ids.json --pem-file "${PEM_FILE}" follow-neuron --type all --followees "54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d"  "${NEURON_ID}" > ./sns/proposal/2023/07/add_followee.json

    ./quill send --yes ./sns/proposal/2023/07/add_followee.json

    # dfx canister --network ic call "${GOVERNANCE_CANISTER}" get_neuron "(record {neuron_id = opt record {id=blob\"${ESCAPED_NEURON_ID}\"}})" --candid ./candid/sns_governance.did
done
