FROM alpine/git as clone

WORKDIR /app
RUN git clone https://github.com/AlexKuzmiankou/conver.git

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone



FROM maven:3.5-jdk-8-alpine as build
EXPOSE 8080
WORKDIR /app
COPY --from=clone /app/conver /app
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/convertator-0.0.1-SNAPSHOT.jar /app/
CMD ["java", "-jar", "/app/convertator-0.0.1-SNAPSHOT.jar"]