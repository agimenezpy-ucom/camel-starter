FROM eclipse-temurin:21-jdk

RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

RUN curl -L https://sh.jbang.dev | bash && \
    mv ~/.jbang/bin/* /usr/local/bin/

WORKDIR /app

COPY routes /app/routes

CMD ["camel", "run", "routes/*.yaml"]
