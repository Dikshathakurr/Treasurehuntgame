// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreasureHuntToken {
    string public tokenName; // Name of the ERC20 token
    string public tokenSymbol; // Symbol of the ERC20 token
    uint8 public tokenDecimals;  // Decimal places for the token
    uint256 public tokenTotalSupply;

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowed;

    address public contractOwner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    modifier onlyContractOwner() {
        require(msg.sender == contractOwner, "Not the contract owner");
        _;
    }

    constructor(
        string memory _tokenName,
        string memory _tokenSymbol,
        uint8 _tokenDecimals,
        uint256 initialSupply
    ) {
        tokenName = _tokenName;
        tokenSymbol = _tokenSymbol;
        tokenDecimals = _tokenDecimals;
        tokenTotalSupply = initialSupply * 10**uint256(_tokenDecimals);
        balances[msg.sender] = tokenTotalSupply;
        contractOwner = msg.sender;
        emit Transfer(address(0), msg.sender, tokenTotalSupply);
    }

    function transfer(address recipient, uint256 amount) external returns (bool) {
        require(recipient != address(0), "Transfer to the zero address");
        require(balances[msg.sender] >= amount, "Transfer amount exceeds balance");

        balances[msg.sender] -= amount;
        balances[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowed[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
        require(sender != address(0), "Transfer from the zero address");
        require(recipient != address(0), "Transfer to the zero address");
        require(balances[sender] >= amount, "Transfer amount exceeds balance");
        require(allowed[sender][msg.sender] >= amount, "Transfer amount exceeds allowance");

        balances[sender] -= amount;
        balances[recipient] += amount;
        allowed[sender][msg.sender] -= amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }

    // Increase allowance for the treasure hunt game
    function increaseAllowance(address spender, uint256 addedValue) external returns (bool) {
        allowed[msg.sender][spender] += addedValue;
        emit Approval(msg.sender, spender, allowed[msg.sender][spender]);
        return true;
    }

    // Decrease allowance for the treasure hunt game
    function decreaseAllowance(address spender, uint256 subtractedValue) external returns (bool) {
        uint256 currentAllowance = allowed[msg.sender][spender];
        require(currentAllowance >= subtractedValue, "Decreased allowance below zero");

        allowed[msg.sender][spender] -= subtractedValue;
        emit Approval(msg.sender, spender, allowed[msg.sender][spender]);
        return true;
    }

    // Mint new tokens
    function mint(uint256 amount) external onlyContractOwner {
        tokenTotalSupply += amount;
        balances[contractOwner] += amount;
        emit Mint(contractOwner, amount);
        emit Transfer(address(0), contractOwner, amount);
    }

    // Burn tokens
    function burn(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Burn amount exceeds balance");

        balances[msg.sender] -= amount;
        tokenTotalSupply -= amount;
        emit Burn(msg.sender, amount);
        emit Transfer(msg.sender, address(0), amount);
    }
}
