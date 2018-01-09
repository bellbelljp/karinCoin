pragma solidity ^0.4.16;
import "zeppelin-solidity/contracts/token/StandardToken.sol";

contract KarinCoin {
  //Ethereumはコントラクトと呼ばれるコードをブロックチェーンに格納し、ノード間で実行・共有することができる
  //状態変数の宣言
  string public name = "KarinCoin";                             // トークンの名前
  string public symbol = "karin";                           // トークンの単位
  uint8 public decimals = 0;                          // 小数点以下の桁数
  uint256 public totalSupply = 10000;                     // トークンの総量
  mapping (address => uint256) public balanceOf;  // 各アドレスの残高
  mapping (address => string) public nickname;        // 名前登録
  mapping (address => string) public karinLevel;

  //コンストラクタ（インスタンスを生成した時に実行される）
  function KarinCoin() public{
    balanceOf[msg.sender] = totalSupply;
    karinLevel[msg.sender] = "checkLevelしてね！";
  }

  //送金
  function transfer(address _to, uint256 _value) public{
    //不正送金の確認
    require(balanceOf[msg.sender] >= _value);
    require(balanceOf[_to] + _value >= balanceOf[_to]);

    //送信元、送信先アカウントの残高を更新
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
  }

  function registration(address _address, string _name) public{
    nickname[_address] = _name;
    //アドレスに自分の名前を登録する。
  }
  function checkLevel(address _check) public{
    if(balanceOf[_check] > 5000){
      karinLevel[_check] = "カリンレベル：７  わーい！最高レベルだよ！大好き〜〜〜！";
    }else if(balanceOf[_check] > 2000){
      karinLevel[_check] = "カリンレベル：６  すごい！！さっすが〜＼(^o^)／";
    }else if(balanceOf[_check] > 1000){
    karinLevel[_check] = "カリンレベル：５  今度一緒に御飯に行こう！２次元で待ってるね！";
    }else if(balanceOf[_check] > 100){
    karinLevel[_check] = "カリンレベル：４  いっぱいカリンコインを集めてくれてありがとう！";
    }else if(balanceOf[_check] > 10){
    karinLevel[_check] = "カリンレベル：３  カリンを集めてくれて嬉しい〜(^o^)";
    }else if(balanceOf[_check] > 5){
    karinLevel[_check] = "カリンレベル：２  初めまして！よろしくね(^^)";
    }else if(balanceOf[_check] > 1){
    karinLevel[_check] = "カリンレベル：１  カリンコインをもっと集めて、カリンからのメッセージをもらおう";
    }else{
    karinLevel[_check] = "カリンレベル：０";
    }
  }
}
