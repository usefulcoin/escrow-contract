#! /bin/bash
#
# script name: setup.bash
# script author: munair simpson
# script created: 20210802
# script purpose: spin up node/express for REACT development

# disable/enable debugging.
debug="false" && echo [$0] set debug mode to "$debug".

# step 1: update the package list and install Yarn. this also installs Node. install unzip and install NPM last.
if $debug ; then sudo apt -y update && sudo apt -y install unzip && sudo apt -y install npm && sudo apt -y install vim && sudo apt -y install awscli; fi
sudo apt -y update > /dev/null 2>&1 && echo [$0] updated APT packages.
sudo apt -y install unzip > /dev/null 2>&1 && echo [$0] installed unzip APT.
sudo apt -y install npm > /dev/null 2>&1 && echo [$0] installed NPM APT.
sudo apt -y install vim > /dev/null 2>&1 && echo [$0] installed vim APT.
sudo apt -y install awscli > /dev/null 2>&1 && echo [$0] installed awscli APT.

# step 2: install Yarn version 12.
if $debug ; then sudo npm install --global yarn; fi
sudo npm install --global yarn > /dev/null 2>&1 && echo [$0] installed Yarn.
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.profile
nvm install 12
nvm use 12

# step 3: verify the installation of APTs and configure AWS Client.
nodeversion=$(nodejs --version) && echo [$0] verified the installation of nodejs version $nodeversion.
npmversion=$(npm --version) && echo [$0] verified the installation of npm version $npmversion.
yarnversion=$(yarn --version) && echo [$0] verified the installation of yarn version $yarnversion.
awsversion=$(aws --version) && echo [$0] verified the installation of aws version $awsversion.
aws configure

# step 4: yarn up.
# if $debug ; then sudo yarn && yarn start ; fi
# sudo yarn install > /dev/null 2>&1 && echo [$0] yarned up.
#
# or
#
# npm install react-router-dom [if required]
# npm start [to compile and host locally]
# npm run build && aws s3 sync build/ s3://staging-usefulcoin-com [to build and host on aws]
