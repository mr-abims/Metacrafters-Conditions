// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Conditions {
    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable  {
        if (msg.value <= 0) {
            revert("Amount should be greater than zero");
        }
        balances[msg.sender] += msg.value;

    }

    function withdraw(uint256 amount) external {
        assert(msg.sender ==owner);
        require(amount > 0, "Amount should be greater than zero");
        if(balances[msg.sender] <= amount) {
            revert("Insufficient balance");
        } 

        balances[msg.sender] -= amount;
    }


    function assertion() external pure returns (uint256) {
        uint256 x = 1;
        uint256 y = 2;

        assert(x != y); // Assertion to check if x is not equal to y

        return x;
    }
}