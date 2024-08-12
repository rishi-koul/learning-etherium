// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleView {
    uint public myStorageVariable;

    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable;
    }

    // Lol is view function like a static method??
    function getAddition(uint a, uint b) public pure returns(uint){
        return a+b;
    }

    // Takes some energy. The above two take virtually no energy(do takes gas)
    // This is a Writing Function
    function setMyStorageVariable(uint _newVar) public {
        myStorageVariable = _newVar;
    }
}