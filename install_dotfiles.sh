find . -maxdepth 1 -name ".*" -not -type d | xargs -I '{}' ln -vsf `pwd`/{} ~/{}
