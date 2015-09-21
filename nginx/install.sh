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
sudo $MANAGER install libpcre3 libpcre3-dev libssl-dev

wget http://nginx.org/download/nginx-1.9.4.tar.gz
tar -xzvf nginx-1.9.4.tar.gz

cd nginx-1.9.4
./configure --prefix="/etc/nginx" --conf-path="/etc/nginx/nginx.conf" --sbin-path="/usr/bin/" --with-http_ssl_module --with-http_spdy_module --with-ipv6 --with-http_gunzip_module --with-http_sub_module --with-http_mp4_module --with-http_gzip_static_module && make && sudo make install || exit 1
cd ..

rm nginx-1.9.4.tar.gz
rm -r nginx-1.9.4

sudo cp nginx.conf /etc/nginx/
sudo cp ssl.conf /etc/nginx/
sudo cp certs/* /etc/ssl/certs
sudo cp private/* /etc/ssl/private

sudo nginx
