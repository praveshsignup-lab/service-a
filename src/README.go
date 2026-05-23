package main
package main

// Placeholder — this repo intentionally vendors the `prometheus-example-app`
// upstream image (see Dockerfile). When the team has real code, drop it here
// and update the Dockerfile to a real multi-stage build.
//
// Required platform contract (see company-monorepo platform-gitops/observability/CONTRACT.md):
//   - Expose /metrics on the HTTP port
//   - Emit http_requests_total{code, method}
//   - Emit http_request_duration_seconds_bucket{code, method, le}
func main() {}
