FROM alpine as builder

ARG MODULE_NAME
ARG MODULE_TAG
ARG MODULE_TARGET=x86_64-unknown-linux-musl

# Building the module
RUN cd /tmp && \
    wget https://github.com/crawlis/${MODULE_NAME}/releases/download/${MODULE_TAG}/${MODULE_NAME}-${MODULE_TAG}-${MODULE_TARGET} && \
    cp /tmp/${MODULE_NAME}-${MODULE_TAG}-${MODULE_TARGET} /tmp/app && \
    chmod +x /tmp/app

FROM scratch
COPY --from=builder /tmp/app /
CMD [ "/app" ]