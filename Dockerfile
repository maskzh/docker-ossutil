FROM golang:alpine as build
ENV OSSUTIL_VERSION 1.7.1
WORKDIR /go/src/aliyun 
RUN apk add --no-cache curl git && \
    curl -Lo /go/src/aliyun/ossutil.zip https://github.com/aliyun/ossutil/archive/${OSSUTIL_VERSION}.zip && \
    unzip /go/src/aliyun/ossutil.zip && \
    cd ossutil-${OSSUTIL_VERSION} && \
    go mod init ossutil-${OSSUTIL_VERSION} && \
    go get && \
    go build && \
    cp ossutil-${OSSUTIL_VERSION} / 

FROM alpine as runner
ENV OSSUTIL_VERSION 1.7.1
COPY --from=build /ossutil-${OSSUTIL_VERSION} /usr/local/bin/ossutil
