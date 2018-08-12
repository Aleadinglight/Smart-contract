pragma solidity ^0.4.0;

interface Regulator{
    // These functions should be declared as "external"
    function checkValue(uint amount) external returns (bool);
    
    function loan() external returns (bool);

}

contract Bank is Regulator {
    // innernal : only MyFirstContract can access, not from outsite
    // we have public, private, internal (protected)
    uint private value;
    address private owner;
    
    
    modifier ownerFunc{
        // there are require, revert, advert to handle error
        require(owner == msg.sender);
        // essence to this function
        // this mean when ownerFunc() is call, it will always execute require() before the following lines
        _;
    }
    
    // Constructor
    constructor(uint amount) public{
        value = amount;
        owner = msg.sender;
    }
    
    // Simply add your modifier after the method
    function deposit(uint amount) public ownerFunc{
        value += amount;
    }
    
    function withdraw(uint amount) public ownerFunc{
        if (checkValue(amount)){
            value -= amount;    
        }
    }
    
    // Functions can be declared view in which case they promise not to modify the state.
    function balance() public view returns (uint){
        return value;
    }
    
    // Abstract
    function checkValue(uint amount) public returns (bool){
        return amount <= value;
    }
    
    function loan() public returns (bool){
        return value>0;
    }
}

contract MyFirstContract is Bank(100){
    string private name;
    uint private age;
    
    function setName(string newName) public{
        name = newName;
    }
    
    // Functions can be declared view in which case they promise not to modify the state.
    function getName() public view returns (string) {
        return name;
    }

}
