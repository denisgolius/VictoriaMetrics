## Application summary

VictoriaLogs is a fast and scalable open source time series database and monitoring solution.

## Description

[VictoriaLogs](https://docs.victoriametrics.com/victorialogs/)

VictoriaLogs is [open source](https://github.com/VictoriaMetrics/VictoriaMetrics/tree/master/app/victoria-logs) user-friendly database for logs from [VictoriaMetrics](https://github.com/VictoriaMetrics/VictoriaMetrics/).
 
## VictoriaLogs provides the following features:

- VictoriaLogs can accept logs from popular log collectors. See [these docs](https://docs.victoriametrics.com/victorialogs/data-ingestion/).
- VictoriaLogs is much easier to set up and operate compared to Elasticsearch and Grafana Loki. See [these docs](https://docs.victoriametrics.com/victorialogs/quickstart/).
- VictoriaLogs provides easy yet powerful query language with full-text search across all the [log fields](https://docs.victoriametrics.com/victorialogs/keyconcepts/#data-model). See [LogsQL docs](https://docs.victoriametrics.com/victorialogs/logsql/).
- VictoriaLogs can be seamlessly combined with good old Unix tools for log analysis such as `grep`, `less`, `sort`, `jq`, etc. See [these docs](https://docs.victoriametrics.com/victorialogs/querying/#command-line) for details.
- VictoriaLogs capacity and performance scales linearly with the available resources (CPU, RAM, disk IO, disk space). It runs smoothly on both Raspberry PI and a server with hundreds of CPU cores and terabytes of RAM.
- VictoriaLogs can handle up to 30x bigger data volumes than Elasticsearch and Grafana Loki when running on the same hardware. See [these docs](https://docs.victoriametrics.com/victorialogs/#benchmarks).
- VictoriaLogs supports fast full-text search over high-cardinality [log fields](https://docs.victoriametrics.com/victorialogs/keyconcepts/#data-model) such as `trace_id`, `user_id` and `ip`.
- VictoriaLogs supports multitenancy - see [these docs](https://docs.victoriametrics.com/victorialogs/#multitenancy).
- VictoriaLogs supports out-of-order logs’ ingestion aka backfilling.
- VictoriaLogs supports live tailing for newly ingested logs. See [these docs](https://docs.victoriametrics.com/victorialogs/querying/#live-tailing).
- VictoriaLogs supports selecting surrounding logs in front and after the selected logs. See [these docs](https://docs.victoriametrics.com/victorialogs/logsql/#stream_context-pipe).
- VictoriaLogs provides web UI for querying logs - see [these docs](https://docs.victoriametrics.com/victorialogs/querying/#web-ui).

If you have questions about VictoriaLogs, then read [this FAQ](https://docs.victoriametrics.com/victorialogs/faq/). Also feel free asking any questions at [VictoriaMetrics community Slack chat](https://victoriametrics.slack.com/), you can join it via [Slack Inviter](https://slack.victoriametrics.com/).
 
See [Quick start docs](https://docs.victoriametrics.com/victorialogs/quickstart/) for start working with VictoriaLogs.

## Getting started after deploying VictoriaLogs Single

### Config

VictoriaMetrics configuration is located at `/etc/victoriametrics/single/scrape.yml` on the droplet.
This One Click app uses 9428 port to accept logs from different log collectors. It's recommended to disable ports for protocols which are not needed. [Ubuntu firewall](https://help.ubuntu.com/community/UFW) can be used to easily disable access for specific ports.

### [Data ingestion](https://docs.victoriametrics.com/victorialogs/data-ingestion/#log-collectors-and-data-ingestion-formats)

[VictoriaLogs](https://docs.victoriametrics.com/victorialogs/) can accept logs from the following log collectors:

-   Syslog, Rsyslog and Syslog-ng - see [these docs](https://docs.victoriametrics.com/victorialogs/data-ingestion/syslog/).
-   Filebeat - see [these docs](https://docs.victoriametrics.com/victorialogs/data-ingestion/filebeat/).
-   Fluentbit - see [these docs](https://docs.victoriametrics.com/victorialogs/data-ingestion/fluentbit/).
-   Logstash - see [these docs](https://docs.victoriametrics.com/victorialogs/data-ingestion/logstash/).
-   Vector - see [these docs](https://docs.victoriametrics.com/victorialogs/data-ingestion/vector/).
-   Promtail (aka Grafana Loki) - see [these docs](https://docs.victoriametrics.com/victorialogs/data-ingestion/promtail/).

The ingested logs can be queried according to [these docs](https://docs.victoriametrics.com/victorialogs/querying/).

See also:

-   [Log collectors and data ingestion formats](https://docs.victoriametrics.com/victorialogs/data-ingestion/#log-collectors-and-data-ingestion-formats).
-   [Data ingestion troubleshooting](https://docs.victoriametrics.com/victorialogs/data-ingestion/#troubleshooting).

### [HTTP APIs](https://docs.victoriametrics.com/victorialogs/data-ingestion/#http-apis)

VictoriaLogs supports the following data ingestion HTTP APIs:

-   Elasticsearch bulk API. See [these docs](https://docs.victoriametrics.com/victorialogs/data-ingestion/#elasticsearch-bulk-api).
-   JSON stream API aka [ndjson](https://jsonlines.org/). See [these docs](https://docs.victoriametrics.com/victorialogs/data-ingestion/#json-stream-api).
-   Loki JSON API. See [these docs](https://docs.victoriametrics.com/victorialogs/data-ingestion/#loki-json-api).

VictoriaLogs accepts optional [HTTP parameters](https://docs.victoriametrics.com/victorialogs/data-ingestion/#http-parameters) at data ingestion HTTP APIs.

### [Querying](https://docs.victoriametrics.com/victorialogs/querying/#)

[VictoriaLogs](https://docs.victoriametrics.com/victorialogs/) can be queried with [LogsQL](https://docs.victoriametrics.com/victorialogs/logsql/) via the following ways:

-   [Web UI](https://docs.victoriametrics.com/victorialogs/querying/#web-ui) - a web-based UI for querying logs
-   [Visualization in Grafana](https://docs.victoriametrics.com/victorialogs/querying/#visualization-in-grafana)
-   [HTTP API](https://docs.victoriametrics.com/victorialogs/querying/#http-api)
-   [Command-line interface](https://docs.victoriametrics.com/victorialogs/querying/#command-line)

### Accessing

Once the Droplet is created, you can use DigitalOcean's web console to start a session or  SSH directly to the server as root:

```console
ssh root@your_droplet_public_ipv4
```
