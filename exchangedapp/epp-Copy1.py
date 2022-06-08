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
    with open(Path('compiled/compiled.json')) as f:
        exchange_abi = json.load(f)

    # Set the contract address (this is the address of the deployed contract)
    contract_address = os.getenv("SMART_CONTRACT_ADDRESS")

    # Get the contract
    contract = w3.eth.contract(
        address=contract_address,
        abi=exchange_abi
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
enter_amt = st.number_input("Enter Amount to Send", value=0, step=1)
if st.button("Send Eth"):
    contract.functions.sendMoney(wallet_account, enter_amt).transact({'from': account, 'gas': 1000000})

################################################################################
# Withdraw from smart contract
################################################################################
if st.button("Withdraw from smart contract"):
    # Get the wallet balance
    withdraw_eth = contract.functions.withdrawAllMoney().call()
    st.write(f"The wallet balance is {end_time}")
    
################################################################################
# Get Balance
################################################################################
if st.button("Display Balance"):
    # Get the wallet balance
    wallet_balance = contract.functions.getBalance().call()
    st.write(f"The wallet balance is {end_time}")