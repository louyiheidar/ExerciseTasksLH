FROM ubuntu:14.04

#Always update your running system
RUN sudo apt-get update -y

#You may or may not need to run these commands
RUN sudo apt-get install -y wget
RUN sudo apt-get install -y tar

#Installs the libraries needed to run the GUI
RUN sudo apt-get install -y libgtk2.0
RUN sudo apt-get install -y mesa-utils
RUN sudo apt-get install -y libXtst6

#RUN sudo apt-get install -y openjdk-7-jre
#RUN java -version

#NOW install the Java Compiler
#RUN sudo apt-get install -y openjdk-7-jdk
#RUN javac -version
#Add java from file and install
WORKDIR /opt

ADD files /opt

RUN sudo tar zxvf /opt/java.tar.gz

RUN sudo update-alternatives --install /usr/bin/java java /opt/jdk1.8.0_74/bin/java 100
RUN sudo update-alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_74/bin/javac 100

new line of text added
