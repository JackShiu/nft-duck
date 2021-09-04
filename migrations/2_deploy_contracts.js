
const DuckNFT = artifacts.require("DuckNFT");


module.exports = async function (deployer, network, accounts ) {


    await deployer.deploy(DuckNFT);
    const nft = await DuckNFT.deployed();
    await nft.mintToken(accounts[0], 1101);
    await nft.mintToken(accounts[0], 1102);

};
