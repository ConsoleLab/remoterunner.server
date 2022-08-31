cmake_minimum_required(VERSION 3.16.3)
file(STRINGS config.json PROGRAM)
file(READ config.json TEMP)
string(REPLACE ";" "" PROGRAM "${PROGRAM}")
string(REPLACE "\"" "\\\"" PROGRAM "${PROGRAM}")
message(STATUS "Program definition: 
${TEMP}"
)
add_definitions(-DPROGRAM="${PROGRAM}")
add_definitions(-DPROGRAM="TEST")


project(remoterunner.server VERSION 0.1.0)


if (WIN32)
  add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif (WIN32)

if(WIN32)
  message(STATUS "User home: $ENV{USERPROFILE}") 
endif(WIN32)

# commons
include_directories("include")

find_library(BSOBLIB libbson)


if(UNIX)
  include_directories("/usr/local/include/")
  include_directories("/usr/local/include/libmongoc-1.0")
  include_directories("/usr/local/include/libbson-1.0")
 
  set(COMMON_LINK_LIBS jansson argtable3 mongoc-1.0 bson-1.0 serialport antenna m) 
endif(UNIX)

add_executable(${CMAKE_PROJECT_NAME} main.c)
target_link_libraries(${CMAKE_PROJECT_NAME} ${COMMON_LINK_LIBS})
install(TARGETS ${CMAKE_PROJECT_NAME} CONFIGURATIONS Release)