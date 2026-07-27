	FROM eclipse-temurin:21-jre-jammy
	ARG APP_VERSION
	ADD jarstaging/com/valaxy/demo-workshop/${APP_VERSION}/demo-workshop-${APP_VERSION}.jar demo-workshop.jar
	ENTRYPOINT ["java", "-jar", "demo-workshop.jar"]