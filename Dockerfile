# Build stage
FROM openjdk:10-jdk AS builder

WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy pom.xml first to cache maven dependencies.
COPY pom.xml .
RUN mvn initialize && mvn install

# Copy the rest and build.
COPY src/ ./src
RUN mvn install

# Deploy stage
FROM openjdk:10-jre

WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven 
COPY init.pom.xml pom.xml
RUN mvn initialize && mvn install

# Copy server jar.
COPY --from=builder /app/target/brisk-runtime-java-*-jar-with-dependencies.jar /app/runtime.jar
COPY startup.sh .

ENTRYPOINT [ "./startup.sh" ]
