#!/bin/bash
#判断当前位置
echo 欢迎使用该防测回脚本
qqpath=/Applications/QQ.app/Contents/MacOS
echo $qqpath
basepath=$(cd `dirname $0`; pwd);
cd $basepath
echo 处理的地址：$basepath
if [[ ! -w ${qqpath} ]]; then
	echo -e "\n\n 为了让本撤回工具能够成功写入QQ,请输入密码："
	sudo chown -R $(whoami) ${qqpath}
fi
cp libQQMessageInvoke.dylib $qqpath
cp libsubstitute.dylib $qqpath
#修改执行路径
# 判断文件是否存在
if [ ! -f "$qqpath/libQQMessageInvoke.dylib" -o ! -f "$qqpath/libQQMessageInvoke.dylib" ]; then
	echo "防撤回失败，请重新执行该脚本！！"
	exit -1
fi
./insert_dylib --all-yes  $qqpath/libQQMessageInvoke.dylib $qqpath/QQ
if [[ $? -eq 0 ]]; then
	echo "第一步操作成功，请稍后！"
fi
install_name_tool -change /usr/local/lib/libsubstitute.0.dylib @executable_path/libsubstitute.dylib $qqpath/libQQMessageInvoke.dylib
install_name_tool -change $qqpath/libQQMessageInvoke.dylib @executable_path/libQQMessageInvoke.dylib $qqpath/QQ
echo "原始文件已经备份到了$qqpath/QQ $qqpath/QQ_backup"
mv $qqpath/QQ $qqpath/QQ_backup
mv $qqpath/QQ_patched $qqpath/QQ
if [[ $? -eq 0 ]]; then
	echo "防撤回成功！"
else
	echo "防撤回失败，请提出issue"
fi

