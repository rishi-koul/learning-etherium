// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleContract {
    // Using a real account
    // Calling this is free
    string public myString = "Hello world";

    // Calling this takes gas/money
    function updateString(string memory _newString) public{
        myString = _newString;
    }

    // This function is meant to receive ETH (that can be send when deploying)
    function updateStringPayable(string memory _newString) public payable {
        if(msg.value == 1 ether){
            myString = _newString;        
        } else {
            payable(msg.sender).transfer(msg.value);
        }
    }
}