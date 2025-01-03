// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {FinanceSystem} from "./FinanceSystem.sol";

contract OrgOwner{
    mapping(address=>address[]) private ownerToContracts;

    address[] private contractAddresses;

    function createFinanceSystem(string memory _orgName) public returns(address){
        FinanceSystem fs = new FinanceSystem(_orgName, msg.sender);
        contractAddresses.push(address(fs));
        ownerToContracts[msg.sender].push(address(fs));
        return address(fs);
    }

    function getFinanceSystemsList() public view returns(address[] memory){
        return ownerToContracts[msg.sender];        
    }

    function checkIfContractExists(address _contractAddress) public view returns(bool){
        for(uint i=0; i<contractAddresses.length; i++){
            if(contractAddresses[i] == _contractAddress){
                return true;
            }
        }
        return false;
    }

}