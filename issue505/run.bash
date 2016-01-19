#!/bin/bash

set -ex

# test for issue 505
# gb does not permit packages from $PROJECT/vendor/src to
# match globs, but if they are named explicity, and are not
# superceeded by $PROJECT/src, they should match. This 
# permits a useful properly for users who want to vendor code
# gen tools like protobuf

gb vendor fetch github.com/golang/protobuf
gb build github.com/golang/protobuf/protoc-gen-go
test -x bin/protoc-gen-go
