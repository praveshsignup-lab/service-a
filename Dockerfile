# Demo service uses the upstream prometheus-example-app as a stand-in for
# real Go code. A real team would build their binary here instead, e.g.:
#   FROM golang:1.22-alpine AS build
#   WORKDIR /src
#   COPY . .
#   RUN CGO_ENABLED=0 go build -o /out/service-a ./cmd/service-a
#   FROM gcr.io/distroless/static:nonroot
#   COPY --from=build /out/service-a /service-a
#   ENTRYPOINT ["/service-a"]
FROM quay.io/brancz/prometheus-example-app:v0.5.0
USER 65534
EXPOSE 8080
