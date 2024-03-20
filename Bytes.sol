// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract Bytes{
    bytes3 public b3;
    bytes2 public b2;

    function setter() public 
    {
        b3 = "abc";
        b2 = "ab";
    }
}