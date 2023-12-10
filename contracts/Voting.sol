// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Voting {
    mapping (string => uint) voteTracker;
    address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // Election Commission's Account

    constructor() {
        // Initiate all parties and votes to zero
        voteTracker["BJP"] = 0;
        voteTracker["INC"] = 0;
        voteTracker["CPI"] = 0;
        voteTracker["NOTA"] = 0;
    }

    function vote(string memory candidate) public{
        // Only allow EC Account to vote, can extend this to multiple EC accounts for safety/tracking
        require(msg.sender == owner, "Only owner can do this");
        voteTracker[candidate] += 1;
    }

    function getVote(string memory candidate) public view returns (uint){
        // Anyone can view the current votes
        return voteTracker[candidate];
    }
}
