// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

library fun{
    function add() public pure returns (uint)
    {
        return 5+4;
    }
}


contract Library{
    function call() public pure returns (uint)
    {
        return fun.add();
    }
}