pragma solidity ^0.4.0;

contract Bank {
    // innernal : only MyFirstContract can access, not from outsite
    // we have public, private, internal (protected)
    uint private value;
    
    // Constructor
    function Bank(uint amount){
        value = amount;
    }
    
    function deposit(uint amount){
        value += amount;
    }
    
    function withdraw(uint amount){
        value -= amount;
    }
    
    function balance() returns (uint){
        return value;
    }
}

contract MyFirstContract is Bank(100){
    string private name;
    uint private age;
    
    function setName(string newName){
        name = newName;
    }
    // comment
    function getName() returns (string){
        return name;
    }
}
