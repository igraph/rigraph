# Error handling
set -eux pipefail

# Set version of igraph
if ! [ -f ./src/vendor/cigraph/IGRAPH_VERSION ]; then
    echo "0.10.0" >> ./src/vendor/cigraph/IGRAPH_VERSION
fi

cd src

# Build igraph with cmake
cmake -H. -Bbuild -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=install -DCMAKE_SHARED_LIBRARY_PREFIX_CXX=""
cmake --build build --target install --config Release

cp -r ./install/include/igraph ./include
cp ./install/lib/libigraph.a .
