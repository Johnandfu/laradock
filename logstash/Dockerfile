ARG ELK_VERSION
FROM logstash:${ELK_VERSION}
ADD  ./config/logstash.yml  /usr/share/logstash/config/logstash.yml
ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
CMD ["-f", "/usr/share/logstash/pipeline/logstash.conf"]
EXPOSE 5044 5001 4560 4561 4562 4563 4564
