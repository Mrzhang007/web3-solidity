// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Pair {

    address private factory;
    address public token0;
    address public token1;

    constructor() {
        factory = msg.sender;
    }

    function initialize(address _token0, address _token1) public  {
        require(factory == msg.sender, "UniswapV2 forbiden");
        token0 = _token0;
        token1 = _token1;
    }

}

contract Create2 {

    mapping (address => mapping (address => address)) public getPairs;
    address[] public allPairs;

    // WBNB地址: 0x2c44b726ADF1963cA47Af88B284C06f30380fC78
    // BSC链上的PEOPLE地址: 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c
    // pairAddress: 0xB3DfF662eEF16CE1891c7e37c55f72a9edB2c74C

    function createPair(address _tokenA, address _tokenB) public returns(address) {
        require(_tokenA != _tokenB, "two same token");
        (address token0, address token1) = _tokenA < _tokenB ? (_tokenA, _tokenB) : (_tokenB, _tokenA);
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        Pair pair = new Pair{salt: salt}();
        pair.initialize(token0, token1);
        address pairAddress = address(pair);
        allPairs.push(pairAddress);
        getPairs[token0][token1] = pairAddress;
        getPairs[token1][token0] = pairAddress;
        return pairAddress;
    }

    // 提前计算合约地址
    function caculateAddress(address _tokenA, address _tokenB) view public returns(address) {
        require(_tokenA != _tokenB, "two same token");
        (address token0, address token1) = _tokenA < _tokenB ? (_tokenA, _tokenB) : (_tokenB, _tokenA);
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        address predictedAddress = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xFF), address(this), salt, keccak256(type(Pair).creationCode))))));
        return predictedAddress;
    }

}