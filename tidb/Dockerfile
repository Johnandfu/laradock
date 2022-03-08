FROM pingcap/tidb:latest
COPY config.toml /etc/tidb/tidb.toml
EXPOSE 4000

ENTRYPOINT ["/usr/local/bin/dumb-init", "/tidb-server --config=/etc/tidb/tidb.toml"]
