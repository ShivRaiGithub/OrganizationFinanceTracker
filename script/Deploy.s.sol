// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Script} from "forge-std/Script.sol";
import {FinanceSystem} from "../src/FinanceSystem.sol";

contract Deploy is Script {
    function run() external returns (FinanceSystem) {
        vm.startBroadcast();
        FinanceSystem fs = new FinanceSystem("MyOrg");
        vm.stopBroadcast();
        return (fs);
    }
}