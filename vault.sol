// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface declaration for token operations
interface IToken {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// Smart contract for the treasure hunt game
contract TreasureHuntGame {
    IToken public immutable gameToken;

    event PaymentMade(address indexed payer, address indexed payee, uint256 amount, string note);
    event RemittanceSent(address indexed sender, address indexed receiver, uint256 amount, string note);

    constructor(address tokenAddress) {
        gameToken = IToken(tokenAddress);
    }

    // Function to make a payment to another account
    function makePayment(address recipient, uint256 amount, string memory note) external {
        require(recipient != address(0), "Recipient address cannot be zero");
        require(gameToken.balanceOf(msg.sender) >= amount, "Insufficient balance");

        require(gameToken.transferFrom(msg.sender, recipient, amount), "Payment transfer failed");

        emit PaymentMade(msg.sender, recipient, amount, note);
    }

    // Function to send remittance to another account
    function sendRemittance(address recipient, uint256 amount, string memory note) external {
        require(recipient != address(0), "Recipient address cannot be zero");
        require(gameToken.balanceOf(msg.sender) >= amount, "Insufficient balance");

        require(gameToken.transferFrom(msg.sender, recipient, amount), "Remittance transfer failed");

        emit RemittanceSent(msg.sender, recipient, amount, note);
    }
}
