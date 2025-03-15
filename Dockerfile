FROM openjdk:17-jdk
EXPOSE 8080
ADD target/spring-docker-demo.jar spring-docker-demo.jar
CMD ["java","-jar","spring-docker-demo.jar"]