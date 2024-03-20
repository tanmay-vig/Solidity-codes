// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

contract Lottery {
    address payable[] public players;
    address public manager;

    constructor() {
        manager = msg.sender;
    }

    // This function is called for all messages sent to
    // this contract (there is no other function).
    // Sending Ether to this contract will cause an exception,
    // because this function does not have the `payable` modifier.
    fallback() external {
        revert("Fallback function is not payable");
    }

    // This function is called whenever the contract receives Ether.
    receive() external payable {
        require(msg.value == 1 ether, "Must send exactly 0.1 ether");
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint) {
        require(msg.sender == manager, "Only the manager can call this function");
        return address(this).balance;
    }

    function random() internal view returns(uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }

    function pickWinner() public {
        require(msg.sender == manager, "Only the manager can call this function");
        require(players.length >= 3, "Not enough players to pick a winner");

        uint r = random();
        address payable winner = players[r % players.length];

        uint prize = address(this).balance;
        winner.transfer(prize);

        // Reset the players array
        delete players;
    }
}
