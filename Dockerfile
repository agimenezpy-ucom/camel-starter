FROM jbangdev/jbang:latest
WORKDIR /app

COPY routes /app/routes

RUN jbang app install camel@apache/camel

EXPOSE 8080
ENTRYPOINT ["camel", "run", "routes/*.yaml"]