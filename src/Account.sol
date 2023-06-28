/// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;


contract AccountLogic {
    uint256 public immutable K;

    ///@notice stores balances of account
    mapping(uint256 => uint256) accountBalance;

    // struct AccountAccess {
    //     uint64 inactivityDiff;
    //     address[] accessors;
    //     uint256[] limits;
    // }

    constructor(uint256 k_) {
        K = k_;
    }

    error Unauthorized();

    function computeAccount(address client_, address token_) public pure returns (uint256) {
        return client_ > token_ ? uint160(client_) - uint160(token_) : uint160(token_) - uint160(client_);
    }

    function deposit(uint256 account_) external virtual returns (uint256 balance) {}
    function withdraw(uint256 account_) external virtual returns (uint256 balance) {}

    function _beforeAccountTransaction(uint256 account_) internal virtual {
        if  (! _isSenderAccountOwner(account_)) revert Unauthorized();

    }

    function _afterAccountTransaction() internal virtual {


    }

    function _isSenderAccountOwner(uint256 account) private view returns (bool) {
        return account == computeAccount(msg.sender,tokenOfAccount(account));
    }

    function tokenOfAccount(uint256 account_) public view returns(address) {
        uint256 t = uint256(uint160(msg.sender)) > account_
            ? uint256(uint160(msg.sender)) - account_
            : account_ + uint256(uint160(msg.sender));
        return address(uint160(t));
    }
}
