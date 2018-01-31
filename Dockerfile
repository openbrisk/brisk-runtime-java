# Build stage
FROM openjdk:10-jdk AS builder

WORKDIR /src

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy pom.xml first to cache maven dependencies.
COPY pom.xml .
RUN mvn install && mvn package

# Copy the rest and build.
COPY src/ .
RUN mvn compile

# Deploy stage
FROM openjdk:10-jre

