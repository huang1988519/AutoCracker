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

findApps=($(clutch -i | grep -i -HRl  $appName))


if [ "$findApps" = "" ]
then 
	echo "Error: 没有找到需要查找的App"
	exit 1
fi


len=${#findApps[@]}
echo "查找条目: "$len


for (( i =0; i<${len}; i++));
do
	echo ${findApps[$i]}
done


sel=$findApps
if [ "$len" -gt "1" ]; then
	echo "找到以下App "$findApps
	read -p "请选择需要破壳的应用 (从0 开始): " selectedIndex
	
	sel=$findAppIndex[$selectedIndex]
fi

echo "选择了" $sel

i=${sel%:*}
echo "破壳index：" $i

echo "开始破壳->"$i

clutch -d ${findAppIndex[$i]}

echo "破壳成功!"
echo "通过上边描述的路径copy到电脑上\n 参考:"
echo "scp root@100.85.109.167:/var/mobile/Documents/Dumped/net.openvpn.connect.app-iOS6.1-(Clutch-2.0.4).ipa ~/Desktop"

exit 0
