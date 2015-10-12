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
sudo $MANAGER -y install screen vim git golang

if ! hash python3 2>/dev/null; then
    wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tar.xz
    tar -xvf Python-3.4.3.tar.xz

    cd Python-3.4.3
    ./configure && make && sudo make install
    cd ..

    rm Python-3.4.3.tar.xz 
    # Requires sudo because "sudo make install" created some root-owned files.
    sudo rm -r Python-3.4.3
fi

if ! hash jq 2>/dev/null; then
    wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-1.5.tar.gz
    tar -xzvf jq-1.5.tar.gz

    cd jq-1.5
    ./configure && make && sudo make install
    cd ..

    rm jq-1.5.tar.gz
    rm -r jq-1.5
fi

sudo pip3 install --upgrade pip
sudo pip3 install requests pyparsing flask