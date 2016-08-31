FROM webserver30-tomcat7-openshift

EXPOSE 8080 9001 9002

RUN yum install -y java-1.8.0-openjdk-headless
RUN mkdir /usr/verticles
RUN curl -L https://github.com/utherp0/oseTestWARs/game-service-1.0.0-SNAPSHOT-fat.jar -o /usr/verticles/game-service.jar
RUN chmod 770 /usr/verticles/game-service.jar

WORKDIR /usr/verticles

ENTRYPOINT["sh","-c"]

CMD["java -jar game-service.jar -cluster"]
