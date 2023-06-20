sns deploy --network "ic" --init-config-file "./sns/sns_init.yaml" --save-to "sns_canister_ids.json" 

ic-admin   \
   --nns-url "https://nns.ic0.app" propose-to-open-sns-token-swap  \
   --min-participants 500  \
   --min-icp-e8s 100000000000000  \
   --max-icp-e8s 200000000000000  \
   --min-participant-icp-e8s 100000000  \
   --max-participant-icp-e8s 15000000000000  \
   --swap-due-timestamp-seconds "1689148800"  \
   --sns-token-e8s 33000000000000000  \
   --target-swap-canister-id "${SNS_SWAP_ID}"  \
   --community-fund-investment-e8s 50100000000000  \
   --neuron-basket-count 5  \
   --neuron-basket-dissolve-delay-interval-seconds 15778800  \
   --proposal-title "Proposal to create an SNS-DAO for Hot or Not"  \
   --summary "Decentralize this SNS" #Edit this from the Notion file
