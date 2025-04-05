// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Fallback {
    /* 触发fallback() 还是 receive()?
           接收ETH
              |
         msg.data是空？
            /  \
          是    否
          /      \
receive()存在?   fallback()
        / \
       是  否
      /     \
receive()  fallback   
    */

    event Receive(address sender, uint value);

    receive() external payable { 
        emit Receive(msg.sender, msg.value);
    }


    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

    event FallbackCalled(address sender, uint value, bytes data);

    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }

}