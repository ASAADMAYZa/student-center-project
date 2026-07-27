FROM eclipse-temurin:11-jdk AS builder
WORKDIR /app
COPY . .
RUN mkdir -p src/main/webapp/WEB-INF/classes
RUN find src/main/java -name "*.java" > sources.txt
RUN javac -d src/main/webapp/WEB-INF/classes @sources.txt

FROM tomcat:9.0-jdk11-openjdk
WORKDIR /usr/local/tomcat/webapps/ROOT
COPY --from=builder /app/src/main/webapp/ ./
EXPOSE 8080
CMD ["catalina.sh", "run"]
