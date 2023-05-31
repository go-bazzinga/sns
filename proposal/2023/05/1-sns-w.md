# Enable principal pheyl-kaaaa-aaaap-aatga-cai in SNS-W to initiate the generation of an SNS for Hot or Not

The proposal offers the Hot or Not dApp to the NNS to be turned into a decentralized service by creation of an SNS to govern the Hot or Not dApp canisters.

## Who sent this proposal?

This proposal is sent by Hot or Not development team. Hot or Not is [**a fully featured short-video social media platform**](https://hotornot.wtf/) running on Internet Computer. The project is presents in [**this whitepaper**](https://www.notion.so/Hot-or-Not-Whitepaper-c539179e51f44867979f4372e4635f59).

## What is the purpose of this proposal?

The Hot or Not development team collaborates with the NNS to transform the Hot or Not app into a decentralized service through the establishment of [**a Service Nervous System (SNS) DAO**](https://internetcomputer.org/sns), which serves as the governing body for Hot or Not. The application comprises numerous canisters, and the SNS assumes direct control over the following Hot or Not canisters:

- Website asset canister (vyatz-hqaaa-aaaam-qauea-cai)
- Configuration canister (efsfj-sqaaa-aaaap-qatwa-cai)
- Data backup canister (jwktp-qyaaa-aaaag-abcfa-cai)
- Post Cache canister (y6yjf-jyaaa-aaaal-qbd6q-cai)
- User Index canister(rimrc-piaaa-aaaao-aaljq-cai)

All of the other canisters are in turn controlled by one of the above listed canisters and would thus also be indirectly controlled by the SNS.

If this proposal is approved, the NNS mandates that the necessary steps to create a [**Service Nervous System (SNS) DAO**](https://internetcomputer.org/sns) to govern Hot or Not are taken.

## What is the technical effect of this proposal?

Adoption of the proposal will enable and mandate installation of the required SNS canisters on the SNS subnet. These SNS canisters will be in a pre-decentralization-sale mode with limited capabilities and where tokens cannot be moved until the decentralization sale is completed. Technically, the proposal’s effect is that the cycles wallet with principal ID **pheyl-kaaaa-aaaap-aatga-cai**, which is controlled by Hot or Not, will get the ability to make a call to the SNS wasm modules canister (SNS-W) to install SNS canisters. This privilege is a one-time occurrence, as it will be revoked after the call is made.

## What is this proposal not about / what will be decided in a second, future proposal?

This proposal does not yet include any concrete parameter choices for the Hot or Not SNS. These parameters will be contained in an upcoming second NNS proposal to initiate the Hot or Not decentralization sale and SNS DAO creation and thus can be checked and voted on at that time together with the conditions for the decentralization sale.
