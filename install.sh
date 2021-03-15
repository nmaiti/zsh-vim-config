#!/bin/bash

###################################################################
# Script Name : install.sh
#
# Description : zsh and vimrc installer
#
# Args :
#
# Creation Date : 02-01-2021
# Last Modified : 16-03-21 04:02:36S
#
# Created By : Nabendu
# Email : 1206581+nmaiti@users.noreply.github.com
####################################################################

if [ `uname` == 'Darwin' ]; then
    echo ' ******* Mac detected ******* '
    brew install ctags
else
    which apt-get 2>/dev/null
    is_debian=$?

    #  Wsl version need update in dns resolution file
    if [[ -n "$IS_WSL" || -n "$WSL_DISTRO_NAME" ]]; then
        echo "This is WSL modifying /etc/wsl.conf & /etc/resolv.conf"
        echo $'[network]\ngenerateResolvConf = false' > /etc/wsl.conf
        echo "nameserver 8.8.8.8" >> /etc/resolv.conf
    else
        echo "This is not WSL"
    fi

    if [ $is_debian == 0 ]; then
        echo ' ******* Debian/Ubuntu detected **********'
        sudo add-apt-repository ppa:jonathonf/vim
        sudo apt-get update
        sudo apt-get install exuberant-ctags cscope git zsh clang-format \
            fonts-powerline vim-gtk3 vim-nox -y

        UBUNTU_CODE=$(cat /etc/os-release | grep "UBUNTU_CODENAME" | cut -d'=' -f 2)

        if [ $UBUNTU_CODE == "focal" ]; then
            sudo apt install fzf ripgrep -y
        else
            git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
            ~/.fzf/install
            sudo apt install silversearcher-ag -y
        fi

    else
        echo ' ******* Redhat/Centos detected **********'
        sudo yum install -y ctags
    fi
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

if [[ -e ~/.zshrc ]]; then
    echo 'Backup zshrc to ~/.zshrc.bak'
    mv ~/.zshrc ~/.zshrc.bak
fi

# install zshrc
if [[ ! -d ~/.zshrc ]];then
    cp $(pwd)/zshrc_src ~/.zshrc
    sed -i "s/XYZZ/$USER/g" ~/.zshrc
    sudo chsh -s $(which zsh)
fi

if [[ -e ~/.vimrc ]]; then
    echo 'Backup vimrc to ~/.vimrc.bak'
    mv ~/.vimrc ~/.vimrc.bak
fi

if [[ -d ~/.vim ]]; then
    echo 'Backup vim to ~/.vim.bak'
    mv ~/.vim ~/.vim.bak
fi

if [[ ! -d ~/.vimrc ]];then
    cp $(pwd)/vimrc_src ~/.vimrc

    mkdir ~/.vim
    cp -rf $(pwd)/vim_src/headers ~/.vim/

#    ln -s $(pwd)/vimrc_src ~/.vimrc
#    ln -s $(pwd)/vim_src ~/.vim
echo '#########################'
echo 'install finished.'
echo 'If you want to install vim-go, Please install golang first,'
echo 'then running: go get -u github.com/jstemmer/gotags'
exit 0
else
    echo '~/vimrc does not exist'
    exit 0
fi
