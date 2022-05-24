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
    function bid() public payable {
        require(block.timestamp < auctionEndTime,'The Auction Has Ended, No Bids Allowed');
        if(msg.value > highestbid) {
            pendingReturns[msg.sender] += msg.value; 
            highestBidder = msg.sender;
            highestbid = msg.value;
            emit highestBidIncreased(msg.sender, msg.value);
        }
        else {
            revert('sorry, the bid is not high enough!');
        }
     }
     function withdraw() public payable returns(bool) {
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
        require(block.timestamp > auctionEndTime,'The Auction Cannot End Before The Specified Time');
        if(ended) revert('the auction is already over!');
        
        ended = true;
        emit auctionEnded(highestBidder, highestbid);
        beneficiary.transfer(highestbid);
    }
}