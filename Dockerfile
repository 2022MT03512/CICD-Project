FROM openjdk:8
ADD jarstaging/com/example/cicd-project/1.0.0/cicd-project-1.0.0.jar cicd-project.jar
ENTRYPOINT ["java", "-jar", "cicd-project.jar"]
