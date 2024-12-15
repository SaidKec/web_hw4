pragma solidity ^0.8.0;
import "../src/ERC20MyToken.sol";

import {ITokenMock} from "../lib/properties/contracts/ERC20/external/util/ITokenMock.sol";
import {CryticERC20ExternalBasicProperties} from "../lib/properties/contracts/ERC20/external/properties/ERC20ExternalBasicProperties.sol";
import {CryticERC20ExternalMintableProperties} from "../lib/properties/contracts/ERC20/external/properties/ERC20ExternalMintableProperties.sol";
import {CryticERC20ExternalBurnableProperties} from "../lib/properties/contracts/ERC20/external/properties/ERC20ExternalBurnableProperties.sol";
import {PropertiesConstants} from "../lib/properties/contracts/util/PropertiesConstants.sol";


contract CryticERC20ExternalHarness is CryticERC20ExternalBasicProperties, CryticERC20ExternalMintableProperties, CryticERC20ExternalBurnableProperties {
    constructor() {
        // Deploy ERC20
        token = ITokenMock(address(new CryticTokenMock()));
    }
}

contract CryticTokenMock is ERC20MyToken, PropertiesConstants {

    bool public isMintableOrBurnable;
    uint256 public initialSupply;
    constructor () {
        _mint(USER1, INITIAL_BALANCE);
        _mint(USER2, INITIAL_BALANCE);
        _mint(USER3, INITIAL_BALANCE);
        _mint(msg.sender, INITIAL_BALANCE);

        initialSupply = totalSupply();
        isMintableOrBurnable = true;
    }
}