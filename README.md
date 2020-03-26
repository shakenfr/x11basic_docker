# x11basic_docker
Docker en for x11 basic

This Docker file is based on the last stable version of X11-basic (see this great project on https://sourceforge.net/projects/x11-basic/ and https://github.com/kollokollo/X11Basic)


The docker image is on docker hub : https://hub.docker.com/repository/docker/shakenfr/x11basic/tags?page=1

The image is based on Debian Jessie and compile X11-basic.

If you want to use the image, you need Docker installed on your host (ubuntu,debian ,centos,windows, macos etc...)
You have to follow the installation documentation of Docker (https://www.docker.com/)

exemples of use :

You can use your prefered editor to write your .bass program files. After you need tooo have x11basic to interprete or compile your code.


You can build an docker image like :

sudo docker build <YOUR_DOCKER_FILE_FOLDER> -t <YOUR_REPO_NAME_AND_TAG> 
exemple : sudo docker build . -t shakenfr/x11basic:0.2

You can pull the image like this :
sudo docker pull shakenfr/x11basic:latest

On your host you can list your images :
sudo docker images

sudo docker pull shakenfr/x11basic:latest

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
x11basic            latest              611dd3e69131        14 hours ago        532MB
shakenfr/x11basic   0.1                 611dd3e69131        14 hours ago        532MB
shakenfr/x11basic   latest              611dd3e69131        14 hours ago        532MB

After on your host you can run docker like this :

sudo docker  run -v dockerfilevolume -ti  -v/<YOUR PROGRAM FILES FOLDER ON YOUR HOST>/:/dockerfilevolume/ <YOUR DOCKER CONTAINER ID> <YOUR X11BASIC COMMAND> <YOUR FILE.bas>

exemple :
sudo docker  run -v dockerfilevolume -ti  -v/home/bruno/projects/x11basic_docker/:/dockerfilevolume/ 611dd3e69131 xbc 1.bas

Where /home/bruno/projects/X11basic_docker is the host folder where are your .bas files and /dockerfilevolume is the volume mounted on container.
After you can obtain your .o, .out files on your host.

If you want to go inside the container you could run it like :

sudo docker  run -v dockerfilevolume -ti  -v/home/bruno/projects/x11basic_docker/:/dockerfilevolume/ 611dd3e69131

After you can run all x11basic commands. Remember to wrk in the /dockerfilevolume to save files inside your container & host
If you exit your container, you will find files in this volume on your host.
If you saved your file outside /dockerfilevolume, you will lost them


Bests

Bruno









