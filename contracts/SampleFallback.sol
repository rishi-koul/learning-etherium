// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleFallback{
    uint public lastValueSent;
    string public lastFuntionCalled;

    uint public myUint;

    function setMyUint(uint _myUint) public {
        myUint = _myUint; 
    }
    receive() external payable{
        lastValueSent = msg.value;
        lastFuntionCalled = "receive";
    }

    fallback() external payable {
        lastValueSent = msg.value;
        lastFuntionCalled = "fallback";

     }
}