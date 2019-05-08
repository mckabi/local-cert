# local-cert

Self-Signed SSL Certificate for local dev

```shell
$ openssl genrsa -des3 -passout pass:x -out private.pass.key 2048
...
$ openssl rsa -passin pass:x -in private.pass.key -out private.key.pem
writing RSA key
$ rm private.pass.key
$ openssl req -new -key private.key.pem -out dev-server.csr
...
Country Name (2 letter code) []:KR
...
A challenge password []:
...
$ cat v3.ext
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
IP.1 = 127.0.0.1
IP.2 = ::1
DNS.1 = localhost

$ openssl x509 -req -extfile v3.ext -days 365 -in dev-server.csr -signkey private.key.pem -out dev-server.crt
```

- private.key.pem : Private key
- dev-server.csr : SSL Certificate Signing Request
- dev-server.crt : SSL certificate

## filename.cer from safari

1. Double Click to Keychain Access
2. Add to Login chain
3. Change Trust
    - SSL : Always
    - X.509 default : Always
