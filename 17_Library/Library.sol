// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
// 使用第三方库合约
import "17_Library/Strings.sol";

contract Library {
     // 转成10进制字符串
    function getString(uint256 num) public pure returns(string memory) {
        return Strings.toString(num);
    }
    // 转成16进制字符串
    function getHexString(uint256 num) public pure returns(string memory) {
        return Strings.toHexString(num);
    }
}