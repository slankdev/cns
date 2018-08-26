#!/bin/sh

set -eu
pingcnt=1

echo -n 'check r0 reachability...'
lxc exec r0 -- ping -c $pingcnt 10.6.0.2 > /dev/null
lxc exec r0 -- ping -c $pingcnt 10.8.0.2 > /dev/null
lxc exec r0 -- ping -c $pingcnt 192.168.120.1 > /dev/null
echo 'done'

echo -n 'check r1 reachability...'
lxc exec r1 -- ping -c $pingcnt 10.7.0.2  > /dev/null
lxc exec r1 -- ping -c $pingcnt 10.10.0.2 > /dev/null
lxc exec r1 -- ping -c $pingcnt 192.168.130.1 > /dev/null
echo 'done'

echo -n 'check r2 reachability...'
lxc exec r2 -- ping -c $pingcnt 10.5.0.2  > /dev/null
lxc exec r2 -- ping -c $pingcnt 10.9.0.2  > /dev/null
lxc exec r2 -- ping -c $pingcnt 192.168.140.1 > /dev/null
echo 'done'

echo -n 'check r3 reachability...'
lxc exec r3 -- ping -c $pingcnt 10.6.0.1  > /dev/null
lxc exec r3 -- ping -c $pingcnt 10.7.0.1  > /dev/null
lxc exec r3 -- ping -c $pingcnt 10.9.0.1  > /dev/null
lxc exec r3 -- ping -c $pingcnt 10.2.0.2  > /dev/null
lxc exec r3 -- ping -c $pingcnt 10.4.0.2  > /dev/null
echo 'done'

echo -n 'check r4 reachability...'
lxc exec r4 -- ping -c $pingcnt 10.8.0.1  > /dev/null
lxc exec r4 -- ping -c $pingcnt 10.10.0.1 > /dev/null
lxc exec r4 -- ping -c $pingcnt 10.5.0.1  > /dev/null
lxc exec r4 -- ping -c $pingcnt 10.2.0.1  > /dev/null
lxc exec r4 -- ping -c $pingcnt 10.3.0.2  > /dev/null
echo 'done'

echo -n 'check r5 reachability...'
lxc exec r5 -- ping -c $pingcnt 10.4.0.1  > /dev/null
lxc exec r5 -- ping -c $pingcnt 10.1.0.2  > /dev/null
lxc exec r5 -- ping -c $pingcnt 192.168.10.2  > /dev/null
echo 'done'

echo -n 'check r6 reachability...'
lxc exec r6 -- ping -c $pingcnt 10.1.0.1  > /dev/null
lxc exec r6 -- ping -c $pingcnt 10.3.0.1  > /dev/null
echo 'done'

echo -n 'check r7 reachability...'
lxc exec r7 -- ping -c $pingcnt 192.168.120.2 > /dev/null
echo 'done'

echo -n 'check r8 reachability...'
lxc exec r8 -- ping -c $pingcnt 192.168.130.2 > /dev/null
echo 'done'

echo -n 'check r9 reachability...'
lxc exec r9 -- ping -c $pingcnt 192.168.140.2 > /dev/null
lxc exec r9 -- ping -c $pingcnt 192.168.20.1  > /dev/null
echo 'done'

echo -n 'check client...'
lxc exec client -- ping -c $pingcnt 192.168.10.1  > /dev/null
echo 'done'

echo -n 'check server...'
lxc exec server -- ping -c $pingcnt 192.168.20.2  > /dev/null
echo 'done'

echo 'all test is done.!'
