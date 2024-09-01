echo "updating dependencies..."
git fetch
git pull
echo "updating submodules..."
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

sudo apt update
sudo apt-get install curl
sudo apt install libmpfr-dev
sudo apt-get install libgmp3-dev
sudo apt-get install libboost-all-dev
