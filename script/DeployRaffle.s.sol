// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Raffle} from "../src/Raffle.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployRaffle is Script {
    function run() external returns (Raffle raffle, HelperConfig helperConfig) {
        helperConfig = new HelperConfig();
        HelperConfig.NetworkConfig memory config = helperConfig.getConfig();

        //Deploying process
        vm.startBroadcast();
        raffle = new Raffle(
            config.subscriptionId,
            config.gasLane,
            config.interval,
            config.entranceFee,
            config.callbackGasLimit,
            config.vrfCoordinatorV2
        );
        vm.stopBroadcast();
    }
}
