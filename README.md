## multidex2jar
d2j-dex2jar 可以将 apk 转成 jar 文件，但是目前许多 apk 都是 multidex 的。d2j-dex2jar 只能转换 apk 中的第一个 dex。

multidex2jar 可以将多 dex apk 转成 jar，使用 [JD-GUI](http://jd.benow.ca/) 查看反编译后的源码。

### 使用
./my_d2j.sh airbnb.apk airbnb.jar

* 需要安装 JDK
* 如果使用 windows，可讲脚本在 git-bash 中执行
