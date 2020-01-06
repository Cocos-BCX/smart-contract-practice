# 回滚攻击

## 事件经过
2019.12.24, Cocos-BCX主网合约[contract.dicegame](http://cocos-terminal.com/#/contract/contract.dicegame) 被攻击，原账户上的近30万的COCOS被盗取。

## 漏洞分析
攻击的思路跟EOS上的回滚攻击原理一样，EOS上的真实案例参考[这里](https://mp.weixin.qq.com/s/WyZ4j3O68qfN5IOvjx3MOg)。

dicegame合约中下注和开奖逻辑放在一起，具体的dice合约源码见[这里](/code/dicegame.lua)。

攻击者就可以利用这个漏洞进行攻击。基本的攻击手法如下：
1. 攻击者部署一个回滚攻击合约。
2. 在攻击合约中下注，下注结束后如果输了，就通过assert中断合约执行，如果赢了，就顺利走完所有的合约
3. 不断重复过程2，就能把原来的dice合约中所有的cocos都薅走。

具体的攻击合约见[这里](/code/rollbackattact.lua)


## 防御方法

有两种方法可以抵御此类攻击：

### 下注和开奖接口分开
### 排除掉下注人为合约的情况