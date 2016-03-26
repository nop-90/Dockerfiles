## DNSCrypt docker
This docker is a dnscrypt resolver associated with a bind server supporting DNSSEC requests  
You can change the default resolver for DNSCrypt with the ENV variable resolver-name

**Docker compose example : ** 

version: '2'  
  
services:  
dnscrypt:   
       image: dnscrypt  
        ports:  
            - "53/udp:53/udp"  
        environment:  
            - resolver_name=ovpnto-se  

