# ld1.x

## Build on github CI and deployed to DockerHub

The build test CI will run for pull requests not for direct push to `main`.
The `latest` version of image on DockerHub is build and pushed from the `main` branch.
In order to create a new version of image, after pull request CI passed and merged, create a tag manually on GitHub.