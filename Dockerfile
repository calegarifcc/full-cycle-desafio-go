FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY . .

RUN go mod init fullcycle

RUN go build -o fullcycle

FROM scratch

COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]