# This image should be used to:
#   - Run a microservice from a crawlis github release
#   - Run it in release mode

### BUILDER
### Debian-based image for openssl compilation
FROM alpine as builder
ARG MODULE_NAME
ARG MODULE_TAG
ARG MODULE_TARGET
# Building the module
RUN cd /tmp && \
    wget https://github.com/crawlis/${MODULE_NAME}/releases/download/${MODULE_TAG}/${MODULE_NAME}-${MODULE_TAG}-${MODULE_TARGET} && \
    cp /tmp/${MODULE_NAME}-${MODULE_TAG}-${MODULE_TARGET} /tmp/app && \
    chmod +x /tmp/app

### CERTIFICATOR
### Used to get SSL certificates
FROM ekidd/rust-musl-builder as certificator

### SCRATCH
### Empty image to execute binary
FROM scratch
COPY --from=builder /tmp/app /
COPY --from=certificator /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_DIR=/etc/ssl/certs
CMD [ "/app" ]