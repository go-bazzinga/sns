#!/usr/bin/env bash

export PEM_FILE="$(readlink -f ~/.config/dfx/identity/hot_or_not_sns/identity.pem)"

export BLOB="$(didc encode --format blob "(record {to_principal = principal\"$(dfx identity get-principal)\"; permission = variant {Prepare}})")"
./sns-testing/bin/quill sns  \
   --canister-ids-file ./sns/sns_canister_ids.json  \
   --pem-file "${PEM_FILE}"  \
   make-proposal --proposal "(record { title=\"Execute grant permission to asset canister.\"; url=\"https://hotornot.wtf/\"; summary=\"This proposal executes grant permission to asset canister.\"; action=opt variant {ExecuteGenericNervousSystemFunction = record {function_id=1000:nat64; payload=${BLOB}}}})" "54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d" > ./sns/proposal/2023/06/add_prepare_permission.json
./sns-testing/bin/quill send --yes ./sns/proposal/2023/06/add_prepare_permission.json
