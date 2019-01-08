[![Build Status](https://cloud.drone.io/api/badges/Ollie-4F6C6C6965/paas-drone-hello-world/status.svg)](https://cloud.drone.io/Ollie-4F6C6C6965/paas-drone-hello-world)

# paas-drone-hello-world

This is a simple example project which deploys a static file app to Cloud Foundry (like [GOV.UK PaaS](https://www.cloud.service.gov.uk/)) using [drone](https://docs.drone.io).

The drone settings are set in the [.drone.yml](.drone.yml) file, secrets (such as the PaaS credentials) are encrypted against the key on the drone server (like [this](https://docs.drone.io/config/secrets/encrypted/)).

## How to run?

_This tutorial assumes you have [drone CLI installed](https://docs.drone.io/cli/install/), a drone server and Cloud Foundry / PaaS access._

1) Clone this project into a new Github project
2) Edit [.drone.yml](.drone.yml), filling out the GPAAS_APP_NAME, GPAAS_ORG, GPAAS_SPACE, GPAAS_API
3) Clear gpaas_user and gpaas_pass so the yml file will end like: (_repo needs activating on drone first to be able to set the user and password encrypted variables_)
```
---
kind: secret
data:
  gpaas_user:
  gpaas_pass:
```
4) Push/commit the repo
5) Activate the repo on drone
6) Ensure drone CLI is [set up](https://docs.drone.io/cli/setup/) by running `drone info` which should display your Github username
7) Run the following commands to encrypt the PaaS username and password (run `drone repo ls` to see the repo format)
```
drone encrypt REPO_USERNAME/REPO_NAME USERNAME
drone encrypt REPO_USERNAME/REPO_NAME PASSWORD
```
8) Set the outputs in the [.drone.yml](.drone.yml) file, so it ends something like..
```
---
kind: secret
data:
  gpaas_user: XnVoyW...
  gpaas_pass: 76cdd...
```
9) Push/commit the repo
10) Check drone, hopefully the repo has successfully built and deployed!
