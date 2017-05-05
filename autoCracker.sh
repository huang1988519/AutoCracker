#!/bin/sh
#


if [ ! -e /usr/bin/ssh ]; then
	echo "Error: 请先安装 ssh"
	exit 1
fi

if [ ! -e /bin/clutch ]; then
	echo "Error: 找不到 clutch，请先安装 Clutch 工具"
	exit 1
fi

read -p "输入需要破壳的App名字:" appName

echo "开始查找: " $appName

findApps=$(clutch -i | grep -I $appName)


if [ "$findApps" = "" ]
then 
	echo "Error: 没有找到需要查找的App"
	exit 1
fi


echo -e "找到以下结果:  \n" $findApps

# for (( i =0; i<${len}; i++));
# do
# 	echo ${findApps[$i]}
# done


read -p "输入搜索结果中需要破壳 app 行首标号 : " index

clutch -d $index

echo "电脑端操作. 参考"
echo "scp root@100.85.109.167:/var/mobile/Documents/Dumped/net.openvpn.connect.app-iOS6.1-(Clutch-2.0.4).ipa ~/Desktop"

exit 0
