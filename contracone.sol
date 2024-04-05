// SPDX-License-Identifier: MIT

pragma solidity =0.8.25;

// Importing ERC20 and ERC20Permit contracts
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";

/// @title IDOOneToken
/// @notice A simple ERC20 token contract with ERC20Permit extension.
/// @dev This contract creates an ERC20 token and mints a certain amount of tokens to the deployer upon deployment.
contract IDOOneToken is ERC20Permit {
    /// @notice Constructor for initializing the contract
    /// @dev Called upon contract deployment, initializes token name, symbol, and mints tokens.
    /// @param _name Name of the token
    /// @param _symbol Symbol of the token
    constructor(string memory _name, string memory _symbol) 
        ERC20(_name, _symbol) // Calling ERC20 constructor
        ERC20Permit(_name) // Calling ERC20Permit constructor to enable permit functionality
    {
        // Minting tokens, total supply is 10^9 plus the number of decimals, minted to the deployer (msg.sender)
        _mint(msg.sender, 10**(9+decimals()));
    }
}
