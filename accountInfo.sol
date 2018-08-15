pragma solidity ^0.4.24;

contract MyBalance{
    address private myAddress;

    constructor() public{
        myAddress = msg.sender;
    }
    // Everytime deploy the contract cost Ether
    // So the balance will decrease
    function getBalance() public view returns (uint){
        return myAddress.balance;
    }
}