# k8-env

A Kubernetes mutating webhook server that implements environnement variable injection.

## Prerequisites

A Kubernetes cluster (v1.19+) with the `admissionregistration.k8s.io/v1beta1` API enabled.
Verify that by the following command :

```bash
kubectl api-versions | grep admissionregistration.k8s.io
```

## How to use

### 1. Create a `namespace`

Create a `namespace` with the label `env-injection: true` :

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: my-namespace
  labels:
    env-injection: true
```

### 2. Create kustomization configuration

Change the `namespace` or create a `k8-env` namespace and create a `kustomization.yaml` file :

```bash
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: k8-env
resources:
  - https://raw.githubusercontent.com/orange-cloudavenue/k8-env/v0.1.0/manifests/manifests.yaml

images:
- name: k8-env
  newName: ghcr.io/orange-cloudavenue/k8-env
  newTag: v0.1.0

configMapGenerator:
  - name: k8-env
    behavior: replace
    files:
      - envconfig.yaml

```

### 3. Create a `envconfig.yaml` file

Create a `envconfig.yaml` with the environment variables to inject :

```yaml
env:
  - name: ENV_VAR_1
    value: "value1"
  - name: ENV_VAR_2
    value: "value2"
```
