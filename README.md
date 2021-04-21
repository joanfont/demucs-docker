# demucs-docker
![Docker Automated build](https://img.shields.io/docker/automated/joanfont/demucs)
![Docker Build Status](https://img.shields.io/docker/build/joanfont/demucs)

A docker image for [facebookresearch/demucs](https://github.com/facebookresearch/demucs)

## Run image

```shell
docker run -v [input-folder]:/demucs/input -v [output-folder]:/demucs/separated joanfont/demucs demucs.separate -d cpu --dl "[output-folder]/[First-file]" ... "[output-folder]/[more-files]"
```

Parameters:

* input-folder: Folder where songs to be separated are stored
* output-folder: Folder where separated tracks will be generated

#### Example

```shell
docker run -v /home/demucs-input:/demucs/input -v /home/demucs-output:/demucs/separated joanfont/demucs demucs.separate -d cpu --dl "/demucs/input/01-Intro.mp3"
```
