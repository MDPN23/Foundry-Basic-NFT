// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;

    constructor() ERC721("MyNFT", "MNFT") Ownable(msg.sender) {}

    function mintNFT(address recipient, string memory metadataURI) external onlyOwner {
        uint256 tokenId = _tokenIdCounter;
        unchecked { _tokenIdCounter = tokenId + 1; }
        _safeMint(recipient, tokenId);
        _setTokenURI(tokenId, metadataURI);
    }
}
