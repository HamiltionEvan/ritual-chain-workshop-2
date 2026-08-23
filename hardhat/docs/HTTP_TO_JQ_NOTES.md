# HTTP to jq notes

The part I spent the most time understanding was the boundary between the
HTTP call and the jq extraction.

I originally treated the oracle response as if the contract could directly
read a Solidity uint256.

That was not how the flow works.

The HTTP precompile obtains the external response.

The jq precompile is then used to extract the required value.

For the example market, the extracted value is compared with the configured
target.

