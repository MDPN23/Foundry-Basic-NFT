// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/MinimalNFT.sol";

contract DeployMinimalNFT is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // Misalnya, baseURI bisa diisi dengan "ipfs://<CID>/"
        string memory baseURI = vm.envString("BASE_URI");

        vm.startBroadcast(deployerPrivateKey);
        MinimalNFT nft = new MinimalNFT(baseURI);
        vm.stopBroadcast();

        console.log("MinimalNFT deployed to:", address(nft));
    }
}
