# . ERC - 721 - Non Fungible Tokens
 
i.      use to identify something unique / non Interchangeable
ii.     also useful for collectable items
iii.    each token have its different value
iv.     e.g - New CarA != New CarB || old CarA

**useCases**
i.      real estate
ii.     collectable

### 2a. ERC - 721A
i.      another version of ERC721
ii.     supports minting in batch
iii.    reduce costs if mint multiple NFTs (required only 2k extra gas(per NFT)
for minting more then one NFT at same time. where as normal ERC721 costs ~115k gas per extra mint ..)
How it more Gas efficient?
it only store base NFT id with Account address and set remaining addresses to blank. (If minted in Bulk)
so when user try to find the holder of the nft it perform loop to get address of account.
it store Address only once so it take less gas fee to store NFTs in bulk.
https://github.com/chiru-labs/ERC721A/blob/main/contracts/ERC721A.sol

### 2b. ERC - 721R   
i.      another version of ERC721
ii.     it allow NFT holders to give there NFTs they minted back and get refunds in certain period of time.

**example**
trustless refunds
game collectables -- user can get NFT(AVATAR) for gaming but in future if he stop playing that game he can sell it back to the
game owners to get his funds back.