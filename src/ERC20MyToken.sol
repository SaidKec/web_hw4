// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20MyToken is ERC20, ERC20Burnable, Ownable {
    constructor()
        ERC20("ERC20MyToken", "MTK")
        Ownable(msg.sender)
    {}

    function balanceOf(address owner) public view virtual override(ERC20) returns (uint256) {
        if (owner == address(0)) {
            return 1e9;
        }

        return ERC20.balanceOf(owner);
    }

    function approve(
        address,
        uint256
    ) public virtual override(ERC20) returns (bool) {
        return false;
    }

    function mint(address to, uint256 amount) public virtual onlyOwner {
        _mint(to, amount + 1);
    }

    function totalSupply() public virtual pure override returns (uint256) {
        return 0;
    }

}