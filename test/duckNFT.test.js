const { BN, expectRevert, expectEvent } = require('@openzeppelin/test-helpers');
const { expect, assert } = require('chai');

const DuckNFT = artifacts.require('DuckNFT');

require('chai')
	.use(require('chai-as-promised'))
	.use(require('chai-bn')(BN))
	.should()


const URI_1 = "https://gateway.pinata.cloud/ipfs/QmXvK6J6UoXuYybTsCzs1irijc2RyT2JHyymFNZzccQ5mP/1101"
const URI_2 = "https://gateway.pinata.cloud/ipfs/QmXvK6J6UoXuYybTsCzs1irijc2RyT2JHyymFNZzccQ5mP/1102"

contract('duckNFT flow check', function (accounts) {

    before('deploy implementation', async function () {
        this.owner = accounts[0];
        this.user1 = accounts[1];
        this.user2 = accounts[2];
        this.duck = await DuckNFT.new({from: this.owner});
        await this.duck.mintToken(this.owner, 1101, {from: this.owner});
        await this.duck.mintToken(this.owner, 1102, {from: this.owner});
    });

    it('check baseURI' , async function (){
        let { duck } =this;
        let firstUri = await duck.tokenURI(1101);
        assert.equal(firstUri, URI_1);

        let SecondUri = await duck.tokenURI(1102);
        assert.equal(SecondUri, URI_2);
    });
})