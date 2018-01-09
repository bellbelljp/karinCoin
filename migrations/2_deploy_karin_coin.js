const KarinCoin = artifacts.require('./KarinCoin.sol')

module.exports = (deployer) => {
  let initialSupply = 10000
  deployer.deploy(KarinCoin, totalSupply)
}
