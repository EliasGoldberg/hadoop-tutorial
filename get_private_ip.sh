#!/bin/bash
public_ip=$1
ifconfig | grep "inet addr" | sed "/$public_ip/d" | sed "/127.0.0.1/d" | cut -d: -f 2 | awk '{print $1}'