// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Pair {

    address private factory;
    address public token0;
    address public token1;

    constructor() payable {
        factory = msg.sender;
    }

    function initialize(address _token0, address _token1) public  {
        require(msg.sender == factory, "UniswapV2 forbiden");
        token0 = _token0;
        token1 = _token1;
    }

}

contract PairFactory {

    mapping (address => mapping (address => address)) public getPair;
    address[] public allPairs;

    function createPair(address token0, address token1) public returns (address) {
        Pair pair = new Pair();
        pair.initialize(token0, token1);
        address pairAddress = address(pair);
        allPairs.push(pairAddress);
        getPair[token0][token1] = pairAddress;
        getPair[token1][token0] = pairAddress;
        return pairAddress;
    }

}