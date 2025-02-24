// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/solmate/src/tokens/ERC721.sol";

contract MinimalNFT is ERC721 {
    uint256 private _tokenIdCounter;
    address public owner;

    constructor() ERC721("MinimalNFT", "MNFT") {
        owner = msg.sender;
    }

    function mint(address recipient) external {
        require(msg.sender == owner, "Not owner");
        _safeMint(recipient, _tokenIdCounter);
        _tokenIdCounter++;
    }

    function tokenURI(uint256) public pure override returns (string memory) {
        return "";
    }
}
