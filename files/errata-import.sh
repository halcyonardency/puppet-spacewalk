#!/bin/bash

cd /tmp

wget -N http://cefs.steve-meier.de/errata.latest.xml

wget -N https://www.redhat.com/security/data/oval/com.redhat.rhsa-all.xml

. /etc/errata-import.cfg

/sbin/errata-import.pl --server localhost --errata /tmp/errata.latest.xml --rhsa-oval /tmp/com.redhat.rhsa-all.xml --bugfix --security --enhancement --publish --sync-timeout=2000| tee -a /var/log/errata.log 
