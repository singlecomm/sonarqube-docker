FROM sonarqube:6.7.2

ENV SONAR_SCALA_VERSION 6.0.0
ENV SONAR_GITHUB_VERSION 1.4.2.1027

# Overwrite with our run.sh
ADD run.sh $SONARQUBE_HOME/bin/

# Install Plugins
WORKDIR /opt/sonarqube/extensions/plugins
RUN wget -O "sonar-scala-plugin-${SONAR_SCALA_VERSION}.jar" "https://dl.bintray.com/mwz/maven/com/github/mwz/sonar-scala_2.12/${SONAR_SCALA_VERSION}/sonar-scala_2.12-${SONAR_SCALA_VERSION}-assembly.jar"
RUN wget "http://central.maven.org/maven2/org/sonarsource/github/sonar-github-plugin/${SONAR_GITHUB_VERSION}/sonar-github-plugin-${SONAR_GITHUB_VERSION}.jar"

WORKDIR $SONARQUBE_HOME

ENTRYPOINT ["./bin/run.sh"]