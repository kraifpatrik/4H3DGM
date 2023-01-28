cmake_minimum_required(VERSION 3.23)

project(4H3DGM)

set(CMAKE_CXX_STANDARD 17)

set(SOURCES
    src/exports.cpp)

add_library(4H3DGM SHARED ${SOURCES})

target_include_directories(4H3DGM PRIVATE include/)
