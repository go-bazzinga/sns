ic-admin   \
   --nns-url "https://nns.ic0.app" propose-to-open-sns-token-swap  \
   --min-participants 500  \
   --min-icp-e8s 100000000000000  \
   --max-icp-e8s 200000000000000  \
   --min-participant-icp-e8s 100000000  \
   --max-participant-icp-e8s 15000000000000  \
   --swap-due-timestamp-seconds "1689235200"  \
   --sns-token-e8s 33000000000000000  \
   --target-swap-canister-id "6eexo-lqaaa-aaaaq-aaawa-cai"  \
   --community-fund-investment-e8s 50100000000000  \
   --neuron-basket-count 5  \
   --neuron-basket-dissolve-delay-interval-seconds 15778800  \
   --sale-delay-seconds 43200  \
   --proposal-title "Proposal to create an SNS-DAO for Hot or Not"  \
   --summary "## Summary

This is the proposal for the NNS to create an SNS DAO to govern the [Hot or Not DApp](https://hotornot.wtf/).

## Purpose

Hot or Not is a decentralized social media platform governed by the people for the people.

Hot or Not is a social media platform like TikTok where people can make and share short videos. But unlike TikTok, it also lets users predict which videos will become popular by choosing **Hot** or **Not**. The website declares winners every hour, and they get twice the token rewards. This platform combines three big industries: Web3, Social Media, and Prediction Markets.

It is open source and the code running on any canister smart contract [verifiably links back to a particular version](https://github.com/go-bazzinga/hot-or-not-dapp/blob/main/README.md) of the code. The repository for open-sourced codes can be accessed at the following links:

1. Front-End Repository: https://github.com/go-bazzinga/hot-or-not-dapp
2. Back-End Repository: https://github.com/go-bazzinga/hot-or-not-backend-canister

To steer the direction of Hot or Not as a public good, the HotorNot DAO is being formed. People who hold HOT tokens can stake them as neurons to make and vote on proposals to change the platform. The SNS DAO holds a treasury of HOT tokens and ICP that can be used to fund the platform's ongoing development and reward users for positive usage and growth. By incentivizing users with HOT tokens and neurons, the platform hopes to create a team of advocates who will promote Hot or Not and contribute to its long-term success.

For more information on the HotorNot Project and SNS please read the [whitepaper here](https://www.notion.so/Hot-or-Not-Whitepaper-c539179e51f44867979f4372e4635f59?pvs=21).

## Proposed Token Distribution

Total token supply: 1 billion HOT tokens

Initially distributed:

- 41.25%: Reserved for the SNS treasury and HotorNot Foundation
- 33%: To be distributed by the NNS-run decentralization sale which includes the Community Fund
- 15%: Allocated to the HotorNot founding team which vests over 4 years
- 9.75%: Allocated to the seed investors of the Hot or Not project and the holders of Hot or Not Funded NFTs
- 1%: Allocated to the advisors of Hot or Not

Ledger transaction fee: 0.001 HOT tokens

For more information on the initial token allocation please [read here](https://www.notion.so/Hot-or-Not-Whitepaper-c539179e51f44867979f4372e4635f59?pvs=21).

## Governance

- Each decentralization sale participant (including the Community Fund) will receive their tokens in a basket of 5 equal value CHAT neurons with dissolve delays of 0, 6, 12, 18, and 24 months respectively
- The founding dev team will receive their tokens in a basket of 48 neurons. Each neuron will have a dissolve delay of 3 months. These neurons will be vested over a period of 48 months from the SNS Sale in equal proportions every month. The founders will not receive any tokens at the SNS sale event, with all the tokens having a vesting period at that time.
- Each investor/advisor will receive tokens in the form of a basket of 24 equal-value neurons. Each neuron will have a dissolve delay of 3 months. These neurons will be vested over a period of 24 months from the SNS Sale in equal proportions every month.

The governance parameters for Hot or Not are proposed to be initially set as:

- Min stake: 5 HOT tokens
- Min staking period for voting: 3 months
- Max staking period: 4 years

Voting Rewards: The reward rate would start from 10% annually. This rate would decline over time and settle at 5% over 10 years.

- Max staking bonus (for 4 years): 2x
- Max age for age bonus: 2 years
- Max age bonus: 1.25x

## Decentralization Sale

33% of the total supply of tokens is proposed to be distributed via an SNS decentralization sale. If the proposal is adopted, the sale will start after the specified delay and is scheduled to conclude at the end of 15 days from the start of the sale. If the maximum number of ICP configured below is raised before that date the sale will conclude earlier.

Sale participation parameters:

- Min participation: 1 ICP
- Max participation: 150,000 ICP
- Max to be raised: 2,000,000 ICP
- Min to be raised: 1,000,000 ICP
- From Community Fund: 501,000 ICP
- Min participants: 500

The sale is open to anyone. Participation is either via the launchpad in the NNS front end: https://nns.ic0.app/ or on the command line using [quill](https://wiki.internetcomputer.org/wiki/How-To:_SNS_swap_participation_via_quill).

## The DApp

The HotorNot DApp consists of a set of canister smart contracts.

Top-level canisters controlled by the HotorNot SNS root canister:

- 1 Website asset canister (vyatz-hqaaa-aaaam-qauea-cai)
- 1 Configuration canister (efsfj-sqaaa-aaaap-qatwa-cai)
- 1 Data backup canister (jwktp-qyaaa-aaaag-abcfa-cai)
- 1 Post Cache canister (y6yjf-jyaaa-aaaal-qbd6q-cai)
- 1 User Index canister(rimrc-piaaa-aaaao-aaljq-cai)

Every logged in user on the platform receives a canister that stores their individual data. They are controlled by the user index canister. So, indirectly, they will all be controlled by the SNS as well.

For more information please see a description of the architecture [here](https://www.notion.so/Hot-or-Not-Whitepaper-c539179e51f44867979f4372e4635f59?pvs=21).

## Verification

All the details above can be verified, by examining the initialized HotorNot SNS canisters. [More detailed instructions are here](https://wiki.internetcomputer.org/wiki/How-to:_Verify_SNS_decentralization_swap_proposal)."
