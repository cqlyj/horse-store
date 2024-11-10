install :; @forge install huff-language/foundry-huff --no-commit && forge install huff-language/huffmate --no-commit && forge install openzeppelin/openzeppelin-contracts --no-commit

huff :; huffc -e shanghai -b ./src/horseStoreV1/HorseStore.huff

runtime-huff :; huffc -e shanghai --bin-runtime ./src/horseStoreV1/HorseStore.huff

yulCompile :; solc --strict-assembly --optimize --optimize-runs 20000 ./yul/HorseStoreYul.yul --bin

yulCompileBinary :; solc --strict-assembly --optimize --optimize-runs 20000 ./yul/HorseStoreYul.yul --bin | grep 60

debug-testReadValue-huff :; @forge test --match-path *Huff* --debug testReadValue -vvvv
debug-testWriteValue-huff :; @forge test --match-path *Huff* --debug testWriteValue -vvvv