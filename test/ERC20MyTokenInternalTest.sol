pragma solidity ^0.8.0;
import {CryticERC20BasicProperties} from "../lib/properties/contracts/ERC20/internal/properties/ERC20BasicProperties.sol";
import {CryticERC20MintableProperties} from "../lib/properties/contracts/ERC20/internal/properties/ERC20MintableProperties.sol";
import {CryticERC20BurnableProperties} from "../lib/properties/contracts/ERC20/internal/properties/ERC20BurnableProperties.sol";
import "../src/ERC20MyToken.sol";

contract CryticERC20InternalHarness is ERC20MyToken, CryticERC20BasicProperties, CryticERC20MintableProperties, CryticERC20BurnableProperties {

    constructor() {
        // Setup balances for USER1, USER2 and USER3:
        _mint(USER1, INITIAL_BALANCE);
        _mint(USER2, INITIAL_BALANCE);
        _mint(USER3, INITIAL_BALANCE);
        // Setup total supply:
        initialSupply = totalSupply();
        isMintableOrBurnable = true;
    }

    function balanceOf(address owner) public view virtual override(ERC20MyToken, ERC20) returns (uint256) {
        return ERC20MyToken.balanceOf(owner);
    }

    function approve(
        address adr,
        uint256 n
    ) public virtual override(ERC20, ERC20MyToken) returns (bool) {
        return ERC20MyToken.approve(adr, n);
    }

    function mint(address to, uint256 amount) public override(CryticERC20MintableProperties, ERC20MyToken) onlyOwner {
        return ERC20MyToken.mint(to, amount);
    }

    function totalSupply() public pure override(ERC20, ERC20MyToken) returns (uint256) {
        return ERC20MyToken.totalSupply();
    }
}