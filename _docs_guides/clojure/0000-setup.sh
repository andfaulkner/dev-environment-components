####################################  JAVA 8  ####################################
# Get and install java 8, install through the cli
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer  

# verify java version
java -version
				# -> should output java version "1.8.0_66" [where 66 is the current patch number]

# Install sane defaults for Java environment variables
sudo apt-get install oracle-java8-set-default

# SEE http://tecadmin.net/install-oracle-java-8-jdk-8-ubuntu-via-ppa/#

############################## FASTER LAUNCH TIMES  ##############################
# Faster clojure launch times - permanently running vm handles it
apt-get install nailgun
java -server -jar /usr/share/java/nailgun.jar& 		# run nailgun server
ng-nailgun ng-cp /usr/share/java/clojure-1.4.jar 	# add clj to classpath

# drip
cd ~/bin
git clone https://github.com/flatland/drip.git
cd drip
git checkout 0.2.4
make prefix=~/bin install
# add this to your .bashrc (or .bash_profile) file:
PATH="$PATH:~/bin/drip/bin"

### MAC ###
brew install drip

