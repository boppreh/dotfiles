ls -a | grep ^\\.[^.] | grep -v git | xargs -I '{}' ln -s `pwd`/{} ~/{}
