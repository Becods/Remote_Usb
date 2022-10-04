<div align="center">

# Remote_Usb

_✨ 基于YK-L1C的远程USB ✨_

</div>

## Build

```bash
git clone https://github.com/x-wrt/x-wrt
git clone https://github.com/Becods/Remote_Usb
cp -rf https://github.com/Becods/Remote_Usb/* x-wrt/package
cd x-wrt
mv .config.example .config
./scripts/feeds update -a
./scripts/feeds install -a
make download -j8
make V=s -j1
```
## Tips

1. `.config.example` 为自用，仅供参考，开启了一大堆不需要的功能
2. 自行配置需要在 `Kernel modules  ---> USB Support` 中启用你需要的内核模块
3. 编译还需要开启的模块有：
   1. `Network  ---> Firewall  ---> iptables-nft`
   2. `Network  ---> usbip  --> usbip-client`
   3. `Network  ---> usbip  --> usbip-server`
4. 在 `VirtualHere` 的管理界面处 `F12`，有惊喜

## Custom

#### 自定义 Zerotier Planet

只需要把planet丢到x-wrt/package/base-files/files/etc下即可