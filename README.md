# AutoCracker
越狱手机自动破壳
 >附上一个破壳后的 OpenVpn，目的是技术研究，如侵权请联系删除。

### 要求
* 越狱手机一台
* 手机需安装
  * ssh
  * clutch


### Manual

* 使用 scp 复制到 手机上

  ``` shell
  scp ~/Desktop/autoCracker.sh root@100.85.109.167:/var/root/autoCracker.sh
  ```
  
* 登录到手机(记得换成自己的ip地址)

 ```shell
 ssh root@100.85.109.167
 ```
 
* 输入手机root密码

 ```
 例: alpine,如果你也一样懒的需改
 ```

* 增加执行权限  
  ``` shell
  chmod +R 777 autoCracker.sh
  ```

* 执行autoCracker

  ```
  ./autoCracker.sh
  ```
  
* 等待执行成功后，会得到一个破壳后的ipa，路径在`/var/mobile/Documents/Dumped/`,然后把破壳后的ipa 导入到电脑
  ```shell
  scp root@100.85.109.167:/var/mobile/Documents/Dumped/net.openvpn.connect.app-iOS6.1-(Clutch-2.0.4).ipa ~/Desktop
  ```
