#!/bin/sh

PASS_FILENAME=private.pass.key
KEY_FILENAME=private.key.pem
REQ_FILENAME=dev-server.csr
CERT_FILENAME=dev-server.crt
EXT_FILENAME=v3.ext

openssl genrsa -des3 -passout pass:x -out ${PASS_FILENAME} 2048
openssl rsa -passin pass:x -in ${PASS_FILENAME} -out ${KEY_FILENAME}
rm ${PASS_FILENAME}

openssl req -new -key ${KEY_FILENAME} -out ${REQ_FILENAME}
openssl x509 -req -extfile ${EXT_FILENAME} -days 365 \
    -in ${REQ_FILENAME} \
    -signkey ${KEY_FILENAME} \
    -out ${CERT_FILENAME}
