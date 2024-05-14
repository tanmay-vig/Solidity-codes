
pragma solidity >=0.8.2 <0.9.0;


contract A {
    uint8 public pub_data = 200; // 8-bit integer value
    uint16 internal int_data = 300; // 16-bit integer value

    function get_internal_data() public view returns (uint16) {
        return int_data;
    }
}

// B is inheriting A
contract B is A {
    // public visibility variable declaration
    address public myaddr;
    // constant values
    uint constant YEAR_IN_SECONDS = 31536000;
    uint16 constant ORIGIN_YEAR = 1970;

    constructor() {
        // address of contract deployer (or owner)
        myaddr = msg.sender;
    }

    function get_time() public view returns (address, uint) {
        // global variable assigning to local variable
        uint ts = block.timestamp;
        // local variable
        uint year = uint16(ORIGIN_YEAR + ts / YEAR_IN_SECONDS);        
        return (myaddr, year);
    }

    function get_external_data() public view returns (uint8) {
        // pub_data is public and has external access
        return (pub_data);
    }
}

contract C {
    function show_A_int_data() public returns (uint16) {
        // pub_data is public and has external access
        // the value of pub_data is going to be returned via instance of A
        return (new A()).pub_data();
    }
}