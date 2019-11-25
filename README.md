# 某个能用的*cpc滚榜

## Features

* 基于的版本
  * 1.1.0dev.1057

* 用到的数据格式
  * 具体见`sample.xml`

* 中文字体
  * 使用了自己的mac里不知道哪里掏出来的`STHEITI.ttf`，其他的显示都没这个正常
  * 要转成`pfb`格式，替换`lib/resolver.jar`里的`font/HELV.PFB`
  * 但是还有某些字符不能正常显示，所以先把自带的`HELV.PFB`捞出来转成`Helvetica.ttf`，和`STHEITI.ttf`合并一下，再转回`pfb`格式。个人感觉`Helvetica`有点古老，所以是`right join`~

## Usage

适用于基于`OnlineJudge(QDUOJ)`的比赛

直接上服务器进`postgres`操库，跑`query.sql`里的一句话。记得修改`contest_id`和`username`正则匹配格式~

执行方法如下
```
\o PATH_TO_FILE
...
\o
```
两句话分别对应的是所有的`team`和所有的`run`，格式见`sample.xml`。注意`award`需要自己手动随便处理一下。


## Bugs

* 貌似排名只支持分钟级
* 待fix - `<first-to-solve>false</first-to-solve>`需要清理掉