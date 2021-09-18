const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("tokenURI", function () {
  it("Minted token URI should be correct", async function () {
    const HelloWorld = await ethers.getContractFactory("HelloWorld");
    const helloWorld = await HelloWorld.deploy();
    await helloWorld.deployed();

    const mintTx = await helloWorld.safeMint("0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc");

    await mintTx.wait();

    expect(await helloWorld.tokenURI(0)).to.equal("ipfs://QmRWYhDanWcmYJFqWCbtRemcYzrNYkhVsPCr6Zie7k7s7f")
  });
});
