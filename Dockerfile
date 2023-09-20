FROM maven:3.8.3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:17-jdk-alpine
COPY --from=build /target/api-gateway-0.0.1-SNAPSHOT.jar api-gateway.jar

EXPOSE 9000

ENTRYPOINT ["java","-jar","api-gateway.jar"]