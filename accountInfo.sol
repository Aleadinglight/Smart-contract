pragma solidity ^0.4.24;

contract MyBalance{
    address private myAddress;

    constructor() public{
        myAddress = msg.sender;
    }

    function getBalance() public view returns (uint){
        return myAddress.balance;
    }
}