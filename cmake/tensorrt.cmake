message("配置tensorrt环境")

#
# 1. 配置tensorrt环境
#
set(TENSORRT_ROOT_DIR /root/trt_projects/TensorRT-8.4.1.5)

include_directories(${TENSORRT_ROOT_DIR}/include)
link_directories(${TENSORRT_ROOT_DIR}/lib)

set(TRT_LIBS nvinfer nvinfer_plugin nvonnxparser)

file(GLOB_RECURSE TRT_SRC
        ${CMAKE_SOURCE_DIR}/src/trt/*.cpp)
add_library(trt_cpp_lib SHARED ${TRT_SRC})