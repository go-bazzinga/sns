#!/usr/bin/env bash

export PEM_FILE="$(readlink -f ~/.config/dfx/identity/hot_or_not_sns/identity.pem)"

./sns-testing/bin/quill sns  \
   --canister-ids-file ./sns/sns_canister_ids.json  \
   --pem-file "${PEM_FILE}"  \
   make-proposal --proposal "(record { title=\"Register grant permission to asset canister.\"; url=\"https://hotornot.wtf/\"; summary=\"This proposals registers grant permission to asset canister with the SNS governance canister.\"; action=opt variant {AddGenericNervousSystemFunction = record {id=1000:nat64; name=\"grant_permission\"; description=\"grant permission to asset canister\"; function_type=opt variant {GenericNervousSystemFunction=record{validator_canister_id=opt principal\"vyatz-hqaaa-aaaam-qauea-cai\"; target_canister_id=opt principal\"vyatz-hqaaa-aaaam-qauea-cai\"; validator_method_name=opt\"validate_grant_permission\"; target_method_name=opt\"grant_permission\"}}}}})" "54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d" > ./sns/proposal/2023/06/register_grant_permission.json
./sns-testing/bin/quill send --yes ./sns/proposal/2023/06/register_grant_permission.json

./sns-testing/bin/quill sns  \
   --canister-ids-file ./sns/sns_canister_ids.json  \
   --pem-file "${PEM_FILE}"  \
   make-proposal --proposal "(record { title=\"Register revoke permission to asset canister.\"; url=\"https://hotornot.wtf/\"; summary=\"This proposals registers revoke permission to asset canister with the SNS governance canister.\"; action=opt variant {AddGenericNervousSystemFunction = record {id=1001:nat64; name=\"revoke_permission\"; description=\"revoke permission to asset canister\"; function_type=opt variant {GenericNervousSystemFunction=record{validator_canister_id=opt principal\"vyatz-hqaaa-aaaam-qauea-cai\"; target_canister_id=opt principal\"vyatz-hqaaa-aaaam-qauea-cai\"; validator_method_name=opt\"validate_revoke_permission\"; target_method_name=opt\"revoke_permission\"}}}}})" "54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d" > ./sns/proposal/2023/06/register_revoke_permission.json
./sns-testing/bin/quill send --yes ./sns/proposal/2023/06/register_revoke_permission.json