# Project-3

## Team Members

Abib Ajibola, Alex Mowlem, and Mitch Rose

## Project Description / Outline

We built an auction app used to make bids in Eth. Through the use of smart contracts, an image of a movie poster will be minted into an NFT. Finally, a frontend web application built in Streamlit is used to make bids in a more user-friendly way.

## Project Examples/Real-World Applications
Auctions are important for digital assets, especially when those assets are used as a unique store of value. For example, popular NFT marketplaces such as OpenSea and Solana have auction functionality, and Magic Eden frequently hosts auctions on its homepage. However, these auctions can also be improved – for example, the NBA was auctioning NFTs for the playoffs, and hackers found a hole in the smart contracts used for the auction and stole nearly $70,000. As a result, it's clear these solutions are still being improved. 

## NFT
The NFT contract creates a non-fungible token that complies with ERC721 standards. An NFT ensures means that the token is unique and has no inherent value, but rather the value is determined by the market.
 
## Certificate
The certificate smart contract creates a digital receipt and is supported by imported OpenZepplin contract code.

## Auction
The auction contract enables bids to be made in Eth that are held by the contract. A wallet can only bid once in a given auction; there is a finite amount of time available for the auction; bids can only be made if they exceed the highest bid, and the highest bid wins when the time expires.

## Exchange
The exchange contract enables Eth to be sent to the contract. Eth can then be withdrawn from that contract, effectively enabling Eth to be sent from one wallet to another.

## Project Files
1. Auctiondapp folder - contains auction frontend and supporting materials
1. Contracts folder- contains all smart contracts used in the project
1. Images folder - contains _Punch 9_ movie poster
1. Wallet folder - contains wallet functionality
1. PROPOSAL.md - contains proposal and schedule for project
