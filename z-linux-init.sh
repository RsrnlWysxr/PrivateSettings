#!/bin/bash


set -e
set -u


HOME_DIR=$HOME
WORK_DIR=$HOME_DIR/tmp
BIN_DIR=$HOME_DIR/bin
USR_DIR=$HOME_DIR/usr
CONFIG_DIR=$HOME_DIR/.config


InitRunEnv()
{
	for arg in $*
	do
		if [ $arg = 'x' ]
		then
			set -x
		fi
	done
}


CheckSysEnv()
{
	git --version 1>/dev/null
	tar --version 1>/dev/null
	python3.7 --version 1>/dev/null
	python3.7 -m pip --version 1>/dev/null
	

	if [ ! -e ~/.bashrc ]
	then
		echo "Error: Can't Found ~/.bashrc"
		return -1
	fi

	if [ ! -e ~/.profile ]
	then
		echo "Error: Can't Found ~/.profile"
		return -1
	fi
}


InitUserEnv()
{
	if [ ! -d $WORK_DIR ]
	then
		mkdir $WORK_DIR
	fi

	if [ ! -d $BIN_DIR ]
	then
		mkdir $BIN_DIR
		echo "OK: Create Directory: $BIN_DIR"
	else
		echo "OK: Already Had $BIN_DIR Directory"
	fi

	if [ ! -d $USR_DIR ]
	then
		mkdir $USR_DIR
		echo "OK: Create Directory: $USR_DIR"
	else
		echo "OK: Already Had $USR_DIR Directory"
	fi

	if [ ! -d $CONFIG_DIR ]
	then
		mkdir $CONFIG_DIR
		echo "OK: Create Directory: $CONFIG_DIR"
	else
		echo "OK: Already Had $CONFIG_DIR Directory"
	fi
}


#
# Utils
#
GetSSHIP()
{
	pts_pid=$(who -a | rg \$(ps -ef | rg sshd | rg liyihang@ | awk -F '@' '{printf $2}') | awk '{printf $8}' | sed 's/[()]//g')
	echo $pts_pid
}


RelocateFD()
{
	f=${1:-}
	if [ $f ]
	then
		exec 3>&1
		exec 4>&2
		exec 1>$1
		exec 2>&1
	else
		exec 1>&3
		exec 2>&4
	fi
}


GetSSHIP()
{
	pts_pid=$(who -a | rg $(ps -ef | rg sshd | rg liyihang@ | awk -F '@' '{printf $2}') | awk '{printf $8}' | sed 's/[()]//g')
	echo $pts_pid
}


CpToUserBinDir()
{
	local execable_path=${1:-}
	local alias=${2:-}

	if [ ! -e $execable_path ]
	then
		echo "Error: No Exsit File: $execable_path" >&2
		return -1
	fi

	if [ -n $alias ]
	then
		alias=$(basename $execable_path)
	fi

	if [ -e "$BIN_DIR/$alias" ]
	then
		echo "Error: Already Exsited File: $BIN_DIR/$alias" >&2
		return -1
	fi

	ln -s $execable_path $BIN_DIR/$alias
}

MoveToUserUsrDir()
{
	local dir_path=${1:-}

	if [ ! -d $dir_path ]
	then
		echo "Error: No Exist Dir: $dir_path" >&2
		return -1
	fi

	local dir_name=$(basename $dir_path)

	if [ -e "$USR_DIR/$dir_name" ]
	then
		echo "Error: Already Existed Dir: $USR_DIR/$dir_name" >&2
		return -1
	fi

	mv $dir_path $USR_DIR
}


WriteToBashrc()
{
	if [ $# == 0 ]
	then
		return 0
	fi

	if [ ! -e ~/tmp/.bashrc ]
	then
		touch ~/tmp/.bashrc
	fi

	echo -e "$1\n" >> $HOME_DIR/.bashrc
}


#
# Function
#
ExportEnvConstVariable()
{
	local content="
export SDL_VIDEO_X11_VISUALID=0x22
export SSHIP=\$(who -a | rg \$(ps -ef | rg sshd | rg liyihang@ | awk -F '@' '{printf \$2}') | awk '{printf \$8}' | sed 's/[()]//g')
export DISPLAY=\$SSHIP:0"

	WriteToBashrc "$content"
	
	echo "OK: Write Const Varialbe To Bashrc: SDL_VIDEO_X11_VISUALID, SSHIP, DISPLAY"
}


ExtendRawFunction()
{
	local auto_cd="
LSAfterCD()
{
	\\\cd \$1
	ls
}

alias cd=\"LSAfterCD\""

	local protected_rm="
Trash()
{
	TRASH=~/.trash

	if [ ! -d \$TRASH ]
	then
		echo \"mkdir trash\"
		mkdir \$TRASH
	fi

	str=\$@
	src=\${str##-* }
	dst=\"\${src}_\$(date \"+%Y%m%d%H%M%S\")\"

	mv \$src \$TRASH/\$dst
}

alias rm=\"Trash\""

	WriteToBashrc "$auto_cd"
	WriteToBashrc "$protected_rm"
}


Tree()
{
	if type tree > /dev/null 2>&1
	then
		echo "OK: tree: Already Existed"
		return 0
	fi

	local work_dir="$WORK_DIR/tree"
	local log_file="$work_dir/tree.log"

	local url="http://mama.indstate.edu/users/ice/tree/src/tree-1.8.0.tgz"
	local pkg="tree-1.8.0"

	mkdir $work_dir
	cd $work_dir

	RelocateFD $log_file
	
	echo "curl..."
	curl -LJO $url

	echo "tar..."
	tar -zxvf "$pkg.tgz"

	MoveToUserUsrDir "$work_dir/$pkg"
	cd "$USR_DIR/$pkg"

	echo "make..."
	make
	
	echo "install..."
	CpToUserBinDir "$USR_DIR/$pkg/tree"

	RelocateFD
	echo "OK: tree"
}


AutoJump()
{
	if type autojump > /dev/null 2>&1
	then
		echo "OK: autojump: Already Existed"
		return 0
	fi

	local work_dir="$WORK_DIR/autojump"
	local log_file="$work_dir/autojump.log"

	local url="git://github.com/wting/autojump.git"
	local pkg="autojump"

	mkdir $work_dir
	cd $work_dir

	RelocateFD $log_file
	
	echo "git clone..."
	git clone $url

	MoveToUserUsrDir "$work_dir/$pkg"
	cd "$USR_DIR/$pkg"

	echo "install..."
	./install.py
	

	WriteToBashrc "[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh"
	RelocateFD
	echo "OK: autojump"
}


Fzf()
{
	if type fzf > /dev/null 2>&1
	then
		echo "OK: fzf: Already Existed"
		return 0
	fi

	local work_dir="$WORK_DIR/fzf"
	local log_file="$work_dir/fzf.log"

	local url="https://github.com/junegunn/fzf.git"
	local pkg="fzf"

	mkdir $work_dir
	cd $work_dir

	RelocateFD $log_file
	
	echo "git clone..."
	git clone --depth 1 $url

	MoveToUserUsrDir "$work_dir/$pkg"
	cd "$USR_DIR/$pkg"

	echo "install..."
	./install --all
	
	RelocateFD
	echo "OK: fzf"
}


Lemonade()
{
	if type lemonade > /dev/null 2>&1
	then
		echo "OK: lemonade: Already Existed"
		return 0
	fi

	local work_dir="$WORK_DIR/lemonade"
	local log_file="$work_dir/lemonade.log"
	local lemo_config_file="$CONFIG_DIR/lemonade.toml"

	local url="https://github.com/hanxi/lemonade/releases/download/v2.0.0-pre/lemonade_linux_amd64.tar.gz"

	mkdir $work_dir
	cd $work_dir

	RelocateFD $log_file

	echo "download..."
	curl -LJO $url
	tar -zxvf "lemonade_linux_amd64.tar.gz"

	echo "install..."
	MoveToUserUsrDir "$work_dir/lemonade"
	CpToUserBinDir "$USR_DIR/lemonade"

	echo "config..."
	touch $lemo_config_file
	# 直接用脚本当前的
	local config_content="
port = 10024
host = '$(GetSSHIP)'
line-ending = 'if'
"
	echo -e  "$config_content" > $lemo_config_file

	RelocateFD
	echo "OK: lemonade"
}


Nvim()
{
	if type nvim > /dev/null 2>&1
	then
		echo "OK: nvim: Already Existed"
		return 0
	fi

	local work_dir="$WORK_DIR/nvim"
	local log_file="$work_dir/nvim.log"

	local url="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz"
	local pkg="nvim-linux64"

	mkdir $work_dir
	cd $work_dir

	RelocateFD $log_file

	echo "download..."
	curl -LJO $url
	tar -zxvf "$pkg.tar.gz"

	echo "install..."
	MoveToUserUsrDir "$work_dir/$pkg"
	CpToUserBinDir "$USR_DIR/$pkg/bin/nvim"

	echo "alias..."
	WriteToBashrc "alias v=\"nvim\""

	echo "install dependency: python3 pkg pynvim..."
	python3.7 -m pip install --user --upgrade pynvim

	RelocateFD
	echo "OK: nvim"
}


VimPlug()
{
	if [ -e $CONFIG_DIR/nvim/init.vim ]
	then
		echo "OK: vim-plug: Already Existed"
		return 0
	fi

	local work_dir="$WORK_DIR/nvim_config"
	local log_file="$work_dir/nvim_config.log"

	local nvim_config_dir="$CONFIG_DIR/nvim"

	mkdir $work_dir
	cd $work_dir

	RelocateFD $log_file

	if [ ! -d $nvim_config_dir ]
	then
		echo "mkdir $nvim_config_dir..."
		mkdir $nvim_config_dir
	fi

	echo "download and install plug manger..."
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	echo "download and install init.vim..."
	curl -LJO "https://raw.githubusercontent.com/RsrnlWysxr/PrivateSettings/main/nvim/init.vim"
	curl -LJO "https://raw.githubusercontent.com/RsrnlWysxr/PrivateSettings/main/nvim/coc-settings.json"
	curl -LJO "https://raw.githubusercontent.com/RsrnlWysxr/PrivateSettings/main/nvim/vimrc.local"
	cp "init.vim" "$nvim_config_dir/"
	cp "coc-settings.json" "$nvim_config_dir/"
	cp "vimrc.local" "$nvim_config_dir/"

	echo "download and install dependency pkg: node ..."
	curl -LJO "install-node.now.sh/lts"
	local pkg="node"
	local node_dir="$work_dir/$pkg"
	mkdir $node_dir

	sh lts -y -P $node_dir
	MoveToUserUsrDir "$node_dir"
	CpToUserBinDir "$USR_DIR/$pkg/bin/node"
	CpToUserBinDir "$USR_DIR/$pkg/bin/npm"

	RelocateFD
	echo "OK: vim-plug"
}


Tmux()
{
	if type tmux > /dev/null 2>&1
	then
		echo "OK: tmux: Already Existed"
		return 0
	fi

	local work_dir="$WORK_DIR/tmux"
	local log_file="$work_dir/tmux.log"

	local url="https://github.com/tmux/tmux.git"
	local pkg="tmux"

	mkdir $work_dir
	cd $work_dir

	RelocateFD $log_file

	echo "download..."
	git clone $url

	echo "make..."
	MoveToUserUsrDir "$work_dir/$pkg"
	cd $USR_DIR/$pkg
	sh autogen.sh
	./configure && make

	echo "install..."
	CpToUserBinDir "$USR_DIR/$pkg/tmux"

	RelocateFD
	echo "OK: tmux"
}

TmuxPlug()
{
	if [ -e $HOME_DIR/.tmux.conf ]
	then
		echo "OK: vim-plug: Already Existed"
		return 0
	fi

	local work_dir="$WORK_DIR/tmux_config"
	local log_file="$work_dir/tmux_config.log"

	local url="https://github.com/tmux-plugins/tpm"
	local install_dir="$HOME_DIR/.tmux/plugins/tpm"

	mkdir $work_dir
	cd $work_dir

	RelocateFD $log_file

	echo "download and install tmux plugin manager..."
	git clone $url $install_dir

	echo "download and install .tmux.conf..."
	curl -LJO "https://raw.githubusercontent.com/RsrnlWysxr/PrivateSettings/main/tmux.conf"
	cp "tmux.conf" "$HOME_DIR/.tmux.conf"

	RelocateFD
	echo "OK: tmux-plug"
}

Tags()
{
	if [ -e $BIN_DIR/ctags ] && [ -e $BIN_DIR/gtags ]
	then
		echo "OK: tags: Already Existed"
		return 0
	fi
	
	local work_dir="$WORK_DIR/ctags"
	local log_file="$work_dir/ctags.log"

	local url="https://github.com/universal-ctags/ctags.git"
	local pkg="ctags"

	mkdir $work_dir
	cd $work_dir

	RelocateFD $log_file

	echo "ctags download..."
	git clone $url 
	MoveToUserUsrDir "$work_dir/$pkg"

	echo "ctags make..."
	cd $USR_DIR/$pkg
	./autogen.sh
	./configure --prefix $HOME_DIR
	make

	echo "ctags install..."
	make install

	RelocateFD
	echo "OK: tags"

	
	local work_dir="$WORK_DIR/gtags"
	local log_file="$work_dir/gtags.log"

	local url="http://tamacom.com/global/global-6.6.3.tar.gz"
	local pkg="global-6.6.3"

	mkdir $work_dir
	cd $work_dir

	RelocateFD $log_file

	echo "gtags download..."
	curl -LJO $url
	tar -zxvf "$pkg.tar.gz"
	MoveToUserUsrDir "$work_dir/$pkg"

	echo "gtags make..."
	cd $USR_DIR/$pkg
	./configure --prefix $HOME_DIR --with-universal-ctags=$BIN_DIR/ctags
	make

	echo "gtags install..."
	make install

	echo "config..."
	local config_content="
export GTAGSCONF=$HOME_DIR/share/gtags/gtags.conf"
	WriteToBashrc "$config_content"

	RelocateFD
	echo "OK: gtags"
}




InitRunEnv $*
CheckSysEnv
InitUserEnv
ExportEnvConstVariable
ExtendRawFunction


( Tree ) &

( Fzf ) &

( AutoJump ) &

( Lemonade ) &

( Nvim ) &

( VimPlug ) &

( Tmux ) &

( TmuxPlug )&

( Tags )&

wait

echo "ALL DONE: Plz Source ~/.bashrc"
