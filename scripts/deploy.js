
const hre = require("hardhat");

async function main() {
  const initBalance = 1;
  const BankATM = await hre.ethers.getContractFactory("BankATM");
  const bankatm = await BankATM.deploy(initBalance);
  await bankatm.deployed();

  console.log(`A contract with balance of ${initBalance} eth deployed to ${bankatm.address}`);
}


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
