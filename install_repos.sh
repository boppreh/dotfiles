TARGET=${1:-$HOME}
cd $TARGET
curl https://api.github.com/users/boppreh/repos?per_page=1000 | jq '.[] | .ssh_url' | xargs -I{} git clone {}
echo 'To clone private repos, enter your access token ( https://github.com/settings/tokens ): '
read ACCESS_TOKEN
curl "https://api.github.com/user/repos?type=private&access_token=$ACCESS_TOKEN" | jq '.[] | .ssh_url' | xargs -I{} git clone {}
