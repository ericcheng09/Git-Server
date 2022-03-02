GIT_DIR="/srv/git/repos"
htpasswd -bc /srv/git/.htpasswd $REPO_USER $REPO_PASS
REPO_NAME=$REPO
PREFIX=$PREFIX
sed -i "1i Define PREFIX ${PREFIX}" /etc/apache2/sites-available/git-site.conf
mkdir -p "${GIT_DIR}/${REPO_NAME}.git"
cd "${GIT_DIR}/${REPO_NAME}.git"
git init --bare
git config http.receivepack true
git update-server-info
chown -Rf www-data:www-data "${GIT_DIR}/${REPO_NAME}.git"
echo "Git repository '${REPO_NAME}' created in ${GIT_DIR}/${REPO_NAME}.git"