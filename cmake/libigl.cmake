if(TARGET igl::core)
  return()
endif()

include(FetchContent)
FetchContent_Declare(
  libigl
  GIT_REPOSITORY https://github.com/libigl/libigl.git
  GIT_TAG v2.5.0
)

option(LIBIGL_USE_STATIC_LIBRARY    "Use libigl as static library" OFF)
option(LIBIGL_COPYLEFT_CGAL         "Use CGAL" ON)

FetchContent_MakeAvailable(libigl)