// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Function {
    // public变量会自动生成同名的getter函数，用于查询数值
    uint256 public num = 0;

    uint256 private privateNum = 10;

    function add() external payable  {
        num += 1;
    }

    function addPure(uint256 _a, uint256 _b) external pure returns(uint256) {
        return _a + _b;
    }
    // 内部函数
    function minus() internal  {
        num += 1;
    }

    function getBalance() external view returns (uint256)  {
        return address(this).balance;
    }

    // payable: 递钱，能给合约支付eth的函数
    function minusPayable() external payable returns(uint256 balance) {
        minus();    
        balance = address(this).balance;
    }

}