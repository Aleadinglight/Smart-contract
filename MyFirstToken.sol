pragma solidity ^0.4.24;

import "browser/ERC20.sol";

contract MyFirstToken is ERC20 {
	string public constant name = "MyFirstToken";
    string public constant symbol = "MFT";
    uint8 public constant decimals = 18;
	
	uint private constant __totalSupply = 1000;
	mapping(address => uint) private __balanceOf; 
	mapping(address => mapping(address => uint)) private __allowances;
	
	// The creator of the contract have all the token
	constructor() public{
	    __balanceOf[msg.sender] = __totalSupply;
	}
	
	// Get totalSupply
    function totalSupply() public view returns (uint _totalSupply){
		_totalSupply = __totalSupply;
	}
	
	// Get the balance of
    function balanceOf(address tokenOwner) public view returns (uint balance){
        return __balanceOf[tokenOwner];    
    }
	
	// Transder money to another account, this action is done on user account
	function transfer(address receiver, uint value) public returns (bool success){
        if (value <= balanceOf(msg.sender)){
            __balanceOf[msg.sender] -= value;
            __balanceOf[receiver] += value;
            return true;
        }
        return false;
    }
    
	// Allow `spender` to withdraw from your account, multiple times, up to the `tokens` amount.
    // If this function is called again it overwrites the current allowance with _value.
    function allowance(address tokenOwner, address spender) public view returns (uint remaining){
        return __allowances[tokenOwner][spender];
    }
    
	// The spender will approve the amount here
    function approve(address spender, uint value) public returns (bool success){
        __allowances[msg.sender][spender] = value;
        return true;
    }
    
	// Send `tokens` amount of tokens from address `from` to address `to`
    // The transferFrom method is used for a withdraw workflow, allowing contracts to send
    // tokens on your behalf, for example to "deposit" to a contract address and/or to charge
    // fees in sub-currencies; the command should fail unless the _from account has
    // deliberately authorized the sender of the message via some mechanism; we propose
    // these standardized APIs for approval:
    function transferFrom(address sender, address receiver, uint value) public returns (bool success){
        if (__allowances[sender][receiver]>0 && 
			value>0 &&
            __allowances[sender][receiver]>=value &&
			__balanceOf[receiver]>=value){
                __balanceOf[sender] -=value;
                __balanceOf[receiver] +=value;
				__allowances[sender][msg.sender] -=value;
                return true;
            }        
        return false;
    }

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}