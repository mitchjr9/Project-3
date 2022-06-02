pragma solidity ^0.5.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";

contract ArtToken is ERC721Full {
    string tokenURI = "https://github.com/mitchjr9/Project-3/blob/main/images/Punch%209%20Poster.png";

    constructor() public ERC721Full("Punch9", "PUNCH9") {}

    function registerArtwork(address owner)
        public
        returns (uint256)
    {
        
        uint256 tokenId = totalSupply(); // 1. create unique token ID 
        _mint(owner, tokenId);           // 2. mint PUNCH9 token for token ID
        _setTokenURI(tokenId, tokenURI); // 3. associate in the process of mining the token ID with URI

        return tokenId;                  // 4. return token ID value
    }
}
