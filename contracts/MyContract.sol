// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.14;

contract MyContract{

    address public someAddress;

    function setSomeAddress(address _someAddress) public {
        someAddress = _someAddress;
    }

    function getAddressBalance() public view returns(uint){
        return someAddress.balance;
   }

   function updateAddressToSender() public {
    someAddress = msg.sender;
   }
}
