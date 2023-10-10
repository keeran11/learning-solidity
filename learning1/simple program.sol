// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {//it has one state variable called simplestorage
    uint storedDate;

    function set(uint x) public {  //uint is unsigned integer
        storedDate = x;
    }
    function get() public view returns (uint){
        return storedDate;

    }

}
//his Solidity contract, SimpleStorage, is a simple example that demonstrates
// how to store and retrieve a single integer value on the Ethereum blockchain. 
//Users can use the set function to change the stored value, 
//and they can use the get function to retrieve the current value. 
//The contract allows for basic data storage and retrieval but lacks access control or 
//more advanced functionality commonly found in real-world smart contracts.





