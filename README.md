# Camel Only Starter - YAML DSL Examples

This starter project demonstrates Apache Camel's YAML DSL without any external broker dependencies. It's a perfect entry point for learning Camel routing with simple, self-contained examples.

## Examples Included

### 1. Hello World Timer (`01-hello-world.camel.yaml`)
- **Pattern**: Timer → Log
- **Description**: A simple route triggered every 5 seconds that logs a constant message
- **Learning**: Basic route structure, timer component, and logging

### 2. Content-Based Router (`02-content-based-router.camel.yaml`)
- **Pattern**: Content-Based Router (CBR)
- **Description**: Routes messages to different paths based on random numeric values
- **Learning**: Choice/when/otherwise predicates, dynamic routing

### 3. Transform and Marshal (`03-transform-marshal.camel.yaml`)
- **Pattern**: Transformation + Message Marshalling
- **Description**: Builds a JSON object with timestamp, marshals to JSON, then unmarshals back
- **Learning**: Data transformation, JSON marshalling/unmarshalling (Jackson), Groovy expressions

### 4. REST Request-Reply (`04-rest-request-reply.camel.yaml`)
- **Pattern**: REST DSL
- **Description**: Exposes HTTP GET and POST endpoints via Camel's REST API
- **Learning**: REST configuration, platform-http component, request/response handling
- **Access**: `curl http://localhost:8080/hello` or `curl -X POST http://localhost:8080/hello -d "test"`

## Requirements

- Docker & Docker Compose (for containerized execution)
- OR JBang + Java 21+ (for local execution)

## Running with Docker

Build and run all examples together:

```bash
docker compose up --build
```

Logs will show all routes executing. To test the REST endpoint:

```bash
# In another terminal
curl http://localhost:8080/hello
```

To stop:

```bash
docker compose down
```

## Running with JBang (Local)

First, install JBang and the Camel app:

```bash
# Download JBang (https://jbang.dev/)
jbang app install camel@apache/camel
```

Then run all routes in development mode (auto-reload on file changes):

```bash
camel run routes/*.yaml --dev
```

Or run a specific route:

```bash
camel run routes/01-hello-world.camel.yaml
```

### JBang Development Mode Benefits

- Auto-restart when YAML files change
- Live reloading of routes
- Console output directly in terminal
- Faster iteration cycle for learning

## Project Structure

```
camel-starter/
├── routes/                      # YAML route definitions
│   ├── 01-hello-world.camel.yaml
│   ├── 02-content-based-router.camel.yaml
│   ├── 03-transform-marshal.camel.yaml
│   └── 04-rest-request-reply.camel.yaml
├── Dockerfile                   # JBang-based container
├── compose.yaml                 # Docker Compose config
└── README.md                    # This file
```

## YAML DSL Conventions

Each route file follows the Camel YAML DSL structure:
- `route:` defines a single route with an `id` and description
- `from:` specifies the source endpoint (timer, rest, etc.)
- `steps:` contains an array of route actions (log, choice, transform, etc.)

For more information on YAML DSL, see:
- [Apache Camel YAML DSL Documentation](https://camel.apache.org/components/next/eips/enterprise-integration-patterns.html)
- Parent course repo: `docs/camel/ejemplos-yaml.md`

## Troubleshooting

### Container won't start
Ensure port 8080 is available. If in use, modify `compose.yaml`:
```yaml
ports:
  - "8081:8080"  # Host port:Container port
```

### JBang command not found
Ensure JBang is installed and in your PATH:
```bash
jbang --version
```

### REST endpoint returns 404
Check that the `camel` service is running and logs show "REST API started".

## Next Steps

- Modify these examples to experiment with different patterns
- Add new routes by creating `05-example.camel.yaml`
- Progress to the `camel-artemis-starter` for broker integration
