SHELL := /bin/bash

NAME=basalt
VERSION=0.1.1

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use 'make package_deb'"

clean:
	rm -f $(NAME)*.deb

prepare:
	# nothing to do here

package_deb: clean prepare
	fpm -s dir \
	    -t deb \
	    -n $(NAME) \
	    -a all \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --url "https://github.com/basalt/basalt" \
	    --license "MIT" \
	    --description "basalt lets you build packages devops-style." \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
	    -d "python-basalt-tasks (>=0.1.1)" \
            -d "rubygem-fpm (>=1.3.3)" \
	    -C ./src \
	    usr
