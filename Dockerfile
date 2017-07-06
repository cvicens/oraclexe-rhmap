# [START all]
FROM wnameless/oracle-xe-11g

## Init using CMD
#ENV INIT_SQL /usr/local/init.sql
#COPY init.sql $INIT_SQL
#COPY start.sh /usr/local/bin/start-docker.sh
#CMD ["/usr/local/bin/start-docker.sh"]

## Init using entrypoint
ADD init.sql /docker-entrypoint-initdb.d/

# [END all]
