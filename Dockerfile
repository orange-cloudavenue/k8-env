FROM alpine

ENV GID 1000
ENV UID 1000

COPY --chown=${UID}:${GID} prestop.sh /usr/bin
COPY k8-env /usr/bin

ENTRYPOINT ["/usr/bin/golink"]