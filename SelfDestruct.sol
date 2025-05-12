// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract SelfDestruct {
    uint public constant REQUIRED_AMOUNT = 0.0005 ether;

    constructor (address payable _etherVault) payable {
        require(msg.value == REQUIRED_AMOUNT, "You must send exactly 0.0005 ether");
        selfdestruct(_etherVault);
    }
}
