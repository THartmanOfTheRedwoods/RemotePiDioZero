# Environment Setup

* Only the .env files should need to be changed for MacOS and Linux environments to make this functional.

## Remote Scripts

* The remote build and run scripts should be put/moved on/to your raspberry pi in a remote_scripts directory.
* A src folder where you plan on putting your Java src code should also exist on your pi.
* DioZero, and all other 3rd party libraries, should be on your raspberry pi, typically put in the /opt directory.
* You should copy the .env.EXAMPLE file to .env and modify the variables in that file to suite your pi environment.
* Remote scripts will be called by IntelliJ and or the local scripts in your project.

## Local Scripts

* You should copy the .env.EXAMPLE file in the local_scripts directory to .env and modify the variables in that file to suite your pi environment.
* Use the **mount.sh** script to make sure your pi directories are mounted via **sshfuse** to your proper local directories.
* Use the **remote.sh** script to compile and run your remote build and run scripts.

## Manually Setting up Project Mounts

### Manually Mounting SRC Directory

```bash
sshfs pi@192.168.1.10:/home/pi/RemotePiDioZero /Users/local_user/RemotePiDioZero/src
```

### Manually Mounting Lib Directory
```bash
sshfs pi@192.168.1.10:/opt/diozero /Users/local_user/RemotePiDioZero/lib
```

### Manually Mounting Remote Script Directory

```bash
sshfs pi@192.168.1.10:/home/pi/remote_scripts /Users/local_user/RemotePiDioZero/remote_scripts
```
