// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

import "./IFactoryERC721.sol";
// import "./Creature.sol";
// import "./CreatureLootBox.sol";

// contract DuckFactory is FactoryERC721, Ownable {
contract DuckFactory is Ownable {
    using SafeMath for uint256;
    using Strings for string;
    uint256 constant INVERSE_BASIS_POINT = 10000;
    address private _eggAddress;
    address private _duckAddress;
    uint256 private _seed;
    uint16 private _rand;
    uint256 private _duckAmount = 20;
    uint256[] public duckList;

    constructor() {
        _seed = 1;
    }

    /**
     * @dev Throws if called by any account other than the egg contract.
     */
    modifier onlyEggContract() {
        require(_eggAddress == msg.sender, "caller is not the egg contract");
        _;
    }

    function addIntoDuckList(uint256 [] memory ids) public {
        // duckList.push(id);
        for(uint256 i =0 ; i<ids.length; i++) {
            duckList.push(ids[i]);
        }
    }

    function getDuckList() public view returns(uint[] memory) {
        return duckList;
    }


    // /**
    //  * @dev setup egg contract address for privileged access
    //  * Can only be called by the current owner.
    //  */
    // function setEggContract(address egg_) external onlyOwner {
    //     _eggAddress = egg_;
    // }


    /**
    * @dev egg hatch to duck, this will mint a new duckNFT to user(`toAddress_`)
    * Can only be called by the current owner.
    */
    function mint(uint256 eggId_, address toAddress_) external onlyEggContract {
        // 1.get random unmber
        uint duckId = 1101;
        // 2.invoke duckNFT to mint/transfer NFT to user
        // hatchDuck(toAddress_, duckId);
    }

    function pickRandom() public returns (uint256) {
        uint256 rand = _random();
        uint16 value = uint16(rand.mod(_duckAmount));
        _rand = value;
        _duckAmount =_duckAmount.sub(1);
    }

    function getRand() public view returns (uint256) {
        return _rand;
    }

    /**
    * @dev Pseudo-random number generator
    */
    function _random() internal returns (uint256) {
        uint256 random = uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), msg.sender, _seed)));
        _seed = random;
        return random;
    }

    function getSeed() public view returns (uint256) {
        return _seed;
    }
}