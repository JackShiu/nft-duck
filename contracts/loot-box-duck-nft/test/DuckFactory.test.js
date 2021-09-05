
const { BN, expectRevert, expectEvent } = require('@openzeppelin/test-helpers');
const { expect, assert } = require('chai');

const DuckFactory = artifacts.require('DuckFactory');

require('chai')
	.use(require('chai-as-promised'))
	.use(require('chai-bn')(BN))
	.should()

const numberToBigNumber = (val) => web3.utils.toWei(val.toString(), 'ether');
const bigNumberToNumber = (val) => web3.utils.fromWei(val.toString(), 'ether');
// const URI_1 = "https://gateway.pinata.cloud/ipfs/QmXvK6J6UoXuYybTsCzs1irijc2RyT2JHyymFNZzccQ5mP/1101"
// const URI_2 = "https://gateway.pinata.cloud/ipfs/QmXvK6J6UoXuYybTsCzs1irijc2RyT2JHyymFNZzccQ5mP/1102"

contract('duck factory flow check', function (accounts) {

    before('deploy implementation', async function () {
        this.owner = accounts[0];
        this.user1 = accounts[1];
        this.user2 = accounts[2];
        this.factory = await DuckFactory.new({from: this.owner});
    });

    it('check randomness' , async function (){
        // await this.factory.random()
        // console.log((await this.factory.getSeed()).toString())

        // 計算 gas fee
        // console.log(await this.factory.random.estimateGas());
        // for(let i=0 ; i<100; i++) {
        //     await this.factory.pickRandom()
        //     console.log((await this.factory.getRand()).toString())
        // }
        function range(start, end) {
            return Array(end - start + 1).fill().map((_, idx) => numberToBigNumber(start + idx))
        }
        // for(let i=1 ; i<10; i++) {
        //     let list = range(1*i,2*i);
        //     // Math.floor( Math.random() * (i + 1) ); //random index
        //     await this.factory.addIntoDuckList(list)
        //     console.log(i, (await this.factory.getDuckList()).reduce((acc, v )=> `${acc} [${bigNumberToNumber(v)}]`,''))
        // }
        let list = range(0,200);
        // Math.floor( Math.random() * (i + 1) ); //random index
        await this.factory.addIntoDuckList(list)
        console.log( (await this.factory.getDuckList()).reduce((acc, v )=> `${acc} [${bigNumberToNumber(v)}]`,''))
    });
})