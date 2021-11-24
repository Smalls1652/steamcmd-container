# SteamCMD Container

Just a quick sample of `steamcmd` running in a container.

## Uses

- [RockyLinux 8](https://hub.docker.com/r/rockylinux/rockylinux)

## Building and running

I'm personally using `buildah` and `podman` instead of `docker`, so change what's different for you.

```bash
# Build the image
buildah bud -t steamcmd-container .

# Run an interactive prompt inside the container to play around.
podman run -it --name=steamcmd-container localhost/steamcmd-container:latest bash
```