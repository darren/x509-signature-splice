#!/bin/bash

set -eu -o pipefail
shopt -s failglob

cp -a $(go env GOROOT)/src/crypto/x509/* ./
rm ./x509_test.go

# Stdlib x509 relies on "internal" packages in Go, which aren't importable
# outside of stdlib.  So we copy those packages and rename them.
OLD_INTERNAL_PATH=$(go env GOROOT)/src/vendor/golang_org/x/crypto/cryptobyte
NEW_INTERNAL_PATH=$(go env GOPATH)/src/github.com/namecoin/x509-signature-splice/x509/golang/x/crypto/cryptobyte
mkdir -p ${NEW_INTERNAL_PATH}/
cp -R ${OLD_INTERNAL_PATH}/* ${NEW_INTERNAL_PATH}/
OLD_PACKAGE='"golang.org/x/crypto/cryptobyte'
NEW_PACKAGE='"github.com/namecoin/x509-signature-splice/x509/golang/x/crypto/cryptobyte'
sed -i "s~${OLD_PACKAGE}~${NEW_PACKAGE}~g" ./*.go ${NEW_INTERNAL_PATH}/*.go ${NEW_INTERNAL_PATH}/*/*.go
