FROM scratch
COPY ./tmp/repo /srv/repo
RUN mkdir /extensions/
COPY manifests/ /manifests/
COPY bootstrap/ /bootstrap/
LABEL io.openshift.release.operator=true
ENTRYPOINT ["/noentry"]
