
pragma solidity >=0.8.2 <0.9.0;

contract HelloWorld {
    string greet = "Hello World!";
    function greet_world() public view returns (string memory) {
        return greet;
    }
}