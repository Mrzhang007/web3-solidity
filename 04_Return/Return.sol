// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Return {

    // 返回值
    function returnSingle() external pure returns (bool) {
        return true;
    }

    // 1.返回值
    function returnMutiple() external pure returns (uint256, bool, uint256[3] memory) {
        return (1, true, [uint256(1), 2, 3]);
    }

    // 2.命名式返回
    function returnSingle1() external pure returns (bool _isTure) {
        _isTure = true;
    }
    

    function returnMutiple1() public pure returns (uint256 _num, bool _isTrue, uint256[3] memory _arr) {
        _num = 1;
        _isTrue = true;
        _arr = [uint256(1), 2, 3];
    }
    // 命名式返回也可直接返回用return返回
    function returnMutiple2() external pure returns (uint256 _num, bool _isTrue, uint256[3] memory _arr) {
        return (1, true, [uint256(1), 2, 3]);
    }

    // 3.解构式赋值
    function returnMutiple3() external view {
        uint256 _num;
        bool _isTrue;
        uint256[3] memory _arr;
        // (_num, _isTrue, _arr) = returnMutiple1();
        // 也可以只机构部分
        //  (, _isTrue, ) = returnMutiple1();

        // 可以通过this调用external函数
        (_num, _isTrue, _arr) = this.returnMutiple2();
    }

}