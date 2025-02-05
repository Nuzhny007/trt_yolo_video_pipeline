find_package(OpenCV REQUIRED)
find_package(Threads REQUIRED)


include_directories(/usr/local/include)
include_directories(/usr/local/include/opencv4)


include_directories(${CMAKE_SOURCE_DIR}/src)

# 启用硬件编解码加速标识
add_definitions(-D__HWCODEC__)

# ffmpeg动态库
file(GLOB_RECURSE FFmpeg_LIBS
        /usr/local/lib/libav*.so
        /usr/local/lib/libsw*.so
        /usr/local/lib/libpostproc.so)


set(local_libs
        pthread
        ${FFmpeg_LIBS}
        ${OpenCV_LIBS}
        )

file(GLOB_RECURSE CPP_SRC
        ${CMAKE_SOURCE_DIR}/src/ffmpeg/*.cpp
        ${CMAKE_SOURCE_DIR}/src/graph/*.cpp
        ${CMAKE_SOURCE_DIR}/src/infer/*.cpp
        ${CMAKE_SOURCE_DIR}/src/utils/*.cpp)
add_library(cpp_lib SHARED ${CPP_SRC})


