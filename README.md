# README

## Quickstart

```sh
chmod +x setup.sh scripts/
./setup.sh
docker compose up
```

visit Kibana UI at <http://localhost:5601>

## Notes

dont use yaml conf for fluent bit, not mapping to container as expected. Conf never gets discovered

Kibana verification code will be printed to console when attempting to link with registration

Elastic Cloud is now on version 8 so the type option must be removed by setting Suppress_Type_Name On as indicated above.

<https://docs.fluentbit.io/manual/pipeline/outputs/elasticsearch#action-metadata-contains-an-unknown-parameter-type>

## Configuring Max Map Count

See <https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_linux>

```sh
grep vm.max_map_count /etc/sysctl.conf
```

Should be, `vm.max_map_count=262144`

Using sysctl,

```sh
sysctl -w vm.max_map_count=262144
```

or edit `/etc/sysctl.conf` for persistant config.

## Optional

- [ ] investigate calyptia for pipeline viz <https://calyptia.com/free-trial>
