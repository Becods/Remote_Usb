--[[
--vhusbd configuration page. Made by 981213
--
-- eHh4eHh4eHh4eHh4LDk5OSxNQ0FDRGtuMGp3dzZSNVdPSWpGcVUvYXBBZzRVbSttRGtVMlRCY0M3ZkExRnJBPT0=
--
-- Good luck to you.
--
]] --
local fs = require "nixio.fs"


m = Map("vhusbd", translate("VirtualHere USB Server"), translatef(
            "可把网络设备上的USB设备映射到本地主机。启用后到 http://www.virtualhere.com/usb_client_software 下载对应构架的客户端到本地主机运行。"))

-- Basic config
m:section(SimpleSection).template = "vhusbd/status"

-- vhusbd
s = m:section(TypedSection, "vhusbd", translate("设置"))
s.anonymous = true

switch = s:option(Flag, "enabled", translate("启用"))
switch.rmempty = false

Access = s:option(Flag, "ExtAccess", translate("外网访问"))
Access.rmempty = false

return m
