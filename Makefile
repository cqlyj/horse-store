install :; @forge install huff-language/foundry-huff --no-commit

huff :; huffc -e shanghai -b ./src/horseStoreV1/HorseStore.huff

runtime-huff :; huffc -e shanghai --bin-runtime ./src/horseStoreV1/HorseStore.huff

debug-testReadValue-huff :; @forge test --match-path *Huff* --debug testReadValue -vvvv
debug-testWriteValue-huff :; @forge test --match-path *Huff* --debug testWriteValue -vvvv