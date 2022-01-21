FROM openjdk:8-jdk-alpine
FROM ubuntu

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# указываем точку монтирования для внешних данных внутри контейнера (как мы помним, это Линукс)
VOLUME /tmp

# внешний порт, по которому наше приложение будет доступно извне
EXPOSE 8080

#Install git
RUN apt-get update        
RUN apt-get install -y git

RUN cd /tmp/

#Clone
RUN git clone https://github.com/AlexKuzmiankou/conver.git

RUN find /conver/ -type d -exec chmod 777 {} \;

RUN cd conver

#Install Maven
RUN apt-get install -y maven

#Set working directory
WORKDIR /conver/

#Собираем билд через Maven
RUN mvn clean install

