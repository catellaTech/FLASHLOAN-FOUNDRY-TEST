# Trying a Flashloan with Foundry
<a href="https://github.com/catellaTech/FLASHLOAN-FOUNDRY-TEST/actions/workflows/test.yml"><img src="https://travis-ci.org/mpaland/printf.svg?branch=master"></a>
<a href="https://github.com/catellaTech" target="_blank">
    <img alt="Author" src="https://img.shields.io/badge/made%20by-CatellaTech-blueviolet?style=flat-square">
  </a>
<br>
<br>
Lets build an example with Foundry in the polygon mainnet where you can experience how we can start a flash loan. Note we won't be actually doing an arbitrage here, because finding profitable arbitrage opportunities is the hardest part and not related to the code, but will essentially just learn how to execute a flash loan.  📚🔓

## First what are Flash Loans?

You might be thinking: Is it some kind of loan? Well, yes, it is. It's a special type of loan where a borrower can borrow an asset as long as they return the borrowed amount and some interest before the end of the transaction. Since the borrowed amount is returned back, with interest, in the same transaction, there is no possibility for anyone to run away with the borrowed money. If the loan is not repaid in the same transaction, the transaction fails overall and is reverted.

## 🈸 Applications of a Flash Loan
They help in arbitrage between assets, causing liquidations in DeFi lending protocols, often play part in DeFi hacks, and other use cases. You can essentially use your own creativity to create something new 😇

## 🤔 How do Flash Loans work?
There are 4 basic steps to any flash loan. To execute a flash loan, you first need to write a smart contract that has a transaction that uses a flash loan. Assume the function is called createFlashLoan(). The following 4 steps happen when you call that function, in order:

- Your contract calls a function on a Flash Loan provider, like Aave, indicating which asset you want and how much of it.
- The Flash Loan provider sends the assets to your contract, and calls back into your contract for a different function, `executeOperation`.
- `executeOperation` is all custom code you must have written - you go wild with the money here. At the end, you approve the Flash Loan provider to withdraw back the borrowed assets, along with a premium.
- The Flash Loan provider takes back the assets it gave you, along with the premium.

What you will practices in this test:
- setUp: it's an optional function, it's like the beforeEach in JS
- The functions we want to test must start with "test", they're like the "it" in JS
- Learning how to config the foundry cheatcodes to make what we want. 
- We are going to fork the mainnet.
- We are going to impersonate an account to be able to send transactions from that account.
and so much more.

The main idea of this project was to practice Foundry and its most basic commands for testing with Solidity. 

🚨 Note: One of the commands that helped us detect errors faster with -v (verbosity).

Verbosity of the EVM.

Pass multiple times to increase the verbosity (e.g. -v, -vv, -vvv).

Verbosity levels:

- 2: Print logs for all tests
- 3: Print execution traces for failing tests
- 4: Print execution traces for all tests, and setup traces for failing tests
- 5: Print execution and setup traces for all tests.

But you can only run the test, because we config in `foundry.toml` file the verbosity.

<hr>
<h2> Installing / Getting started </h2>

```bash
# Clone this project
$ git clone https://github.com/catellaTech/FLASHLOAN-FOUNDRY-TEST

# Access
$ cd FLASHLOAN-FOUNDRY-TEST

# Install dependencies
$ forge install
``` 

<h2>Commands</h2>

- $ `forge build`
- $ `forge test --fork-url <RPC URL> --fork-block-number <BLOCK NUMBER>`


<h2> Technologies / Built With </h2>

- Solidity
- Foundry
- Alchemy

<h2>Contributing</h2>
Contributions are always welcome! Open a PR or an issue!

<br>
<br>

<p align="center">
<a href="mailto:catellatech@gmail.com" target="_blank" >
  <img alt="Email - J.Gabriela" src="https://img.shields.io/badge/Email--%23F8952D?style=social&logo=gmail">
</a> 
<br/>
  Made with ❤️ by <b>catellaTech</b>.
<p/>