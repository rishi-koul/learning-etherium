// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract ContractOne{
    mapping (address => uint) public addressBalance;

    function deposit() public payable {
        addressBalance[msg.sender] += msg.value;
    }

    receive() external payable { 
        deposit();
    }
}

contract ContractTwo{
    receive() external payable { }

    function depositToContractOne(address _contractOne) public {
    //    What is you dont know the contract type or whether its a smart contract or not
    // ContractOne one = ContractOne(_contractOne);
    // one.deposit{value:10, gas: 100000}();

    bytes memory payload = abi.encodeWithSignature("deposit()");
    // The 2nd param is the return value, None in this case
    // (bool success, ) = _contractOne.call{value:10, gas: 100000}(payload);
    // require(success);

    // do this if you know the main address has a callback function(receive)
    (bool success, ) = _contractOne.call{value:10, gas: 100000}("");
    require(success);
    }
}