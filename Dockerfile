from maven:3.8.4-jdk-8 as build

COPY src /app/src
COPY pom.xml /app

WORKDIR /app
RUN mvn clean install

FROM eclipse-temurin:8-jre-alpine

COPY --from=build /app/target/spring-boot-hello-world-1.0.2-SNAPSHOT.jar /app/app.jar

WORKDIR /APP 

EXPOSE 8080 

CMD ["java", "-jar", "app.jar"]