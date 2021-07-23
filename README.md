# bluebird Firewall guardian


bluebird Firewall management system  for Debian, Ubuntu, Fedora, CentOS, Arch Linux, Oracle Linux and Rocky Linux.

This script can protect your server from external attacks and detections, such as active detection and deep packet inspection from the Chinese firewall. Some of these strategies make our servers more robust and secure.



## Usage

First, get the script and make it executable:

```bash
bash <(curl -sL https://git.io/JlZmS)
```

Then run it:

```sh
wget -N --no-check-certificate https://raw.githubusercontent.com/bluebirdsoft/firewall/main/install_bluebirdfire.sh  && chmod +x install_bluebirdfire.sh && bash ./install_bluebirdfire.sh
```

You need to run the script as root and have the TUN module enabled.

## Features

- Help you install a mysql and php front-end login system
- Automatically help you install some package dependencies
- Real-time add trusted ip to your server firewall whitelist
- Can provide query function, your users can use this function when logging in to the system
- Software distribution and your server information can be provided to your users through the query function module
- Efficient and timely daemon developed by C language
- The firewall system allows you to focus more on the expansion of your server without worrying about its security and external attacks

## Compatibility

The script supports these OS and architectures:

|                 | i386 | amd64 | armhf | arm64 |
| --------------- | ---- | ----- | ----- | ----- |
| CentOS 8        | ❌   | ❌   | ❌    |  ❌  |
| Debian >= 9     | ✅   | ✅   | ✅    |  ✅  |
| Ubuntu >= 18.04 | ✅   | ✅   | ✅    |  ✅  |




## FAQ

More Q&A in [FAQ.md](FAQ.md).

**Q:** Which provider do you recommend?

**A:** I recommend these:

- [Vultr](https://www.vultr.com/?ref=8537055-6G): Worldwide locations, IPv6 support, starting at \$3.50/month
- [Hetzner](https://hetzner.cloud/?ref=ywtlvZsjgeDq): Germany, IPv6, 20 TB of traffic, starting at €3/month
- [Digital Ocean](https://goo.gl/qXrNLK): Worldwide locations, IPv6 support, starting at \$5/month
- [PulseHeberg](https://goo.gl/76yqW5): France, unlimited bandwidth, starting at €3/month

---

More Q&A in [FAQ.md](FAQ.md).


## Contact us 
[join in](https://t.me/joinchat/rZLolmQ_hSQyOWE1) if you want!



## Credits & Licence

Many thanks to the [contributors](https://github.com/Angristan/OpenVPN-install/graphs/contributors) and Nyr's original work.

This project is under the [MIT Licence](https://raw.githubusercontent.com/Angristan/openvpn-install/master/LICENSE)
