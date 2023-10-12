cmake_minimum_required(VERSION 3.24)

project(onyx VERSION 1.0.0 DESCRIPTION "A test onyx lib" LANGUAGES CXX)

set(CMAKE_INSTALL_PREFIX artifacts/${TARGET_ARCHITECTURE})

add_subdirectory(src)