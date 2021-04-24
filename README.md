# Docker TeX Live

[![Build Status](https://github.ci.maxkratz.com/api/badges/maxkratz/docker_texlive/status.svg)](https://github.ci.maxkratz.com/maxkratz/docker_texlive)

*Unofficial* [TeX Live](https://www.tug.org/texlive/) Dockerfile for various versions.
Prebuild images can be found at this [Dockerhub repository](https://hub.docker.com/r/maxkratz/texlive).

**Please notice**: TeX Live <= 2020 is frozen forever according to [tuc.org](https://www.tug.org/texlive/).
You should only use it, if you need it for a specific project or template which is incompatible with newer versions.


## Quickstart
After installing [Docker](https://docs.docker.com/get-docker/), just run the following command inside your LaTeX workspace.
It will mount the current directory to `/data` inside the container.
This path will be used as working directory as defined in the Dockerfile.

```sh
docker run --rm -it -v ${PWD}:/data maxkratz/textlive:latest pdflatex <yourfile>.tex
```

If you have a Makefile defined just run the following command from your workspace:

```sh
docker run --rm -it -v ${PWD}:/data maxkratz/texlive:latest make
```

You can also use other compilers, e.g. lualatex:

```sh
docker run --rm -it -v ${PWD}:/data maxkratz/texlive:latest lualatex <yourfile>.tex
```


## Versions

This Docker image is available in various versions which each represent a *tag*.
Currently, there are the following tags published:

| Tag    | Description                                         |
| ------ | --------------------------------------------------- |
| base   | Base image with updates and prerequesites installed |
| latest | Newest (stable) TeX Live version available          |
| 2021   | TeX Live version 2021                               |
| 2020   | TeX Live version 2020 (from archive)                |
| 2019   | TeX Live version 2019 (from archive)                |
| 2018   | TeX Live version 2018 (from archive)                |
| 2017   | TeX Live version 2017 (from archive)                |
| 2016   | TeX Live version 2016 (from archive)                |

Please notice, that the *base* tag does not have any TeX packages installed.
It is used as a base for the other builds and builds on top of the [ubuntu 20.04 image](https://hub.docker.com/_/ubuntu).


## Dockerfiles
The Dockerfiles can be found at the Github repository sorted in [folders by year](https://github.com/maxkratz/docker_texlive).


## What gets installed in this image?
The following packages are installed in this Docker image:

* Some utility packages like wget and build essentials etc.
* [TeX Live](https://www.tug.org/texlive/acquire-netinstall.html) (thats the whole point ...)


## Issues & Contribution
If you find any problems, bugs or missing packages, feel free to open an [issue on Github](https://github.com/maxkratz/docker_texlive/issues).
