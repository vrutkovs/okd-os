FROM INITIAL_IMAGE as oscontainer
FROM scratch
COPY --from=oscontainer /srv/repo /srv/repo
COPY bootstrap/manifests/ /manifests
COPY bootstrap/ /bootstrap
LABEL io.openshift.release.operator=true
ENTRYPOINT ["/noentry"]
