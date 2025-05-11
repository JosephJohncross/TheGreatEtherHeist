# TheGreatEtherHeist

### Self-Destruct Contract Address: 0x014dc8bec4b0e03898c4789494b81414467a52f0ebc60acf3e307a8f5041205d
### whitelisted wallet address: 0xdD05a90117572dc948500be5a1bf7a0cB9462143


## Report

For this challenge, the objective was to send ether to the Ether Vault contract without directly interacting with its `receive()` or `fallback()` functions. The key here was to leverage Solidity’s `selfdestruct()` opcode.

### Strategy

I deployed a simple attack contract with a payable constructor to accept ether and a `selfDestruct()` function that takes the Ether Vault address as a parameter. When `selfDestruct()` is called, the contract is destroyed and its balance is forcibly sent to the target address without triggering any logic in the recipient contract.

### Implementation Steps

1. **Deploy the attack contract** with the ether amount intended for transfer.  
2. **Call `selfDestruct()`** and pass the Ether Vault address.  
3. The ether is transferred directly without interacting with the Vault's fallback or receive functions.

### Challenges

- **Gas Management:** Ensuring the transaction had enough gas to handle the `selfdestruct()` operation without failing.  
- **Testing and Verification:** Since the contract is deleted after self-destruction, confirming the ether transfer required some creative logging and balance checks.  
- **Timing and Sequencing:** Ensuring the self-destruct transaction executed as intended without losing the ether in the process.  

Overall, the strategy worked as planned. The experience reinforced how powerful low-level Solidity opcodes can be when it comes to bypassing typical ether transfer restrictions.
