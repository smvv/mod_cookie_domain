##
##  Makefile -- Build procedure for sample cookie_domain Apache module
##  Autogenerated via ``apxs -n cookie_domain -g''.
##

builddir=build

# Ubuntu
top_srcdir=/usr/share/apache2
top_builddir=/usr/share/apache2

# Gentoo
top_srcdir=/usr/lib64/apache2
top_builddir=/usr/lib64/apache2

include ${top_builddir}/build/special.mk

#   the used tools
APXS=apxs
APACHECTL=sudo /etc/init.d/apache2

TEST_URL=http://es.test.mimessenger.com/app/web/sb
TEST_URL=http://chato.kompiler.org/tight/app/web/sb

#   additional defines, includes and libraries
#DEFS=-Dmy_define=my_value
#INCLUDES=-Imy/include/dir
#LIBS=-Lmy/lib/dir -lmylib
DEFS=-Wall -Wextra -Werror

#   the default target
all: local-shared-build

#   install the shared object file into Apache 
install: install-modules-yes

#   cleanup
clean:
	rm -f build/*.{o,lo,slo,la}

#   simple test
test: reload
	wget ${TEST_URL} --server-response -O/dev/null --quiet

#   install and activate shared object by reloading Apache to
#   force a reload of the shared object file
reload: install restart

#   the general Apache start/restart/stop
#   procedures
start:
	$(APACHECTL) start
restart:
	$(APACHECTL) restart
stop:
	$(APACHECTL) stop

