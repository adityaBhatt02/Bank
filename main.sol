// SPDX-License-Identifier: MIT
pragma solidity 0.8.17; 

contract Bank {
    mapping(address => uint256) balance;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function addBalance(uint256 _toAdd) public{
        require(msg.sender == owner);
        balance[msg.sender] += _toAdd;
    }

    function getBalance() public view returns(uint256){
        return balance[msg.sender];
    }

    function transfer(address recepient , uint256 amount) public{
        require(balance[msg.sender] >= amount , "Insufficient Amount");
        require(msg.sender != recepient , "You can't add money to yourself");
        _transfer(msg.sender , recepient , amount);
    }

    function _transfer(address from , address to , uint256 amount) private{
        balance[from] -= amount;
        balance[to] += amount;
    }

}
