#!/bin/bash
#判断当前位置
echo 欢迎使用该防测回脚本
qqpath=/Applications/QQ.app/Contents/MacOS
echo $qqpath
basepath=$(cd `dirname $0`; pwd);
cd $basepath
echo 处理的地址：$basepath
cp libQQMessageInvoke.dylib $qqpath
cp libsubstitute.dylib $qqpath
echo 请在此处输入y
#修改执行路径
./insert_dylib $qqpath/libQQMessageInvoke.dylib $qqpath/QQ
install_name_tool -change /usr/local/lib/libsubstitute.0.dylib @executable_path/libsubstitute.dylib $qqpath/libQQMessageInvoke.dylib
install_name_tool -change $qqpath/libQQMessageInvoke.dylib @executable_path/libQQMessageInvoke.dylib $qqpath/QQ
otool -L QQ | grep voke
echo '原始文件已经备份到了$qqpath/QQ $qqpath/QQ_backup'
mv $qqpath/QQ $qqpath/QQ_backup
mv $qqpath/QQ_patched $qqpath/QQ
echo "防撤回成功！"

