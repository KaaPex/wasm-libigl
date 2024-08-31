echo "Generating makefile..."
rm -rf build
mkdir build && cd build

emcmake cmake -DCMAKE_BUILD_TYPE=Release -DLIBIGL_USE_STATIC_LIBRARY=ON ../libigl
emmake make -j