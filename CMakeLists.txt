cmake_minimum_required(VERSION 3.30)
project(jsigl)

list(PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Set CMP0169 policy to OLD
if(POLICY CMP0169)
    cmake_policy(SET CMP0169 OLD)
endif()

# Libigl
include(libigl)

# igl_include(glfw)
#igl_include(embree)
#igl_include(imgui)
# igl_include(opengl)
#igl_include(stb)
#igl_include(predicates)
#igl_include(xml)
igl_include(copyleft cgal)
#igl_include(copyleft comiso)
#igl_include(copyleft core)
#igl_include(copyleft cork)
#igl_include(copyleft tetgen)
#igl_include(restricted matlab)
#igl_include(restricted mosek)
#igl_include(restricted triangle)

# Add source files
file(GLOB_RECURSE SRC_FILES "src/*.cpp")
add_executable(${PROJECT_NAME} ${SRC_FILES})

# Link libraries
target_link_libraries(${PROJECT_NAME} PUBLIC
  # igl::glfw
  # igl::embree
  # igl::imgui
  # igl::opengl
  # igl::stb
  # igl::predicates
  # igl::xml
  igl_copyleft::cgal
  # igl_copyleft::comiso
  # igl_copyleft::core
  # igl_copyleft::cork
  # igl_copyleft::tetgen
  # igl_restricted::matlab
  # igl_restricted::mosek
  # igl_restricted::triangle
)

# Set output to a WebAssembly module
set_target_properties(${PROJECT_NAME} PROPERTIES
  OUTPUT_NAME "index"
  SUFFIX ".js"
  CFLAGS "-O3"
  LINK_FLAGS "-s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -s DEMANGLE_SUPPORT=1  --bind"
)