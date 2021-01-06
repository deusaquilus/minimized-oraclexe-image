# Quill Testing Oracle Build Image

This is a fork of minimized-oraclexe-image by diemobilar:
https://github.com/diemobiliar/minimized-oraclexe-image

It is modified to create an image to be used specifically for testing Oracle
against the Quill library:
https://github.com/getquill/quill

Many thanks to Alain Fuhrer and Andreas Wyssenbach who created the original image.

# minimized-oraclexe-image

This project contains a **Minimized Oracle 18.4.0 XE** docker image intended 
to be used for integration testing.

This is a minimized image based on the [official Oracle Docker XE](https://github.com/oracle/docker-images) 
Image but removes files not required for this purpose to minimize image file size and improve 
startup time.

## Image creation

First you will ned to create the official Oracle Docker image

```shell script
$ git clone https://github.com/oracle/docker-images.git
$ cd docker-images/OracleDatabase/SingleInstance/dockerfiles
$ ./buildDockerImage.sh -v 18.4.0 -x

$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
oracle/database     18.4.0-xe           79e03b2304a7        About an hour ago   5.89GB
```

Then use the Dockerfile from this project to build the minimized image:

```shell script
$ git clone https://github.com/diemobiliar/minimized-oraclexe-image.git
$ cd minimized-oraclexe-image/18c_xe
$ docker build . -t quillbuilduser/oracle-18-xe-micro

$ docker image ls
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
diemobiliar/oracle   18c_xe              df4317e0b89d        21 seconds ago      3.9GB
oracle/database      18.4.0-xe           79e03b2304a7        2 hours ago         5.89GB
```

Note that if you build with the `--squash` option the container will be even smaller:
```
$ docker build --squash . -t quillbuilduser/oracle-18-xe-micro
REPOSITORY                             TAG       IMAGE ID       CREATED             SIZE
quillbuilduser/oracle-18-xe-micro-sq   latest    fd47805b460b   29 minutes ago      2.29GB
quillbuilduser/oracle-18-xe-micro      latest    35feee4afcf5   40 minutes ago      3.87GB
```


## Usage and Startup Options

The username and password to connect to the database is: ```AOO_TESTS```

The SID is: ```XE```

The image allows to specify the SGA memory from 288M to 1664M, the default being 1536M. 
Important: don't miss out on the "M".

Example:
 ```shell script
docker run -e "SGA_TARGET=512M"  --name 18c_xe512m -p 1523:1521 diemobiliar/oracle:18c_xe
```


## Contributions

A big thank-you goes to the creators of the image:
  * Alain Fuhrer, IT Database Services, [Die Mobiliar](https://www.mobiliar.ch/)
  * Andreas Wyssenbach, Database-Specialist, [Die Mobiliar](https://www.mobiliar.ch/)


