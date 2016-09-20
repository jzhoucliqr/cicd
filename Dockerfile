FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ARG CONFIG_LABEL
ENV CONFIG_LABEL ${CONFIG_LABEL:-master}
ADD app.jar app.jar
RUN sh -c 'touch /app.jar'
EXPOSE 80
ENTRYPOINT ["java","-DCONFIG_SERVER_HOST=config-server","-Dspring.cloud.config.label=${CONFIG_LABEL}","-Dspring.profiles.active=docker","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
