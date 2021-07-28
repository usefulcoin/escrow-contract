pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

contract YourContract {

  //variables
  address payable public payer; //this the person giving funds.
  address payable public payee; //this the person receiving funds.

  constructor(address payable _payee) {
    //this is done on deploy
    payer = payable(msg.sender);
    payee = _payee
  }

    modifier onlyPayer() {
      require(msg.sender == payer, "you are not the payer");

      _; //required for every modifier function.
    }
}
