cmake_minimum_required(VERSION 3.20.2)
project(remoterunner.server VERSION 0.1.0)

if (WIN32)
  add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif (WIN32)

if(WIN32)
  message(STATUS "User home: $ENV{USERPROFILE}") 
endif(WIN32)

# commons
include_directories("include")

if(WIN32)
  include_directories($ENV{USERPROFILE}/AppData/Local/include) 
  include_directories($ENV{USERPROFILE}/AppData/Local/include/libmongoc-1.0) 
  include_directories($ENV{USERPROFILE}/AppData/Local/include/libbson-1.0)
  link_directories($ENV{USERPROFILE}/AppData/Local/lib)

  # set(COMMON_LINK_LIBS_DEBUG jansson_d argtable3d)
  set(COMMON_LINK_LIBS_OPTIM jansson argtable3 mongoc-1.0 bson-1.0 libserialport libantenna) 
endif(WIN32)

if(UNIX)
  include_directories("/usr/local/include/")
  include_directories("/usr/local/include/libmongoc-1.0")
  include_directories("/usr/local/include/libbson-1.0")
 
  # set(COMMON_LINK_LIBS_DEBUG jansson argtable3 m)
  set(COMMON_LINK_LIBS_OPTIM jansson argtable3 mongoc-1.0 bson-1.0 serialport antenna m) 
endif(UNIX)

add_executable(${CMAKE_PROJECT_NAME} main.c)
target_link_libraries(${CMAKE_PROJECT_NAME} ${COMMON_LINK_LIBS_OPTIM})
install(TARGETS ${CMAKE_PROJECT_NAME} CONFIGURATIONS Release) 
