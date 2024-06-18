## Custom Actions Runner for Self-Hosted ARC Deployments

This repository contains a Dockerfile for a custom GitHub Actions runner image designed for self-hosted deployments of ARC (GitHub Actions Runner Configuration). It is currently used internally at Clyent Softwares Ltd.

### Image Availability

The pre-built image is available on GitHub Container registry at:

```
ghcr.io/clyentsoftwares/custom-actions-runner:latest
```

### Using the Image

To use this image in your self-hosted ARC deployment, you can reference it in your `values.yaml` configuration file:

```yaml
spec:
  containers:
    - name: runner
      image: ghcr.io/clyentsoftwares/custom-actions-runner:latest
      command: ["/home/runner/run.sh"]
```

**Note:** Replace `[YOUR_CUSTOM_LABELS]` with any labels you want to assign to the runner.

### Built-in Tools and Packages

This image is based on Ubuntu 22.04 and includes several useful CLI tools and packages to enhance your workflow capabilities. A complete list of included packages is not provided here, but some notable examples include:

* Git clients
* Common build tools
* Cloud provider tools (AWS CLI, etc.)

**Please note:** The exact set of tools and packages may be subject to change in future updates.

### Contributing

We currently do not accept external contributions to this image.

### License

This project is licensed under the terms of the [MIT License](https://opensource.org/licenses/MIT).
