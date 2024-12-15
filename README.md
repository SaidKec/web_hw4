# ДЗ 4

Абдуллин Саид Маратович БПИ 218

Для internal тестирования команда - 
```
echidna test/ERC20MyTokenInternalTest.sol --contract CryticERC20InternalHarness --config echidna-config.yaml
```

Для external тестирования команды - 
```
fuzzing % echidna test/ERC20MyTokenExternalTest.sol --contract CryticERC20ExternalHarness --config echidna-config-external.yaml
```

В контракте были переопределены функции balanceOf, approve, mint, totalSuply

Для balanceOf всегда отдается 1е9 для address(0), из-за этого ломается _zeroAddressBalance, так как баланся для нулевого адреса неверен

Для approve всегда возвращается false, из-за чего ломаются _setAllowanceTwice и _setAllowance, собственно потому, что никогда allowance не становится true, соответственно и set allowance не сработает

Для mint выпускался amount + 1, вместо amount, из-за чего ломается _mintTokens, так как число выпущенных токенов не совпадает с ожидаемым(на один больше)

Для totalSuply всегда отдается 0, из-за чего ломаются _userBalanceNotHigherThanSupply и _userBalancesLessThanTotalSupply, так как totalSuply считается всегда нулевым, а значит почти всегда меньше ожидаемого
