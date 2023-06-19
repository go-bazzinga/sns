sns deploy --network "ic" --init-config-file "./sns/sns_init.yaml" --save-to "sns_canister_ids.json" 

ic-admin   \
   --nns-url "https://nns.ic0.app" propose-to-open-sns-token-swap  \
   --min-participants 1  \
   --min-icp-e8s 100000000000000  \
   --max-icp-e8s 200000000000000  \
   --min-participant-icp-e8s 100000000  \
   --max-participant-icp-e8s 15000000000000  \
   --swap-due-timestamp-seconds "1296000"  \
   --sns-token-e8s 33000000000000000  \
   --target-swap-canister-id "${SNS_SWAP_ID}"  \
   --community-fund-investment-e8s 501_000_00_000_000  \
   --neuron-basket-count 5  \
   --neuron-basket-dissolve-delay-interval-seconds 15778800  \
   --proposal-title "Decentralize this SNS"  \
   --summary "Decentralize this SNS"
