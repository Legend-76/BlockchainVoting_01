// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 一个简单的区块链投票系统智能合约
contract SimpleVoting {
    // 记录每个候选人的得票数
    mapping(string => uint) public votesReceived;
    // 记录已经投过票的地址，防止重复投票
    mapping(address => bool) public hasVoted;

    // 投票函数
    function vote(string memory candidateName) public {
        // 检查是否已经投过票了
        require(!hasVoted[msg.sender], "You have already voted!");
        
        // 记录投票状态
        hasVoted[msg.sender] = true;
        
        // 给候选人加一票
        votesReceived[candidateName] += 1;
    }

    // 查询候选人得票数的函数
    function getVotes(string memory candidateName) public view returns (uint) {
        return votesReceived[candidateName];
    }
}
