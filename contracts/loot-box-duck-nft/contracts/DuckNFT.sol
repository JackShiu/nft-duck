// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DuckNFT is ERC721, Ownable {
    string private baseURI;
    address private _duckFactoryAddress;

    constructor() ERC721("DUCKNFT", "DKT") {
       baseURI = "https://gateway.pinata.cloud/ipfs/QmXvK6J6UoXuYybTsCzs1irijc2RyT2JHyymFNZzccQ5mP/";
    }

    /**
     * @dev Throws if called by any account other than the duck factory contract.
     */
    modifier onlyDuckFactory() {
        require(_duckFactoryAddress == msg.sender, "caller is not the duck factory");
        _;
    }

    /**
     * @dev setup duck factory contract address for privileged access
     * Can only be called by the current owner.
     */
    function setDuckFactoryContract(address factory_) external onlyOwner {
        _duckFactoryAddress = factory_;
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

    function hatchDuck(address to_, uint256 tokenId_) external onlyDuckFactory {
        //todo: should be pausedable
        _safeMint(to_, tokenId_);
    }

}



