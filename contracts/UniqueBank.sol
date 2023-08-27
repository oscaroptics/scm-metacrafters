// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract scm {
    address payable public owner;
    uint256 public balance;

    event Increase(uint256 count);
    event Decrease(uint256 count);

    constructor() payable {
        owner = payable(msg.sender);
    }

    function getBalance() public view returns(uint256){
        return balance;
    }

    function increase(uint256  count) public payable {
        uint _previousBalance = balance;
        require(msg.sender == owner, "You are not the owner of this account");
        balance +=  count;
        assert(balance == _previousBalance +  count);
        emit Increase( count);
    }
    error InsufficientBalance(uint256 balance, uint256 decreaseeCount);

    function decrease(uint256 _decreaseeCount) public {
        require(msg.sender == owner, "You are not the owner of this account");
        uint _previousBalance = balance;
        if (balance < _decreaseeCount) {
            revert InsufficientBalance({
                balance: balance,
                decreaseeCount: _decreaseeCount
            });
        }
        balance -= _decreaseeCount;
        assert(balance == (_previousBalance - _decreaseeCount));
        emit Decrease(_decreaseeCount);
    }
}