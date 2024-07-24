# TAV-s-DNSCrypt-batch-launcher
Installing dnscrypt as a service can break wifi web login so I just make this to only run dnscrypt when needed

How-to:

https://github.com/DNSCrypt/dnscrypt-proxy

1. put the setupdnscrypt.bat in the same folder as extracted dnscrypt-proxy

2. run the .bat as admin

3. set the DNS to 127.0.0.1 (1st option), it will give you network name.

4. See the state, check which one is Connected.

5. Usually there 2 option: either you connected to Ethernet interface or Wi-Fi interface. Choose according what you connected to. If not, choose Custom and type the Interface Name.

6. After the primary DNS changed to 127.0.0.1, and the DNS flushed, you can start the DNSCrypt. It will run DNSCrypt on new window. You can test it using 4th option of the batch.

7. Dont forget to set back DNS to auto after you exit DNSCrypt or you might can't browse internet properly
