---

# Foundry Basic NFT  
My First Personal Project for NFT using Foundry SDK  

---

## Foundry  

**Foundry is a blazing fast, portable, and modular toolkit for Ethereum application development written in Rust.**  

Foundry consists of:  

- **Forge**: Ethereum testing framework (like Truffle, Hardhat, and DappTools).  
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions, and getting chain data.  
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.  
- **Chisel**: Fast, utilitarian, and verbose Solidity REPL.  

### Documentation  

📖 Official Docs: [Foundry Book](https://book.getfoundry.sh/)  

---

## Installation  

Before starting, install **Foundry**, **Solmate**, and **OpenZeppelin** to get all the necessary libraries.  

### Install Foundry  

```sh
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

### Install Solmate (Gas-Optimized Smart Contract Library)  

```sh
forge install transmissions11/solmate
```

💡 **Why Solmate?**  
Solmate is **50% more gas-efficient** than OpenZeppelin for certain contract operations, making it ideal for cost-sensitive deployments.  

### Install OpenZeppelin (Security-Focused Library)  

```sh
forge install OpenZeppelin/openzeppelin-contracts
```

💡 **Why OpenZeppelin?**  
OpenZeppelin provides **battle-tested security** and **widely adopted standards** for smart contract development. While it might use more gas than Solmate, it ensures **safer** contract interactions.  

---

## Usage  

### Build  

```sh
forge build
```

### Deploy  
you can deploy with solmate lib
```sh
forge script script/MinimalNFT.s.sol:DeployMinimalNFT --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
```

or you can use openzeppelin lib
```sh
forge script script/myNFT.s.sol:DeploymyNFT --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
```

---

## Why Foundry + Solmate + OpenZeppelin?  

| Library       | Focus | Gas Efficiency | Security | Recommended Use |
|--------------|------|--------------|---------|----------------|
| **Foundry** | Fast development & testing | ✅ | ✅ | General development |
| **Solmate** | Gas optimization | ✅✅✅ | ⚠️ (Minimal security features) | Cost-sensitive contracts |
| **OpenZeppelin** | Security & standards | ⚠️ (Uses more gas) | ✅✅✅ | Production-grade security |

By combining **Foundry, Solmate, and OpenZeppelin**, you get the best of both worlds:  
- **Fast development** with Foundry ⚡  
- **Lower gas fees** with Solmate 💰  
- **Strong security standards** with OpenZeppelin 🔒  

🚀 **Start building Ethereum smart contracts efficiently today!** 🚀  

---

Always open for discusiion guuys >.< lets grow together
