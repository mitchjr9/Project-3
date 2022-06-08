// SPDX-License-Identifier: MIT
pragma solidity>=0.7.0 <0.9.0;

contract Auction{
    address payable public beneficiary;
    uint public auctionEndTime;
    
    // current state of the auction 
    address public highestBidder;
    uint public highestbid; 
    bool ended;
    
    mapping(address => uint) pendingReturns;
    
    event highestBidIncreased(address bidder, uint amount);
    event auctionEnded(address winner, uint amount);
    
    constructor(uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime; 
    }
    function bid(uint current_bid, address wallet_address) public payable {
        require(block.timestamp < auctionEndTime,"The auction is over");
        require(wallet_address != highestBidder,"You are already the highest bidder");
        if(current_bid > highestbid) {
            
            if(pendingReturns[wallet_address]>0)
            {
                uint amount = pendingReturns[wallet_address];
                payable(wallet_address).transfer(amount);
            }

            pendingReturns[wallet_address] = current_bid; 
            highestBidder = wallet_address;
            highestbid = current_bid;
            emit highestBidIncreased(wallet_address, current_bid);
        }
        else {
            revert('sorry, the bid is not high enough!');
        }
     }
     function withdraw() public payable returns(bool) {
        require(ended,"You Cannot Withdraw Until The Auction Has Ended");
        uint amount = pendingReturns[msg.sender];
        if(amount > 0) {
            pendingReturns[msg.sender] = 0;
        }
        
        if(!payable(msg.sender).send(amount)) {
            pendingReturns[msg.sender] = amount;
        }
        return true;
    }
    function auctionEnd() public {
        require(block.timestamp > auctionEndTime,"The Auction Cannot End Before The Specified Time");
        if(ended) revert("the auction is already over!");
        ended = true;
        emit auctionEnded(highestBidder, highestbid);
        beneficiary.transfer(highestbid);
    }
}