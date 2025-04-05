// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SendETH {
    constructor() payable {}

    // 最推荐使用call转账 无gas限制。transfer和send都限制2300的gas
    // 其次推荐transfer. 转账失败会自动revert

    receive() external payable { }
    // send发送ETH失败的提示
    error SendFailed();
    // 调用call发送ETH失败提示
    error CallFailed();

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    /*
    * 方法一：transfer 转账ETH
    * to: 接收ETH合约地址 必须是payable
    * value: 转账值
    */
    function tranferETH(address payable to, uint256 value) public {
        to.transfer(value);
    }

    /*
    * 方法二：send 转账ETH
    * to: 接收ETH合约地址 必须是payable
    * value: 转账值
    */
    function sendETH(address payable to, uint256 value) public {
       bool success = to.send(value);
       if (!success) {
            revert SendFailed();
       }
    }

    /*
    * 方法三：call 转账ETH
    * to: 接收ETH合约地址 必须是payable
    * value: 转账值
    */
    function call(address payable to, uint256 value) public {
       (bool success, ) = to.call{ value: value }("");
       if (!success) {
        revert CallFailed();
       }
    }

}


// 接收ETH的合约 需要先deploy后获取合约address
contract ReceiveETH {

    event ReceiveCalled(address sender, uint256 value, uint256 gas);

    receive() external payable {
        emit ReceiveCalled(msg.sender, msg.value, gasleft());
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

}   