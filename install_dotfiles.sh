find . -maxdepth 1 -name ".*" -not -type d | xargs -I '{}' ln -v -s `pwd`/{} ~/{}
