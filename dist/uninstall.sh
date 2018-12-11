#!/bin/bash
qqpath=/Applications/QQ.app/Contents/MacOS
mv $qqpath/QQ $qqpath/QQ_old
mv $qqpath/QQ_backup $qqpath/QQ
if [[ $? -eq 0 ]]; then
	echo "卸载成功！"
else
	echo "卸载失败！"
fi