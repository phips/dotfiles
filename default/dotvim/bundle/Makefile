.PHONY: pull

urls := $(shell grep ^https 00README)

pull:
	@for i in $(urls) ; do \
	git clone $$i ; \
	done

update:
	@for i in $(urls) ; do \
	cd $(basename $$i) ; \
	git pull ; \
	cd .. ; \
	done
