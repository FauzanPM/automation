FROM golang:1.16-alpine AS builder
WORKDIR /app
RUN apk add --no-cache git
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -o app

FROM alpine:3.18
WORKDIR /app
RUN apk add --no-cache ca-certificates
# Copy binary dari builder
COPY --from=builder /app/app .
# Copy .env file ke dalam container
COPY --from=builder /app/.env .env
# Expose port
EXPOSE 8080
CMD ["./app"]
