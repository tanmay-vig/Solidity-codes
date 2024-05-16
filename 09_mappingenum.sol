pragma solidity >=0.8.2 <0.9.0;

contract Registration {
    address owner;
    enum userStatus {APPLIED, APPROVED}
    mapping(address => userStatus) userlist;  

    constructor() {
        owner = msg.sender;        
    }

    modifier onlyByOwner {
        require(msg.sender == owner);
        _;
    }

    modifier onlyByApprovedUser {
        require(userlist[msg.sender] == userStatus.APPROVED);
        _;
    }

    function send_application(address addr) public returns (string memory) {
        if((userlist[addr] == userStatus.APPLIED) || 
                    (userlist[addr] == userStatus.APPROVED)) {
            return "Already Applied....";
        } else {
            userlist[addr] = userStatus.APPLIED;   
        }
    }

    function approve_application(address addr) public onlyByOwner {
        if(userlist[addr] == userStatus.APPLIED)
            userlist[addr] = userStatus.APPROVED;
    }

    function get_status(address addr) public view returns (userStatus) {
            return userlist[addr];
    }

    function transfer_fund(address payable to) public payable onlyByApprovedUser {
            to.transfer(msg.value);
    }
}