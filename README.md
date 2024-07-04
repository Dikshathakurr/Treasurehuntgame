# Treasure Hunt Game
This project has two smart contracts : TreasureHuntToken and TreasureHuntGame. TreasureHuntToken is a special cryptocurrency we  can send, create, or destroy. TreasureHuntGame uses these tokens for game transactions between players. The game is like a treasure hunt where you use the tokens to play. Everything runs on the blockchain for security and transparency.

# Components

TreasureHuntToken:

The TreasureHuntToken contract implements the ERC-20 token standard, which is a widely used standard for creating custom tokens on the Ethereum blockchain. This token can be transferred between players, 
used in transactions within the game, and managed by the game owner.
It  defines a set of functions that all compliant tokens must implement. These include functions for transferring tokens, checking balances, and approving allowances.

The TreasureHuntGame contract manages the treasure hunt game, using the TreasureHuntToken as the in-game currency. Players can make payments and send remittances to each other as part of the game.

# Key Features

1) Token Information:

 TokenName: The name of the token (e.g., "Treasure Hunt Token").

 TokenSymbol: The symbol of the token (e.g., "THT").
   
 TokenDecimals: The number of decimal places the token uses.
 
 TokenTotalSupply: The total supply of tokens in circulation.



  2)  Ownership:

  contractOwner: The address of the contract owner who has special privileges, such as minting new tokens.


   3) Events:

  Transfer: Emitted when tokens are transferred from one account to another.
 
  Approval: Emitted when an account approves another account to spend tokens on its behalf.
  
  Mint: Emitted when new tokens are created.
  
 Burn: Emitted when tokens are destroyed.


# Deployment and Interaction

 let's get started with building our DeFi Empire on Avalanche! Here's a detailed plan to set up your EVM subnet, define your native currency, connect to MetaMask, and deploy your foundational smart contracts.

### Step-by-Step Guide

#### 1. Set Up Your EVM Subnet

1. **Install the Avalanche CLI**:
   ```bash
   npm install -g avalanche-cli
   ```

2. **Create a New EVM Subnet**:
   ```bash
   avalanche subnet create
   ```
   Follow the prompts to name your subnet and configure it.

3. **Deploy the Subnet**:
   ```bash
   avalanche subnet deploy
   ```
   This will set up your custom EVM subnet on the Avalanche network.

   
#### 2. Define Your Native Currency

1. **Create ERC20 Token Contract**:
   Use Remix IDE to create your ERC20 token contract for the native currency.

2. **Deploy ERC20 Contract**:
   Deploy this contract on your custom EVM subnet using Remix IDE connected to MetaMask.

#### 3. Connect to MetaMask

1. **Add Custom Network to MetaMask**:
   Go to MetaMask and add a custom RPC network using the details from your subnet.

   - Network Name: mySubnet
   - New RPC URL:  http://127.0.0.1:9650/ext/bc/23i61hin8oEwqPmDD9nvEGgk1C2Y5HveJ3Au4bDx6pADZmfE6x/rpc
   - Chain ID: 43113
   - Currency Symbol: AVAX
     
2. **Connect MetaMask to Remix**:
        
   In Remix, select the “Injected Web3” environment to connect to your MetaMask wallet.

#### 4. Deploy Basic Building Blocks

1. **Create Vault Contract**:
   Use Solidity to create a Vault contract for storing tokens. 

2. **Deploy Vault Contract**:
   Deploy this contract on your EVM subnet using Remix IDE.

3. **Develop Game Mechanics**:
   Implement additional contracts for game activities like battling, exploring, and trading. These will use the Vault and ERC20 contracts for various in-game transactions.

### Deployment and Interactions

1. **Deploy ERC20Token**:
   - Use a tool like Remix, Hardhat, or Truffle to deploy the `ERC20Token contract.I will use remix
     
    - Set the desired token name, symbol, initial supply, and decimals when the contract is first created.
      
    - 2.**Deploy PaymentSystem** : 
   - Generate and implement the `PaymentSystem` contract, supplying the address of the `ERC20Token} that has been deployed.

3. **Interact with Contracts**:
   - Transfer tokens, authorize allowances, mint new tokens, and burn existing tokens using the `ERC20Token` methods.
    - Call the `makePayment` and `sendRemittance` functions on the `PaymentSystem` contract to send remittances and make micropayments.


### Conclusion

The basic infrastructure needed to create a payment platform with ERC20 tokens is provided by this project.This project creates a treasure hunt game on Avalanche using smart contracts. Players use a custom cryptocurrency called TreasureHuntToken for game transactions like payments and remittances. The TreasureHuntToken contract manages token creation, transfers, and ownership. With MetaMask integration, players can securely interact with the game on the Avalanche blockchain, ensuring transparency and fairness in gameplay.

# License
These contracts are licensed under the MIT License.

# Author
@Diksha thakur
