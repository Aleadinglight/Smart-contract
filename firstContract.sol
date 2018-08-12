pragma solidity ^0.4.0;

contract MyFirstContract{
    string private name;
    uint private age;
    
    // The input must be of type JSON, remember to put the name between the quotes " "
    function setName(string newName) public{
        name = newName;
    }
    
    function getName() public view returns (string){
        return name;
    }
}
