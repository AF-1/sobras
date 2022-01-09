Building libmusly on macOS
====

Install **XCode Command Line Tools**:<br>
`xcode-select --install`

Install **Homebrew** (as admin user):<br>
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Download the latest Musly (zip archive) from [CDrummond's repo](https://github.com/CDrummond/musly)<br>

Download **Eigen** from [this repo](https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar.bz2)<br>

Extract it to */tmp*:<br>
`tar -C /tmp -xf eigen-3.3.9.tar.bz2`

Create some folders and unzip the Musly archive:<br>
`cd ~/Downloads && mkdir testbuild && cd testbuild`
`unzip musly-master.zip`


**Edit CMakeLists.txt**:<br>
below the following line: *# add_definitions(-DMUSLY_VERSION="${MUSLY_VERSION}") #*<br>
probably in line 12, **add these lines**:

```
# start additions
SET(CMAKE_INSTALL_PREFIX "/usr/local/opt/musly-0.2")
SET(CMAKE_BUILD_TYPE "Release")
SET(CMAKE_SKIP_INSTALL_RPATH  FALSE)
SET(CMAKE_SKIP_RPATH  FALSE)
SET(EIGEN3_INCLUDE_DIR "/tmp/eigen-3.3.9/")

SET(CMAKE_SKIP_BUILD_RPATH  FALSE)
SET(CMAKE_BUILD_WITH_INSTALL_RPATH FALSE)
SET(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
# end additions

```

Then build and make:<br>
`mkdir ~/Downloads/testbuild/build && cd ~/Downloads/testbuild/build`<br>
`cmake ../musly-master`<br>
`make -j4`<br>
`sudo make install`<br>

Now you'll find a folder called *musly-0.2* with the libmusly binary in **/usr/local/opt/**
