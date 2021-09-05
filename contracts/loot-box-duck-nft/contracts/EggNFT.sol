// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract EggNFT is ERC721, Ownable, ReentrancyGuard {
    using Strings for string;

    string private baseURI;

    constructor() ERC721("EggNFT", "ENT") {
        baseURI = "https://gateway.pinata.cloud/ipfs/QmXvK6J6UoXuYybTsCzs1irijc2RyT2JHyymFNZzccQ5mP/";
    }

    function setBaseURI(string memory uri_) external onlyOwner {
        baseURI = uri_;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    // function tokenURI(uint256 tokenId_) override public pure returns (string memory) {
    //     return string(abi.encodePacked(_baseURI(), Strings.toString(tokenId_)));
    // }

    function hatch(uint256 tokenId_) public nonReentrant {
        require(ownerOf(tokenId_) == _msgSender());

        // FactoryERC721 factory = FactoryERC721(factoryAddress);
        // factory.mint(OPTION_ID, _msgSender());

        _burn(tokenId_);
    }

}






