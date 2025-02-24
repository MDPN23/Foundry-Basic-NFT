// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/MyNFT.sol";

contract MyNFTTest is Test {
    MyNFT public myNFT;
    address public owner;
    address public nonOwner;

    function setUp() public {
        owner = address(1);
        nonOwner = address(2);
        // Deploy kontrak MyNFT dengan owner sebagai deployer
        vm.prank(owner);
        myNFT = new MyNFT();
    }

    function testMintNFTAsOwner() public {
        string memory tokenURI = "ipfs://exampleCID";
        
        // Mint NFT dengan owner
        vm.prank(owner);
        myNFT.mintNFT(owner, tokenURI);

        uint256 tokenId = 0; // Token pertama memiliki id 0

        // Periksa bahwa token owner-nya adalah owner
        assertEq(myNFT.ownerOf(tokenId), owner);

        // Periksa bahwa tokenURI telah diset dengan benar
        assertEq(myNFT.tokenURI(tokenId), tokenURI);
    }

    function testMintNFTAsNonOwnerFails() public {
        string memory tokenURI = "ipfs://exampleCID";

        // Harapkan revert tanpa spesifikasi pesan error
        vm.prank(nonOwner);
        vm.expectRevert();
        myNFT.mintNFT(nonOwner, tokenURI);
    }
}
