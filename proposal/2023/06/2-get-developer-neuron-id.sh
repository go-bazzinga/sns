#!/usr/bin/env bash

export JSON="$(dfx canister --network ic call 6wcax-haaaa-aaaaq-aaava-cai list_neurons "(record {of_principal = opt principal\"7gaq2-4kttl-vtbt4-oo47w-igteo-cpk2k-57h3p-yioqe-wkawi-wz45g-jae\"; limit = 0})" --output idl --candid ./candid/sns_governance.did | sed "s/principal *=/\"principal\"=/g" | idl2json | jq -r ".neurons")"

# export JSON="$(dfx canister --network ic call 6wcax-haaaa-aaaaq-aaava-cai list_neurons "(record {of_principal = opt principal\"7gaq2-4kttl-vtbt4-oo47w-igteo-cpk2k-57h3p-yioqe-wkawi-wz45g-jae\"; limit = (0:nat32)})" --output idl | sed "s/principal *=/\"principal\"=/g" | idl2json | jq -r ".neurons")"
# echo $JSON
export NEURON_ID="$(echo $JSON | jq -r ".[${i}].id[0].id" | python3 -c "import sys; ints=sys.stdin.readlines(); sys.stdout.write(bytearray(eval(''.join(ints))).hex())")"
echo $NEURON_ID