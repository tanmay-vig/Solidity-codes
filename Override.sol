// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;


contract Override{
    function val() public pure virtual returns (uint)
    {
        return 6;
    }
}


contract inherit is Override{
    function val() public pure override returns(uint)
    {
        return 7;
    }
}