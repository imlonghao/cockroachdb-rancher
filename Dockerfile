FROM cockroachdb/cockroach:v19.1.3

MAINTAINER Byte Pixie <hello@bytepixie.com>

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		ca-certificates \
		libssl1.1 \
		logrotate \
		curl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/*

#
# Bootstrap script.
COPY ./rancher-entrypoint.sh /

ENTRYPOINT ["/rancher-entrypoint.sh"]
