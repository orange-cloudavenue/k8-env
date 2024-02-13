# k8-env

A Kubernetes mutating webhook server that implements environnement variable injection.

## How to use

### Prerequisites

- A Kubernetes cluster with the `admissionregistration.k8s.io/v1beta1` API enabled.
Verify that by the following command :

```bash
kubectl api-versions | grep admissionregistration.k8s.io
```
