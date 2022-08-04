# Lazy Window Join

## Code Structure

- benchmark -- application code to use the generated shared library
- cmake -- cmake configuration files
- docs -- any documents
- include -- all the header files
- src -- corresponding source files, will generate a shared library
- test -- test code based on google test
- tools -- script to start a remote-debug environment that contains all required libs.

## How to build

```shell
docker build -t clion/ubuntu/cpp-env:1.0 -f Dockerfile.cpp-env-ubuntu --build-arg UID=$(id -u) .
```

### Native Compile

```shell
mkdir build
cd build && cmake ..
make
```

### Cross Compile

```shell
mkdir CROSS_BUILD
cd CROSS_BUILD
export CC= {Full path and name of your cross C compiler}
export CXX= {Full path and name of your cross CPP compiler}
cmake .. -DENABLE_UNIT_TESTS=OFF
make
```

## The document, please

The API document is generated by doxygen, and they can be found in the project website
https://intellistream.github.io/AllianceDB/

### Local generate

You can also re-generate them locally, if you have the doxygen and graphviz. Following are how to install them in ubuntu
21.10

```shell
sudo apt-get install doxygen
sudo apt-get install graphviz
```

Then, you can do

```shell
mkdir doc
doxygen Doxyfile
```

to get the documents in doc/html folder, and start at index.html