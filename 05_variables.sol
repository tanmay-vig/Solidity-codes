
pragma solidity >=0.8.2 <0.9.0;

contract VarDemo {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    uint public num = 123;

    function localVariable() public pure returns (uint) {
        // Local variables are not saved to the blockchain.
        uint i = 456;
        return i;
    }

    function globalVariables() public view returns (uint, address) {
        // Here are some global variables
        uint timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller
        return (timestamp, sender);
    }
}