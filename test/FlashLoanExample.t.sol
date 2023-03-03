// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import { FlashLoanExample } from "../src/FlashLoanExample.sol";
import { IERC20 } from "../src/interface/IERC20.sol";  

abstract contract HelperContract {
    /// DAI: contract address in polygon mainnet.
    /// DAI_WHALE: Impersonate the DAI_WHALE account to be able to send transactions from that account.
    /// POOL_ADDRESS_PROVIDER:  Address of the PoolAddressProvider: you can find it here: https://docs.aave.com/developers/deployed-contracts/v3-mainnet/polygon
    address constant DAI = 0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063;
    address constant DAI_WHALE = 0xdfD74E3752c187c4BA899756238C76cbEEfa954B;
    address constant POOL_ADDRESS_PROVIDER = 0xa97684ead0e402dC232d5A977953DF7ECBaB3CDb;

}
contract FlashLoanExampleTest is Test, HelperContract {
    FlashLoanExample flashLoanExample;
    IERC20 token = IERC20(DAI);
    function setUp() public {
        flashLoanExample = new FlashLoanExample(POOL_ADDRESS_PROVIDER);
    }

    function testTransferDaiIntoTheContract() public {
        // Learn more about "broadcast": https://book.getfoundry.sh/cheatcodes/start-broadcast?highlight=startBroadcast#startbroadcast
        vm.startBroadcast(DAI_WHALE);
        uint FlashloanBeforeBalance = token.balanceOf(address(flashLoanExample));
        // learn more about loggings: https://book.getfoundry.sh/reference/ds-test?highlight=log_named_uint#logging
        emit log_named_uint("Flashloan Before balance:", FlashloanBeforeBalance);
        token.transfer(address(flashLoanExample), 2_000);
        uint FlashloanAfterBalance = token.balanceOf(address(flashLoanExample));
        emit log_named_uint("Flashloan After balance:", FlashloanAfterBalance);
        assertEq(FlashloanAfterBalance, 2_000);
        
    }

     function testCreateFlashLoan() public {
        testTransferDaiIntoTheContract();
        flashLoanExample.createFlashLoan(address(token), 1_000);
        uint remainingBalance = token.balanceOf(address(flashLoanExample));
         emit log_named_uint("Contract Balance after trying the flashloan:", remainingBalance);
        assertEq(remainingBalance, 1_999);

    }
}
