if hash apt-get 2>/dev/null; then
    MANAGER="apt-get"
elif hash dnf 2>/dev/null; then
    MANAGER="dnf"
elif hash yum 2>/dev/null; then
    MANAGER="yum"
else
    echo "No package manager found. Aborting."
    exit 1
fi
sudo $MANAGER update
sudo $MANAGER -y install screen vim git golang jq python3

mkdir temp
cd temp

if ! hash python3 2>/dev/null; then
    wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tar.xz
    tar -xvf Python-3.4.3.tar.xz

    cd Python-3.4.3
    ./configure && make && sudo make install
    cd ..
fi

if ! hash jq 2>/dev/null; then
    wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-1.5.tar.gz
    tar -xzvf jq-1.5.tar.gz

    cd jq-1.5
    ./configure && make && sudo make install
    cd ..
fi

if hash startx 2>/dev/null; then
    sudo $MANAGER install -y gvim gnome-tweak-tool

    if ! hash skype 2>/dev/null; then
        sudo $MANAGER install -y http://download.skype.com/linux/skype-4.3.0.37-fedora.i586.rpm
    fi

    if ! hash subl 2>/dev/null; then
        wget 'https://gist.githubusercontent.com/simonewebdesign/8507139/raw/bb380e1fb290f75458ec8aa8ec8ba2e1f259d81f/install_sublime_text.sh'
        chmod +x install_sublime_text.sh
        sudo ./install_sublime_text.sh
    fi

    if ! hash flash-player-properties  2>/dev/null; then
        sudo $MANAGER -y install http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
        sudo $MANAGER -y install flash-plugin
    fi
fi

cd ..
sudo rm -rf ./temp

sudo pip3 install --upgrade pip
sudo pip3 install requests pyparsing flask
