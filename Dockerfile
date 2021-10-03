FROM ros:latest
ADD ./scripts-docker-build /scripts-build
RUN /scripts-build/install-prerequisites.sh

