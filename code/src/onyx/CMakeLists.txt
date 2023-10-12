add_library(onyx API.h API.cpp)

set_property(TARGET onyx PROPERTY CXX_STANDARD 17)

target_include_directories(onyx PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/../lucid)

file(GLOB_RECURSE API_FILES "${CMAKE_CURRENT_SOURCE_DIR}/../lucid/*.h")

install(TARGETS onyx DESTINATION lib)
install(FILES API.h ${API_FILES} DESTINATION include)