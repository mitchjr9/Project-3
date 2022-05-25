pragma solidity ^0.5.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
// tokenURI= "https://github.com/mitchjr9/Project-3/blob/main/images/Punch%209%20Poster.png";
contract ArtToken is ERC721Full {
    constructor() public ERC721Full("Punch9", "PUNCH9") {}
    
    function registerArtwork(address owner, string memory tokenURI)
        public
        returns (uint256)
    {
        uint256 tokenId = totalSupply();
        _mint(owner, tokenId);
        _setTokenURI(tokenId, tokenURI);

        return tokenId;
    }
}