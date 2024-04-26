# README

## Quickstart

```sh
chmod +x setup.sh scripts/
./setup.sh
docker compose up
```

visit Kibana UI at <http://localhost:5601>

## Notes:

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

## TODO:

- [x] include conf files and map them from a volume to avoid complicating the root conf file
- [ ] JVM and log2j2 config for Kibana setup (mem limits in particular)
- [x] env mapping to docker compose to allow simpler config
- [ ] kibana keystore persistance: <https://www.elastic.co/guide/en/kibana/8.13/docker.html#_persist_the_kibana_keystore>
- [ ] improve container names for hostname matching
- [ ] proxy based auth: https://opendistro.github.io/for-elasticsearch-docs/docs/security/configuration/proxy/#:~:text=Kibana%20proxy%20authentication,headers%20to%20the%20security%20plugin.

## Optiona:

- [ ] investigate calyptia for pipeline viz <https://calyptia.com/free-trial>
