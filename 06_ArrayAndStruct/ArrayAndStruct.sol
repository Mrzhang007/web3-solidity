// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract ArrayAndStruct {

    // 固定长度数组
    uint[8] public  array1;
    bytes1[2] public _bytesList;
    address[3] public _address;
    // 可变长度数组
    uint[] public _array01;
    bytes1[] public _array02;
    address[] public _array03;
    bool[] public _array04;
    
    constructor() {
        // 创建动态数组  用new创建数组必须声明数组长度
        bytes memory _bytes = new bytes(2);
        _bytes[0] = 0x61;
        _bytes[1] = 0x62;

        bytes memory _bytes1 = new bytes(1);
        _bytes1[0] = 0x61;
        // bytes比byte1更省gas
        // bytes1 _byte1 = 0x61;

    }

    // 结构体
    struct Student {
        uint256 id;
        uint256 score;
    }

    Student public stu;

    function initStudent1() public {
        stu.id = 11;
        stu.score = 98;
    }

    function initStudent2() public {
        Student storage _stu = stu;
        _stu.id = 11;
        _stu.score = 98;
    }

    function initStudent3() public {
        stu = Student({id: 11, score: 99});
    }
    
     function initStudent4() public {
        stu = Student(11, 87);
    }

}