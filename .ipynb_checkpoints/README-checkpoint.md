# Project-3

## Team Members

Abib Ajibola, Alex Mowlem, and Mitch Rose

## Project Description / Outline

We built an auction app used to make bids in Eth. Through the use of smart contracts, an image of a movie poster will be minted into an NFT. Finally, a frontend web application built in Streamlit is used to make bids in a more user-friendly way.

## Project Examples/Real-World Applications
Auctions are important for digital assets, especially when those assets are used as a unique store of value. For example, popular NFT marketplaces such as OpenSea and Solana have auction functionality, and Magic Eden frequently hosts auctions on its homepage. However, these auctions can also be improved – for example, the NBA was auctioning NFTs for the playoffs, and hackers found a hole in the smart contracts used for the auction and stole nearly $70,000. As a result, it's clear these solutions are still being improved. As it relates to movies, a marketplace where creators can distribute movie or video content in a decentralized way is not currently available, and creators need to eitehr distribute the movie themselves or sell to a centralized company, which can be unfavorable for creators. Thus, we wanted to create our own decentrlaized auction, and if we had more time, a decentralized marketplace, for movies.

## Usage and Installation Instructions
To use the app, clone the GitHub repo to your local machine. Then, launch Ganache on your local machine and ensure you have Ganache wallets imported on your MetaMask. Next, launch Remix, or another Ethereum IDE, and copy and paste the 'auction.sol' smart contract into a new '.sol' file in the IDE. Next, you will need to change the Solidity compiler to a version between 0.7.0 and 0.9.0, and then compile the smart contract. After that, go to the icon under the compiling area on Remix; enter a duration for the auction in the 'Bidding Time' field, and enter a wallet address in the 'Beneficiary' field. Then, click 'transact' to deploy the contract (you will also have to sign off on the deployment inyour MetaMask). Before you deploy, ensure that your environment is set as 'Injected Web3' so you're using a Ganache wallet. After this, you can submit bids on Remix by opening the bid function, entering a bid value in 'current_bid' and the wallet address from which you're submitting your bid in 'wallet_address,' and clicking 'transact.' However, if you'd like to bid in a more user-friendly way, you can copy and paste the 'auction.sol' smart contract address in the .env file in the 'auctiondapp' folder and copy and paste the ABI in the 'compiled.json' file in 'contracts' and 'compiled' folders in the 'auctiondapp' folder. Now, you're ready to launch the frontend app! Navigate to your terminal and open the 'auctiondapp' folder, then enter the following command: 'streamlit run app.py.' Once the app opens, you can select a wallet and make a bid! You can also click 'Display Auction Info' to see the time remaining in the auction, the current highest bid, and the highest bidder's wallet.

## NFT
The NFT contract creates a non-fungible token that complies with ERC721 standards. An NFT ensures means that the token is unique and has no inherent value, but rather the value is determined by the market.
 
## Certificate
The certificate smart contract creates a digital receipt and is supported by imported OpenZepplin contract code.

## Auction
The auction contract enables bids to be made in Eth that are held by the contract. A wallet can only bid once in a given auction; there is a finite amount of time available for the auction; bids can only be made if they exceed the highest bid, and the highest bid wins when the time expires.

## Exchange
The exchange contract enables Eth to be sent to the contract. Eth can then be withdrawn from that contract, effectively enabling Eth to be sent from one wallet to another.

## Project Files
1. Auctiondapp folder - contains auction frontend and supporting materials including contracts, .env file, .json file
1. Exchangedapp folder – contains exchange smart contract (and incomplete frontend)
1. Contracts folder- contains other smart contracts used in the project
1. Images folder - contains _Punch 9_ movie poster
1. Wallet folder - contains wallet functionality
1. PROPOSAL.md - proposal and schedule for project
