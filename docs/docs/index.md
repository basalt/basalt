# basalt

basalt allows you to build parameterized packages for Linux (and even OSX or FreeBSD). This is very handy, if you want to build several packages of one project for different customers, or if you need to build packages with small differences for several hosts.

To build packages you basically need a [YAML config](https://github.com/basalt/go-get-a-martini-bottle/blob/master/hello_martini/configs/go.dajool.com.yaml) and a [build file](https://github.com/basalt/go-get-a-martini-bottle/blob/master/hello_martini/tasks.py). In this example, the package is generated with `invoke build_deb --config configs/go.dajool.com.yaml` and packages a go application with all the configes needed. Even the webserver config is generated with the information from the YAML file and a post-install-script takes care of the server reload.

## A dwarf - standing on the shoulders of giants

basalt makes havy usage of [invoke](https://github.com/pyinvoke/invoke) and [fpm](https://github.com/jordansissel/fpm/wiki) for the package generation.

## The history of basalt

basalt came to being with this tree blog posts:

1. [Cup-Recipe For (Django) Python Deployment - Or How To Make Your Admin Happy](https://brejoc.com/cup-recipe-for-django-python-deployment-or-how-to-make-your-admin-happy/)
2. [Cup-Recipe For (Django) Python Deployment Part 2 - Detailed Overview](https://brejoc.com/cup-recipe-for-django-python-deployment-part-2-detailed-overview/)
3. [Cup-Recipe For (Django) Python Deployment Part 3 - Deployment](https://brejoc.com/cup-recipe-for-django-python-deployment-part-3-deployment/)



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

