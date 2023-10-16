add_library(onyx API.h API.cpp)

target_include_directories(onyx PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(onyx PUBLIC lucid shader)

install(TARGETS onyx DESTINATION lib)
install(FILES API.h DESTINATION include)