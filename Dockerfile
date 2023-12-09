FROM jenkins/agent:alpine-jdk11

RUN apt-get update && apt-get install -y python3.10 python3.9-dev