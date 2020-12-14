---
title: Useful commands
created: '2020-10-09T14:28:07.914Z'
modified: '2020-11-30T07:53:05.282Z'
---

# Useful commands

## Google Cloud query logs

```
resource.type="k8s_container" resource.labels.namespace_name="wms-backend" resource.labels.container_name="main"  textPayload!~"[0-9]+ms"
```

## Kiali URL
https://telemetry.sandbox.paack.app:15029/kiali/

```
kubectl get secrets kiali -o yaml -n istio-system | ksd
```

## Download video from Youtube

```
youtube-dl -o '%(title)s.%(ext)s' -f best <video URL>
```

## Holidays

https://www.adpnet.esp.adp.com/login
