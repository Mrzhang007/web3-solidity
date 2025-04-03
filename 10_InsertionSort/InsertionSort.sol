// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract InsertionSort {

    function insertionSort(uint256[] memory nums) public pure returns (uint256[] memory) {
        // [2, 5, 3, 1]
        for (uint8 i = 1; i < nums.length; i ++) {
            uint256 base = nums[i];
            // j必须大于0, 所以要在原来的i-1的基础上加1
            uint8 j = i;
            while (j >= 1 && nums[j - 1] > base) {
                nums[j] = nums[j - 1];
                j --;
            }
            nums[j] = base;
        }
        return nums;
    }

}