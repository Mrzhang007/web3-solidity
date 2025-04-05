// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract C {
    uint256 public num;
    address public sender;

    function setVars(uint256 _num) public {
        sender = msg.sender;
        num = _num;
    }
}

contract B {
    // 合约B必须和目标合约C的变量存储布局必须相同 —— 即存在两个 public 变量且变量类型顺序为 uint256 和 address
    uint256 public numB;
    address public senderB;

    event Response(bool success, bytes data);

    function callSetVars(address to, uint256 num) public {
        (bool success, bytes memory data) = to.call(abi.encodeWithSignature("setVars(uint256)", num));
        emit Response(success, data);
    }

    function delegateCallSetVars(address to, uint256 num) public {
        (bool success, bytes memory data) = to.delegatecall(abi.encodeWithSignature("setVars(uint256)", num));
        emit Response(success, data);
    }
}