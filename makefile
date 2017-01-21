export VERSION

deploy: debian aws

debian:
	test -n "$(VERSION)" # $$VERSION
	$(MAKE) -C $@ package

aws:
	test -n "$(VERSION)" # $$VERSION
	$(MAKE) -C $@ update

.PHONY: aws debian deploy
