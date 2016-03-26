#!/bin/bash
/usr/bin/dnscrypt-proxy -R $(echo $resolver_name) -a 127.0.0.2:53 -d
/usr/bin/named -u named -f
