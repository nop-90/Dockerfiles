#!/bin/bash
/usr/bin/named -f -u named &
/usr/bin/dnscrypt-proxy -a 127.0.0.2 -R d0wn-nl-ns2 --user=nobody

