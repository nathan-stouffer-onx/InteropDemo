set(LUCID_FILES lucid/Vector.h lucid/Types.h)

add_library(lucid INTERFACE ${LUCID_FILES})

target_include_directories(lucid INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

install(FILES ${LUCID_FILES} DESTINATION include)