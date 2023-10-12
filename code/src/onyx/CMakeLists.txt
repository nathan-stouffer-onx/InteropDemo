add_library(onyx API.h API.cpp)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

target_include_directories(onyx PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(onyx PUBLIC lucid)

install(TARGETS onyx DESTINATION lib)
install(FILES API.h DESTINATION include)