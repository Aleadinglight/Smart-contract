pragma solidity ^0.4.0;

contract Transaction {
    // innernal : only MyFirstContract can access, not from outsite
    // we have public, private, internal (protected)
    address private owner;
    event SenderLogger(address);
    event ValueLogger(uint);
    
    modifier isOwner{
        // there are require, revert, advert to handle error
        require(owner == msg.sender);
        // essence to this function
        // this mean when ownerFunc() is call, it will always execute require() before the following lines
        _;
    }
    
    modifier validValue{
        assert(msg.value >= 1 ether);
        _;
    }
    // Constructor
    constructor() public{
        owner = msg.sender;
    }

    function() payable public isOwner validValue{
        emit SenderLogger(msg.sender);
        emit ValueLogger(msg.value);
    }
}