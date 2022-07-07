# privateIPscaner
This tries to scan all private IP range

```
  CLASS A 
  10.0.0.0 - 10.255.255.255

  CLASS B 
  172.16.0.0 - 172.31.255.255

  CLASS C 
  192.168.0.0 - 192.168.255.255
```
Note you can find also other private IPs configured on some networks, but those ones have been reserved by IANA



EXECUTION EXAMPLE

```
  $ ./privateIPscaner.sh -c C
  
  IP class C selected
	  [+] Host 192.168.0.106 - ACTIVE
    [+] Host 192.168.3.1 - ACTIVE
    [+] Host 192.168.3.3 - ACTIVE
```
