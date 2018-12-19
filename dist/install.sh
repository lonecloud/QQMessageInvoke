main(){
	GITHOME=~/QQMessageInvoke
	echo '欢迎使用该QQ防撤回工具，请确认你的mac电脑安装了GIT'
	if [[ -d $GITHOME ]]; then
		rm -rf $GITHOME
	fi
	env git clone --depth=1 https://github.com/lonecloud/QQMessageInvoke.git "$GITHOME" || {
    	printf "Error: 克隆QQ防撤回项目失败\n"
    	exit 1
  	}
  	cd $GITHOME/dist
  	sh start.sh
}


main