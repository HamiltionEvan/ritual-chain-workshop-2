// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";

contract OracleMalformedResponseTest is Test {
    enum Result {
        YES,
        NO,
        INVALID
    }

    function classify(
        bool requestOk,
        bool bodyDecodable,
        bool fieldExists
    ) internal pure returns (Result) {
        if (!requestOk) {
            return Result.INVALID;
        }

        if (!bodyDecodable) {
            return Result.INVALID;
        }

        if (!fieldExists) {
            return Result.INVALID;
        }

        return Result.YES;
    }

    function testHttpFailure() public pure {
        assertEq(
            uint256(classify(false, true, true)),
            uint256(Result.INVALID)
        );
    }

    function testMalformedBody() public pure {
        assertEq(
            uint256(classify(true, false, true)),
            uint256(Result.INVALID)
        );
    }

    function testMissingField() public pure {
        assertEq(
            uint256(classify(true, true, false)),
            uint256(Result.INVALID)
        );
    }

    function testValidResponse() public pure {
        assertEq(
            uint256(classify(true, true, true)),
            uint256(Result.YES)
        );
    }
}
