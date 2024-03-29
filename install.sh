#!/bin/bash

###################################################################
# Script Name : install.sh
#
# Description : zsh and vimrc installer.
#
# Args :
#
# Creation Date : 02-01-2021
# Last Modified : 18-06-23 12:12:25S
#
# Created By : Nabendu
# Email : 1206581+nmaiti@users.noreply.github.com
####################################################################
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN"
esac
echo ${machine}

if [ $machine == 'Mac' ]; then
    echo ' ******* Mac detected ******* '
    brew install ctags
elif [ $machine == 'MinGw' ]; then
    hash cscope 2>/dev/null && hash ctags 2>/dev/null && hash clang-format 2>/dev/null && hash fzf 2>/dev/null && hash bat 2>/dev/null && hash fzf 2>/dev/null && hash rg 2>/dev/null
    if [[ $? -ne 0 ]];then
        echo ' Binaries are missing (cscope, ctags, clang-format, bat, ripgrep, fzf)'
        echo ' Install Manually and start this script)'
        exit 0
    fi
elif [ $machine == 'Linux' ]; then
    which apt-get 2>/dev/null
    is_debian=$?

    #  Wsl version need update in dns resolution file
    if [[ -n "$IS_WSL" || -n "$WSL_DISTRO_NAME" ]]; then
        echo "This is WSL modifying /etc/wsl.conf & /etc/resolv.conf"
        echo '[network]\ngenerateResolvConf = false'| sudo tee -a /etc/wsl.conf
        echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
    else
        echo "This is not WSL"
    fi

    if [ $is_debian == 0 ]; then
        echo ' ******* Debian/Ubuntu detected **********'
        OS_NAME=$(cat /etc/os-release | grep "^NAME="| cut -d '=' -d '"' -f 2 )
        VERSION_ID=$(cat /etc/os-release | grep "VERSION_ID" | cut -d '=' -f 2|tr -d \. | bc)
        echo $VERSION_ID
        echo $OS_NAME
        if [[ $VERSION_ID == '"10.5"' ]]; then
            sudo apt install software-properties-common
        fi
        sudo apt-get update
        sudo apt-get install exuberant-ctags cscope git zsh clang-format \
            fonts-powerline  -y

        if [[ $OS_NAME == "Ubuntu" ]] || [[ $OS_NAME == "Debian" ]] ; then
            if [[ $VERSION_ID < $(echo "2204" | bc) ]] ; then
                git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
                ~/.fzf/install
                sudo add-apt-repository ppa:jonathonf/vim
                sudo apt-get update
                sudo apt install silversearcher-ag vim-gtk3 -y
            else
                sudo apt install fzf vim ripgrep bat -y
                ##  TODO change as per the architechture
            fi
        else
            echo ' ******* Redhat/Centos detected **********'
            sudo yum install -y ctags
            ##  TODO change as per the architechture
        fi
    fi
else

    echo "This is not Known Machine type"
fi

if [ $machine != 'UNKNOWN' ]; then


    if [ ! -d ~/.oh-my-zsh ]; then

        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

        echo "Oh my zsh Installed"
        if [[ -e ~/.zshrc ]]; then
            echo 'Backup zshrc to ~/.zshrc.bak'
            mv ~/.zshrc ~/.zshrc.bak
        fi

        # install zshrc
        if [[ ! -d ~/.zshrc ]];then
            cp $(pwd)/zshrc_src ~/.zshrc
            if [ $machine == 'MinGw' ]; then
                sed -i "s/\/home\/XYZZ/~/g" ~/.zshrc
            else
                sed -i "s/XYZZ/$USER/g" ~/.zshrc
            fi
            cat ~/.bashrc | grep "exec zsh" >/dev/null
            if [[ $? ]] ; then
                echo "exec zsh" >> ~/.bashrc
                #    sudo chsh -s $(which zsh)
            fi
        fi
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
       echo '~/vimrc still present'
       exit 0
    fi
fi
