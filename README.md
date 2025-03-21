# mtu-checker

Simple script to find optimal MTU size for site-to-site VPN tunnels.

```bash
wget https://raw.githubusercontent.com/felixd/mtu-checker/refs/heads/master/mtu-checker.sh
chmod +x mtu-checker.sh
./mtu-checker.sh HOST

Checking MTU size 1500: Too large
Checking MTU size 1492: Too large
Checking MTU size 1484: Too large
Checking MTU size 1476: Too large
Checking MTU size 1468: Too large
Checking MTU size 1460: Too large
Checking MTU size 1452: Too large
Checking MTU size 1444: Too large
Checking MTU size 1436: Too large
Checking MTU size 1428: Too large
Checking MTU size 1420: Too large
Checking MTU size 1412: Too large
Checking MTU size 1404: Too large
Checking MTU size 1396: Too large
Checking MTU size 1388: Too large
Checking MTU size 1380: Too large
Checking MTU size 1372: Too large
Checking MTU size 1364: Too large
Checking MTU size 1356: Too large
Checking MTU size 1348: Too large
Checking MTU size 1340: Too large
Checking MTU size 1332: Too large
Checking MTU size 1324: Too large
Checking MTU size 1316: Too large
Checking MTU size 1308: Too large
Checking MTU size 1300: Success
Optimal MTU size: 1300

```

## Knowledge 

* https://www.cisco.com/c/en/us/support/docs/ip/generic-routing-encapsulation-gre/25885-pmtud-ipfrag.html

## Author

* Paweł 'felixd' Wojciechowski - FlameIT - Immersion Cooling

