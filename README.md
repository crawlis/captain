# Captain ⚓

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Build Status](https://travis-ci.com/crawlis/captain.svg?branch=master)](https://travis-ci.com/github/crawlis/captain)

Captain is a notorious sailor that will help you navigate your Crawlis containers across the deep-web sea !

## Usage

Captain is a Crawlis helper to manage Docker containers. It provides several Docker containers to build images from your local Rust code or from built modules on Github releases, in debug or release mode. It also provides scripts to easily run Crawlis modules using docker-compose and a Travis CI configuration to build and release images on DockerHub.

## Running Crawlis with Captain

You need to copy the `default.config` file into a `.config` file:

```
cp default.config .config
```

You can set your own configuration in this file.
Now you're ready to use Crawlis:

```
./run.sh
```

## Releasing Crawlis Docker images to DockerHub

Captain also gives you the ability to build Docker images for Crawlis modules and to release them to DockerHub. Simply follow those steps:

- Choose your favorite module (e.g CRAWLER)
- Create a new tag for this module and wait for Travis CI to complete
- Open `.travis.yml` file, go to `env.global` variables and set your module env variable (e.g CRAWLER_TAG) to your new tag id
- Commit your changes and merge a new Captain pull request
- When the Travis CI completes, your new Docker image is available 🥳
