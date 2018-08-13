pragma solidity ^0.4.0;

contract DataTypes{
    bool myBool = false;

    int8 myInt = -128;
    uint myUInt = 255;

    // Solidity store String as Array of Integers
    string myString;
    uint8[] myStringArr;

    byte myValue;
    bytes1 myBytes1;
    bytes32 myBytes32;

    fixed8x1 myFixed;
}