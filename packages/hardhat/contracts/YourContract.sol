pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  //variables
  address public giver; //this the person giving funds.

  constructor() {
    //this is done on deploy
    giver = msg.sender;

  }

      modifier onlyGiver() {
        require(msg.sender == giver, "you are not the giver");

        _; //required for every modifier function.
      }
  }
}
