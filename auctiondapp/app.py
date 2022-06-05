import os
import json
from web3 import Web3
from pathlib import Path
from dotenv import load_dotenv
import streamlit as st

load_dotenv()

# Define and connect a new Web3 provider
w3 = Web3(Web3.HTTPProvider(os.getenv("WEB3_PROVIDER_URI")))

################################################################################
# Contract Helper function:
# 1. Loads the contract once using cache
# 2. Connects to the contract using the contract address and ABI
################################################################################

# Cache the contract on load
@st.cache(allow_output_mutation=True)
# Define the load_contract function
def load_contract():

    # Load ABI
    with open(Path('contracts/compiled/compiled.json')) as f:
        auction_abi = json.load(f)

    # Set the contract address (this is the address of the deployed contract)
    contract_address = os.getenv("SMART_CONTRACT_ADDRESS")

    # Get the contract
    contract = w3.eth.contract(
        address=contract_address,
        abi=auction_abi
    )
    # Return the contract from the function
    return contract


# Load the contract
contract = load_contract()


################################################################################
# Award Certificate
################################################################################

accounts = w3.eth.accounts
account = accounts[0]
wallet_account = st.selectbox("Select Account", options=accounts)
make_bid = st.number_input("Make a Bid", value=0, step=1)
if st.button("Make Bid"):
    contract.functions.bid(wallet_account, make_bid).transact({'from': account, 'gas': 1000000})

################################################################################
# Display Certificate
################################################################################
if st.button("Display Auction Info"):
    # Get the certificate owner
    end_time = contract.functions.auctionEndTime().call()
    st.write(f"The auction ends in {end_time}")

    # Get the certificate's metadata
    high_bid = contract.functions.highestbid().call()
    st.write(f"The highest bid is {high_bid}")
    
    # Highest bidder
    high_bidder = contract.functions.highestBidder().call()
    st.write(f"The highest bidder is {high_bidder}")