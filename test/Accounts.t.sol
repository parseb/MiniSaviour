// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

import "forge-std/Test.sol";
import "../src/Account.sol";
import "../src/MiniSavior.sol";

import "openzeppelin/utils/Strings.sol";

contract AccountTest is Test {
    AccountLogic A;
    uint256 k;

    using Strings for string;

    function setUp() public {
        k = 9999999999999999999999999999;
        A = new AccountLogic(k);
    }

    function testDeployed() public {
        assertTrue(address(A).code.length > 0, "has code");
        assertTrue(A.K() > 1_000_000_000 ether, "has k");
        console.log("max K encode value: ", type(uint256).max / A.K() - A.K());
    }
}
