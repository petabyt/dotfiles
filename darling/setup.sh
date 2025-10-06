#!/bin/sh

darling shell bash /Volumes/SystemRoot/setup-darling.sh

darling shutdown

# save state
cp -r /root/overlay/.darling /root/.darling

exit
