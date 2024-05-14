// Events code 

pragma solidity >=0.8.2 <0.9.0;

contract Coin {
    address public immutable MINTER;

    mapping (address => uint) public balances;

    // Events allow light clients to react on changes efficiently.
    event Sent(address from, address to, uint amount);

    // This is the constructor whose code is run only when the contract is created.
    constructor() {
        MINTER = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        if (msg.sender != MINTER) return;
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}