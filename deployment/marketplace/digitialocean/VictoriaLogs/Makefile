RELEASE_NAME := vl-oneclick-droplet
VL_VERSION ?= $(shell git describe --abbrev=0 --tags)

.PHONY: $(MAKECMDGOALS)

release-victoria-logs-digitalocean-oneclick-droplet:
	cp ./files/etc/update-motd.d/99-one-click.tpl ./files/etc/update-motd.d/99-one-click
	sed -i -e "s/VL_VERSION/${VL_VERSION}/g" ./files/etc/update-motd.d/99-one-click
	packer init template.pkr.hcl
	packer build template.pkr.hcl