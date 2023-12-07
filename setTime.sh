#!/bin/bash

# use NTP to set the good date...
sudo service ntp stop
sudo ntpd -gq
sudo service ntp start
