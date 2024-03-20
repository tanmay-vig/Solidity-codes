// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

abstract contract Abstract{
    uint public num;

    function call() public pure virtual returns (uint);
}

contract main is Abstract{
    function call() public pure override returns (uint){
        return 1;
    }
}