
const DuckNFT = artifacts.require("DuckNFT");


module.exports = async function (deployer, network, accounts ) {

    await deployer.deploy(DuckNFT);
    const nft = await DuckNFT.deployed();
    await nft.setManager('0x94229Cc8743aA9730a14f4894a5350667383C833');

};
