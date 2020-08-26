---
title: JVM monitoring
category: Datadog
date: 2020-08-26
---

-----

* Enable jxm console for service:

```bash
-Dcom.sun.management.jmxremote -Djava.rmi.server.hostname=127.0.0.1 -Dcom.sun.management.jmxremote.port=9010 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false
```

* Add agent listener:

```bash
$ nano /etc/datadog-agent/conf.d/jmx.d/conf.yaml
 instances:
  - host: "127.0.0.1"
    port: "9010"

    name: "my-application"
    java_bin_path: "/usr/bin/java"
    java_options: "-Xmx200m -Xms50m"

    rmi_connection_timeout: 20
    rmi_client_timeout: 15000
```

-----

[Source flags](https://stackoverflow.com/a/856882)

[Source agent](https://docs.datadoghq.com/integrations/java/?tab=host)

-----
