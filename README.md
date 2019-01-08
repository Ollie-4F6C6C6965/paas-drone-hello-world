[![Build Status](https://cloud.drone.io/api/badges/Ollie-4F6C6C6965/paas-drone-hello-world/status.svg)](https://cloud.drone.io/Ollie-4F6C6C6965/paas-drone-hello-world)

# paas-drone-hello-world

This is a simple example project which deploys a static file app to Cloud Foundry (like [GOV.UK PaaS](https://www.cloud.service.gov.uk/)) using [drone](https://docs.drone.io).

The drone settings are set in the [.drone.yml](.drone.yml) file, secrets (such as the PaaS credentials) are encrypted against the key on the drone server (like [this](https://docs.drone.io/config/secrets/encrypted/)).

## How to run?

_This tutorial assumes you have [drone CLI installed](https://docs.drone.io/cli/install/), a drone server and Cloud Foundry / PaaS access._

1) Create a new Github repo or copy [.drone.yml](.drone.yml) to an existing one
2) Sync and activate the repo on drone
2) Ensure drone CLI is [set up](https://docs.drone.io/cli/setup/) by running `drone info` which should display your Github username
3) Run the following commands to encrypt the PaaS username and password (run `drone repo ls` to see the repo format)
```
drone encrypt REPO_USERNAME/REPO_NAME USERNAME
drone encrypt REPO_USERNAME/REPO_NAME PASSWORD
```
4) Edit [.drone.yml](.drone.yml), filling out the GPAAS_APP_NAME, GPAAS_ORG, GPAAS_SPACE, GPAAS_API and set the outputs from the above commands at the bottom:
```
---
kind: secret
data:
  gpaas_user: XnVoyW...
  gpaas_pass: 76cdd...
```
5) Push/commit the repo
6) Check drone, hopefully the repo has successfully built and deployed!
