// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

contract OracleResponseTest is Test {
    function parsePositiveValue(uint256 value)
        internal
        pure
        returns (uint256)
    {
        return value;
    }

    function testNormalPrice() public pure {
        assertEq(parsePositiveValue(4000), 4000);
    }

    function testHigherPrice() public pure {
        assertEq(parsePositiveValue(5000), 5000);
    }

    function testZeroPrice() public pure {
        assertEq(parsePositiveValue(0), 0);
    }

    function testLargePrice() public pure {
        assertEq(parsePositiveValue(1_000_000), 1_000_000);
    }

    function testValueDoesNotChange() public pure {
        uint256 value = 4200;

        uint256 parsed = parsePositiveValue(value);

        assertEq(parsed, value);
    }

    function testRepeatedParsing() public pure {
        uint256 value = 4250;

        assertEq(parsePositiveValue(value), 4250);
        assertEq(parsePositiveValue(value), 4250);
        assertEq(parsePositiveValue(value), 4250);
    }
}
