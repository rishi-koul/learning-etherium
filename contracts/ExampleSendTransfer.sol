// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract Sender{

    receive() external payable { }

    function withdrawTransfer(address payable _to) public {
        // throws an error if tranfer fails
        _to.transfer(10);
    }

    function withdrawSend(address payable _to) public {
        // sends a false boolean if the transaction fails
        bool isSend = _to.send(10);

        require(isSend, "Sending the funds was unsuccessful");
    } 
}

contract ReceiveNoAction{
    function balance() public view returns(uint){
        return address(this).balance;
    }

    receive() external payable { }
}

contract ReceiveAction{
    uint public balanceReceived;

    receive() external payable {
        balanceReceived += msg.value;
     }

     function balance() public view returns(uint){
        return address(this).balance;
    }
}