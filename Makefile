builddir=build

# Ubuntu
ifneq ("$(wildcard /usr/share/apache2/build/special.mk)","")
top_srcdir=/usr/share/apache2
top_builddir=/usr/share/apache2
else
# Gentoo
top_srcdir=/usr/lib64/apache2
top_builddir=/usr/lib64/apache2
endif

include ${top_builddir}/build/special.mk

APXS=apxs
APACHECTL=sudo /etc/init.d/apache2

# additional defines, includes and libraries
#DEFS=-Dmy_define=my_value
#INCLUDES=-Imy/include/dir
#LIBS=-Lmy/lib/dir -lmylib
DEFS=-Wall -Wextra -Werror

# the default target
all: local-shared-build

# install the shared object file into Apache
install: install-modules-yes

clean:
	rm -f build/*.{o,lo,slo,la}

test: reload
	wget ${TEST_URL} --server-response -O/dev/null --quiet

# Install and activate shared object by reloading Apache to force a reload of
# the shared object file
reload: install restart

restart:
	$(APACHECTL) restart
