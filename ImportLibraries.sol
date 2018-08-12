// This file go with library.sol
pragma solidity ^0.4.0;

import "library.sol";

contract TestLibrary {
    // change to for * to use all types
    using IntExtended for uint;
    
    // Can be pure because this function does not modify the state variable
    function testIncresment(uint _base) public pure returns (uint){
        return _base.increment();
    }
    
    function testDecresment(uint _base) public pure returns (uint){
        return _base.decrement();
    }
    
    function testIncresmentByValue(uint _base, uint _value) public pure returns (uint){
        return _base.incrementByValue(_value);
    }
    
    function decrementByValue(uint _base, uint _value) public pure returns (uint){
        return _base.decrementByValue(_value);
    }
}