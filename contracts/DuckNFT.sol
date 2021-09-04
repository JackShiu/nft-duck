// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DuckNFT is ERC721, Ownable {
    string private baseURI;
    constructor() ERC721("DUCKNFT", "DKT") {
       baseURI = "https://gateway.pinata.cloud/ipfs/QmXvK6J6UoXuYybTsCzs1irijc2RyT2JHyymFNZzccQ5mP/";
    }

    function setBaseURI(string memory uri_) external onlyOwner {
        baseURI = uri_;
    }

    function mintToken(address to_, uint256 tokenId_) external onlyOwner {
        _safeMint(to_, tokenId_);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

}



