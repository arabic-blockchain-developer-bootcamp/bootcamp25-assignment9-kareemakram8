// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Assignment9 is Ownable {
    address[] public deployedContracts;

    constructor() Ownable(msg.sender) {}

    // Changed: createContract now takes no arguments
    function createContract() external onlyOwner {
        // Deploy SimpleContract with default initialValue, e.g., 0
        SimpleContract newContract = new SimpleContract(0);
        deployedContracts.push(address(newContract));
    }

    function getDeployedContractsCount() external view returns (uint256) {
        return deployedContracts.length;
    }
}

contract SimpleContract {
    uint256 public value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    function setValue(uint256 newValue) external {
        value = newValue;
    }
}

