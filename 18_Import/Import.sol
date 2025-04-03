// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
// import "18_Import/Yeye.sol";
import { Yeye } from "18_Import/Yeye.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol";

contract Import {

    using Address for address;
    
    Yeye yeye = new Yeye();

    function test() public {
        yeye.sing();
    }

}