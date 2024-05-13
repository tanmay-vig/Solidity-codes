
pragma solidity >=0.8.2 <0.9.0;


contract Counter {
    uint count;

    constructor() {
        count = 0;
    }

    function show_count() public view returns (uint) {
        return count;
    }

    function inc() public {
        count++;
    }

    function dec() public {
        count--;
    }
}