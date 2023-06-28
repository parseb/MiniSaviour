// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Account.sol";

contract MiniSavior is AccountLogic {

    address deployer;

    constructor(uint256 Kconst) AccountLogic(Kconst) {
        deployer = msg.sender;
    }
}
