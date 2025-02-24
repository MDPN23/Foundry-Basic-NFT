// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../lib/solmate/src/tokens/ERC721.sol";

contract MinimalNFT is ERC721 {
    uint256 public totalSupply;
    string public baseURI;

    constructor(string memory _baseURI) ERC721("MinimalNFT", "MNFT") {
        baseURI = _baseURI;
    }

    function mint(address to) external {
        uint256 tokenId = totalSupply;
        totalSupply = tokenId + 1;
        _mint(to, tokenId);
    }

    // Override tokenURI untuk menggabungkan baseURI dengan tokenId
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(tokenId < totalSupply, "Token does not exist");
        return string(abi.encodePacked(baseURI, _toString(tokenId)));
    }

    // Fungsi konversi uint256 ke string
    function _toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) return "0";
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
