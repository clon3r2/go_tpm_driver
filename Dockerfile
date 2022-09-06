FROM artifactory.runc.info/docker/golang:1.16 AS builder
WORKDIR /app
COPY . .
RUN go build


FROM artifactory.runc.info/docker/debian:10.8-slim
WORKDIR /app
COPY --from=builder /app/main .


CMD ["./main"]