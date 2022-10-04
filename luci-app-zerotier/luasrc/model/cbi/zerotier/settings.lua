a = Map("zerotier")
a.title = translate("ZeroTier")
a.description = translate("Zerotier 是一个开源，跨平台，而且适合内网穿透互联的傻瓜配置虚拟 VPN LAN")

a:section(SimpleSection).template  = "zerotier/zerotier_status"

t = a:section(NamedSection, "sample_config", "zerotier")
t.anonymous = true
t.addremove = false

e = t:option(Flag, "enabled", translate("启用"))
e.default = 0
e.rmempty = false

e = t:option(DynamicList, "join", translate('ZeroTier Network ID'))
e.password = true
e.rmempty = false

e = t:option(Flag, "nat", translate("自动允许客户端 NAT"))
e.description = translate("允许 Zerotier 的拨入客户端访问路由器 LAN 资源（需要在 Zerotier 管理页面设定到 LAN 网段的路由表）")
e.default = 0
e.rmempty = false

e = t:option(DummyValue, "opennewwindow", translate("<input type=\"button\" class=\"cbi-button cbi-button-apply\" value=\"Zerotier.com\" onclick=\"window.open('https://my.zerotier.com/network')\" />"))
e.description = translate("点击跳转到 Zerotier 官网管理平台，新建或者管理网络，并允许客户端接入访问你私人网路（新接入的节点默认不允许访问）")

return a
