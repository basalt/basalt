# basalt


## Installation

### Packages for Ubuntu 14.04

There are packages available for Ubuntu 14.04 from my personal repository. The packages are signed, so that apt won't complain and you can be sure that they are from me. I'm trying to keep this repository stable, but you shouldn't bet all you money on it.

Just download and install [this package](http://pelicanbay.de/pool/main/p/pelicanbay-apt-repository/pelicanbay-apt-repository_0.1_all.deb). It will add an entry to `/etc/apt/sources.d/` and import the key. After that you can install basalt via apt:

`apt update && apt install basalt`

### From source

Since I tried to avoid the chicken and egg problem, you won't need basalt to generate packages for basalt. But you'll have to install [fpm](https://github.com/jordansissel/fpm). Usually it should be enough to just install ruby and then execute `gem install fpm`. I not sure, but you might also need to install `build-essential` for some of the packages.

#### Packaging the dependencies

`git clone https://github.com/basalt/dependencies.git`  
`cd dependencies/ubuntu/14.04/`  
`cd fpm && make package_deb`  
`cd ../python-invoke && make package_deb`  
`cd ../python-sh && make package_deb`  

Install all generated packages.

#### Packaging the python core of basalt

`git clone https://github.com/basalt/python-basalt.git`  
`cd python-basalt && make package_deb` 

Install the generated package.

#### Packaging of basalt

`git clone https://github.com/basalt/basalt.git`  
`cd basalt && make package_deb`  

Install the generated package.

You are done! :)
