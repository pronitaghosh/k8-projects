

# Pull base image.
FROM ubuntu:16.04

RUN \
    apt-get update && \
    apt-get install -y redis-server

RUN \
  sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
  sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
  sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
# CMD ["redis-server", "/etc/redis/redis.conf"]

EXPOSE      6379
ENTRYPOINT  ["/usr/bin/redis-server"]
