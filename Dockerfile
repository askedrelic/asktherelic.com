FROM pierrezemb/gostatic
COPY ./build/ /srv/http/
ENTRYPOINT ["/goStatic", "-port","8080", "-log-level","debug"]
