# Fallback function

## Definition

In Solidity, a contract may have precisely one unnamed function, which cannot have arguments, nor return anything.

Fallback functions are executed if a contract is called and no other function matches the specified function identifier, or if no data is supplied.

These functions are also executed whenever a contract would receive plain Ether, without any data.

In addition to that, to enable receiving Ether, you have to mark the fallback function payable. When no function like that is present, the contract is unable to receive Ether cia regular transactions.

In context like that, you normally would have minimal amounts of gas available for the function call (2300 gas exactly), so you must make fallback functions as cheap as they can be.

Keep in mind that what gas is required by the transaction (differently than with an internal type call) which will invoke the fallback function is a lot higher, since every transaction will an additional amount of than 21000 gas or even greater amounts for things such as signature checking.

## Usage

```javascript
contract Transaction {
    function() payable{
    //...
    }
}
```