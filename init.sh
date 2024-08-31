echo "updating dependencies..."
git pull
git submodule update --recursive --remote


echo "setting up emsdk..."
cd emsdk
# Download and install the latest SDK tools.
./emsdk install latest

# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
./emsdk activate latest

# Activate PATH and other environment variables in the current terminal
source ./emsdk_env.sh

cd ..