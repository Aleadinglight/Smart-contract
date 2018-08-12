pragma solidity ^0.4.0;

interface Regulator{
    function checkValue(uint amount) returns (bool);
    function loan() returns (bool);
}

contract Bank is Regulator {
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
        if (checkValue(amount)){
            value -= amount;    
        }
    }
    
    function balance() returns (uint){
        return value;
    }
    
    // Abstract
    function checkValue(uint amount) returns (bool){
        return amount <= value;
    }
    
    function loan() returns (bool){
        return value>0;
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
