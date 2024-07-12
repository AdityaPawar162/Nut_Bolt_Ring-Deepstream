# Compiler
CXX = /usr/local/gcc-14.1.0/bin/g++-14.1.0 

# CUDA version
CUDA_VER?=12.4

# Application name
APP := nut_bolt_ring_detection

# Target device
TARGET_DEVICE = $(shell g++ -dumpmachine | cut -f1 -d -)

# DeepStream version
NVDS_VERSION := 7.0

# Installation directories
LIB_INSTALL_DIR ?= /opt/nvidia/deepstream/deepstream-$(NVDS_VERSION)/lib/
OPENCV_INSTALL_DIR := /home/adi/libraries/opencv/install
CURL_INSTALL_DIR := /home/adi/libraries/librealsense/build/libcurl/libcurl_install
PKG_CONFIG_PATH := $(CURL_INSTALL_DIR)/lib/pkgconfig:$(PKG_CONFIG_PATH)


# Compiler flags
CXXFLAGS = -std=c++20 -Wall

# Additional flags for Tegra devices
ifeq ($(TARGET_DEVICE),aarch64)
  CXXFLAGS += -DPLATFORM_TEGRA
endif

# Source and header files
SRCS := $(wildcard ds_src/*.cpp)
SRCS += $(wildcard ds_src/*.c)
INCS := $(wildcard ds_src/*.h)
OBJS := $(SRCS:.cpp=.o)

# GStreamer package
PKGS := gstreamer-1.0 

CXXFLAGS += $(shell PKG_CONFIG_PATH="$(PKG_CONFIG_PATH)" pkg-config --cflags $(PKGS))
CXXFLAGS += $(shell PKG_CONFIG_PATH="$(PKG_CONFIG_PATH)" pkg-config --cflags libcurl)
LIBS := $(shell PKG_CONFIG_PATH="$(PKG_CONFIG_PATH)" pkg-config --libs $(PKGS))
LIBS += $(shell PKG_CONFIG_PATH="$(PKG_CONFIG_PATH)" pkg-config --libs libcurl)


# Additional include directories
CXXFLAGS += -I/opt/nvidia/deepstream/deepstream-$(NVDS_VERSION)/sources/includes \
            -DDS_VERSION_MINOR=0 -DDS_VERSION_MAJOR=5 \
            -I$(OPENCV_INSTALL_DIR)/include/opencv4 \
            -I/usr/local/cuda-$(CUDA_VER)/include
CXXFLAGS += $(shell pkg-config --cflags $(PKGS))

# Libraries to link
LIBS += -L/usr/local/cuda-$(CUDA_VER)/lib64/ -lcudart \
        -L$(LIB_INSTALL_DIR) -lnvdsgst_meta -lnvds_meta -lnvds_yml_parser -lnvdsgst_helper\
        -lcuda -Wl,-rpath,$(LIB_INSTALL_DIR)
LIBS += -pthread -O3 -Ofast
LIBS += -luuid -lnvbufsurface -lnvbufsurftransform
LIBS += -L$(OPENCV_INSTALL_DIR)/lib \
        -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_imgcodecs \
        -Wl,-rpath,$(OPENCV_INSTALL_DIR)/lib
LIBS += -L$(CURL_INSTALL_DIR)/lib -lcurl -Wl,-rpath,$(CURL_INSTALL_DIR)/lib
LIBS += -pthread -lz -lssl -lcrypto

# Targets
all: nut_bolt_ring objdets

objdets: yolov3

nut_bolt_ring: $(APP)

%.o: %.cpp $(INCS) Makefile
	$(CXX) -c -o $@ $(CXXFLAGS) $<

$(APP): $(OBJS) Makefile
	$(CXX) -o $(APP) $(OBJS) $(LIBS)

yolov3:
	cd nvdsinfer_custom_impl_Yolo && $(MAKE)

clean:
	rm -rf $(OBJS) $(APP)
	cd nvdsinfer_custom_impl_Yolo && $(MAKE) clean
