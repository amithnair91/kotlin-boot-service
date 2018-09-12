FROM maven:3.5.4-jdk-10 as builder

COPY . /src
WORKDIR /src

#run tests
RUN mvn clean test
#build
RUN mvn package

FROM openjdk:10-jre-slim
EXPOSE 8080

COPY --from=builder /src/target/metadata-1.0.0-SNAPSHOT.jar /app/metadata.jar
WORKDIR /app
CMD java -jar metadata.jar







