FROM websphere-liberty:full

LABEL version="1.0"
ENV DBNAME="REPLACEME"

EXPOSE 9080/tcp
EXPOSE 9443/tcp

USER root
RUN mkdir -p /software && chown -R 1001:0 /software
RUN chmod 777 /software
RUN echo "ciao mondo" > /software/hello.txt
VOLUME /software

COPY --chown=1001:0 FaultToleranceAppEAR.ear /config/apps/
COPY --chown=1001:0 server.xml /config/
COPY --chown=1001:0 Derby /config/Derby

USER 1001
## autostart
#ENTRYPOINT [ "/opt/ibm/wlp/bin/server", "run", "defaultServer"]
