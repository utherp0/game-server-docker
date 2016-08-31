FROM registry.access.redhat.com/rhel7.2

EXPOSE 8080 9001 9002

USER root
RUN yum install -y java-1.8.0-openjdk-headless && yum clean all
RUN mkdir /usr/verticles mkdir /usr/verticles/.vertx
ADD https://github.com/utherp0/oseTestWARs/blob/master/game-service-1.0.0-SNAPSHOT-fat.jar?raw=true /usr/verticles/game-service.jar
RUN chmod 770 /usr/verticles/game-service.jar
RUN chmod 777 /usr/verticles/.vertx

WORKDIR /usr/verticles

CMD ["java","-jar","game-service.jar","-cluster"]
