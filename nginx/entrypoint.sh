#!/bin/bash

set -eo pipefail


GITBIN=`which git`
WORKSPACE=/etc/conf
export ETCD_PORT=${ETCD_PORT:-4001}
export HOST_IP=${HOST_IP:-172.17.42.1}

if [ -z "$ETCD_ENDPOINT"]; then
  export ETCD_ENDPOINT=$HOST_IP:$ETCD_PORT
fi

check_git () {


  if [ ! -z "$GIT_REPO_KEY" ] && [ -n "$GIT_REPO_KEY" ]; then
    echo "Setting git admin"
    git config --global alias.admin \!"/usr/bin/git-as.sh $GIT_REPO_KEY"
  fi

  if [ ! -d "$WORKSPACE/.git" ]; then
    rm -r $WORKSPACE/*.*
    cd $WORKSPACE
    echo "# Cloning source: $GIT_REPO"
    $GITBIN clone $GIT_REPO .

    if [ -z "$GIT_REPO_BRANCH" ]; then
      echo "# Changing branch: $GIT_REPO_BRANCH"
      cd $WORKSPACE
      git checkout $GIT_REPO_BRANCH
    fi

  else
    echo "# Updating source: $GIT_REPO"
    cd $WORKSPACE
    $GITBIN pull
  fi
}


echo "[nginx] booting container. ETCD: $ETCD."


if [ ! -z "$GIT_REPO" ]; then
  check_git
fi

# Put a continual polling `confd` process into the background to watch
# for changes every 10 seconds
confd -interval 10 -backend etcd -node $ETCD_ENDPOINT &
echo "[nginx] confd is now monitoring etcd for changes..."

# Start the Nginx service using the generated config
echo "[nginx] starting nginx service..."
service nginx start

# Follow the logs to allow the script to continue running
tail -f /var/log/nginx/*.log