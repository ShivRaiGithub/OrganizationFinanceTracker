// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {FinanceSystem} from "./FinanceSystem.sol";

contract OrgOwner{
    mapping(address=>address[]) private ownerToContracts;

    function createFinanceSystem(string memory _orgName) public returns(address){
        FinanceSystem fs = new FinanceSystem(_orgName, msg.sender);
        ownerToContracts[msg.sender].push(address(fs));
        return address(fs);
    }

    function getFinanceSystemsList() public view returns(address[] memory){
        return ownerToContracts[msg.sender];        
    }

}