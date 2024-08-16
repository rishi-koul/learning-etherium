// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Wallet {
    uint public balanceReceived;
    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawl() public {
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    function withdrawToAddress(address payable to) public {
        to.transfer(getContractBalance());
    }
}