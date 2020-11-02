# Kubernetes Installer
Deploy [jpillora's](https://github.com/jpillora) [installer](https://github.com/jpillora/installer) on a Kubernetes cluster.

### Secret
To change the `USER` and `GH_TOKEN` for the servo, run the following in the command line and paste the results into `secret.yaml`
```bash
$ echo -n 'user' | base64
$ echo -n 'gh_token' | base64
```
### Ingress
Change the `nginx.ingress.kubernetes.io/whitelist-source-range` and `host` variables in the `ingress.yaml` file.
```yaml
...
    nginx.ingress.kubernetes.io/whitelist-source-range: 192.168.1.0/24
...
  - host: installer.192.168.1.202.nip.io
...
```
## Installation
### Automatic
```bash
$ chmod +x deploy.sh
$ ./deploy.sh
```

### Manual
```bash
$ kubectl apply -f manifests/namespace.yaml
$ kubectl apply -f manifests/secret.yaml
$ kubectl apply -f manifests/service.yaml
$ kubectl apply -f manifests/deployment.yaml
$ kubectl apply -f manifests/ingress.yaml
```

## Usage
### Running
Check that the pod is running correctly
```bash
$ kubectl get pods -n installer
NAME                           READY   STATUS    RESTARTS   AGE
installer-94bc9d45b-9lrxr      1/1     Running   0          94m
```
See the **Usage** section at [installer](https://github.com/jpillora/installer#usage).

### Ingress
```bash
$ kubectl get ingress -n transmission
NAME           CLASS    HOSTS                               ADDRESS         PORTS   AGE
installer   <none>   installer.192.168.1.202.nip.io   192.168.1.202   80      73m
```
Make sure the IP address in the `HOST` matches the one listed in `ADDRESS`

## Uninstallation
### Automatic
```bash
$ chmod +x delete.sh
$ ./delete.sh
```

### Manual
```bash
$ kubectl delete -f manifests/ingress.yaml
$ kubectl delete -f manifests/deployment.yaml
$ kubectl delete -f manifests/service.yaml
$ kubectl delete -f manifests/secret.yaml
$ kubectl delete -f manifests/namespace.yaml

```
If you are having trouble deleting the namespace, see [knsk](https://github.com/thyarles/knsk).
