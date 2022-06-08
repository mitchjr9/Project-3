# Project-3

## Team Members

Abib Ajibola, Alex Mowlem, and Mitch Rose

## Project Description / Outline

We built an auction app used to make bids in Eth. Through the use of smart contracts, an image of a movie poster will be minted into an NFT. Finally, a frontend web application built in Streamlit is used to make bids in a more user-friendly way.

## NFT
The NFT contract creates a non-fungible token that complies with ERC721 standards. An NFT ensures means that the token is unique and has no inherent value, but rather the value is determined by the market.
 
## Certificate
The certificate smart contract creates a digital receipt and is supported by imported OpenZepplin contract code.

## Auction
The auction contract enables bids to be made in Eth that are held by the contract. A wallet can only bid once in a given auction; there is a finite amount of time available for the auction; bids can only be made if they exceed the highest bid, and the highest bid wins when the time expires.

## Exchange
The exchange contract enables Eth to be sent to the contract. Eth can then be withdrawn from that contract, effectively enabling Eth to be sent from one wallet to another.

## Project Files
1. auctiondapp folder - contains auction frontend and supporting materials
1. contracts - contains all smart contracts used in the project
1. images - contains _Punch 9_ movie poster
