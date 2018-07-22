# JupyterHub Docker

## Overview

JupyterHub Docker is a Docker image for JupyterHub.
A default authentication for JupyterHub Docker uses GitHub's OAuth.

## Build Docker Images

### Ubuntu 16.04 based Image

```
./bin/jupyter-docker build -t ubuntu16.04
```

### Machine Learning Image

```
./bin/jupyter-docker build -t machinelearning
```

### CUDA based Image

```
./bin/jupyter-docker build -t cuda9.0-cudnn7
```

### CUDA based Machine Learning Image

```
./bin/jupyter-docker build -t cuda-machinelearning
```

## Setup

### OAuth (GitHub)

Create a configuration file:

```
cp env/localhost env/`uname -n`
cat env/`uname -n`
CONTEXT_PATH=/
GITHUB_CLIENT_ID=<<GitHub Client ID>>
GITHUB_CLIENT_SECRET=<<GitHub Client Secret>>
OAUTH_CALLBACK_URL=http://localhost:8000/hub/oauth_callback
```

For GITHUB\_CLIENT\_ID and GITHUB\_CLIENT\_SECRET, see [Building OAuth Apps](https://developer.github.com/apps/building-oauth-apps/).

### Login Users

JupyterHub Docker uses acceptable users list, `res/userlist`.
You need to update userlist file.
The format is `<userid> <username> <mode>`.
userid is an user id in Docker container, username is GitHub account, and mode is admin or (empty).
For details, see `res/addusers.sh`.

## Operations

### Run Docker Container

```
./bin/jupyter-docker run -t <tag name>
```

Tag names are as below:

- ubuntu16.04
- cuda9.0-cudnn7
- cuda-machinelearning

URL for this Jupyterhub is `http://localhost:8000/`.

### Stop Docker Container

```
./bin/jupyter-docker stop -t <tag name>
```
