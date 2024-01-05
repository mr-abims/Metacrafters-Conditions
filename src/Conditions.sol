// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Conditions {
    address public owner;
    uint256 public balance;
    mapping(address => uint256) public userDeposit;

    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable  {
        if (msg.value <= 0) {
            revert("Amount should be greater than zero");
        }
        userDeposit[msg.sender] += msg.value;
        balance+= msg.value;

    }

    function withdraw(uint256 amount) external {
        assert(msg.sender ==owner);
        require(amount <= balance, "Amount should be less than balance");
        balance -= amount;
        payable(msg.sender).transfer(amount);
    }


    function greaterNumber(uint256 a, uint256 b) external pure returns (uint256) {
        assert(a != b); 
        if (a > b) {
            return a;
        } else {
            return b;
        }
    }

}