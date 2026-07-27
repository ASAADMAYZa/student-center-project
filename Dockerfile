FROM tomcat:10.1-jdk17-openjdk
COPY *.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
