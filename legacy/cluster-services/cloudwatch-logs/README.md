# CloudWatch Log Forwarder

```
ln -s /path/to/cloudwatch-logs/secrets.yaml secrets.yaml

helm install --name cloudwatch-log-forwarder --namespace kube-system -f values.yaml -f secrets.yaml incubator/fluentd-cloudwatch
```

```
helm upgrade cloudwatch-log-forwarder incubator/fluentd-cloudwatch -f values.yaml -f secrets.yaml
```

```
helm delete cloudwatch-log-forwarder --purge
```
