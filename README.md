# overview
The ERC20 token contract defines a standard token with functionalities for transferring tokens, approving allowances, and transferring tokens on behalf of others. The Vault contract allows users to deposit and withdraw these tokens.


# Key Features:

1) ERC20 Token (ERC20.sol)
   
    It  Provides standard functions for transferring tokens (transfer and transferFrom).

    It Allows users to transfer tokens between addresses securely.

2) Vault (Vault.sol)

     Users can deposit ERC20 tokens securely into the Vault contract.
  
     It  Provides controlled withdrawals of deposited tokens.
  
     Tracks user balances within the Vault for accurate deposit and withdrawal operations.
   
     Emits events (Deposit and Withdrawal) to track deposit and withdrawal activities.


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

These contracts provide a straightforward way to manage ERC20 tokens securely on the blockchain. The ERC20.sol contract sets the standard for token interaction, while the Vault.sol contract enhances security by allowing controlled deposits and withdrawals. Whether you're building a decentralized application or managing digital assets, these contracts offer essential functionalities for interacting with ERC20 tokens.

# License
These contracts are licensed under the MIT License.

# Author
@Diksha thakur
