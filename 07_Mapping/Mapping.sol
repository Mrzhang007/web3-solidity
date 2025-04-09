// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Mapping {
    // mapping必须存储在storage
    mapping (address => uint256) public balances;

    function setMap(uint256 value) public {
        balances[msg.sender] = value;
    }

}