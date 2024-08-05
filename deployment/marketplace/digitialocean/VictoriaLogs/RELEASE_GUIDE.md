## Release guide for DigitalOcean 1-ClickApp Droplet

### Build image

1. To build the snapshot in DigitalOcean account you will need API Token and [packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli).
2. API Token can be generated on [https://cloud.digitalocean.com/account/api/tokens](https://cloud.digitalocean.com/account/api/tokens) or use already generated from OnePassword.
3. Choose prefered version of VictoriaMetrics on [Github releases](https://github.com/VictoriaMetrics/VictoriaMetrics/releases/latest) page.
4. Set variables `DIGITALOCEAN_API_TOKEN` with `VL_VERSION` for `packer` environment and run make from example below:

```console
make release-victoria-logs-digitalocean-oneclick-droplet DIGITALOCEAN_API_TOKEN="dop_v23_2e46f4759ceeeba0d0248" VL_VERSION="0.28.0-victorialogs"
```

## Release guide for DigitalOcean Kubernetes 1-Click App

VM operator support in the development process, see https://github.com/VictoriaMetrics/operator/issues/1052

### Update information on Vendor Portal

After packer build finished you need to update a product page.

1. Go to [https://cloud.digitalocean.com/vendorportal](https://cloud.digitalocean.com/vendorportal).
2. Choose a product that you need to update.
3. Enter newer information for this release and choose a droplet's snapshot which was builded recently.
4. Submit updates for approve on DigitalOcean Marketplace.
