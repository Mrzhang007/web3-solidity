// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import "https://github.com/openzeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract ERC20 is IERC20 {

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;
    // 代币总量
    uint256 public totalSupply;
    
    uint8 public decimals = 8;
    string public name;
    string public symble;

    constructor(string memory _name, string memory _symble) {
        name = _name;
        symble  = _symble;
    }

    // 转账
    function transfer(address to, uint256 value) external  returns(bool) {
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
    // 授权给【to】多少【value】个代币
    function approve(address to, uint256 value) external returns(bool) {
        allowance[msg.sender][to] = value;
        emit Approval(msg.sender, to, value);
        return true;
    }
    // 代币授权转账
    function transferFrom(address from, address to, uint256 value) external returns(bool) {
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][to] -= value;
        emit Transfer(from, to, value);
        return true;
    }
    // 铸造代币
    function mint(uint256 value) external {
        totalSupply += value;
        balanceOf[msg.sender] += value;
        emit Transfer(address(0), msg.sender, value);
    }
    // 烧掉代币
    function burn(uint256 value) external {
        totalSupply -= value;
        balanceOf[msg.sender] -= value;
        emit Transfer(msg.sender, address(0), value);
    }

}