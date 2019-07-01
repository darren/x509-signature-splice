# X.509 Signature Splicing Library

x509-signature-splice is a Go library for creating an X.509 certificate with a user-supplied signature, instead of creating a signature from a user-supplied private key.  It is designed to be used in situations where a certificate template and a signature are available separately, but the private key is not available.  One example of such a situation is the dehydrated certificate system used by Namecoin for TLS.

## Building

Prerequisites:

1. Ensure you have the Go tools installed.

Option A: Using Go build commands (works on any platform with Bash):

1. Ensure you have the GOPATH environment variable set. (For those not
   familar with Go, setting it to the path to an empty directory will suffice.
   The directory will be filled with build files.)

2. Run `go get -d -t -u github.com/namecoin/x509-signature-splice/...`. The x509-signature-splice source code will be
   retrieved automatically.

3. Run `go generate github.com/namecoin/x509-signature-splice/...`.  Some source code will be generated.

4. You can now `import "github.com/x509-signature-splice/x509"` from your Go projects.

## Licence

Original Go standard library code Copyright (c) 2009 The Go Authors. All rights reserved.

Signature splice modifications Copyright (c) 2015-2019 The Namecoin Developers. All rights reserved.

Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
