// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HelloWorld is ERC721, Ownable {
    bool mintable = true;
    
    constructor() ERC721("HelloWorld", "HELLO") {}

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmRWYhDanWcmYJFqWCbtRemcYzrNYkhVsPCr6Zie7k7s7f";
    }

    function safeMint(address to) public onlyOwner {
        require(mintable, "token already minted");
        mintable = false;
        _safeMint(to, 0);
    }
    
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        return _baseURI(); 
        
    }
    
    function tokenSupply() public pure returns (string memory) {
        return "1";
    }
}