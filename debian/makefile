ifndef VERSION
$(error VERSION not set)
endif

certs = etc/ssl/certs/dhparam.pem etc/ssl/certs/mykeystore.net.pem 
certs += etc/ssl/private/mykeystore.net.pem

bin = ../../bin/keystore

package: $(certs) $(bin)
	@sed -ri 's/(VERSION=)[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]/\1$(VERSION)/' createDebian.sh
	@sed -ri 's/(Version: )[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]/\1$(VERSION)/' DEBIAN/control
	@./createDebian.sh

$(certs):
	$(error No cert file, $@ found. Generate with appropriate tool)

$(bin):
	$(error No binary found at $@ for debain package)

