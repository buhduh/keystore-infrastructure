ifndef VERSION
$(error VERSION not set)
endif

deb = mykeystore-$(VERSION).deb
deb_loc = ../debian/packages/$(deb)

default:
	$(error no default target allowed)

upload: $(deb_loc)
	@if [ ! -z "$$(aws s3 ls s3://mykeystore/packages/ | grep $(deb))" ]; then \
	  echo " $(deb) found at s3://mykeystore/packages/, stopping." ;\
	  exit 1 ;\
	fi
	aws s3 cp $(deb_loc) s3://mykeystore/packages/

$(deb_loc):
	$(error no debian package found at $(deb_loc))

update: upload
	@sed -ri \
	  's/(mykeystore-)[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+/\1$(VERSION)/' \
	  parameters.json
	aws cloudformation update-stack --stack-name MyKeystore-production --parameters \
		file://parameters.json --template-body file://template.json

