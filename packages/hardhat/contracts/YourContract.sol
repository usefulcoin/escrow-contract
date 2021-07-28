pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

contract YourContract {

  //variables
  address payable public payer; //this is the person giving funds.
  address payable public payee; //this is the person receiving funds.
  bool public payer_approved; //the person giving funds gives consent to transfer funds out of the smart contracts.
  bool public payee_approved; //the person receiving funds gives consent to transfer funds out of the smart contracts.

  constructor(address payable _payee) {
    //this is done on deploy
    payer = payable(msg.sender);
    payee = _payee;
  }

  modifier onlyPayer() {
    require(msg.sender == payer, "you are not the payer");

    _; //required for every modifier function.
  }

  modifier onlyPayee() {
    require(msg.sender == payee, "you are not the payee");

    _; //required for every modifier function.
  }

  function payerApprovedPayout() {
    public onlyPayer{
      payer_approved true;
    }
    public onlyPayer{
      payee_approved true;
    }
  }
}
