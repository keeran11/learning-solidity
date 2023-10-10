// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract AdvancedStorage {
    uint private storedData;
    address private owner;

    event ValueSet(uint indexed newValue, address indexed setter);
    event Withdrawal(address indexed recipient, uint amount);
//Here, we declare two events:

//ValueSet: This event is emitted when the set function is called to update 
//the storedData value. It logs the new value and the address of the caller.

//Withdrawal: This event is emitted when the withdraw function is called 
//to withdraw funds from the contract. It logs the recipient's address and the amount withdrawn.

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

//onlyOwner is used to restrict access to certain functions (set and withdraw) 
//to only the owner of the contract. The require statement checks if the caller (msg.sender) 
//is the same as the owner and reverts with an error message if it's not.
//This establishes the account that deploys the contract as the owner.

    function set(uint x) public onlyOwner {
        storedData = x;
        emit ValueSet(x, msg.sender);


    }
//This is a public function named set. 
//It allows only the owner to set the value of storedData to a new value x. 
//The function takes one argument, x, which is a uint, and assigns its value to storedData.
// After updating the value, it emits the ValueSet event to log the change.

    function get() public view returns (uint) {
        return storedData;
    }

    function withdraw(uint amount) public onlyOwner {
        require(amount <= address(this).balance, "Insufficient balance");
        payable(owner).transfer(amount);
        emit Withdrawal(owner, amount);
    }
//This is a public function named withdraw. 
//It allows only the owner to withdraw ether from the contract. 
//The function checks the contract's balance to ensure that the requested withdrawal 
//amount is not greater than the contract's balance. 
//If the balance is sufficient, it transfers the specified amount to the contract 
//owner's address and emits the Withdrawal event to log the withdrawal.

    receive() external payable {
        // Accept ether sent to the contract
    }
}
