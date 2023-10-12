add_library(onyx API.h API.cpp)

set_property(TARGET onyx PROPERTY CXX_STANDARD 17)

target_include_directories(onyx PUBLIC ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/../lucid)

install(TARGETS onyx DESTINATION lib)
install(FILES API.h DESTINATION include)