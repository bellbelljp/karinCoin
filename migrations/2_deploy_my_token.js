const KarinCoin = artifacts.require('./MyToken.sol')

module.exports = (deployer) => {
  let initialSupply = 10000
  deployer.deploy(KarinCoin, totalSupply)
}
