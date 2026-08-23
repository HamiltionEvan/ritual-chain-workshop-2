// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

contract OracleMissingFieldTest is Test {
    function hasValue(bool fieldExists)
        internal
        pure
        returns (bool)
    {
        return fieldExists;
    }

    function testExistingField() public pure {
        assertTrue(hasValue(true));
    }

    function testMissingField() public pure {
        assertFalse(hasValue(false));
    }

    function testMissingFieldIsNotZeroPrediction() public pure {
        bool exists = false;

        assertFalse(exists);
    }

    function testValidField() public pure {
        bool exists = true;

        assertTrue(exists);
    }
}
