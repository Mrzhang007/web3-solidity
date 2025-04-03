// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract InitialValue {
    // 值类型初始值
    uint256 public _uint; // 0
    int public _int; // 0
    bool public _bool; // false
    address public _address; // 0x0000000000000000000000000000000000000000
    bytes1 public _bytes1; // 0x00
    enum Action { A, B, C } 
    Action public _enumAction; // A 也就是0

    string public _string; // ''

    // 引用类型初始值
    mapping (address => uint256) public _mapping;
    // 静态数组  所有成员设为其默认值的静态数组
    string[3] public _strings; // ["", "", "",]
    uint256[] public _uints; // 动态数组默认值为 []
    // 结构体
    struct Student {
        uint256 id;
        address _address;
    }
    Student public stu;

    bytes public _bytes = "hello world";
}