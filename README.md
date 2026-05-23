# service-a

Demo Go HTTP service owned by **team-a**. This repo is the **source of truth
for application behavior**:

```
service-a/
├── src/                      # application code (placeholder — uses upstream image)
├── Dockerfile                # build artifact
├── chart/                    # Helm chart shipping the service
│   ├── Chart.yaml
│   ├── values.yaml           # defaults (image tag, resources, SLO)
│   └── templates/
│       ├── deployment.yaml
│       ├── service.yaml
│       ├── servicemonitor.yaml
│       └── prometheusservicelevel.yaml
└── .github/workflows/ci.yaml # build + push image, helm lint
```

## Separation of concerns

| Change | Where |
|---|---|
| New endpoint, bugfix, log line | **this repo** (PR → CI builds image → bumps `appVersion`) |
| More replicas in prod, change memory limit | **company-monorepo** `platform-gitops/services/service-a/prod/values.yaml` |
| New SLO objective (97% → 99%) | **company-monorepo** (operational target) |

ArgoCD multi-source Applications consume:
- the **chart** at `chart/` from this repo (tagged by `targetRevision`)
- the **values** at `platform-gitops/services/service-a/<env>/values.yaml` from the gitops repo

## Local dev

```sh
docker build -t service-a:dev .
helm template ./chart --values chart/values.yaml | less
helm lint ./chart
```
