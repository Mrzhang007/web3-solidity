// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

//值类型
contract ValueType {

    // 1. bool类型
    bool public isTrue = false;
    // 2. 整型
    int public _int = -1; 
    // 无符号整型
    uint256 public _int256 = 1000;
    // 3.定长字节数组
    bytes8 public _bytes8 = "helloWeb";
    bytes1 public _bytes1 = _bytes8[0];
    // 4.地址. 存储一个 20 字节的值（以太坊地址的大小）。这是我的小狐狸钱包地址
    // payable address: 比普通地址多了 transfer 和 send 两个成员方法，用于接收转账。
    address public _address = 0x35c7e8D0693451fB8Cd4258DE66C0C4c000B9516;
    // 5.枚举 enum
    enum ActionSet { Buy, Hold, Sell }
    ActionSet public _action = ActionSet.Hold;

}