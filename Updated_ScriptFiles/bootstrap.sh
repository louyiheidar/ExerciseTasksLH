# 1) Copying the files from the shared directory

echo "Copying files from shared directory"
cd /temp/shared
sudo scp java.tar.gz /opt/
sudo scp maven.tar.gz /opt/
sudo scp jenkins_2.1_all.deb /home/vagrant/Desktop
sudo scp jira.bin /opt/
sudo scp response.varfile /opt/
cd /opt/

# 2) Installing Java and Maven
echo "Installing Java and Maven..."
sudo apt-get update
sudo tar zxvf java.tar.gz
sudo tar zxvf maven.tar.gz
sudo update-alternative --install /user/bin/java java /opt/jdk1.8.0_45/bin/java 100
sudo update-alternative --install /user/bin/javac javac /opt/jdk1.8.0_45/bin/java 100
sudo update-alternative -- install /user/bin/mvn mvn /opt/apache-maven-3.3.9/bin/mvn 100

# 3) Setting Environment vairables for Maven
sudo echo "export M2_HOME=/optapache-maven-3.3.9" >> /etc/profile
sudo echo "export M2=$M2_HOME/bin" >> /etc/profile
sudo echo "export PATH=$M2:PATH" >> /etc/profile
#refresh profile to activate environment vairable 
source /etc/profile

#4) Installing Git
echo "Installing Git..."
sudo apt-get install -y git

#5) Installing Jenkins
echo "Installing Jenkins..."
cd /home/vagrant/Desktop
sudo dpkg -i jenkins_2.1_all.deb
sudo apt-get install -y -f
sudo apt-get install -y jenkins
sudo service jenkins start

#6) Installing Jira
echo "Installing Jira"
cd /opt/
sudo chmod a+x jira.bin
sudo ./jira.bin -q -varfile response.varfile
