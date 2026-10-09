open the level02.pcap file via a viewer like wireshark or [webpcap.com/](https://webpcap.com)
then you find a message containing `Password: `

If you read the Messages byte by byte after this message (including delete `0x7f`)
 you get the password