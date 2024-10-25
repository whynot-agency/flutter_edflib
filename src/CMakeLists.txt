# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_edflib_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_edflib SHARED
  "flutter_edflib.c"
)

set_target_properties(flutter_edflib PROPERTIES
  PUBLIC_HEADER flutter_edflib.h
  OUTPUT_NAME "flutter_edflib"
)

target_compile_definitions(flutter_edflib PUBLIC DART_SHARED_LIB)
