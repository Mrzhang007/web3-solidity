// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Yeye {

    event Log(string message);

    function sing() external virtual {
        emit Log("Yeye sing");
    }

    function jump() external virtual {
        emit Log("Yeye jumped");
    }

    function rap() external virtual {
        emit Log("Yeye Rap RAP!");
    }

}