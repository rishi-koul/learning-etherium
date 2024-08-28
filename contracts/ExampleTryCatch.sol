// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract WillThrow {
    function aFunction() public pure {
        require(false, "Error message");
        // assert(false);
    }
}

contract ErrorHandling{
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowLevelData);

    function catchTheError() public {
        WillThrow will = new WillThrow();
        try will.aFunction(){
            // do smth here if it works
        }
        // this is for require
        catch Error (string memory reason){
            emit ErrorLogging(reason);
        }
        // this if for asserts
        catch Panic(uint errorCode){
            emit ErrorLogCode(errorCode);
        }
        // for everything else
        catch (bytes memory lowLevelCode){
            emit ErrorLogBytes(lowLevelCode);
        }
    }
}