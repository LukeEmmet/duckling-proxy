FROM alpine:latest

ADD build/linux/duckling /

# These two files must exist.
ADD duckling.crt /duckling.crt
ADD duckling.key /duckling.key

CMD ["/duckling", "--address", "0.0.0.0", "--serverCert", "/duckling.crt", "--serverKey", "/duckling.key"]
