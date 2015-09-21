ls -a | grep -P '^\.(?!git$)\w' | xargs -I '{}' ln -vs `realpath {}` `realpath ~/{}`
