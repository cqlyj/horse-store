// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {HorseStore} from "src/horseStoreV1/HorseStore.sol";
import {IHorseStore} from "src/horseStoreV1/IHorseStore.sol";

abstract contract Base_TestV1 is Test {
    IHorseStore public horseStore;

    function setUp() public virtual {
        horseStore = IHorseStore(address(new HorseStore()));
    }

    function testReadValue() public view {
        uint256 value = horseStore.readNumberOfHorses();
        console.log("value: ", value);
        assertEq(value, 0);
    }

    function testWriteValue(uint256 numberOfHorses) public {
        horseStore.updateHorseNumber(numberOfHorses);
        uint256 value = horseStore.readNumberOfHorses();
        console.log("value: ", value);
        assertEq(value, numberOfHorses);
    }
}
