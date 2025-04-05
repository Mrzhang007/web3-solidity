// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;


contract OtherContract {

    event Log(address sender, uint256 value, uint256 gas);
    event LogFallback(address sender);

    receive() external payable {}

    fallback() external payable {
        emit LogFallback(msg.sender);
    }

    uint256 private _x = 0;

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function setX(uint256 x) public payable {
        _x = x;
        if (msg.value > 0) {
            emit Log(msg.sender, msg.value, gasleft());
        }
    }

    function getX() public view returns (uint256) {
        return _x;
    }

}

contract Call {


    event Response(bool success, bytes data);
    

    function callGetX(address to) public returns(uint256)  {
       (bool success, bytes memory data) = to.call(abi.encodeWithSignature("getX()"));
       emit Response(success, data);
       return abi.decode(data, (uint256));
    }

    function callSetX(address to, uint256 x) public {
        (bool success, bytes memory data) = to.call(abi.encodeWithSignature("setX(uint256)", x));
        emit Response(success, data);
    }

    function callSetXTransfer(address to, uint256 x) public payable  {
        (bool success, bytes memory data) = to.call{value: msg.value}(abi.encodeWithSignature("setX(uint256)", x));
        emit Response(success, data);
    }

    function callUndefinedFunc(address to) public {
        (bool success, bytes memory data) = to.call(abi.encodeWithSignature("foo(uint256)"));
        emit Response(success, data);
    }

}