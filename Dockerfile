FROM debian:jessie

ENV JAVA_UPDATE_NUMBER 40
ENV JAVA_BUILD_NUMBER 25

ENV JAVA_VERSION 1.8.0_$JAVA_UPDATE_NUMBER

RUN apt-get update && \
    apt-get install -y tar curl && \
    (curl -skLb "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u$JAVA_UPDATE_NUMBER-b$JAVA_BUILD_NUMBER/jdk-8u$JAVA_UPDATE_NUMBER-linux-x64.tar.gz  | tar xfz -) && \
	mv /jdk$JAVA_VERSION/jre /jre$JAVA_VERSION && \
	mv /jdk$JAVA_VERSION/lib/tools.jar /jre$JAVA_VERSION/lib/ext && \
	rm -Rf /jdk$JAVA_VERSION

ENV JAVA_HOME /jre$JAVA_VERSION
ENV PATH $PATH:$JAVA_HOME/bin

