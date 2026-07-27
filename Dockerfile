# المرحلة الأولى: ترجمة ملفات الجافا
FROM openjdk:11-jdk-slim AS builder
WORKDIR /app
COPY . .
RUN mkdir -p src/main/webapp/WEB-INF/classes
RUN javac -d src/main/webapp/WEB-INF/classes src/main/java/*.java

# المرحلة الثانية: تشغيل خادم تومكات ونقل ملفات الويب إليه
FROM tomcat:9.0-jdk11-openjdk
WORKDIR /usr/local/tomcat/webapps/ROOT
COPY --from=builder /app/src/main/webapp/ ./
EXPOSE 8080
CMD ["catalina.sh", "run"]
