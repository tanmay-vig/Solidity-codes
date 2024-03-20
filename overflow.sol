// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

contract overflow{
    uint8 public money = 255;

    function setter() public {
        money = money + 1;
    }
}

// Overflow error came 
//  255 -> becomes 0 after +1 