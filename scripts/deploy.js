const hre = require("hardhat");

async function main() {
  const RecordKeeping = await ethers.getContractFactory("RecordKeeping");
  const recordKeeping = await RecordKeeping.deploy();
 
  console.log("contract deployed to:", recordKeeping.target);
  };


// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
