// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Script} from "forge-std/Script.sol";
import {FinanceSystem} from "../src/FinanceSystem.sol";
import {OrgOwner} from "../src/OrgOwner.sol";

contract Deploy is Script {
    function run() external returns (FinanceSystem) {
        address owner = address(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);
        FinanceSystem fs = new FinanceSystem("MyOrg", owner);

        // Add tracked accounts
        address[6] memory accounts = [
            0x1234567890AbcdEF1234567890aBcdef12345678,
            0x9876543210FeDcba9876543210FEdCba98765432,
            0xdEF1234567890AbcdEF1234567890aBcdEF12345,
            0xabCDEF1234567890ABcDEF1234567890aBCDeF12,
            0xfEdcBA9876543210FedCBa9876543210fEdCBa98,
            0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
        ];

        for (uint i = 0; i < accounts.length; i++) {
            fs.addAccount(accounts[i]);
        }

        // Add 20 sample transactions with manual timestamps
        fs.addTransaction(1000, "Subscription Service Payment", 0xfEdcBA9876543210FedCBa9876543210fEdCBa98, accounts[0], false, 1704067200); // Jan 1, 2024
        fs.addTransaction(750, "Office Rent", 0x876543210AbcdeF9876543210abCdeF987654321, accounts[1], false, 1706745600); // Feb 1, 2024
        fs.addTransaction(2000, "Client Payment Received", accounts[0], 0xdEF1234567890AbcdEF1234567890aBcdEF12345, true, 1709251200); // Mar 1, 2024
        fs.addTransaction(1500, "Payment for Services", accounts[3], accounts[1], true, 1711929600); // Apr 1, 2024
        fs.addTransaction(1200, "Freelancer Payment", accounts[1], accounts[2], false, 1714521600); // May 1, 2024
        fs.addTransaction(2500, "Product Sales", accounts[0], accounts[3], true, 1717200000); // Jun 1, 2024
        fs.addTransaction(3000, "Consultation Fees", accounts[1], accounts[4], true, 1719792000); // Jul 1, 2024
        fs.addTransaction(500, "Office Supplies", accounts[2], 0x6543210fedcBA9876543210Fedcba9876543210f, false, 1722470400); // Aug 1, 2024
        fs.addTransaction(800, "Utility Bill Payment", 0x876543210AbcdeF9876543210abCdeF987654321, accounts[1], false, 1725148800); // Sep 1, 2024
        fs.addTransaction(1800, "Received from Partner", accounts[0], accounts[2], true, 1727740800); // Oct 1, 2024
        fs.addTransaction(700, "Advertising Payment", accounts[4], accounts[0], false, 1730419200); // Nov 1, 2024
        fs.addTransaction(900, "Web Development Contract", accounts[1], accounts[3], true, 1704153600); // Jan 2, 2024
        fs.addTransaction(2200, "Partner Commission", accounts[0], accounts[4], true, 1706832000); // Feb 2, 2024
        fs.addTransaction(400, "IT Services Payment", accounts[2], accounts[1], false, 1709337600); // Mar 2, 2024
        fs.addTransaction(1600, "Maintenance Fees", accounts[3], accounts[4], true, 1712016000); // Apr 2, 2024
        fs.addTransaction(300, "Food Supplies", accounts[0], accounts[2], false, 1714608000); // May 2, 2024
        fs.addTransaction(700, "Travel Expenses", accounts[1], accounts[3], false, 1717286400); // Jun 2, 2024
        fs.addTransaction(2100, "Annual Bonus Payment", accounts[3], accounts[1], true, 1719878400); // Jul 2, 2024
        fs.addTransaction(650, "Support Payment", accounts[1], accounts[3], false, 1722556800); // Aug 2, 2024

        vm.stopBroadcast();
        return (fs);
    }
}

contract Deploy2 is Script {
    function run() external returns (OrgOwner, FinanceSystem) {
        vm.startBroadcast(msg.sender);
        OrgOwner orgown = new OrgOwner();
        orgown.createFinanceSystem("MyOrg");
        address[] memory addr = orgown.getFinanceSystemsList();
        FinanceSystem fs = FinanceSystem(addr[0]);

        // Add tracked accounts
        address[6] memory accounts = [
            0x1234567890AbcdEF1234567890aBcdef12345678,
            0x9876543210FeDcba9876543210FEdCba98765432,
            0xdEF1234567890AbcdEF1234567890aBcdEF12345,
            0xabCDEF1234567890ABcDEF1234567890aBCDeF12,
            0xfEdcBA9876543210FedCBa9876543210fEdCBa98,
            0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
        ];

        for (uint i = 0; i < accounts.length; i++) {
            fs.addAccount(accounts[i]);
        }

        fs.addTransaction(1000, "Subscription Service Payment", 0xfEdcBA9876543210FedCBa9876543210fEdCBa98, accounts[0], false, 1704067200); // Jan 1, 2024
fs.addTransaction(900, "Web Development Contract", accounts[1], accounts[3], true, 1704153600); // Jan 2, 2024
fs.addTransaction(950, "Freelance Graphic Design", accounts[0], accounts[2], false, 1704240000); // Jan 3, 2024
fs.addTransaction(2900, "Equipment Purchase", accounts[2], accounts[3], true, 1704326400); // Jan 4, 2024
fs.addTransaction(800, "Office Rent", accounts[4], accounts[0], false, 1704412800); // Jan 5, 2024
fs.addTransaction(2100, "Received from Supplier", accounts[0], accounts[2], true, 1704499200); // Jan 6, 2024
fs.addTransaction(450, "Website Maintenance", accounts[1], accounts[3], false, 1704585600); // Jan 7, 2024
fs.addTransaction(750, "Office Rent", 0x876543210AbcdeF9876543210abCdeF987654321, accounts[1], false, 1706745600); // Feb 1, 2024
fs.addTransaction(2200, "Partner Commission", accounts[0], accounts[4], true, 1706832000); // Feb 2, 2024
fs.addTransaction(2700, "Product Licensing Fees", accounts[1], accounts[3], true, 1706918400); // Feb 3, 2024
fs.addTransaction(400, "Office Cleaning Service", accounts[4], accounts[0], false, 1707004800); // Feb 4, 2024
fs.addTransaction(2000, "Client Payment Received", accounts[0], 0xdEF1234567890AbcdEF1234567890aBcdEF12345, true, 1709251200); // Mar 1, 2024
fs.addTransaction(400, "IT Services Payment", accounts[2], accounts[1], false, 1709337600); // Mar 2, 2024
fs.addTransaction(1800, "Sales Commission", accounts[2], accounts[1], true, 1709424000); // Mar 3, 2024
fs.addTransaction(600, "Consulting Fees", accounts[3], accounts[4], false, 1709510400); // Mar 4, 2024
fs.addTransaction(1500, "Payment for Services", accounts[3], accounts[1], true, 1711929600); // Apr 1, 2024
fs.addTransaction(1600, "Maintenance Fees", accounts[3], accounts[4], true, 1712016000); // Apr 2, 2024
fs.addTransaction(2200, "E-commerce Payment", accounts[0], accounts[2], true, 1712102400); // Apr 3, 2024
fs.addTransaction(750, "Server Hosting Fees", accounts[1], accounts[3], false, 1712188800); // Apr 4, 2024
fs.addTransaction(1200, "Freelancer Payment", accounts[1], accounts[2], false, 1714521600); // May 1, 2024
fs.addTransaction(300, "Food Supplies", accounts[0], accounts[2], false, 1714608000); // May 2, 2024
fs.addTransaction(1300, "Legal Services", accounts[2], accounts[4], false, 1714694400); // May 3, 2024
fs.addTransaction(2500, "Product Sales", accounts[0], accounts[3], true, 1717200000); // Jun 1, 2024
fs.addTransaction(700, "Travel Expenses", accounts[1], accounts[3], false, 1717286400); // Jun 2, 2024
fs.addTransaction(2600, "Software Sales", accounts[0], accounts[3], true, 1717372800); // Jun 3, 2024
fs.addTransaction(900, "Cloud Storage Payment", accounts[1], accounts[2], false, 1717459200); // Jun 4, 2024
fs.addTransaction(3000, "Consultation Fees", accounts[1], accounts[4], true, 1719792000); // Jul 1, 2024
fs.addTransaction(2100, "Annual Bonus Payment", accounts[3], accounts[1], true, 1719878400); // Jul 2, 2024
fs.addTransaction(1700, "Client Invoice", accounts[3], accounts[4], true, 1719964800); // Jul 3, 2024
fs.addTransaction(500, "Training Workshop Fee", accounts[0], accounts[1], false, 1720051200); // Jul 4, 2024
fs.addTransaction(500, "Office Supplies", accounts[2], 0x6543210fedcBA9876543210Fedcba9876543210f, false, 1722470400); // Aug 1, 2024
fs.addTransaction(650, "Support Payment", accounts[1], accounts[3], false, 1722556800); // Aug 2, 2024
fs.addTransaction(1950, "Received from Customer", accounts[3], accounts[0], true, 1722643200); // Aug 3, 2024
fs.addTransaction(1400, "Logistics Fees", accounts[1], accounts[2], false, 1722729600); // Aug 4, 2024
fs.addTransaction(800, "Utility Bill Payment", 0x876543210AbcdeF9876543210abCdeF987654321, accounts[1], false, 1725148800); // Sep 1, 2024
fs.addTransaction(1100, "Software Subscription", accounts[2], accounts[1], false, 1725235200); // Sep 2, 2024
fs.addTransaction(2800, "Consultancy Revenue", accounts[0], accounts[3], true, 1725321600); // Sep 3, 2024
fs.addTransaction(1800, "Received from Partner", accounts[0], accounts[2], true, 1727740800); // Oct 1, 2024
fs.addTransaction(1900, "Received from Business Partner", accounts[0], accounts[3], true, 1727827200); // Oct 2, 2024
fs.addTransaction(700, "Advertising Payment", accounts[4], accounts[0], false, 1730419200); // Nov 1, 2024
fs.addTransaction(1300, "Marketing Services Payment", accounts[1], accounts[4], false, 1730505600); // Nov 2, 2024
fs.addTransaction(1100, "Advertising Fees", accounts[2], accounts[4], false, 1730592000); // Nov 3, 2024
fs.addTransaction(1700, "Client Invoice", accounts[3], accounts[4], true, 1733097600); // Dec 2, 2024
fs.addTransaction(500, "Training Workshop Fee", accounts[0], accounts[1], false, 1735776000); // Dec 3, 2024
fs.addTransaction(2400, "Enterprise Solutions Payment", accounts[0], accounts[1], true, 1735862400); // Dec 4, 2024
fs.addTransaction(850, "Business Card Printing", accounts[3], accounts[2], false, 1735958400); // Dec 5, 2024



        vm.stopBroadcast();
        return (orgown, fs);
    }
}

//  forge script script/Deploy.s.sol:Deploy2 --fork-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast