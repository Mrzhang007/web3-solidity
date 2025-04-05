// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract OtherContract {

    uint256 private _x = 0;

    event Log(address sender, uint256 value, uint256 gas);

    function getX() public view returns(uint256) {
        return _x;
    }

    function setX(uint256 x) public payable {
        _x = x;
        if (msg.value > 0) {
            // 有交易转账
            emit Log(msg.sender, msg.value, gasleft());
        }
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

}

contract CallContract {
    

    function callContract(OtherContract _address) public view returns(uint256) {
       return _address.getX();
    }

    function callContract1(address _address) public view returns(uint256) {
        OtherContract oc = OtherContract(_address);
        return oc.getX();
    }

    function callSetX(address _address, uint256 _x) public {
        OtherContract(_address).setX(_x);
    } 
    // 调用setX并转账
    function callSetXTransferETH(OtherContract _address, uint256 _x) public payable {
        _address.setX{value: msg.value }(_x);
    }

}

