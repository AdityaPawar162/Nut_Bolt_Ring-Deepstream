# Nut_Bolt_Ring-Deepstream
NutBoltRing Detector is a real-time vision system for detecting and counting nuts, bolts, and rings in industrial settings. It uses Computer Vision and NVIDIA DeepStream to improve quality control and inventory management in manufacturing.

![NutBoltRing-Detection Image Result](resources/result.png)

The main objective of this project is to develop a real-time detection system that identifies and counts essential industrial components, specifically nuts, bolts, and rings, using NVIDIA DeepStream technology to enhance quality control, inventory management, and production monitoring in manufacturing and assembly processes.

## Citations

* [AlexeyAB/darknet](https://github.com/AlexeyAB/darknet)
* [marcoslucianops/DeepStream-Yolo](https://github.com/marcoslucianops/DeepStream-Yolo)
* [NMadhub/deepstream6.1-yolov8](https://github.com/NMadhub/deepstream6.1-yolov8)
* [FalconMadhab/PPE-Deepstream](https://github.com/FalconMadhab/PPE-Deepstream)

## Index

1. [Introduction](#Introduction)
2. [Deepstream Setup](#Deepstream-Setup)
    1. [Prerequisites](#1-Prerequisites)
    2. [Install Dependencies](#2-Install-Dependencies)
    3. [Install Deepstream SDK](#3-Install-Deepstream-SDK)
3. [Project Setup](#Project-Setup)
    1. [Prerequisites](#1-Prerequisites-1)
    2. [Edit Makefile](#2-Edit-Makefile)
       1. [Update GCC path](#1Update-GCC-path)
       2. [Update the Deepstream Version](#2-update-the-deepstream-version)
       3. [Optional](#3-omit-18-20-and-40-43if-opencv-and-libcurl-is--not-installed-manuallyoptional)
4. [Running the Application](#Running-the-Application)

## Introduction

Nut-Bolt-Ring Detection Application consists of an Intelligent Video Analytics Pipeline powered by Deepstream.

This project is a proof-of-concept, aiming to monitor and count industrial components (specifically nuts, bolts, and rings) in manufacturing and assembly processes using Computer Vision. It is accelerated using NVIDIA DeepStream and can be implemented with a production line camera and an onboard Jetson platform, enhancing quality control and inventory management in real-time.

This project detects objects of these 3 classes-nut, bolt and ring

## Deepstream Setup

###  1. Prerequisites

You must install the following components:

Ubuntu 22.04                                                                                                                                                                                
GStreamer 1.20.3                                                                                                                                                                            
NVIDIA driver 535.161.08                                                                                                                                                                    
CUDA 12.4                                                                                                                                                                                   
TensorRT 8.6.1.6                                                                                                                                                                            

### 2. Install Dependencies

```sh
sudo apt install \
libssl3 \
libssl-dev \
libgles2-mesa-dev \
libgstreamer1.0-0 \
gstreamer1.0-tools \
gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad \
gstreamer1.0-plugins-ugly \
gstreamer1.0-libav \
libgstreamer-plugins-base1.0-dev \
libgstrtspserver-1.0-0 \
libjansson4 \
libyaml-cpp-dev \
libjsoncpp-dev \
protobuf-compiler \
gcc \
make \
git \
python3
```

### 3. Install Deepstream SDK

Download the DeepStream 7.0 dGPU Debian package deepstream-7.0_7.0.0-1_amd64.deb : https://catalog.ngc.nvidia.com/orgs/nvidia/resources/deepstream

```sh
sudo apt-get install ./deepstream-7.0_7.0.0-1_amd64.deb
```

## Project Setup

### 1. Prerequisites

This project is built without external dependencies, relying solely on C++'s Standard Template Library (STL). To leverage the latest features and optimizations, it utilizes GCC version 14. For optimal performance, it's recommend installing GCC 14 on your system. Installation instructions for Ubuntu 22.04 and 24.04 can be found in the provided link.                       
https://askubuntu.com/questions/1513160/how-to-install-gcc-14-on-ubuntu-22-04-and-24-04


### 2. Edit Makefile

#### 1.Update GCC path
```sh
CXX = /usr/local/gcc-14.1.0/bin/g++-14.1.0 
```

#### 2. Update the Deepstream Version
```sh
NVDS_VERSION := 7.0
```

#### 3. Omit 18-20 and 40-43,if OpenCV and libcurl is  not installed manually(Optional)
If you haven't manually installed OpenCV and libcurl, modify the Makefile by removing or commenting out lines 18-20 and 40-43. These lines typically contain include paths and library links for these dependencies.

![Makefile1](resources/Makefile1.png)
![Makefile2](resources/Makefile2.png)

## Running the Application

### 1. Clone the Repository

This is a straightforward step, however, if you are new to git, I recommend glancing threw the steps.

First, install git

```sh
sudo apt install git
```

Next, clone the repository

```sh
# Using Https
git clone https://github.com/AdityaPawar162/Nut_Bolt_Ring-Deepstream.git

#Using SSH
git clone git@github.com:AdityaPawar162/Nut_Bolt_Ring-Deepstream.git
```

### 2. Run with different sources

The computer vision part of the solution can be run on one or many input sources of multiple types, all powered using NVIDIA Deepstream.

First, build the application by running the following command:

```sh
make clean && make -j$(nproc)
```

This will generate the binary called `nut_bolt_ring_detection`. This is a one-time step and you need to do this only when you make source-code changes.

Next, create a file called `inputsources.txt` and paste the path of videos or rtsp url.

```sh
file:///home/adi/test/cuda_image_processing/build/output.mp4
rtsp://admin:admin%40123@192.168.1.1:554/stream
```

Now, run the application by running the following command:

```sh
./nut_bolt_ring_detection
```




