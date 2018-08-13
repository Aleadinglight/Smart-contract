pragma solidity ^0.4.24;

contract MyFirstToken{
    string public constant symbol = "MFT";
    string public constant name = "MyFirstToken";
    uint8 public constant decimals=18;

    // Define the total supply
    uint private constant __totalSupply = 1000;
    mapping (address => uint) private __balanceOf;

}