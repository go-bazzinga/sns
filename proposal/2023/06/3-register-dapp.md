```sh
# prepare asset canister
dfx canister --network ic call vyatz-hqaaa-aaaam-qauea-cai grant_permission "(record {to_principal = principal\"6wcax-haaaa-aaaaq-aaava-cai\"; permission = variant { ManagePermissions }})"

# add sns root as controller to all the dapps
dfx canister --network ic update-settings --add-controller "67bll-riaaa-aaaaq-aaauq-cai" "vyatz-hqaaa-aaaam-qauea-cai"
dfx canister --network ic update-settings --add-controller "67bll-riaaa-aaaaq-aaauq-cai" "efsfj-sqaaa-aaaap-qatwa-cai"
dfx canister --network ic update-settings --add-controller "67bll-riaaa-aaaaq-aaauq-cai" "jwktp-qyaaa-aaaag-abcfa-cai"
dfx canister --network ic update-settings --add-controller "67bll-riaaa-aaaaq-aaauq-cai" "y6yjf-jyaaa-aaaal-qbd6q-cai"
dfx canister --network ic update-settings --add-controller "67bll-riaaa-aaaaq-aaauq-cai" "rimrc-piaaa-aaaao-aaljq-cai"

# Register the dapps
./sns-testing/bin/quill sns --canister-ids-file ./sns_canister_ids.json --pem-file "/home/saikat/.config/dfx/identity/hot_or_not_sns/identity.pem" make-proposal --proposal "(record { title=\"Register dapp's canisters with SNS.\"; url=\"https://hotornot.wtf/\"; summary=\"This proposal registers dapp's canisters with SNS.\"; action=opt variant {RegisterDappCanisters = record {canister_ids=vec {principal\"vyatz-hqaaa-aaaam-qauea-cai\"; principal\"efsfj-sqaaa-aaaap-qatwa-cai\"; principal\"jwktp-qyaaa-aaaag-abcfa-cai\"; principal\"y6yjf-jyaaa-aaaal-qbd6q-cai\"; principal\"rimrc-piaaa-aaaao-aaljq-cai\";}}}})" "54f9ba2b0e81a17f5261b277abd91816e041c5ca749ba88b3dbe05f66bb6124d" > ./sns/proposal/2023/06/register_dapp.json
./sns-testing/bin/quill send ./sns/proposal/2023/06/register_dapp.json --yes

```
