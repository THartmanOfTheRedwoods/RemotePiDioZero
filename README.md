# SSHFS Environment Setup

## Mount SRC Directory

```bash
sshfs viable@192.168.86.17:/home/viable/RemotePiDioZero /Users/trevorhartman/CR/Faculty_Notes/docs/code/RemotePiDioZero/src
```

## Mount Lib Directory
```bash
sshfs viable@192.168.86.17:/opt/diozero /Users/trevorhartman/CR/Faculty_Notes/docs/code/RemotePiDioZero/lib
```

## Mount Remote Script Directory

* These scripts execute your remote code by using the remote JVM
```bash
sshfs viable@192.168.86.17:/home/viable/remote_scripts /Users/trevorhartman/CR/Faculty_Notes/docs/code/RemotePiDioZero/remote_scripts
```

## Local Scripts

* These scripts execute your remote scripts via ssh and your IntelliJ Runtime Config

### Build your remote code
```bash
ssh viable@192.168.86.17 '/usr/bin/bash -s < /home/viable/remote_scripts/WS281xBuild.sh'
```

### Run your remote code
```bash
ssh viable@192.168.86.17 '/usr/bin/bash -s < /home/viable/remote_scripts/WS281xRun.sh'
```
