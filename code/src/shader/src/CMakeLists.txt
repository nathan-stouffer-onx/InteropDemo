add_library(shader shader/uniform.cpp)

target_include_directories(shader INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

install(TARGETS shader DESTINATION lib)
install(FILES shader/uniform.h DESTINATION include/shader)