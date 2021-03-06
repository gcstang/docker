FROM debian:7
MAINTAINER sebastian.stenzel@cryptomator.org

ENV LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_COLLATE=C \
	LC_CTYPE=en_US.UTF-8 \
	JDK_FULL_VERSION="jdk1.8.0_102" \
	JAVA_HOME="/usr/lib/jvm/jdk1.8.0_102" \
	JDK_DOWNLOAD_URL="http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-i586.tar.gz" \
	JCE_POLICY_URL="http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" \
	ANT_HOME="/usr/local/ant" \
	ANT_DOWNLOAD_URL="http://mirrors.ae-online.de/apache/ant/binaries/apache-ant-1.9.7-bin.tar.gz"

# Install Build Dependencies
RUN dpkg --add-architecture i386 && apt-get update \
	&& apt-get -y --no-install-recommends install curl unzip ca-certificates fakeroot libc6:i386 libstdc++6:i386 \
	&& apt-get clean
RUN cd /tmp \
	&& curl -L --cookie 'oraclelicense=accept-securebackup-cookie;' ${JDK_DOWNLOAD_URL} -o jdk.tar.gz \
	&& mkdir -p `dirname ${JAVA_HOME}` \
	&& tar -xzf jdk.tar.gz -C `dirname ${JAVA_HOME}` \
	&& rm jdk.tar.gz
RUN cd /tmp \
	&& curl -L --cookie 'oraclelicense=accept-securebackup-cookie;' ${JCE_POLICY_URL} -o jce-policy.zip \
	&& unzip -j -o jce-policy.zip *.jar -d ${JAVA_HOME}/jre/lib/security \
	&& rm jce-policy.zip
RUN cd /tmp \
	&& curl -L ${ANT_DOWNLOAD_URL} -o ant.tar.gz \
	&& mkdir -p /usr/local/ant \
	&& tar -xzf ant.tar.gz \
	&& mv apache-ant-*/* ${ANT_HOME} \
	&& rm ant.tar.gz \
	&& ln -s ${ANT_HOME}/bin/ant /usr/local/bin/ant

CMD ant -version
