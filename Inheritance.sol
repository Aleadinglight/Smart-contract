pragma solidity ^0.4.0;

contract MyFirstContract{
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
