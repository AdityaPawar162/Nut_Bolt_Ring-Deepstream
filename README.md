
# Nut_Bolt_Ring-Deepstream
NutBoltRing Detector is a real-time vision system for detecting and counting nuts, bolts, and rings in industrial settings. It uses Computer Vision and NVIDIA DeepStream to improve quality control and inventory management in manufacturing.

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
3. [Running the Application](#Running-the-Application)
    1. [Clone the Repository](#1-clone-the-repository)
    2. [Run the application](#2-run-the-application)
4. [Video Demonstration of the app](#video-demonstration-of-the-app)
   
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

### 2. Compile

* x86 platform
```
CUDA_VER=11.1 make -C nvdsinfer_custom_impl_Yolo
```

* Jetson platform
```
CUDA_VER=10.2 make -C nvdsinfer_custom_impl_Yolo
```
This is a one-time step and you need to do this only when you make source-code changes.

### Understanding and editing deepstream_app_config
To understand and edit deepstream_app_config.txt file, read the [DeepStream SDK Development Guide - Configuration Groups](https://docs.nvidia.com/metropolis/deepstream/dev-guide/text/DS_ref_app_deepstream.html#configuration-groups)

Now, run the application by running the following command:

```sh
deepstream-app -c deepstream_app_config.txt
```

## Video demonstration of the App

Link to video demonstartion [video_link](https://www.youtube.com/watch?v=wP0lTCHs5Uw)
