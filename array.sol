// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0 < 0.9.0;

contract array{

    uint[4] public arr = [10 , 20 , 30 , 40];


    // Dynamic array
    uint[] public dynamic;

    function push(uint value) public {

        dynamic.push(value);
    }
}