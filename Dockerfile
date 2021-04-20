FROM quay.io/vrutkovs/okd-os@sha256:05f8f91c6683ba3ab08718a0486f15ec51233abe4aaaf6586f9e6c3407051449 as oscontainer
FROM scratch
COPY --from=oscontainer /srv/repo /srv/repo
COPY bootstrap/manifests/ /manifests
COPY bootstrap/ /bootstrap
LABEL io.openshift.release.operator=true
ENTRYPOINT ["/noentry"]
