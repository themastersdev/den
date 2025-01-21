# Den

A tool I built to create my development environment in a docker container with linux so that I can write code and experiment in isolation from my host machine. You can `rm -rf` all you want :) just rebuild the image.

## Getting Started
1. Install [Docker](https://www.docker.com/).
1. Install a Terminal. I use [Ghostty](https://ghostty.org/).
1. Run `git clone https://github.com/themastersdev/den.git`
1. Run `cd den`
1. Run `make den`
1. Start building!

⚠️**CAUTION**⚠️: Running `make den` removes any image and container named *den*, then builds a fresh image and container named *den*. Therefore, you should run `make code` to access the den you previously built. Alternatively, you can run `docker start -i den` to access the den you previously built.
