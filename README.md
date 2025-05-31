# Fuzzy Invention

### What is this about?

Creating a custom model agnostic framework that enables teams to not care about which they use to create agents and use any kind of agents without the hassle of writing ton of code.

### What does this include?


### Technical Deep Dive


### How to use?

Don't & you can't





### Decision Making

##### 1. Why putting Dockerfile inside api/ is better decision than keeping it at root folder?

```
When "docker build ." is run, Docker wouls send the entire content of the directory to the Docker daemon. So it will have to process the entire codebase which would make the build context unncessarily large, meaning slower initial build times and more (useless) data transferred to Docker daemon.

When placing this in the api/ folder - the build context is only limited to the api/ directory. Inside of Dockerfile, we can write the command to COPY src/ so it only sends what is truly needed for the service.

This also enables enhanced layer caching - changes in one won't necessarily invalidate the cache for the other layers (Docker builds the image layer by layer)

Building the image from the root directory: 

docker build -t genai-api -f api_service/Dockerfile .
```

